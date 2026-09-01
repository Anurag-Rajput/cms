package com.cvc.dto;

public class AllegationDto {

	private Integer allegationId;
	private String allegation;

	public AllegationDto() {
	}

	public Integer getAllegationId() {
		return allegationId;
	}

	public void setAllegationId(Integer allegationId) {
		this.allegationId = allegationId;
	}

	public String getAllegation() {
		return allegation;
	}

	public void setAllegation(String allegation) {
		this.allegation = allegation;
	}

}
