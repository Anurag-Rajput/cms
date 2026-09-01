package com.cvc.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Collection;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cvc.dto.AccessControlDto;
import com.cvc.dto.CitizenDto;
import com.cvc.dto.Email;
import com.cvc.dto.ResetPasswordDto;
import com.cvc.dto.UserDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.dto.PincodeDto;
import com.cvc.security.Util;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.DiaryServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.util.EmailApi;
import com.cvc.util.MyUtill;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	UserServiceImpl userServiceImpl;

	@Autowired
	DiaryServiceImpl diaryServiceImpl;

	@Autowired
	CommonServiceImpl commonServiceImpl;

	@Autowired
	EmailApi emailApi;
	
	
	
	
	@RequestMapping(value = "/getEmailPhone", method = RequestMethod.POST)
	public @ResponseBody List<CitizenDto> getEmailPhone(@RequestParam("loginvalue") String loginId) {
		logger.info("firstProfile method is call");
		
		return commonServiceImpl.getEmailPhone(loginId);
	}
	
	
	@RequestMapping(value = "/setEmailPhone", method = RequestMethod.POST)
	public @ResponseBody void setEmailPhone(@RequestParam("loginvalue") String loginId,@RequestParam("Email") String email)
					throws ParseException {
		
		commonServiceImpl.setEmailPhone(loginId,email);
	
	}
	

	@RequestMapping(value = "/getStateDetails", method = RequestMethod.GET)
	public  @ResponseBody List<PincodeDto> getPincodeData() {
		logger.info("getStateDetails page is call");
		
		return commonServiceImpl.getPincodeData();
				
	}

	
	
	@RequestMapping(value = "/citybyState", method = RequestMethod.POST)
	public  @ResponseBody List<PincodeDto> getcitybyState(@RequestParam("stateselected") String stateselected) {
		logger.info("citybyState page is call");
		
		return commonServiceImpl.getcitybyState(stateselected);
				
	}
	
	
	@RequestMapping(value = "/pinbyDistrict", method = RequestMethod.POST)
	public  @ResponseBody List<PincodeDto> getpinbyCity(@RequestParam("stateselected") String stateselected) {
		logger.info("citybyState page is call");
		
		return commonServiceImpl.getpinbyCity(stateselected);
				
	}


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, HttpServletRequest request, Model model) throws IOException {
		logger.info("Welcome index! The client locale is {}.", locale);
		MyUtill.authenticationMessage(request, model);
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String index(Locale locale, HttpServletRequest request, Model model) throws IOException {
		logger.info("Welcome login! The client locale is {}.", locale);
		MyUtill.authenticationMessage(request, model);
		request.getSession().invalidate();
		return "index";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String resgister(Model model, @ModelAttribute("register") UserDto dairyDto, HttpSession httpSession, HttpServletRequest request) {
		logger.info("register page is called");
		model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
		return "register";
	}
	
	
	

	@RequestMapping(value = "/recoverPassword", method = RequestMethod.GET)
	public String recoverPassword(Model model, @ModelAttribute("user") AccessControlDto accessControlDto) {
		logger.info("recoverPassword page is called");
		return "recoverPassword";
	}

	@RequestMapping(value = "/updateRecoverPassword", method = RequestMethod.POST)
	public String updateRecoverPassword(@Valid @ModelAttribute("user") AccessControlDto accessControlDto,
			BindingResult result, Model model) throws Exception {
		logger.info("updatePassword page is called");
		if (accessControlDto.getEmail().equals(accessControlDto.getReEmail())) {
			Boolean check = userServiceImpl.findUserName(accessControlDto.getUserName());
			if (check == true) {
				String password = Util.generateCaptchaTextMethod2(6);
				String message = "Dear user,\n This is System generated " + password
						+ " password.\n Please update by your self after login.\n";
				emailApi.readyToSendEmail(accessControlDto.getEmail(), "portal-cvc@nic.in",
						"CVC Recover Password", message);
				userServiceImpl.updatePasswordBySystem(accessControlDto.getUserName(), password);
				model.addAttribute("errMessage", "Mail has been sent to the email id. Please check your email.");
			} else {
				Boolean checkCitizenId = userServiceImpl.findCitizenUserName(accessControlDto.getUserName());
				if (checkCitizenId == true) {
					String password = Util.generateCaptchaTextMethod2(6);
					String message = "Dear user,\n This is System generated " + password
							+ " password.\n Please update by your self after login.\n";
					emailApi.readyToSendEmail(accessControlDto.getEmail(), "portal-cvc@nic.in",
							"CVC Recover Password", message);
					userServiceImpl.updatePasswordBySystemForCitizen(accessControlDto.getUserName(), password);
					model.addAttribute("errMessage", "Mail has been sent to the email id. Please check your email.");
				} else {
					model.addAttribute("errMessage", "UserName not Found.");
				}
			}

		} else {
			model.addAttribute("errMessage", "Email not Matched.");
		}

		return "recoverPassword";
	}

	@RequestMapping(value = "/user/firstProfile", method = RequestMethod.GET)
	public String firstProfile(Model model, @ModelAttribute("profile") UserDto userDto, HttpSession httpSession) {
		logger.info("firstProfile method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); 
		UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String cvoCode = userLoginAuthenticationDto.getCvoCode();
		 List<String> role=(List<String>) userLoginAuthenticationDto.getListRole();
		model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
		model.addAttribute("cvoCode",cvoCode);
		if(role.size()>0)
		{
			model.addAttribute("role", role.get(0).toString());
		}else
		{
			model.addAttribute("role","");
		}
		model.addAttribute("userDetail",userLoginAuthenticationDto);	
		model.addAttribute("mapOfUserId", commonServiceImpl.findAllUserId(role.get(0).toString()));
		if(role.get(0).toString().equalsIgnoreCase("ROLE_ADMIN"))
		{
			return "updatePassword1";
		}
		else
		{
			return "updatePassword";
		}
	}

	
	
	@RequestMapping(value = "/user/loadUserDetails", method = RequestMethod.POST)
	public @ResponseBody UserLoginAuthenticationDto loadUserDetail(@RequestParam("userid") String userid , HttpSession httpSession) {
		logger.info("loadUserDetail method is call");
	
		UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(userid);
//		String cvoCode = userLoginAuthenticationDto.getCvoCode();
//		List<String> role=(List<String>) userLoginAuthenticationDto.getListRole();
//		model.addAttribute("mapOfOrganisation", commonServiceImpl.getAllOrganisation());
//		model.addAttribute("cvoCode",cvoCode);
	
		//model.addAttribute("userDetail",userLoginAuthenticationDto);	
		return userLoginAuthenticationDto;
	}
	
	
	@RequestMapping(value = "/user/citizenProfile", method = RequestMethod.GET)
	public String citizenProfile(Model model, @ModelAttribute("citizenProfile") CitizenDto citizenDto,
			HttpSession httpSession, HttpServletRequest request) {
		logger.info("firstProfile method is call");
		return "citizenProfileUpdate";
	}

	
	@RequestMapping(value = "/user/firstProfileUpdate", method = RequestMethod.POST)
	public String firstProfileUpdate(@ModelAttribute("profile") UserDto userDto, BindingResult bindingResult,
			HttpSession httpSession, HttpServletRequest request, Model model) throws ParseException {
		logger.info("firstProfileUpdate method is call");
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); 
		UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String cvoCode = userLoginAuthenticationDto.getCvoCode();
		 List<String> role=(List<String>) userLoginAuthenticationDto.getListRole();
		 userDto.setLoginRoll(role.get(0).toString());
		 userDto.setCvoCode(cvoCode);
		 //userDto.setFirstLogin(userLoginAuthenticationDto.isFirstLogin());
	/*	if (!userDto.getPassword().equals(userDto.getRePassword()) | userDto.getPassword().isEmpty()) {
			model.addAttribute("errMessage", "password not matched.");
			return "updatePassword";
		}*/

		/*
		 * if (bindingResult.hasErrors()) { logger.info(
		 * "validation error in updateComplainDetails.");
		 * model.addAttribute("errMessage",bindingResult.getErrorCount()+
		 * " errors."); model.addAttribute("mapOfOrganisation",
		 * commonServiceImpl.getAllOrganisation()); return "updatePassword"; }
		 */
		
		
		CsrfToken token = (CsrfToken) request.getAttribute("_csrf");
		if (token.getToken().equals(userDto.getCsrf())) {
			if (userServiceImpl.updateFirstProfile(userDto.getUserID(), userDto) == true) {
				//httpSession.invalidate();
				if(role.get(0).toString().equalsIgnoreCase("ROLE_ADMIN"))
				{
					return "cvoUpdateSuccess";
				}
				else
				{
					return "profileSuccees";
				}
			}

		}

		model.addAttribute("errMessage", "Wrong Credential. Please try again later..");
		return "updatePassword";
	}

	@RequestMapping(value = "/user/citizenProfileUpdate", method = RequestMethod.POST)
	public String citizenProfileUpdate(@ModelAttribute("citizenProfile") CitizenDto citizenDto,
			BindingResult bindingResult, HttpSession httpSession, Model model) throws ParseException {
		logger.info("citizenProfileUpdate method is call");
		if (!citizenDto.getPassword().equals(citizenDto.getRePassword()) | citizenDto.getPassword().isEmpty()) {
			model.addAttribute("errMessage", "password not matched.");
			return "citizenProfileUpdate";
		}

		/*
		 * if (bindingResult.hasErrors()) { logger.info(
		 * "validation error in updateComplainDetails.");
		 * model.addAttribute("errMessage",bindingResult.getErrorCount()+
		 * " errors."); model.addAttribute("mapOfOrganisation",
		 * commonServiceImpl.getAllOrganisation()); return "updatePassword"; }
		 */

		if (userServiceImpl.updateCitizenProfile(citizenDto.getCitizenId(), citizenDto) == true) {
			httpSession.invalidate();
			return "profileSuccees";
		}
		model.addAttribute("errMessage", "Wrong Credential. Please try again later..");
		return "citizenProfileUpdate";
	}

	@RequestMapping(value = "/citizenRegister", method = RequestMethod.GET)
	public String citizenRegister(Model model, @ModelAttribute("citizen") CitizenDto citizenDto) {
		logger.info("citizenRegistration page is called");
		return "citizenRegistration";
	}

	@RequestMapping(value = "/addUserDetails", method = RequestMethod.POST)
	public String addUserDetails(@ModelAttribute("register") @Valid UserDto userDto, BindingResult result,
			HttpServletRequest request, Model model) throws ParseException {
		HttpSession httpSession = request.getSession();
		String serveletCaptcha = (String) httpSession.getAttribute("CAPTCHA");
		CsrfToken token = (CsrfToken) request.getAttribute("_csrf");

		if(token.getToken().equals(userDto.getCsrf())){
		if (!serveletCaptcha.equals(userDto.getCaptcha())) {
			MyUtill.authenticationMessage(request, model);
			return "register";
		}

		if (result.hasErrors()) {
			logger.info("validation error!");
			return "register";
		}
		if (commonServiceImpl.findUserId(userDto.getUserID()) == false) {
			diaryServiceImpl.insertUserDetails(userDto);
			
			DiaryController diaryController =new DiaryController();
			Email email =new Email();
			if(!(userDto.getUserEmail()).equalsIgnoreCase(""))
			{			
				email.setSenderEmail("portal-cvc@nic.in");
				email.setRecepientEmail(userDto.getUserEmail());
				email.setSubject("Central Vigilance Commission");
				email.setEmailContent("Your have successfully registered with Central Vigilance Commission. You can login http://portal.cvc.gov.in/cvproject/ with user-id:"+userDto.getUserID());
				try {
					diaryController.sendMail(email);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(!(userDto.getMobileNumber()).equalsIgnoreCase(""))
			{
				String mobNo = userDto.getMobileNumber();
				String message="Your have successfully registered with Central Vigilance Commission. You can login http://portal.cvc.gov.in/cvproject/ with user-id:"+userDto.getUserID();
				try
				{
					diaryController.sendSMS(mobNo,message);
				}catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			
			
			logger.info("addUserDairyDetails method is call");
			return "userRegS";
		}
		model.addAttribute("errorEntry", "User Id Already Exist.");
		logger.info("errorEntry page is call");
		return "register";
}
return "error";
	}

	@RequestMapping(value = "/addCitizenDetails", method = RequestMethod.POST)
	public String addCitizenDetails(@Valid @ModelAttribute("citizen") CitizenDto citizenDto, BindingResult result,
			HttpServletRequest request, Model model) throws ParseException {
		logger.info("addCitizenDetails method is call");
		HttpSession httpSession = request.getSession();
		String serveletCaptcha = (String) httpSession.getAttribute("CAPTCHA");

		if (!serveletCaptcha.equals(citizenDto.getCaptcha())) {
			MyUtill.authenticationMessage(request, model);
			return "citizenRegistration";
		}

		if (result.hasErrors()) {
			return "citizenRegistration";
		}

		if (commonServiceImpl.findUserId(citizenDto.getCitizenId()) == false) {
			diaryServiceImpl.insertCitizenDetails(citizenDto);
			DiaryController diaryController =new DiaryController();
			Email email =new Email();
			if(!(citizenDto.getCitizenEmail()).equalsIgnoreCase(""))
			{			
				email.setSenderEmail("portal-cvc@nic.in");
				email.setRecepientEmail(citizenDto.getCitizenEmail());
				email.setSubject("Central Vigilance Commission");
				email.setEmailContent("Your have successfully registered with Central Vigilance Commission. You can login http://portal.cvc.gov.in/cvproject/ with user-id:"+citizenDto.getCitizenId());
				try {
					diaryController.sendMail(email);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if(!(citizenDto.getContactNumber()).equalsIgnoreCase(""))
			{
				String mobNo = citizenDto.getContactNumber();
				String message="Your have successfully registered with Central Vigilance Commission. You can login http://portal.cvc.gov.in/cvproject/ with user-id:"+citizenDto.getCitizenId();
				try
				{
					diaryController.sendSMS(mobNo,message);
				}catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			
			logger.info("addUserDairyDetails method is call");
			return "RegS";
		}
		model.addAttribute("errorEntry", "User Id Already Exist.");
		logger.info("errorEntry page is call");

		return "citizenRegistration";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String errorPage(Exception exception) {
		logger.info("Error page is call");
		exception.printStackTrace();
		// logger.debug("Error Messege", exception);
		return "error";
	}
	
	@RequestMapping(value = "/admin/credential", method = RequestMethod.GET)
	public String updateCredential(Model model) {
		logger.info("credential update page is called");
		return "updateCredential";
	}

	@RequestMapping(value = "/admin/clearDecision", method = RequestMethod.GET)
	public String clearDecision(Model model) {
		logger.info("clear Decision update page is called");
		return "clearDecision";
	}
}
