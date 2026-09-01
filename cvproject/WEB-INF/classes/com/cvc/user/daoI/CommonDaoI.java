package com.cvc.user.daoI;

import java.io.File;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

import com.cvc.dto.CitizenDto;
import com.cvc.dto.CvoDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.IpCaptureDto;
import com.cvc.dto.UserDto;
import com.cvc.dto.VigClearanceDto;
import com.cvc.dto.NotingDto;

public interface CommonDaoI {

	public void insertDairyDetails(DairyDetailsDto dairyDetailsDto, File file, String loginId, String roll,
			HttpServletRequest request) throws ParseException;

	public void insertCNumber(String complainNumber, HttpServletRequest request);

	public void insertUpdatedComplain(NotingDto notingDto, DairyDetailsDto dairyDetailsDto, Integer complaintNumber,
			String loginId,IpCaptureDto ipCaptureDto ) throws ParseException;

	public void insertForwardDetails(Integer complaintnumber, String loginId, NotingDto notingDto,
			DairyDetailsDto dairyDetailsDto,IpCaptureDto ipCaptureDto);

	public void insertNotingDetails(NotingDto notingDto, Integer complaintNumber, String loginId,String name, String uDesiganation,IpCaptureDto ipCaptureDto);

	public void insertUser(UserDto dairyDto) throws ParseException;

	public void insertCitizen(CitizenDto citizenDto);

	public void insertDetailsByCvo(CvoDto cvoDto);

	public void insertFiledDetails(DairyDetailsDto dairyDetailsDto, Integer complaintnumber, String loginId);

	public void insertMoreOrganization(DairyDetailsDto dairyDetailsDto, String complainNumber);

	public void insertClearance(VigClearanceDto vigClearanceDto, File file, String loginId, String roll,
			HttpServletRequest request);

	public void insertVijClearanceOfficerDetail(VigClearanceDto vigClearanceDto, String fileno, String loginId,String uDesiganation);

	public void insertUpdatedClearanceDetails(VigClearanceDto vigClearanceDto, String fileNo11, String loginId);

}
