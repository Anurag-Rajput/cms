package com.cvc.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;


public class MyUtill {
	
	
	public static String getMd5(String s) {
		String passwordToHash = s;
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(passwordToHash.getBytes());
			byte[] bytes = md.digest();
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < bytes.length; i++) {
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			}
			generatedPassword = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return generatedPassword;
	}
	
	public static JdbcTemplate conn(DataSource dataSource) {
		JdbcTemplate jdbcTemplate = null;
		if (dataSource != null) {
			try {
				jdbcTemplate = new JdbcTemplate(dataSource);
			} catch (DataAccessException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return jdbcTemplate;
		}
		return jdbcTemplate;
	}
	
	public static void connClose(JdbcTemplate jdbcTemplate) {
		if (jdbcTemplate != null) {
			try {
				jdbcTemplate.getDataSource().getConnection().close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static String getSaltPassword(String md5Password) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(md5Password);
		return hashedPassword;
	}
	
	/**
	 * @author SWATI; Authentication Message Print.
	 * @param request
	 * @param model
	 */
	public static void authenticationMessage(HttpServletRequest request, Model model) {
		
		HttpSession httpSession = request.getSession();
		AuthenticationException message = (AuthenticationException) httpSession.getAttribute("authenticationException");
		String captchaMessage = (String) httpSession.getAttribute("captchMatch");
		if (captchaMessage != null) {
			model.addAttribute("message", captchaMessage);
			request.getSession().removeAttribute("captchMatch");
		} else if (message != null && !message.equals("")) {
			String authmessege = "";
			if (message.getMessage().equals("Bad credentials"))
				authmessege = "UserId/Password Is Wrong";
			else if (message.getMessage().contains("User Is Locked"))
				authmessege = "User Is Locked.Please login after 24 hour.";
			else
				authmessege = "UserId/Password Is Wrong";
			model.addAttribute("message", authmessege);
			request.getSession().removeAttribute("authenticationException");
		} else {
			model.addAttribute("message", "");
		}
	}

	
	
	
}


































