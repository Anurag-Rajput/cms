package com.cvc.dto;

public class MonthlyCommonDto {
	private int broughtForward;
	private int receipt;
	private int totalDisposal;
	private int totalPending;
	private int ir;
	private int fd;
	private int na;
	private int other;
	private int pendingLastMonth;
	private int pendingLastThreeMonth;
	private int pendingMoreThanThreeMonth;
	private int totalMonth;
	private int signed;
	private int pseudonymous;
	private int anonymous;
	private int pending;
	private String organization;
 	
	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public int getSigned() {
		return signed;
	}

	public void setSigned(int signed) {
		this.signed = signed;
	}

	public int getPseudonymous() {
		return pseudonymous;
	}

	public void setPseudonymous(int pseudonymous) {
		this.pseudonymous = pseudonymous;
	}

	public int getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(int anonymous) {
		this.anonymous = anonymous;
	}

	public int getPending() {
		return pending;
	}

	public void setPending(int pending) {
		this.pending = pending;
	}

	private String boName;

	public String getBoName() {
		return boName;
	}

	public void setBoName(String boName) {
		this.boName = boName;
	}

	public int getOther() {
		return other;
	}

	public void setOther(int other) {
		this.other = other;
	}

	public int getTotalPending() {
		return totalPending;
	}

	public void setTotalPending(int totalPending) {
		this.totalPending = totalPending;
	}

	public int getBroughtForward() {
		return broughtForward;
	}

	public void setBroughtForward(int broughtForward) {
		this.broughtForward = broughtForward;
	}

	public int getReceipt() {
		return receipt;
	}

	public void setReceipt(int receipt) {
		this.receipt = receipt;
	}

	public int getTotalDisposal() {
		return totalDisposal;
	}

	public void setTotalDisposal(int totalDisposal) {
		this.totalDisposal = totalDisposal;
	}

	public int getIr() {
		return ir;
	}

	public void setIr(int ir) {
		this.ir = ir;
	}

	public int getFd() {
		return fd;
	}

	public void setFd(int fd) {
		this.fd = fd;
	}

	public int getNa() {
		return na;
	}

	public void setNa(int na) {
		this.na = na;
	}

	public int getPendingLastMonth() {
		return pendingLastMonth;
	}

	public void setPendingLastMonth(int pendingLastMonth) {
		this.pendingLastMonth = pendingLastMonth;
	}

	public int getPendingLastThreeMonth() {
		return pendingLastThreeMonth;
	}

	public void setPendingLastThreeMonth(int pendingLastThreeMonth) {
		this.pendingLastThreeMonth = pendingLastThreeMonth;
	}

	public int getPendingMoreThanThreeMonth() {
		return pendingMoreThanThreeMonth;
	}

	public void setPendingMoreThanThreeMonth(int pendingMoreThanThreeMonth) {
		this.pendingMoreThanThreeMonth = pendingMoreThanThreeMonth;
	}

	public int getTotalMonth() {
		return totalMonth;
	}

	public void setTotalMonth(int totalMonth) {
		this.totalMonth = totalMonth;
	}

}
