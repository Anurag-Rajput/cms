package com.cvc.user.service;

import java.io.File;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.UserDto;

public interface DiaryServiceI {


	public void addDairyDetails(DairyDetailsDto dairyDetailsDto, File file, String loginId, String roll,
			HttpServletRequest request) throws ParseException;

	public void updateCNumber(String complainNumber, HttpServletRequest request);

	public List<DairyDetailsDto> getDairy(HttpServletRequest request);

	public void insertUserDetails(UserDto dairyDto) throws ParseException;

	public void addMoreOrganization(DairyDetailsDto dairyDetailsDto, String complainNumber);

}
