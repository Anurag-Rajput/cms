package com.cvc.dto;

public class EmailSmsUserDto {
	private String name;
	private String emailId;
	private String designation;
	private String org;
	private String mobileNumber;
	private boolean sendCommunication;
	private String userRole;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public boolean isSendCommunication() {
		return sendCommunication;
	}
	public void setSendCommunication(boolean sendCommunication) {
		this.sendCommunication = sendCommunication;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
}
