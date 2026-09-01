package com.cvc.dto;

import java.util.List;

public class ComplainDto {

	private String senderName;
	private String organizationName;
	private String recipientName;
	private String complainNo;
	private String complaintAgainstName;
	private String designation;
	private String complaindate;
	private String createdDate;
	private String complaint;
	private String rollType;
	private String allegationDeatils;
	private String compliant;
	private String section;
	private String dairyStatus;
	private String uploadDocument;
	private String mobileNo;
	private String boirremidate;
	private String boirconrecdate;
	private String boircondate;
	private String boirackdate;
	private String ir; 
	private String factual_report; 
	private String filed; 
	private String direct_invest; 
	private String action_taken_report;
	
	private String bofiledackdate;
	private String boNaAckDate;
	private String boNaOmDate;
	
	private String complaintStatus;
	private String decision;
	
	private String decisiondate;
	private String boDecision;
	private String boDecisionDate;
	private Integer status;
	private Integer cvoview;
	private boolean important;
	
	public boolean isImportant() {
		return important;
	}

	public void setImportant(boolean important) {
		this.important = important;
	}
	private List<ComplainDto> complainofcitizen;
	private List<ComplainDto> complainofdairy;
	private List<ComplainDto> complainofhelpline;
	

	

	public String getBofiledackdate() {
		return bofiledackdate;
	}

	public void setBofiledackdate(String bofiledackdate) {
		this.bofiledackdate = bofiledackdate;
	}

	public String getBoNaAckDate() {
		return boNaAckDate;
	}

	public void setBoNaAckDate(String boNaAckDate) {
		this.boNaAckDate = boNaAckDate;
	}

	public String getBoNaOmDate() {
		return boNaOmDate;
	}

	public void setBoNaOmDate(String boNaOmDate) {
		this.boNaOmDate = boNaOmDate;
	}

	public String getBoDecision() {
		return boDecision;
	}

	public void setBoDecision(String boDecision) {
		this.boDecision = boDecision;
	}

	public Integer getCvoview() {
		return cvoview;
	}

	public void setCvoview(Integer cvoview) {
		this.cvoview = cvoview;
	}

	public List<ComplainDto> getComplainofcitizen() {
		return complainofcitizen;
	}

	public void setComplainofcitizen(List<ComplainDto> complainofcitizen) {
		this.complainofcitizen = complainofcitizen;
	}

	public List<ComplainDto> getComplainofdairy() {
		return complainofdairy;
	}

	public void setComplainofdairy(List<ComplainDto> complainofdairy) {
		this.complainofdairy = complainofdairy;
	}

	public List<ComplainDto> getComplainofhelpline() {
		return complainofhelpline;
	}

	public void setComplainofhelpline(List<ComplainDto> complainofhelpline) {
		this.complainofhelpline = complainofhelpline;
	}

	public String getBoirackdate() {
		return boirackdate;
	}

	public void setBoirackdate(String boirackdate) {
		this.boirackdate = boirackdate;
	}

	public String getBoirremidate() {
		return boirremidate;
	}

	public void setBoirremidate(String boirremidate) {
		this.boirremidate = boirremidate;
	}

	public String getBoirconrecdate() {
		return boirconrecdate;
	}

	public void setBoirconrecdate(String boirconrecdate) {
		this.boirconrecdate = boirconrecdate;
	}

	public String getBoircondate() {
		return boircondate;
	}

	public void setBoircondate(String boircondate) {
		this.boircondate = boircondate;
	}
private String fileNo;
	
	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getIr() {
		return ir;
	}

	public void setIr(String ir) {
		this.ir = ir;
	}

	public String getFactual_report() {
		return factual_report;
	}

	public void setFactual_report(String factual_report) {
		this.factual_report = factual_report;
	}

	public String getFiled() {
		return filed;
	}

	public void setFiled(String filed) {
		this.filed = filed;
	}

	public String getDirect_invest() {
		return direct_invest;
	}

	public void setDirect_invest(String direct_invest) {
		this.direct_invest = direct_invest;
	}

	public String getAction_taken_report() {
		return action_taken_report;
	}

	public void setAction_taken_report(String action_taken_report) {
		this.action_taken_report = action_taken_report;
	}

	public String getDiscrete_veri() {
		return discrete_veri;
	}

	public void setDiscrete_veri(String discrete_veri) {
		this.discrete_veri = discrete_veri;
	}

	private String discrete_veri; 

	public ComplainDto() {
	}

	public String getAllegationDeatils() {
		return allegationDeatils;
	}

	public void setAllegationDeatils(String allegationDeatils) {
		this.allegationDeatils = allegationDeatils;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getComplaintStatus() {
		return complaintStatus;
	}

	public void setComplaintStatus(String complaintStatus) {
		this.complaintStatus = complaintStatus;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getDecision() {
		return decision;
	}

	public void setDecision(String decision) {
		this.decision = decision;
	}

	public String getDecisiondate() {
		return decisiondate;
	}

	public void setDecisiondate(String decisiondate) {
		this.decisiondate = decisiondate;
	}

	public String getDairyStatus() {
		return dairyStatus;
	}

	public void setDairyStatus(String dairyStatus) {
		this.dairyStatus = dairyStatus;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getComplaintAgainstName() {
		return complaintAgainstName;
	}

	public void setComplaintAgainstName(String complaintAgainstName) {
		this.complaintAgainstName = complaintAgainstName;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getCompliant() {
		return compliant;
	}

	public void setCompliant(String compliant) {
		this.compliant = compliant;
	}

	public String getRollType() {
		return rollType;
	}

	public void setRollType(String rollType) {
		this.rollType = rollType;
	}

	public String getComplaint() {
		return complaint;
	}

	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getComplainNo() {
		return complainNo;
	}

	public void setComplainNo(String complainNo) {
		this.complainNo = complainNo;
	}

	public String getComplaindate() {
		return complaindate;
	}

	public void setComplaindate(String complaindate) {
		this.complaindate = complaindate;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getUploadDocument() {
		return uploadDocument;
	}

	public void setUploadDocument(String uploadDocument) {
		this.uploadDocument = uploadDocument;
	}

	public String getBoDecisionDate() {
		return boDecisionDate;
	}

	public void setBoDecisionDate(String boDecisionDate) {
		this.boDecisionDate = boDecisionDate;
	}

}
