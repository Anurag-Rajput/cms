package com.cvc.dto;

public class TransferDto {

	private String fromUser;
	private String toUser;
	private String forwardDate;
	private String forwardSerialNo;
	private String currentSection;

	public String getFromUser() {
		return fromUser;
	}

	public void setFromUser(String fromUser) {
		this.fromUser = fromUser;
	}

	public String getToUser() {
		return toUser;
	}

	public void setToUser(String toUser) {
		this.toUser = toUser;
	}

	public String getForwardDate() {
		return forwardDate;
	}

	public void setForwardDate(String forwardDate) {
		this.forwardDate = forwardDate;
	}

	public String getForwardSerialNo() {
		return forwardSerialNo;
	}

	public void setForwardSerialNo(String forwardSerialNo) {
		this.forwardSerialNo = forwardSerialNo;
	}

	public String getCurrentSection() {
		return currentSection;
	}

	public void setCurrentSection(String currentSection) {
		this.currentSection = currentSection;
	}

}
