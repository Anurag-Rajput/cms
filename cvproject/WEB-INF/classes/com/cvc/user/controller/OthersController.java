package com.cvc.user.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import com.cvc.dto.Email;
import com.cvc.dto.ResetPasswordDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.DiaryServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.user.service.impl.VigCleranceServiceImpl;
import com.cvc.util.FileUpload;
import com.cvc.util.MyUtill;
import com.cvc.util.RandomUnqieId;
import com.cvc.util.SingletonProperties;

@Controller
public class OthersController {

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);



	@Autowired
	CommonServiceImpl commonServiceImpl;

	@Autowired
	UserServiceImpl userServiceImpl;

	//String fileNo;

	@RequestMapping(value = "/user/others/coord", method = RequestMethod.GET)
	public String vigClearance(Model model, HttpServletRequest request) throws SQLException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		logger.info("Welcome Coordination! The client locale is {}.");
		if(uRoleTpye.contains("ROLE_CVC")) 
		{
			return "coordmenuCVC";
		}
		else
		{
			return "coordmenu";	
		}
		
	}
	
	@RequestMapping(value = "/user/others/cvodetail", method = RequestMethod.GET)
	public String cvoDetail(Model model, HttpServletRequest request) throws SQLException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		logger.info("Welcome Coordination! The client locale is {}.");
		return "cvoDetail";
	}
	
	@RequestMapping(value = "/user/others/cvoactivity", method = RequestMethod.GET)
	public String cvoActivity(Model model, HttpServletRequest request) throws SQLException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		logger.info("Welcome Coordination! The client locale is {}.");
		return "cvoActivity";
	}
	@RequestMapping(value = "/user/admin/transfer", method = RequestMethod.GET)
	public String Admin(Model model, HttpServletRequest request) throws SQLException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		logger.info("Welcome Admin! The client locale is {}.");
		return "Admin";
	}
	
	@RequestMapping(value = "/user/others/complaintUserPending", method = RequestMethod.GET)
	public String complaintUserPending(Model model, HttpServletRequest request) throws SQLException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		logger.info("Welcome Coordination! The client locale is {}.");
		return "complaintUserPending";
	
	}
	
	
}
