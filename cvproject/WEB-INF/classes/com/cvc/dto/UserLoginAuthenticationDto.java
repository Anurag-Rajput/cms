package com.cvc.dto;

import java.util.Collection;

public class UserLoginAuthenticationDto {

	private Collection<String> listRole;
	private String username;
	private String name;
	private String password;
	private Integer userPID;
	private Integer dairyStatus;
	private String loginRoll;
	private String org;
	private String cvoCode;
	private String desiganation;
	private String email;
	private String mobile;
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	private boolean firstLogin;
	private boolean isAccountLocked;

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;
	}

	public String getCvoCode() {
		return cvoCode;
	}

	public void setCvoCode(String cvoCode) {
		this.cvoCode = cvoCode;
	}

	public boolean isFirstLogin() {
		return firstLogin;
	}

	public void setFirstLogin(boolean firstLogin) {
		this.firstLogin = firstLogin;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isAccountLocked() {
		return isAccountLocked;
	}

	public void setAccountLocked(boolean isAccountLocked) {
		this.isAccountLocked = isAccountLocked;
	}

	public UserLoginAuthenticationDto() {
	}

	public String getDesiganation() {
		return desiganation;
	}

	public void setDesiganation(String desiganation) {
		this.desiganation = desiganation;
	}

	public Integer getDairyStatus() {
		return dairyStatus;
	}

	public void setDairyStatus(Integer dairyStatus) {
		this.dairyStatus = dairyStatus;
	}

	public String getLoginRoll() {
		return loginRoll;
	}

	public void setLoginRoll(String loginRoll) {
		this.loginRoll = loginRoll;
	}

	public Integer getUserPID() {
		return userPID;
	}

	public void setUserPID(Integer userPID) {
		this.userPID = userPID;
	}

	public Collection<String> getListRole() {
		return listRole;
	}

	public void setListRole(Collection<String> listRole) {
		this.listRole = listRole;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
