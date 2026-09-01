package com.cvc.user.service;

import java.util.List;

import com.cvc.dto.ComplainDto;
import com.cvc.dto.OrganisationDto;
import com.cvc.dto.UserLoginAuthenticationDto;

public interface UserServiceI {

	
	public UserLoginAuthenticationDto getUserAuthentication(String userName);

	public	UserLoginAuthenticationDto getUserName(String userId);

	public List<OrganisationDto> findSection(String orgID);

	public List<ComplainDto> findAllDiary(String uSection, String loginId);

	public boolean updateFalseUserAccount(String userName);

}




