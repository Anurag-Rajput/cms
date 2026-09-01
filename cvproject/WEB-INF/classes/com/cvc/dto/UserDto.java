package com.cvc.dto;

import java.util.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class UserDto {

	@NotEmpty
	//@Pattern(regexp = "^[a-zA-Z\040]+|^$")
//	@Pattern(regexp = "^[a-zA-Z ]+|^$")
	private String userName;

	private String captcha;

	@NotEmpty
	@Pattern(regexp = "^[a-zA-Z0-9_-]{6,15}|^$")
	private String userID;

	@NotEmpty
	private String password;

	private String rePassword;

	@Pattern(regexp = "^[0-9]+|^$")
	private String mobileNumber;

	@Pattern(regexp = "^[a-z0-9](\\.?[a-z0-9_-]){0,}@[a-z0-9-]+\\.([a-z]{1,6}\\.)?[a-z]{2,6}$|^$")
	private String userEmail;

	@NotEmpty
	@Pattern(regexp = "^[a-zA-Z.\040.)(/\\&-]+|^$")
	private String organisation;

	private String section;

	@Pattern(regexp = "^[a-zA-Z_]+|^$")
	private String loginType;

	@Pattern(regexp = "^[a-zA-Z-\0400-9]+|^$")
	private String loginRoll;

	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String desiganation;

	@NotEmpty
	private String dateOfTenure;

	private String currentDate;

	@Pattern(regexp = "^[a-zA-Z]+|^$")
	private String boCode;

	@Pattern(regexp = "^[a-zA-Z0-9]+|^$")
	private String cvoCode;

	private String csrf;
	
	private boolean firstLogin;

	public boolean isFirstLogin() {
		return firstLogin;
	}

	public void setFirstLogin(boolean firstLogin) {
		this.firstLogin = firstLogin;
	}

	public UserDto() {
	}

	public String getCsrf() {
		return csrf;
	}

	public void setCsrf(String csrf) {
		this.csrf = csrf;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public String getCvoCode() {
		return cvoCode;
	}

	public void setCvoCode(String cvoCode) {
		this.cvoCode = cvoCode;
	}

	public String getBoCode() {
		return boCode;
	}

	public void setBoCode(String boCode) {
		this.boCode = boCode;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getOrganisation() {
		return organisation;
	}

	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getLoginRoll() {
		return loginRoll;
	}

	public void setLoginRoll(String loginRoll) {
		this.loginRoll = loginRoll;
	}

	public String getCurrentDate(Date date) {
		return currentDate;
	}

	public void setCurrentDate(String currentDate) {
		this.currentDate = currentDate;
	}

	public String getDesiganation() {
		return desiganation;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public String getCurrentDate() {
		return currentDate;
	}

	public void setDesiganation(String desiganation) {
		this.desiganation = desiganation;
	}

	public String getDateOfTenure() {
		return dateOfTenure;
	}

	public void setDateOfTenure(String dateOfTenure) {
		this.dateOfTenure = dateOfTenure;
	}

}
