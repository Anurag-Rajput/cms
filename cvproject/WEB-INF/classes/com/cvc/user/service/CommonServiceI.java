package com.cvc.user.service;

import java.io.File;
import java.util.Collection;
import java.util.List;

import com.cvc.dto.AllegationDto;
import com.cvc.dto.CitizenDto;
import com.cvc.dto.ComplainDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.ForwardDto;
import com.cvc.dto.IpCaptureDto;
import com.cvc.dto.NotingDto;
import com.cvc.dto.OfficerDto;
import com.cvc.dto.OrganisationDto;
import com.cvc.dto.VigClearanceDto;

public interface CommonServiceI {

	public List<OrganisationDto> getAllOrganisation();

	public List<AllegationDto> findAllAllegation();

	public List<ComplainDto> findAllDiaryForBo(String uSection, String loginId);

	public List<NotingDto> findAllNoting(Integer complaintnumber);
	public List<NotingDto> findAllCPANoting(String complaintnumber);

	public List<DairyDetailsDto> viewComplain(Integer complaintnumber);

	public List<DairyDetailsDto> viewFiledComplain(Integer complaintnumber);

	public void addForwardDetails(Integer complaintnumber, String loginId, NotingDto notingDto,
			DairyDetailsDto dairyDetailsDto,IpCaptureDto ipCaptureDto);

	public void addNoting(NotingDto notingDto, Integer complaintNumber, String loginId,String name, String uDesiganation,IpCaptureDto ipCaptureDto);

	public List<OfficerDto> findAllOfficer(String loginId, String uSection);

	public List<ComplainDto> findAllPendingDairy(String loginId, Collection<String> uRoleTpye);

	public List<ComplainDto> findAllDiarySo(String uSection, String loginId);

	public List<ForwardDto> findAllSentComplain(String loginId);

	public List<CitizenDto> getCitizenDetials(String loginId);

	public	List<ComplainDto> getCitizenComplain(String loginId);

	public List<ComplainDto> findComplainByNo(String loginId, Integer complainNo);

	public List<OfficerDto> findAllBo();

	public List<ComplainDto> findAllDiaryForCvo(String uSection, String loginId);

	public List<ComplainDto> findDetailsByCno(String loginId, Integer complainNo);

	public List<ComplainDto> findDetailsByCnoForCvo(String loginId, Integer complainNo);

	public List<ComplainDto> findDetailsByCnoForDh(String loginId, Integer complainNo, String uSection);

	public List<ComplainDto> findAllPendingDairyforDairy(String loginId);

	public void addVijClearanceOfficerDetail(VigClearanceDto vigClearanceDto, String fileno, String loginId, String uDesiganation);

	public List<ComplainDto> findDetailsByCPACnoForDh(String loginId, String complainNo, String uSection);
	public void setEmailPhone(String loginId, String email);

	
	
	


}
