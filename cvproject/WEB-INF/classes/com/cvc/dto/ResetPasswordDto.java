package com.cvc.dto;

import org.hibernate.validator.constraints.NotEmpty;

public class ResetPasswordDto {

	@NotEmpty
	private String oldPassword;
	@NotEmpty
	private String newPassword;
	@NotEmpty
	private String reNewPassword;

	private String tempPassword;

	private String aspx;

	public ResetPasswordDto() {
	}

	public String getAspx() {
		return aspx;
	}

	public void setAspx(String aspx) {
		this.aspx = aspx;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getReNewPassword() {
		return reNewPassword;
	}

	public void setReNewPassword(String reNewPassword) {
		this.reNewPassword = reNewPassword;
	}

	public String getTempPassword() {
		return tempPassword;
	}

	public void setTempPassword(String tempPassword) {
		this.tempPassword = tempPassword;
	}

}
