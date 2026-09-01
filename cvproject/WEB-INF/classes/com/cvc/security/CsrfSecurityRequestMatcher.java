package com.cvc.security;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.util.matcher.RequestMatcher;

public class CsrfSecurityRequestMatcher implements RequestMatcher{

	
	 private Pattern allowedMethods = Pattern.compile("^(GET|HEAD|TRACE|OPTIONS|POST)$");
	 
	    /*@Override
	    public boolean matches(HttpServletRequest request) {
	        if(allowedMethods.matcher(request.getMethod()).matches()){
	            return false;
	        }
	 
	        return !unprotectedMatcher.matches(request);
	    }*/

		
		public boolean matches(HttpServletRequest request) {
			 if(allowedMethods.matcher(request.getMethod()).matches()){
		            return false;
		        }
		 
		        return true;
		}
}
