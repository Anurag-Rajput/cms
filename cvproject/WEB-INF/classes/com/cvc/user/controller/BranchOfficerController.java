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
import com.cvc.user.service.impl.BranchOfficerServiceImpl;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.util.MyUtill;

@Controller
public class BranchOfficerController {

	private static final Logger logger = LoggerFactory.getLogger(BranchOfficerController.class);
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
	@Autowired
	CommonServiceImpl commonServiceImpl;
	
	@Autowired
	BranchOfficerServiceImpl branchOfficerServiceImpl;
	
	@RequestMapping(value = "/user/bo/report", method = RequestMethod.GET)
	public String viewReportBo(Model model) {
		logger.info("ReportBo Page is Called.");
		return "reportBo";
	}
	
	
	@RequestMapping(value = "/user/bo/cvoMonthlyReport", method = RequestMethod.GET)
	public String viewCvoReport(Model model,HttpServletRequest request) {
		logger.info("cvoReportToBo Page is Called.");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserName(loginId);
		model.addAttribute("allDiary", branchOfficerServiceImpl.getAllReportOfCvo(userLoginAuthenticationDto) );
		return "cvoReportToBo";
	}
	
	@RequestMapping(value = "/user/bo/branchOfficer", method = RequestMethod.GET)
	public String branchOfficer(Model model,HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication(); 
	     String loginId = auth.getName(); // get logged in loginId HttpSession
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		 UserLoginAuthenticationDto userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
		 String uSection = userLoginAuthenticationDto.getLoginRoll();
		 model.addAttribute("allDiary" , commonServiceImpl.findAllDiaryForBo(uSection,loginId));
		logger.info("BO Inbox page is call");
		return "inboxBo";
	}
}
