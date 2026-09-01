package com.cvc.dto;

import java.util.List;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class DairyDetailsDto {

	private int complaintNumber;

	private int registraionId;

	//@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String senderName;

	@NotEmpty
	private String complainDate;

	@Pattern(regexp = "^[a-zA-Z0-9,./\040.-_)(/\\&-]+|^$")
	private String address;

	@Pattern(regexp = "^[a-zA-Z0-9,./\040.-_)(/\\&-]+|^$")
	private String address2;

	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String state;

	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String complaintSentType;

	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String city;

	private String csrf;

	private Integer pinno;

	/*@Pattern(regexp = "^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$)|| ^[a-zA-Z0-9](\\.?[a-zA-Z0-9_-]){0,}@(([a-zA-Z0-9\\\\-])+\\\\.)+([a-zA-Z0-9]{2,4})+$")*/
	private String email;

	@Pattern(regexp = "^[0-9]+|^$")
	private String mobileNo;

	@Pattern(regexp = "^[a-zA-Z\0400-9.]+|^$")
	private String complaintAgainstName;

	@Pattern(regexp = "^[a-zA-Z0-9\\s]+|^$")
	private String designation;

	@NotEmpty
	/*@Pattern(regexp = "^[a-zA-Z.,\040.)(/\\&-]+|^$")*/
	private String organization;

	//@Pattern(regexp = "^[0-9]+|^$")
	private String section;

	@Pattern(regexp = "^[a-zA-Z]+|^$")
	private String whetherFastTrack;

	@Pattern(regexp = "^[a-zA-Z]+|^$")
	private String complaintType;

	@Pattern(regexp = "^[a-zA-Z]+|^$")
	private String actionTaken;

	private String fileId;

	private MultipartFile uploadScanDocument;

	private String userid;

	private String documentStatus;

	private String fileName;

	private String complaint;

	//@Pattern(regexp = "^[a-zA-Z0-9.,\040.)(/\\&-]+|^$")
	private String gistOfAllegation;

	private List<String> moreOraganization;

	private List<String> moreDesiganation;

	private String dairyStatus;

	private String dairyId;

	private Integer userPID;

	@Pattern(regexp = "^[a-zA-Z]+|^$")
	private String boDecision;
	
	private String boDecisionDate;

	/*@Pattern(regexp = "^[a-zA-Z0-9,.\040.-_)(/\\&-]+|^$")*/
	private String detailsAlligations;

	private String organisationCode;

	private String boFiledAckDate;

	private String boNaAckDate;

	private String boNaOmDate;

	private String boircondate;

	private String boirremdate;

	private String confirmCVO;

	private String boirconrecdate;
	
	private String roletype;	

	public String getRoletype() {
		return roletype;
	}

	public void setRoletype(String roletype) {
		this.roletype = roletype;
	}

	@Pattern(regexp = "^[a-zA-Z]+|^$")
	private String boirfinaldec;

	private String boirfinaldecdate;

	@Pattern(regexp = "[^|^[0-9]]*")
	private String boirfileno;

	private String boirackdate;

	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String boName;
	
	private String createdDate;
	
	private String ministry_name;
	
	private String complaint_summary;
	
	private String complaint_description;
	
	private String org_file_name; 
	private String enc_file_name;
	private String file_location; 
	private String stageIR;
	
	private String boDecisionnew;
	private String boirfinaldectemp;
	private String boirfinaldecdatetemp;
	
	
	

	public String getBoirfinaldectemp() {
		return boirfinaldectemp;
	}

	public void setBoirfinaldectemp(String boirfinaldectemp) {
		this.boirfinaldectemp = boirfinaldectemp;
	}

	public String getBoirfinaldecdatetemp() {
		return boirfinaldecdatetemp;
	}

	public void setBoirfinaldecdatetemp(String boirfinaldecdatetemp) {
		this.boirfinaldecdatetemp = boirfinaldecdatetemp;
	}

	public String getBoDecisionnew() {
		return boDecisionnew;
	}

	public void setBoDecisionnew(String boDecisionnew) {
		this.boDecisionnew = boDecisionnew;
	}

	public String getComplaintSentType() {
		return complaintSentType;
	}

	public void setComplaintSentType(String complaintSentType) {
		this.complaintSentType = complaintSentType;
	}

	
	
	public String getConfirmCVO() {
		return confirmCVO;
	}

	public void setConfirmCVO(String confirmCVO) {
		this.confirmCVO = confirmCVO;
	}

	public String getDairyStatus() {
		return dairyStatus;
	}

	public void setDairyStatus(String dairyStatus) {
		this.dairyStatus = dairyStatus;
	}

	public String getOrganisationCode() {
		return organisationCode;
	}

	public void setOrganisationCode(String organisationCode) {
		this.organisationCode = organisationCode;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getBoircondate() {
		return boircondate;
	}

	public String getCsrf() {
		return csrf;
	}

	public void setCsrf(String csrf) {
		this.csrf = csrf;
	}

	public void setBoircondate(String boircondate) {
		this.boircondate = boircondate;
	}

	public String getBoirremdate() {
		return boirremdate;
	}

	public void setBoirremdate(String boirremdate) {
		this.boirremdate = boirremdate;
	}

	public String getBoirconrecdate() {
		return boirconrecdate;
	}

	public void setBoirconrecdate(String boirconrecdate) {
		this.boirconrecdate = boirconrecdate;
	}

	public String getBoirfinaldec() {
		return boirfinaldec;
	}

	public void setBoirfinaldec(String boirfinaldec) {
		this.boirfinaldec = boirfinaldec;
	}

	public String getBoirfinaldecdate() {
		return boirfinaldecdate;
	}

	public void setBoirfinaldecdate(String boirfinaldecdate) {
		this.boirfinaldecdate = boirfinaldecdate;
	}

	public String getBoirfileno() {
		return boirfileno;
	}

	public void setBoirfileno(String boirfileno) {
		this.boirfileno = boirfileno;
	}

	public String getBoirackdate() {
		return boirackdate;
	}

	public void setBoirackdate(String boirackdate) {
		this.boirackdate = boirackdate;
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

	public String getBoName() {
		return boName;
	}

	public void setBoName(String boName) {
		this.boName = boName;
	}

	public String getBoFiledAckDate() {
		return boFiledAckDate;
	}

	public void setBoFiledAckDate(String boFiledAckDate) {
		this.boFiledAckDate = boFiledAckDate;
	}

	public String getDetailsAlligations() {
		return detailsAlligations;
	}

	public void setDetailsAlligations(String detailsAlligations) {
		this.detailsAlligations = detailsAlligations;
	}

	public String getBoDecision() {
		return boDecision;
	}

	public void setBoDecision(String boDecision) {
		this.boDecision = boDecision;
	}

	public String getDairyId() {
		return dairyId;
	}

	public void setDairyId(String dairyId) {
		this.dairyId = dairyId;
	}

	public String getGistOfAllegation() {
		return gistOfAllegation;
	}

	public void setGistOfAllegation(String gistOfAllegation) {
		this.gistOfAllegation = gistOfAllegation;
	}

	public String getComplaint() {
		return complaint;
	}

	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}

	public List<String> getMoreOraganization() {
		return moreOraganization;
	}

	public Integer getUserPID() {
		return userPID;
	}

	public void setUserPID(Integer userPID) {
		this.userPID = userPID;
	}

	public void setMoreOraganization(List<String> moreOraganization) {
		this.moreOraganization = moreOraganization;
	}

	public List<String> getMoreDesiganation() {
		return moreDesiganation;
	}

	public void setMoreDesiganation(List<String> moreDesiganation) {
		this.moreDesiganation = moreDesiganation;
	}

	private Integer isActive;

	public int getRegistraionId() {
		return registraionId;
	}

	public void setRegistraionId(int registraionId) {
		this.registraionId = registraionId;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public DairyDetailsDto() {
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getComplaintNumber() {
		return complaintNumber;
	}

	public void setComplaintNumber(int complaintNumber) {
		this.complaintNumber = complaintNumber;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComplaintAgainstName() {
		return complaintAgainstName;
	}

	public void setComplaintAgainstName(String complaintAgainstName) {
		this.complaintAgainstName = complaintAgainstName;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getOrganization() {
		return organization;
	}

	public void setOrganization(String organization) {
		this.organization = organization;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getWhetherFastTrack() {
		return whetherFastTrack;
	}

	public void setWhetherFastTrack(String whetherFastTrack) {
		this.whetherFastTrack = whetherFastTrack;
	}

	public String getComplaintType() {
		return complaintType;
	}

	public void setComplaintType(String complaintType) {
		this.complaintType = complaintType;
	}

	public String getActionTaken() {
		return actionTaken;
	}

	public void setActionTaken(String actionTaken) {
		this.actionTaken = actionTaken;
	}

	public MultipartFile getUploadScanDocument() {
		return uploadScanDocument;
	}

	public void setUploadScanDocument(MultipartFile uploadScanDocument) {
		this.uploadScanDocument = uploadScanDocument;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getDocumentStatus() {
		return documentStatus;
	}

	public void setDocumentStatus(String documentStatus) {
		this.documentStatus = documentStatus;
	}

	public String getComplainDate() {
		return complainDate;
	}

	public void setComplainDate(String complainDate) {
		this.complainDate = complainDate;
	}

	public Integer getPinno() {
		return pinno;
	}

	public void setPinno(Integer pinno) {
		this.pinno = pinno;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getBoDecisionDate() {
		return boDecisionDate;
	}

	public void setBoDecisionDate(String boDecisionDate) {
		this.boDecisionDate = boDecisionDate;
	}

	public String getMinistry_name() {
		return ministry_name;
	}

	public void setMinistry_name(String ministry_name) {
		this.ministry_name = ministry_name;
	}

	public String getComplaint_summary() {
		return complaint_summary;
	}

	public void setComplaint_summary(String complaint_summary) {
		this.complaint_summary = complaint_summary;
	}

	public String getComplaint_description() {
		return complaint_description;
	}

	public void setComplaint_description(String complaint_description) {
		this.complaint_description = complaint_description;
	}

	public String getOrg_file_name() {
		return org_file_name;
	}

	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}

	public String getEnc_file_name() {
		return enc_file_name;
	}

	public void setEnc_file_name(String enc_file_name) {
		this.enc_file_name = enc_file_name;
	}

	public String getFile_location() {
		return file_location;
	}

	public void setFile_location(String file_location) {
		this.file_location = file_location;
	}

	public String getStageIR() {
		return stageIR;
	}

	public void setStageIR(String stageIR) {
		this.stageIR = stageIR;
	}

	
	
}
