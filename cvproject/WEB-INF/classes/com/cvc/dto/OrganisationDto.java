package com.cvc.dto;

public class OrganisationDto {

	public String organisationName;
	public String organisationCode;
	public String orgSection;
	
	 public OrganisationDto() {
	}

	 
	public String getOrgSection() {
		return orgSection;
	}


	public void setOrgSection(String orgSection) {
		this.orgSection = orgSection;
	}


	public String getOrganisationName() {
		return organisationName;
	}

	public void setOrganisationName(String organisationName) {
		this.organisationName = organisationName;
	}

	public String getOrganisationCode() {
		return organisationCode;
	}

	public void setOrganisationCode(String organisationCode) {
		this.organisationCode = organisationCode;
	}
	 
	 
}
