package com.cvc.dto;

import javax.validation.constraints.Pattern;

/*import org.hibernate.validator.constraints.NotEmpty;*/

public class CitizenDto {

/*	@NotEmpty
	@Pattern(regexp = "^[a-z0-9_-]{3,15}|^$")*/
	private String citizenId;

	private String captcha;
	
	
//	@NotEmpty
	private String password;

//	@NotEmpty
	private String rePassword;

//	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String securityQuestion;

//	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String securityAnswer;

//	@Pattern(regexp = "^[a-zA-Z\040.]+|^$")
	private String salutation;

//	@NotEmpty
//	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String name;

	private Integer age;

//	@NotEmpty
//	@Pattern(regexp = "^[a-zA-Z0-9]+|^$")
	private String idcardnumber;

//	@NotEmpty
//	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String address1;

//	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String address2;
	
//	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String address3;

//	@NotEmpty
//	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String state;

//	@NotEmpty
//	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String city;

//	@Pattern(regexp = "^[a-z0-9](\\.?[a-z0-9_-]){0,}@[a-z0-9-]+\\.([a-z]{1,6}\\.)?[a-z]{2,6}$")
	private String citizenEmail;

//	@Pattern(regexp = "^[0-9]+|^$")
	private String contactNumber;

	private Integer pincode;
	
	private Integer landLine;
	
	private Integer STDcode;
	
	private Long size;
	

	public Long getSize() {
		return size;
	}

	public void setSize(Long size) {
		this.size = size;
	}

	public Integer getSTDcode() {
		return STDcode;
	}

	public void setSTDcode(Integer sTDcode) {
		STDcode = sTDcode;
	}

	private String createdDate;


	public Integer getLandLine() {
		return landLine;
	}

	public void setLandLine(Integer landLine) {
		this.landLine = landLine;
	}

	public CitizenDto() {
	}

	public String getCitizenId() {
		return citizenId;
	}

	public void setCitizenId(String citizenId) {
		this.citizenId = citizenId;
	}

	public String getPassword() {
		return password;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSecurityQuestion() {
		return securityQuestion;
	}

	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public String getSecurityAnswer() {
		return securityAnswer;
	}

	
	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}

	public String getCitizenEmail() {
		return citizenEmail;
	}

	public void setCitizenEmail(String citizenEmail) {
		this.citizenEmail = citizenEmail;
	}

	public String getSalutation() {
		return salutation;
	}

	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name.toUpperCase();
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getIdcardnumber() {
		return idcardnumber;
	}

	public void setIdcardnumber(String idcardnumber) {
		this.idcardnumber = idcardnumber;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1.toUpperCase();
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2.toUpperCase();
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getPincode() {
		return pincode;
	}

	public void setPincode(Integer pincode) {
		this.pincode = pincode;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}
	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3.toUpperCase();
	}

}
