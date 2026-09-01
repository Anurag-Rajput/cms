package com.cvc.dto;

public class OfficerDto {

	private String officerName;
	private String officerDesiganation;
	private String officerCode;
	private String loginType;
	private String dairyStatus;
	private String ackGenBy;
	private boolean naAckFlag;
	private boolean filedAckFlag;
	private boolean omAckFlag;

	public OfficerDto() {
	}

	public boolean isNaAckFlag() {
		return naAckFlag;
	}

	public void setNaAckFlag(boolean naAckFlag) {
		this.naAckFlag = naAckFlag;
	}

	public boolean isFiledAckFlag() {
		return filedAckFlag;
	}

	public void setFiledAckFlag(boolean filedAckFlag) {
		this.filedAckFlag = filedAckFlag;
	}

	public boolean isOmAckFlag() {
		return omAckFlag;
	}

	public void setOmAckFlag(boolean omAckFlag) {
		this.omAckFlag = omAckFlag;
	}

	public String getAckGenBy() {
		return ackGenBy;
	}

	public void setAckGenBy(String ackGenBy) {
		this.ackGenBy = ackGenBy;
	}

	public String getDairyStatus() {
		return dairyStatus;
	}

	public void setDairyStatus(String dairyStatus) {
		this.dairyStatus = dairyStatus;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getOfficerName() {
		return officerName;
	}

	public void setOfficerName(String officerName) {
		this.officerName = officerName;
	}

	public String getOfficerDesiganation() {
		return officerDesiganation;
	}

	public void setOfficerDesiganation(String officerDesiganation) {
		this.officerDesiganation = officerDesiganation;
	}

	public String getOfficerCode() {
		return officerCode;
	}

	public void setOfficerCode(String officerCode) {
		this.officerCode = officerCode;
	}

}
