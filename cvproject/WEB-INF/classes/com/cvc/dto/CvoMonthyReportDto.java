package com.cvc.dto;

import org.springframework.web.multipart.MultipartFile;

public class CvoMonthyReportDto {

	private Integer month;
	private Integer year;
	private String organisationCode;
	private String organisation;
	private String branchOfficer;
	private String branchOfficerCode;
	private String reportSubmitDate;
	private String cvoName;
	private String uploadedFileName;
	private MultipartFile uploadedReport;

	public CvoMonthyReportDto() {
	}

	public String getUploadedFileName() {
		return uploadedFileName;
	}

	public void setUploadedFileName(String uploadedFileName) {
		this.uploadedFileName = uploadedFileName;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public String getOrganisationCode() {
		return organisationCode;
	}

	public void setOrganisationCode(String organisationCode) {
		this.organisationCode = organisationCode;
	}

	public String getOrganisation() {
		return organisation;
	}

	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}

	public String getBranchOfficer() {
		return branchOfficer;
	}

	public void setBranchOfficer(String branchOfficer) {
		this.branchOfficer = branchOfficer;
	}

	public String getBranchOfficerCode() {
		return branchOfficerCode;
	}

	public void setBranchOfficerCode(String branchOfficerCode) {
		this.branchOfficerCode = branchOfficerCode;
	}

	public String getReportSubmitDate() {
		return reportSubmitDate;
	}

	public void setReportSubmitDate(String reportSubmitDate) {
		this.reportSubmitDate = reportSubmitDate;
	}

	public String getCvoName() {
		return cvoName;
	}

	public void setCvoName(String cvoName) {
		this.cvoName = cvoName;
	}

	public MultipartFile getUploadedReport() {
		return uploadedReport;
	}

	public void setUploadedReport(MultipartFile uploadedReport) {
		this.uploadedReport = uploadedReport;
	}

}
