package com.cvc.user.session;

public class CitizenDetails {

	private String cAddress1;
	private String cAddress2;
	private String cAddress3;
	private String cCcity;
	private String cState;
	private Integer cPpincode;
	private String cEmail;
	private String cPhNumber;

	public CitizenDetails() {
	}

	public String getcAddress1() {
		return cAddress1;
	}

	public String getcAddress3() {
		return cAddress3;
	}

	public void setcAddress3(String cAddress3) {
		this.cAddress3 = cAddress3;
	}

	public void setcAddress1(String cAddress1) {
		this.cAddress1 = cAddress1;
	}

	public String getcAddress2() {
		return cAddress2;
	}

	public void setcAddress2(String cAddress2) {
		this.cAddress2 = cAddress2;
	}

	public String getcCcity() {
		return cCcity;
	}

	public void setcCcity(String cCcity) {
		this.cCcity = cCcity;
	}

	public String getcState() {
		return cState;
	}

	public void setcState(String cState) {
		this.cState = cState;
	}

	public Integer getcPpincode() {
		return cPpincode;
	}

	public void setcPpincode(Integer cPpincode) {
		this.cPpincode = cPpincode;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}

	public String getcPhNumber() {
		return cPhNumber;
	}

	public void setcPhNumber(String cPhNumber) {
		this.cPhNumber = cPhNumber;
	}

}
