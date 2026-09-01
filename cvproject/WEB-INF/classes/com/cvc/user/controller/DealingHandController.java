package com.cvc.user.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cvc.dto.AccessControlDto;
import com.cvc.dto.CvoDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.IpCaptureDto;
import com.cvc.dto.NotingDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.CvoServiceImpl;
import com.cvc.user.service.impl.DealingHandServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;

@Controller
public class DealingHandController {
	private static final Logger logger = LoggerFactory.getLogger(DealingHandController.class);

	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired
	DealingHandServiceImpl dealingHandServiceImpl;
	
	@Autowired
	CommonServiceImpl commonServiceImpl;
	
	@Autowired
	CvoServiceImpl cvoServiceImpl;
	

	@RequestMapping(value = "/user/dh/dealingHand", method = RequestMethod.GET)
	public String dealingHand(Model model,HttpServletRequest request) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
	     UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
	     //int uPID=userLoginAuthenticationDto.getUserPID();
	     String uSection = userLoginAuthenticationDto.getLoginRoll();
		 model.addAttribute("allDiary" , userServiceImpl.findAllDiary(uSection,loginId));
		logger.info("Inbox page is call");
		return "inbox";
	}

	@RequestMapping(value = "/user/updateComplainDetails", method = RequestMethod.GET)
	public String addDairyComplain( @ModelAttribute("userForm") DairyDetailsDto dairyDetailsDto,@ModelAttribute("cvoForm") CvoDto cvoDto, NotingDto notingDto,HttpServletRequest request,
			Model model) {
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
	     AccessControlDto accessControlDto=(AccessControlDto)httpSession.getAttribute("accessControlDto");
	     Integer complaintnumber=accessControlDto.getComplainNumber();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
	     String uSection = userLoginAuthenticationDto.getLoginRoll();
	     httpSession.setAttribute("Role", uSection);
	     Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
	     List<CvoDto> cvoData=dealingHandServiceImpl.viewCVOComplain(complaintnumber);
	     if(uRoleTpye.contains("ROLE_CVO")){
		 		model.addAttribute("complainDetails",dealingHandServiceImpl.viewComplain(complaintnumber));
		 		model.addAttribute("cvocomplainDetails",cvoData.size()>0?cvoData.get(0): new CvoDto());
		 	//	model.addAttribute("cvoComplainDetails",cvoServiceImpl.getDetailsOfComplain(complaintnumber));
		 		dealingHandServiceImpl.updateCvoInbox(complaintnumber);
		 		return "cvoComplaintView";
		 } else if(uRoleTpye.contains("ROLE_COORD")){
		 		model.addAttribute("complainDetails",dealingHandServiceImpl.viewComplain(complaintnumber));
		 		model.addAttribute("cvocomplainDetails",cvoData.size()>0?cvoData.get(0): new CvoDto());
		 	//	model.addAttribute("cvoComplainDetails",cvoServiceImpl.getDetailsOfComplain(complaintnumber));
		 		dealingHandServiceImpl.updateCvoInbox(complaintnumber);
		 		return "cvoComplaintCoordView";
		 }
		 else {
			 	model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
		 		model.addAttribute("complainDetails",dealingHandServiceImpl.viewComplain(complaintnumber));
		 		model.addAttribute("gistOfAllegation",commonServiceImpl.findAllAllegation());
		 		model.addAttribute("mapAllBo", commonServiceImpl.findAllBo());
		 		model.addAttribute("mapOfOfficer",commonServiceImpl.findAllOfficer(loginId,uSection));
		 		model.addAttribute("mapOfNoting", commonServiceImpl.findAllNoting(complaintnumber));
		 }
		
		logger.info("updateComplainDetails page is call");
		return "updateComplainDetails";
	}
	
	
	@RequestMapping(value = "/user/closedComplain", method = RequestMethod.GET)
	public String complainClosed(HttpServletRequest request,Model model) {
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		String loginId = accessControlDto.getName();
		
		IpCaptureDto ipCaptureDto= (IpCaptureDto) request.getSession().getAttribute("IpCaptureDetail");
		userServiceImpl.sendToDataRecord(complaintnumber,loginId,ipCaptureDto);
		logger.info("complainClosed page is call");
		return "redirect:/user/goBack";
	}
	
	
	@RequestMapping(value = "/user/openComplain", method = RequestMethod.GET)
	public String complainOpen(HttpServletRequest request,
			Model model) {
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		String loginId = accessControlDto.getName();
		userServiceImpl.openComplainFromDataRecord(complaintnumber,loginId);
		logger.info("complainClosed page is call");
		return "redirect:/user/goBack";
	}
	
	
	
	
	@RequestMapping(value = "/user/compialnFiled", method = RequestMethod.POST)
	public String compialnFiled(@ModelAttribute("userForm") @Valid DairyDetailsDto dairyDetailsDto,
			BindingResult bindingResult,
			HttpServletRequest request,Model model) {
		
		if (bindingResult.hasErrors()) {
			logger.info("validation error in updateComplainDetails.");
			 /*attr.addFlashAttribute("org.springframework.validation.BindingResult.dairyDetailsDto", bindingResult);
			    attr.addFlashAttribute("userForm", dairyDetailsDto);*/
			model.addAttribute("errMessage",bindingResult.getErrorCount()+" errors.");
			    return "redirect:/user/updateComplainDetails";
		}else {
			logger.info("Inbox page is call");
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
	     HttpSession httpSession=request.getSession();
	     AccessControlDto accessControlDto=(AccessControlDto)httpSession.getAttribute("accessControlDto");
	     Integer complaintnumber=accessControlDto.getComplainNumber();
	    userServiceImpl.updateComplainByOfficer(dairyDetailsDto,complaintnumber,loginId);
		}
		return "redirect:/user/goBack";
	}
	
}
