package com.cvc.user.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.cvc.dto.CvoDto;
import com.cvc.dto.CvoMonthyReportDto;
import com.cvc.dto.IpCaptureDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.CvoServiceImpl;
import com.cvc.user.service.impl.ReportServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.util.FileUpload;
import com.cvc.util.MyUtill;
import com.cvc.util.SingletonProperties;

@Controller
public class CvoController {
	
private static final Logger logger = LoggerFactory.getLogger(BranchOfficerController.class);
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired
	CommonServiceImpl commonServiceImpl;
	
	@Autowired
	ReportServiceImpl reportServiceImpl;
	
	@Autowired
	CvoServiceImpl cvoServiceImpl;
	
	@RequestMapping(value = "/user/cvofficer/cvo", method = RequestMethod.GET)
	public String cvoMessage(Model model,HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 
		 if(userLoginAuthenticationDto!=null){
				if(userLoginAuthenticationDto.getListRole().contains("ROLE_CVO") && userLoginAuthenticationDto.isFirstLogin()){
					 model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
				return	"redirect:/user/firstProfile";
				}
			}
		 
		/* 
		 if(userLoginAuthenticationDto.getPassword().equals(MyUtill.getMd5("1234"))){
			 logger.info("first profile page is call");
			 model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
			 return "redirect:/user/firstProfile";
		 }*/
		 
	//	 model.addAttribute("allDiary" , commonServiceImpl.findAllDiaryForCvo(uSection,loginId));
		logger.info("cvoHome page is call");
		return "cvoHome";
	}
	
	@RequestMapping(value = "/user/cvofficer/insertDetailsByCvo",method = RequestMethod.POST)
	public String addDetailsByCvo( @ModelAttribute("cvoForm") CvoDto cvoDto,BindingResult result)
	{
		commonServiceImpl.addDetailsByCvo(cvoDto);
		return "redirect:/user/goBack";
	}
	
	
	@RequestMapping(value = "/user/cvofficer/na",method = RequestMethod.GET)
	public String viewNAComplaint(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		 model.addAttribute("allDiary" , commonServiceImpl.allReadNaForCvo(orgCode,loginId,org));
		return "cvoNaAllComplaint";
	}
	
	
	@RequestMapping(value = "/user/cvofficerread/na",method = RequestMethod.GET)
	public String viewNAReadComplaint(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		 model.addAttribute("allDiary" , commonServiceImpl.allReadNaForReadComplainCvo(orgCode,loginId,org));
		return "cvoNaReadComplaint";
	}
	
	
	@RequestMapping(value = "/user/cvofficerunread/na",method = RequestMethod.GET)
	public String viewNAUnReadComplaint(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		 model.addAttribute("allDiary" , commonServiceImpl.allUnReadNaForUnReadComplainCvo(orgCode,loginId,org));
		return "cvoNaUnReadComplaint";
	}
	
	
	
	@RequestMapping(value = "/user/cvofficer/monthlyReport",method = RequestMethod.GET)
	public String monthlyReport(CvoMonthyReportDto cvoMonthyReportDto,
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 model.addAttribute("mapAllBo", commonServiceImpl.findAllBo());
		return "cvoMonthlyReport";
	}
	
	
	@RequestMapping(value = "/user/cvo/insertCvoMonthlyReport" , method = RequestMethod.POST)
	public String insertCvoMonthlyReport(@ModelAttribute("cvoReport") @Valid CvoMonthyReportDto cvoMonthyReportDto, 
			BindingResult bindingResult, HttpServletRequest request,Model model) throws Exception{
		boolean flag = false;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserName(loginId);
		
		if (cvoMonthyReportDto.getMonth()!=0 && cvoMonthyReportDto.getBranchOfficer()!="None" && FileUpload.wordFileValidate(cvoMonthyReportDto.getUploadedReport())) {
			flag = cvoServiceImpl.getMonthyReport(loginId,cvoMonthyReportDto,userLoginAuthenticationDto);
		}else{
			model.addAttribute("mapAllBo", commonServiceImpl.findAllBo());
			model.addAttribute("error" , "Incorrect details.Please fill all the nesseary details.");
			return "cvoMonthlyReport";
		}
		
		
		
		if (flag==false) {
			cvoServiceImpl.insertCvoMonthlyReport(loginId,cvoMonthyReportDto,request,userLoginAuthenticationDto);
			return "reportSubmited";
		}
		
		model.addAttribute("mapAllBo", commonServiceImpl.findAllBo());
		model.addAttribute("error" , "Report has been already submited of this month.");
		return "cvoMonthlyReport";
		
		
	}
	
	@RequestMapping(value = "/user/cvofficer/firstStage",method = RequestMethod.GET)
	public String firstStage(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		 model.addAttribute("cvo" , commonServiceImpl.cvoCorner(orgCode,loginId,org));
		 model.addAttribute("csvlastupdate", reportServiceImpl.getCSVLastUpdate());
		return "firstStage";
	}
	
	@RequestMapping(value = "/user/cvofficer/secondStage",method = RequestMethod.GET)
	public String secondStage(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		 model.addAttribute("cvo" , commonServiceImpl.cvoCorner(orgCode,loginId,org));
		 model.addAttribute("csvlastupdate", reportServiceImpl.getCSVLastUpdate());
		return "secondStage";
	}
	
	@RequestMapping(value = "/user/cvofficer/complaintPending",method = RequestMethod.GET)
	public String complaintPending(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		 model.addAttribute("cvo" , commonServiceImpl.cvoCorner(orgCode,loginId,org));
		 model.addAttribute("csvlastupdate", reportServiceImpl.getCSVLastUpdate());
		return "complaintPending";
	}
	
	@RequestMapping(value = "/user/cvofficer/furtherClarification",method = RequestMethod.GET)
	public String furtherClarification(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		 model.addAttribute("cvo" , commonServiceImpl.cvoCorner(orgCode,loginId,org));
		 model.addAttribute("csvlastupdate", reportServiceImpl.getCSVLastUpdate());
		return "furtherClarification";
	}
	
	@RequestMapping(value = "/user/cvofficer/departmentalInquiry",method = RequestMethod.GET)
	public String departmentalInquiry(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		 model.addAttribute("cvo" , commonServiceImpl.cvoCorner(orgCode,loginId,org));
		 model.addAttribute("csvlastupdate", reportServiceImpl.getCSVLastUpdate());
		return "departmentalInquiry";
	}
	
	@RequestMapping(value = "/user/cvofficer/ELearning",method = RequestMethod.GET)
	public String ELearning(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		return "ELearning";
	}
	
	@RequestMapping(value = "/user/cvofficerclosed/na",method = RequestMethod.GET)
	public String viewNAClosedComplaint(
			Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String org = userLoginAuthenticationDto.getOrg();
		 String orgCode = userLoginAuthenticationDto.getCvoCode();
		 model.addAttribute("allDiary" , commonServiceImpl.allClosedNaForCvo(orgCode,loginId,org));
		return "cvoNaClosedComplaint";
	}
	
	
}
