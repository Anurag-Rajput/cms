package com.cvc.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.util.MyUtill;

@Controller
public class SectionOfficerController {

	public static final Logger logger = LoggerFactory.getLogger(SectionOfficerController.class);
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired 
	CommonServiceImpl commonServiceImpl;
	
	@RequestMapping(value = "/user/so/sectionOfficer", method = RequestMethod.GET)
	public String sectionOfficer(Model model, HttpServletRequest request){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName();
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		model.addAttribute("allDiary", commonServiceImpl.findAllDiarySo(uSection,loginId));
		logger.info("inbox page is call");		
		return "inbox";
	}
}
