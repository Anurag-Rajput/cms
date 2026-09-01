package com.cvc.dto;

import java.sql.Date;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class CvoDto {

	private String complaintnumber;

	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String sourceOfComplaint;
	@Pattern(regexp = "^[a-zA-Z\040]+|^$")
	private String gistOfAllegations;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String dueDateReport;

	private String file;

	@NotEmpty @Pattern(regexp = "^[0-9]+|^$")
	private String cvoFileNumber;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String observation;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String responseOfficialConcerned;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String counterResponse;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String conclusion;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String responsibilityOfficials;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String recommendationAction;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String systematicImprovement;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String assuranceMemo;
	@Pattern(regexp = "^[a-zA-Z\0400-9_.-]+|^$")
	private String biodataOfOfficials;
	
    private String officerName;
    private String officerDesignation;
    private Date investigationOpenDate;
   private Date investigationCloseDate;
   
   private String decision;
   private Date decisionDate;
   
   private String remark;
   private String cvcJuri;
   private String referFirstStage;
   
   private Date recommendationActionDate;
   private Date referFirstStageDate;
   private Date assuranceMemoDate;
   
   
   

	public Date getRecommendationActionDate() {
	return recommendationActionDate;
}

public void setRecommendationActionDate(Date recommendationActionDate) {
	this.recommendationActionDate = recommendationActionDate;
}

public Date getReferFirstStageDate() {
	return referFirstStageDate;
}

public void setReferFirstStageDate(Date referFirstStageDate) {
	this.referFirstStageDate = referFirstStageDate;
}

public Date getAssuranceMemoDate() {
	return assuranceMemoDate;
}

public void setAssuranceMemoDate(Date assuranceMemoDate) {
	this.assuranceMemoDate = assuranceMemoDate;
}

	public String getReferFirstStage() {
	return referFirstStage;
}

public void setReferFirstStage(String referFirstStage) {
	this.referFirstStage = referFirstStage;
}

	public String getCvcJuri() {
	return cvcJuri;
}

public void setCvcJuri(String cvcJuri) {
	this.cvcJuri = cvcJuri;
}

	public String getRemark() {
	return remark;
}

public void setRemark(String remark) {
	this.remark = remark;
}

	public String getDecision() {
	return decision;
}

public void setDecision(String decision) {
	this.decision = decision;
}

public Date getDecisionDate() {
	return decisionDate;
}

public void setDecisionDate(Date decisionDate) {
	this.decisionDate = decisionDate;
}

	public String getOfficerName() {
		return officerName;
	}

	public void setOfficerName(String officerName) {
		this.officerName = officerName;
	}

	public String getOfficerDesignation() {
		return officerDesignation;
	}

	public void setOfficerDesignation(String officerDesignation) {
		this.officerDesignation = officerDesignation;
	}


	public Date getInvestigationOpenDate() {
		return investigationOpenDate;
	}

	public void setInvestigationOpenDate(Date investigationOpenDate) {
		this.investigationOpenDate = investigationOpenDate;
	}

	public Date getInvestigationCloseDate() {
		return investigationCloseDate;
	}

	public void setInvestigationCloseDate(Date investigationCloseDate) {
		this.investigationCloseDate = investigationCloseDate;
	}

	public CvoDto() {
	}

	public String getComplaintnumber() {
		return complaintnumber;
	}

	public void setComplaintnumber(String complaintnumber) {
		this.complaintnumber = complaintnumber;
	}

	public String getSourceOfComplaint() {
		return sourceOfComplaint;
	}

	public void setSourceOfComplaint(String sourceOfComplaint) {
		this.sourceOfComplaint = sourceOfComplaint;
	}

	public String getGistOfAllegations() {
		return gistOfAllegations;
	}

	public void setGistOfAllegations(String gistOfAllegations) {
		this.gistOfAllegations = gistOfAllegations;
	}

	public String getDueDateReport() {
		return dueDateReport;
	}

	public void setDueDateReport(String dueDateReport) {
		this.dueDateReport = dueDateReport;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getCvoFileNumber() {
		return cvoFileNumber;
	}

	public void setCvoFileNumber(String cvoFileNumber) {
		this.cvoFileNumber = cvoFileNumber;
	}

	public String getObservation() {
		return observation;
	}

	public void setObservation(String observation) {
		this.observation = observation;
	}

	public String getResponseOfficialConcerned() {
		return responseOfficialConcerned;
	}

	public void setResponseOfficialConcerned(String responseOfficialConcerned) {
		this.responseOfficialConcerned = responseOfficialConcerned;
	}

	public String getCounterResponse() {
		return counterResponse;
	}

	public void setCounterResponse(String counterResponse) {
		this.counterResponse = counterResponse;
	}

	public String getConclusion() {
		return conclusion;
	}

	public void setConclusion(String conclusion) {
		this.conclusion = conclusion;
	}

	public String getResponsibilityOfficials() {
		return responsibilityOfficials;
	}

	public void setResponsibilityOfficials(String responsibilityOfficials) {
		this.responsibilityOfficials = responsibilityOfficials;
	}

	public String getRecommendationAction() {
		return recommendationAction;
	}

	public void setRecommendationAction(String recommendationAction) {
		this.recommendationAction = recommendationAction;
	}

	public String getSystematicImprovement() {
		return systematicImprovement;
	}

	public void setSystematicImprovement(String systematicImprovement) {
		this.systematicImprovement = systematicImprovement;
	}

	public String getAssuranceMemo() {
		return assuranceMemo;
	}

	public void setAssuranceMemo(String assuranceMemo) {
		this.assuranceMemo = assuranceMemo;
	}

	public String getBiodataOfOfficials() {
		return biodataOfOfficials;
	}

	public void setBiodataOfOfficials(String biodataOfOfficials) {
		this.biodataOfOfficials = biodataOfOfficials;
	}

}
