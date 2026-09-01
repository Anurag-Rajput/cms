package com.cvc.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.base.Throwables;

/**
 * General error handler for the application.
 */
@ControllerAdvice
class ExceptionHandler {

	/**
	 * Handle exceptions thrown by handlers.
	 */

	@org.springframework.web.bind.annotation.ExceptionHandler(value = Exception.class)

	public String exception(Exception exception, WebRequest request, HttpServletRequest req) {
	/*String	url="/user/j_spring_security_logout";
             ModelAndView modelAndView = new ModelAndView();
             modelAndView.addObject("url",url);
             modelAndView.setViewName("error");
	*/		System.out.println(
				"\n" + "##################################" + "\n" + "Exception All details" + "\n" + "Exception !!!"
						+ "   =   " + exception + "\n" + "Exception url" + "  =   " + req.getRequestURL() + "\n");
       
			for (StackTraceElement st : exception.getStackTrace()) {
			System.out.println("***********************************" + "\n" + "Class Name:   " + st.getClassName()
					+ "\n" + "Method Name: " + st.getMethodName() + "\n" + "line Number: " + st.getLineNumber() + "\n");
			System.out.println("***********************************" + "\n" + "###################################"+"\n");
			break;
		  }
			/*modelAndView.addObject("errorMessage", Throwables.getRootCause(exception));*/

		return "redirect:/doLogout";
	}
}