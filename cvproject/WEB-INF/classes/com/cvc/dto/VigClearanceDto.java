package com.cvc.dto;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class VigClearanceDto {

	@NotEmpty
	@Pattern(regexp = "^[a-zA-Z0-9,.\040.-_)(/\\&-]+|^$")
	private String fileNo;

	
	private Integer vijHdrId;
	private String csrf;

	private String clearanceType;

	@NotEmpty
	@Pattern(regexp = "^[a-zA-Z0-9,.\040.-_)(/\\&-]+|^$")
	private String nameOfDepart;

	@Pattern(regexp = "^[a-zA-Z0-9.,\040.-_)(/\\&-]+|^$")
	private String departRefNo;

	private String departRefDate1;
	private String departRefRecvDate;

	@Pattern(regexp = "^[a-zA-Z0-9,.\040.-_)(/\\&-]+|^$")
	private String subject;

	private String country;
	private String city;

	private Integer numberOfOfficer;

	@Pattern(regexp = "^[a-zA-Z0-9,.\040.-_)(/\\&-]+|^$")
	private String nameOfOfficer;

	@Pattern(regexp = "^[a-zA-Z0-9,.\040.-_)(/\\&-]+|^$")
	private String service;

	@Pattern(regexp = "^[a-zA-Z0-9,.\040.-_)(/\\&-]+|^$")
	private String batch;

	@Pattern(regexp = "^[a-zA-Z0-9,.\040.-_)(/\\&-]+|^$")
	private String cadre;
	@Pattern(regexp = "^[a-zA-Z0-9,.\040.-_)(/\\&-]+|^$")
	private String empCode;
	private String letterToCBIDate;
	private String dateOfBirth;
	private String dateOfRetirement;
	private String letterToSectionDate;
	
	private String letterToConcerned;
	private String completeProfile;
	private String returnToDepart;
	private String feedbackReceivedFromCBIDate;

	private String feedbackReceivedFromSection;
	
	private String feedbackReceivedFromOrganization;
	private String fileSubmittedByDHDate;
	private String finalDecisionDate;
	private String dateOnFile;
	private String letterIssueDate;

	/*@Pattern(regexp = "^[a-zA-Z0-9\040_]+|^$")*/
	private String finalDecisionDd;
    
	private MultipartFile uploadScanDocument;
	
	private String fileName;
	private String fileId;

	public VigClearanceDto() {
	}

	public String getCsrf() {
		return csrf;
	}

	public void setCsrf(String csrf) {
		this.csrf = csrf;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public String getClearanceType() {
		return clearanceType;
	}

	public void setClearanceType(String clearanceType) {
		this.clearanceType = clearanceType;
	}

	public String getNameOfDepart() {
		return nameOfDepart;
	}

	public void setNameOfDepart(String nameOfDepart) {
		this.nameOfDepart = nameOfDepart;
	}

	public String getDepartRefNo() {
		return departRefNo;
	}

	public void setDepartRefNo(String departRefNo) {
		this.departRefNo = departRefNo;
	}

	public String getDepartRefDate1() {
		return departRefDate1;
	}

	public void setDepartRefDate1(String departRefDate1) {
		this.departRefDate1 = departRefDate1;
	}

	public String getDepartRefRecvDate() {
		return departRefRecvDate;
	}

	public void setDepartRefRecvDate(String departRefRecvDate) {
		this.departRefRecvDate = departRefRecvDate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getNumberOfOfficer() {
		return numberOfOfficer;
	}

	public void setNumberOfOfficer(Integer numberOfOfficer) {
		this.numberOfOfficer = numberOfOfficer;
	}

	public String getNameOfOfficer() {
		return nameOfOfficer;
	}

	public void setNameOfOfficer(String nameOfOfficer) {
		this.nameOfOfficer = nameOfOfficer;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getBatch() {
		return batch;
	}

	public void setBatch(String batch) {
		this.batch = batch;
	}

	public String getCadre() {
		return cadre;
	}

	public void setCadre(String cadre) {
		this.cadre = cadre;
	}

	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public String getLetterToCBIDate() {
		return letterToCBIDate;
	}

	public void setLetterToCBIDate(String letterToCBIDate) {
		this.letterToCBIDate = letterToCBIDate;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getDateOfRetirement() {
		return dateOfRetirement;
	}

	public void setDateOfRetirement(String dateOfRetirement) {
		this.dateOfRetirement = dateOfRetirement;
	}

	public String getLetterToSectionDate() {
		return letterToSectionDate;
	}

	public void setLetterToSectionDate(String letterToSectionDate) {
		this.letterToSectionDate = letterToSectionDate;
	}

	public String getLetterToConcerned() {
		return letterToConcerned;
	}

	public void setLetterToConcerned(String letterToConcerned) {
		this.letterToConcerned = letterToConcerned;
	}

	public String getCompleteProfile() {
		return completeProfile;
	}

	public void setCompleteProfile(String completeProfile) {
		this.completeProfile = completeProfile;
	}

	public String getReturnToDepart() {
		return returnToDepart;
	}

	public void setReturnToDepart(String returnToDepart) {
		this.returnToDepart = returnToDepart;
	}

	public String getFeedbackReceivedFromCBIDate() {
		return feedbackReceivedFromCBIDate;
	}

	public void setFeedbackReceivedFromCBIDate(String feedbackReceivedFromCBIDate) {
		this.feedbackReceivedFromCBIDate = feedbackReceivedFromCBIDate;
	}

	public String getFeedbackReceivedFromSection() {
		return feedbackReceivedFromSection;
	}

	public void setFeedbackReceivedFromSection(String feedbackReceivedFromSection) {
		this.feedbackReceivedFromSection = feedbackReceivedFromSection;
	}

	public String getFeedbackReceivedFromOrganization() {
		return feedbackReceivedFromOrganization;
	}

	public void setFeedbackReceivedFromOrganization(String feedbackReceivedFromOrganization) {
		this.feedbackReceivedFromOrganization = feedbackReceivedFromOrganization;
	}

	public String getFileSubmittedByDHDate() {
		return fileSubmittedByDHDate;
	}

	public void setFileSubmittedByDHDate(String fileSubmittedByDHDate) {
		this.fileSubmittedByDHDate = fileSubmittedByDHDate;
	}

	public String getFinalDecisionDate() {
		return finalDecisionDate;
	}

	public void setFinalDecisionDate(String finalDecisionDate) {
		this.finalDecisionDate = finalDecisionDate;
	}

	public String getDateOnFile() {
		return dateOnFile;
	}

	public void setDateOnFile(String dateOnFile) {
		this.dateOnFile = dateOnFile;
	}

	public String getLetterIssueDate() {
		return letterIssueDate;
	}

	public void setLetterIssueDate(String letterIssueDate) {
		this.letterIssueDate = letterIssueDate;
	}

	public String getFinalDecisionDd() {
		return finalDecisionDd;
	}

	public void setFinalDecisionDd(String finalDecisionDd) {
		this.finalDecisionDd = finalDecisionDd;
	}

	public MultipartFile getUploadScanDocument() {
		return uploadScanDocument;
	}

	public void setUploadScanDocument(MultipartFile uploadScanDocument) {
		this.uploadScanDocument = uploadScanDocument;
	}

	public Integer getVijHdrId() {
		return vijHdrId;
	}

	public void setVijHdrId(Integer vijHdrId) {
		this.vijHdrId = vijHdrId;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
