package com.cvc.dto;

public class ReportDto {

	private int broughtForward;
	private int recipt;
	private int totalDispose;
	private int totalPending;
	private String section;

	public ReportDto() {
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public int getBroughtForward() {
		return broughtForward;
	}

	public void setBroughtForward(int broughtForward) {
		this.broughtForward = broughtForward;
	}

	public int getRecipt() {
		return recipt;
	}

	public void setRecipt(int recipt) {
		this.recipt = recipt;
	}

	public int getTotalDispose() {
		return totalDispose;
	}

	public void setTotalDispose(int totalDispose) {
		this.totalDispose = totalDispose;
	}

	public int getTotalPending() {
		return totalPending;
	}

	public void setTotalPending(int totalPending) {
		this.totalPending = totalPending;
	}

}
