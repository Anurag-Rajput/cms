package com.cvc.security;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.cvc.dto.IpCaptureDto;
import com.cvc.user.service.impl.UserServiceImpl;

public class MySimpleUrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    protected Log logger = LogFactory.getLog(this.getClass());
 
    @Autowired
	UserServiceImpl userServiceImpl;
    
    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
 
    
    public void onAuthenticationSuccess(HttpServletRequest request, 
      HttpServletResponse response, Authentication authentication) throws IOException {
    	

		String ipAddress  = request.getHeader("X-FORWARDED-FOR");
		if(ipAddress == null)
		{
		  ipAddress = request.getRemoteAddr();
		}
		System.out.println("ipAddress......>:"+ipAddress);



    	String captcha=request.getParameter("captcha");
    	HttpSession httpSession = request.getSession();
    	String serveletCaptcha=(String)httpSession.getAttribute("CAPTCHA");
    	if(!captcha.equals(serveletCaptcha)){
    		httpSession.setAttribute("captchMatch", "Captcha Is Not Match");
    		 redirectStrategy.sendRedirect(request, response, "/login");
		}
        handle(request, response, authentication);
        clearAuthenticationAttributes(request);
        ipCapture(authentication.getName(),ipAddress,request);
        userServiceImpl.updateLogs(authentication.getName(),new Timestamp(System.currentTimeMillis()),ipAddress,"successfull");
        
        
    }
 
    private void ipCapture(String name, String ipAddress, HttpServletRequest request) {
    	HttpSession httpSession = request.getSession();
    	IpCaptureDto ipCapture = new IpCaptureDto();
    	ipCapture.setIpAddress(ipAddress);
    	ipCapture.setByUserId(name);
    	ipCapture.setOnDate(new Date().toString());
    	
    	httpSession.setAttribute("IpCaptureDetail", ipCapture);
    	// TODO Auto-generated method stub
		
	}

	protected void handle(HttpServletRequest request, 
      HttpServletResponse response, Authentication authentication) throws IOException {
        String targetUrl = determineTargetUrl(authentication);
        if (response.isCommitted()) {
            logger.debug("Response has already been committed. Unable to redirect to " + targetUrl);
            return;
        }
 
        redirectStrategy.sendRedirect(request, response, targetUrl);
    }
 
    /** Builds the target URL according to the logic defined in the main class Javadoc. */
    protected String determineTargetUrl(Authentication authentication) {
        //boolean isUser = false;
        boolean isDiary = false;
        boolean isAdmin = false;
        boolean isDH = false;
        boolean isSO = false;
        boolean isBO = false;
        boolean isCVO = false;
        boolean isHELP = false;
        boolean isCLR = false;
        boolean isCITIZEN = false;
        boolean isOthers=false;
        boolean iscvc=false;
        
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals("ROLE_Diary")) {
            	isDiary = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_DH")) {
                isDH = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_SO")) {
            	isSO = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_BO")) {
            	isBO = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_CVO")) {
            	isCVO = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_HELP")) {
            	isHELP = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_CITIZEN")) {
            	isCITIZEN = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_CLR")) {
            	isCLR = true;
                break;
            }else if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
                isAdmin = true;
                break;
            }
            else if (grantedAuthority.getAuthority().equals("ROLE_COORD")) {
                isOthers = true;
                break;
            }
            else if (grantedAuthority.getAuthority().equals("ROLE_CVC")) {
                iscvc = true;
                break;
            }
        }
 
        if (isDiary) {
            return "/user/dairy/addDairyComplain";
        } else if (isDH) {
            return "/user/dh/dealingHand";
        } else if (isSO) {
            return "/user/so/sectionOfficer";
        } else if (isBO) {
            return "/user/bo/branchOfficer";
        } else if (isCVO) {
            return "/user/cvofficer/cvo";
        }  else if (isHELP) {
            return "/user/helpLine";
        } else if (isCITIZEN) {
            return "/user/public/citizen";
        } else if (isCLR) {
            return "/user/clr/vigClearance";
        }else if (isAdmin) {
            return "/user/admin/transfer";
        }else if(iscvc)
        {
        	return "/user/others/complaintUserPending";
        }
        else if(isOthers)
        {
        	return "/user/others/coord";
        	
        }
        else {
        	 
            throw new IllegalStateException();
        }
    }
 
    protected void clearAuthenticationAttributes(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return;
        }
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
    }
 
    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }
    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }
}