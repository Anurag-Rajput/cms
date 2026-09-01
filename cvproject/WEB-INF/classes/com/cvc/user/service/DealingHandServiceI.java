package com.cvc.user.service;

import java.util.List;

import com.cvc.dto.DairyDetailsDto;

public interface DealingHandServiceI {

	public List<DairyDetailsDto> viewComplain(Integer complaintnumber);


	


	public List<DairyDetailsDto> viewCPAComplain(String complaintnumberString);


}
