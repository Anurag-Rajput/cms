package com.cvc.dto;

import java.util.Date;

public class IpCaptureDto {
	private String ipAddress;
	private String byUserId;
	private String onDate;
	
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public String getByUserId() {
		return byUserId;
	}
	public void setByUserId(String byUserId) {
		this.byUserId = byUserId;
	}
	public String getOnDate() {
		return onDate;
	}
	public void setOnDate(String date) {
		this.onDate = date;
	}

}
