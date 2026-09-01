package com.cvc.user.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cvc.dto.DairyDetailsDto;
import com.cvc.user.controller.DiaryController;
import com.cvc.dto.Email;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.DiaryServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.util.RandomUnqieId;

@Controller
public class HelpLineController {
	
	private static final Logger logger = LoggerFactory.getLogger(HelpLineController.class);


	@Autowired
	UserServiceImpl userServiceImpl;

	@Autowired
	DiaryServiceImpl diaryServiceImpl;
	
	@Autowired
	CommonServiceImpl commonServiceImpl;
	
	@RequestMapping(value = "/user/helpLine", method = RequestMethod.GET)
	public String helpLineIndex(@ModelAttribute("helpform")DairyDetailsDto dairyDetailsDto,Model model,HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
		return "helpLineIndex";
	}
	
	@RequestMapping(value = "/user/help/complainAdded", method = RequestMethod.POST)
	public String helpComplaintAdd(@ModelAttribute("helpform") @Valid DairyDetailsDto dairyDetailsDto,Model model,HttpServletRequest request,BindingResult bindingResult){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		if (bindingResult.hasErrors()) {
				System.out.println("HelpLine Getting error in validation");
				//logger.debug("validation error",bindingResult.hasErrors());
				model.addAttribute("errMessage",bindingResult.getErrorCount()+" errors.");
				return "helpLineIndex";
		}
		CsrfToken token = (CsrfToken) request.getAttribute("_csrf");
		Calendar cal = Calendar.getInstance();
		if(token.getToken().equals(dairyDetailsDto.getCsrf())){
			String dairyid = loginId + "/" + Long.toString(RandomUnqieId.unique());
			HttpSession httpSession1 = request.getSession();
			httpSession1.setAttribute("dairyid", dairyid);
			String roll = userLoginAuthenticationDto.getLoginRoll();
			try {
		
					diaryServiceImpl.addDairyDetails(dairyDetailsDto, null, loginId, roll, request);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String complainNumber = "";
			List<DairyDetailsDto> list = diaryServiceImpl.getDairy(request);
			for (DairyDetailsDto dairyDetailsDto2 : list) {
				complainNumber = dairyDetailsDto2.getComplaintNumber() + "/"
						+ cal.get(Calendar.YEAR) + "/" + "vigilance-"
						+ dairyDetailsDto2.getSection();
			}
			model.addAttribute("compaincell", list);
			model.addAttribute("complainNumber", complainNumber);
			diaryServiceImpl.updateCNumber(complainNumber, request);
			
			Email email = new Email();
			DiaryController diaryController=new DiaryController();
			if((!dairyDetailsDto.getEmail().equalsIgnoreCase("") || dairyDetailsDto.getEmail() != null) && !complainNumber.isEmpty())
			{			
				email.setSenderEmail("portal-cvc@nic.in");
				email.setRecepientEmail(dairyDetailsDto.getEmail());
				email.setSubject("Central Vigilance Commission");
				email.setEmailContent("Your complaint dated "+dairyDetailsDto.getComplainDate()+" has been successfully received in CVC. For status/action taken on your complaint no. "+complainNumber+" visit:http://portal.cvc.gov.in/cvproject/");
				try {
					diaryController.sendMail(email);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if((!dairyDetailsDto.getMobileNo().equalsIgnoreCase("") || dairyDetailsDto.getMobileNo() != null ) && !complainNumber.isEmpty())
			{
				String mobNo = dairyDetailsDto.getMobileNo();
				String message="Your complaint dated "+dairyDetailsDto.getComplainDate()+" has been successfully received in CVC. For status/action taken on your complaint no. "+complainNumber+" visit:http://portal.cvc.gov.in/cvproject/";
				try
				{
					diaryController.sendSMS(mobNo,message);
				}catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			
			return "helpLine";
		}
		return "helpLineIndex";
	}
	
}
