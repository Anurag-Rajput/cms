package com.cvc.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class CacheControlInterceptor extends HandlerInterceptorAdapter {


	private static final Logger logger = LoggerFactory
			.getLogger(CacheControlInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		long startTime = System.currentTimeMillis();
		logger.info("Pre Handler Request URL::" + request.getRequestURL().toString()
				+ ":: Start Time=" + System.currentTimeMillis());
		request.setAttribute("startTime", startTime);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if( request.getRequestURL().toString().contains("/user/getAllCitizen"))
		{
			// do nothing
		}
		else if( request.getRequestURL().toString().contains("/user/getDetailsByComplaintNumber"))
		{
			// do nothing
		}
		else if(auth.getName().toString().equalsIgnoreCase("anonymousUser"))
		{
			return false;
		}
		//if returned false, we need to make sure 'response' is sent
		if (handler instanceof HandlerMethod) {
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate, max-age=0, proxy-revalidate, no-transform, pre-check=0, post-check=0, private");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);
	       }
		httpSession.setAttribute("loginId", auth.getName());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("Post Handler Request URL::" + request.getRequestURL().toString()
				+ " Sent to Handler :: Current Time=" + System.currentTimeMillis());
		//we can add attributes in the modelAndView and use that in the view page
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		long startTime = (Long) request.getAttribute("startTime");
		logger.info(" After Handler Request URL::" + request.getRequestURL().toString()
				+ ":: End Time=" + System.currentTimeMillis());
		logger.info("Request URL::" + request.getRequestURL().toString()
				+ ":: Time Taken=" + (System.currentTimeMillis() - startTime));
	}
}
