package com.cvc.user.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cvc.dto.CitizenDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.ResetPasswordDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.CitizenServiceImpl;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.user.session.CitizenDetails;
import com.cvc.util.MyUtill;

@Controller
public class CitizenController {

	private static final Logger logger = LoggerFactory.getLogger(CitizenController.class);
	
	@Autowired
	CommonServiceImpl commonServiceImpl;
	
	@Autowired
	CitizenServiceImpl citizenServiceImpl;
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	
	@RequestMapping(value = "/user/public/citizen", method = RequestMethod.GET)
	public String citizen(@ModelAttribute("userForm")	DairyDetailsDto dairyDetailsDto,HttpServletRequest request, CitizenDto citizenDto,Model model
			) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getCitizenAuthentication(loginId);
		 if(userLoginAuthenticationDto.getPassword().equals(MyUtill.getMd5("1234"))){
			 logger.info("first profile page is call");
			 return "redirect:/user/firstProfile";
		 }
		List<CitizenDto> listofCitizen = commonServiceImpl.getCitizenDetials(loginId);
		model.addAttribute("mapOfOrganisation", commonServiceImpl.getCitizenOrganisation());
		model.addAttribute("citizenDetails", listofCitizen);
		for (CitizenDto citizenDto2 : listofCitizen) {
			CitizenDetails citizenDetails=new CitizenDetails();
			citizenDetails.setcAddress1(citizenDto2.getAddress1());
			citizenDetails.setcAddress2(citizenDto2.getAddress2());
			citizenDetails.setcAddress3(citizenDto2.getAddress3());
			citizenDetails.setcCcity(citizenDto2.getCity());
			citizenDetails.setcState(citizenDto2.getState());
			citizenDetails.setcEmail(citizenDto2.getCitizenEmail());
			citizenDetails.setcPhNumber(citizenDto2.getContactNumber());
			citizenDetails.setcPpincode(citizenDto2.getPincode());
			httpSession.setAttribute("citizen", citizenDetails);
		}
		

		logger.info("citizenHome page is call");
		return "citizenHome";
	}

	@RequestMapping(value = "/user/public/citizenMyComplaint", method = RequestMethod.GET)
	public String citizenMycomplaint(Model model,HttpServletRequest request,DairyDetailsDto dairyDetailsDto){
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		model.addAttribute("citizenComplain",commonServiceImpl.getCitizenComplain(loginId));
		logger.info("citizenMycomplaint page is call");
		return "citizenMycomplaint";
	}
	
	
	@RequestMapping(value = "/user/public/citizenResetPassword", method = RequestMethod.GET)
	public String citizenChangePassword(@ModelAttribute("passwordFrom") ResetPasswordDto resetPasswordDto,
			BindingResult result,
			HttpServletRequest request){
		logger.info("citizenChangePassword page is call");
		return "citizenPasswordChange";
	}
	
	
	@RequestMapping(value = "/user/public/citizenChangedPassword", method = RequestMethod.POST)
	public String updatePassword(@ModelAttribute("passwordFrom")  ResetPasswordDto resetPasswordDto,
			BindingResult result,
			HttpServletRequest request,Model model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
	     HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 Integer pwdFlag = citizenServiceImpl.insertNewPasswordforCitizen(resetPasswordDto,loginId);
		 
		 
		 
		 if (pwdFlag== 1) {
			 return "citizenPwdSuccess";
		}
		 else if(pwdFlag==0){
			 model.addAttribute("pwdError","Please Enter Correct Password.");
			 return "citizenPasswordChange";
		 }
		 
		 else{
			 pwdFlag = citizenServiceImpl.insertNewPasswordforCitizen(resetPasswordDto,loginId);
		}
		 
		return "citizenPasswordChange";
	}
	
	@RequestMapping(value = "/user/public/updateCitizenProfile/{operation}", method = RequestMethod.POST)     //For Cititzen Profile Updation
	public String updateCitizenProfile(@ModelAttribute("citizenProfile") CitizenDto citizenDto,HttpServletRequest request,Model model, @PathVariable("operation") String operation ) throws ParseException {
			logger.info("updateCitizenProfile method is call");
			
			HttpSession httpSession=request.getSession();
			String loginId = httpSession.getAttribute("loginId").toString();
			
			List<CitizenDto> cDto = new ArrayList<CitizenDto>();
			
			if(operation.equalsIgnoreCase("view"))
			{
				cDto = commonServiceImpl.getCitizenDetials(loginId);
				model.addAttribute("citizenData",cDto.get(0));
				model.addAttribute("msg","");
			}
			else if(operation.equalsIgnoreCase("update"))
			{
				if(citizenDto.getAddress1().equals(""))
				{
					model.addAttribute("citizenData",citizenDto);
					model.addAttribute("msg","Address-1 can not be blank");
					return "citizenProfile";
				}
				if(citizenDto.getContactNumber()!="" && !isInteger(citizenDto.getContactNumber(),10))
				{
					model.addAttribute("citizenData",citizenDto);
					model.addAttribute("msg","Please provide 10 digit Mobile Number");
					return "citizenProfile";
				}
				if(!isValidEmailAddress(citizenDto.getCitizenEmail()))
				{
					model.addAttribute("citizenData",citizenDto);
					model.addAttribute("msg","Please provide valid Email Id");
					return "citizenProfile";
				}
				if(citizenDto.getCitizenEmail().equals("") && citizenDto.getContactNumber().equals(""))
				{
					model.addAttribute("citizenData",citizenDto);
					model.addAttribute("msg","Please provide either Email Id or Mobile Number");
					return "citizenProfile";
				}
				if (userServiceImpl.citizenProfileUpdation(citizenDto.getCitizenId(), citizenDto) == true) {
					cDto = commonServiceImpl.getCitizenDetials(loginId);
					model.addAttribute("citizenData",cDto.get(0));
					model.addAttribute("msg","Information Successfully Updated");
				}
			}
			
		
		return "citizenProfile";
	}
	
	public static boolean isValidEmailAddress(String email) {
		   boolean result = true;
		   try {
			   if(!email.equals(""))
			   {
				   InternetAddress emailAddr = new InternetAddress(email);
				   emailAddr.validate();
			   }
		   } catch (AddressException ex) {
		      result = false;
		   }
		   return result;
		}
	
	public static boolean isInteger(String s, int radix) {
	    if(s.isEmpty()) return false;
	    if(s.length()!=10)
	    {
	    	return false;
	    }
	    for(int i = 0; i < s.length(); i++) {
	        if(i == 0 && s.charAt(i) == '-') {
	            if(s.length() == 1) return false;
	            else continue;
	        }
	        if(Character.digit(s.charAt(i),radix) < 0) return false;
	    }
	    return true;
	}
	
}
