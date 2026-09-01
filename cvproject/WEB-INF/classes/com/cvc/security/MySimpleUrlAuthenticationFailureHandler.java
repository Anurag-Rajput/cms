package com.cvc.security;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.ui.Model;

import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.UserServiceImpl;

public class MySimpleUrlAuthenticationFailureHandler implements AuthenticationFailureHandler {

	@Autowired
	private UsernamePasswordAuthenticationFilter usernamePasswordAuthenticationFilter;

	@Autowired
	UserServiceImpl userServiceImpl;

	@Autowired
	CustomUserDetailsService customUserDetailsService;

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	protected Log logger = LogFactory.getLog(this.getClass());

	
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		

String ipAddress  = request.getHeader("X-FORWARDED-FOR");
if(ipAddress == null)
{
  ipAddress = request.getRemoteAddr();
}
System.out.println("ipAddress......>:"+ipAddress);



		HttpSession httpSession = request.getSession();
		
		httpSession.setAttribute("authenticationException", exception);
		String targetUrl = determineTargetUrl(exception,
				request.getParameter(usernamePasswordAuthenticationFilter.getUsernameParameter()),httpSession);
		userServiceImpl.updateLogs(request.getParameter(usernamePasswordAuthenticationFilter.getUsernameParameter()),new Timestamp(System.currentTimeMillis()),ipAddress,exception.getMessage());
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	protected String determineTargetUrl(AuthenticationException exception, String lastUserName,HttpSession httpSession) {
		logger.info("Password is not valild", exception);
		try {
			userServiceImpl.getUserAuthentication(lastUserName);
			userServiceImpl.getCitizenAuthentication(lastUserName);
			userServiceImpl.updateFalseUserAccount(lastUserName);
		} catch (Exception e) {
			logger.info("Update Authentication password ploicy", e);
			logger.info("Update Authentication password ploicy", exception);
		}
		
		
		 httpSession.setAttribute("loginId", lastUserName);
		
		UserLoginAuthenticationDto userLoginAuthenticationDto = null;
		UserLoginAuthenticationDto userLoginAuthenticationDto1 = null;
		userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(lastUserName);
		/*if(userLoginAuthenticationDto!=null){
			if(userLoginAuthenticationDto.getListRole().contains("ROLE_CVO") && userLoginAuthenticationDto.isFirstLogin()){
			return	"/user/firstProfile";
			}
		}
		
		userLoginAuthenticationDto1 = userServiceImpl.getCitizenAuthentication(lastUserName);
		if(userLoginAuthenticationDto1!=null){
			if(userLoginAuthenticationDto1.getListRole().contains("ROLE_CITIZEN") && userLoginAuthenticationDto1.isFirstLogin()){
			return	"/user/citizenProfile";
			}
		}*/
		

		return "/login";
	}
}
