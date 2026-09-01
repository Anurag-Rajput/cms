package com.cvc.dto;

public class NotingDto {

	private Integer notingId;
	private String noterName;
	private String name;
	private String desiganation;
	private String notingMessage1;
	private String notingMessage2;
	private String notingMessage3;
	private String reason;
	private String forwardto;
	private String forwradvalue;	
	private String notingdate;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getForwradvalue() {
		return forwradvalue;
	}

	public void setForwradvalue(String forwradvalue) {
		this.forwradvalue = forwradvalue;
	}

	public NotingDto() {
	}

	public Integer getNotingId() {
		return notingId;
	}

	public void setNotingId(Integer notingId) {
		this.notingId = notingId;
	}

	public String getNoterName() {
		return noterName;
	}

	public void setNoterName(String noterName) {
		this.noterName = noterName;
	}

	public String getDesiganation() {
		return desiganation;
	}

	public void setDesiganation(String desiganation) {
		this.desiganation = desiganation;
	}

	public String getNotingMessage1() {
		return notingMessage1;
	}

	public void setNotingMessage1(String notingMessage1) {
		this.notingMessage1 = notingMessage1;
	}

	public String getNotingMessage2() {
		return notingMessage2;
	}

	public void setNotingMessage2(String notingMessage2) {
		this.notingMessage2 = notingMessage2;
	}

	public String getNotingMessage3() {
		return notingMessage3;
	}

	public void setNotingMessage3(String notingMessage3) {
		this.notingMessage3 = notingMessage3;
	}

	public String getForwardto() {
		return forwardto;
	}

	public void setForwardto(String forwardto) {
		this.forwardto = forwardto;
	}

	public String getNotingdate() {
		return notingdate;
	}

	public void setNotingdate(String notingdate) {
		this.notingdate = notingdate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
