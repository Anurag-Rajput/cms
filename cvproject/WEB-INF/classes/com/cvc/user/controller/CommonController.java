package com.cvc.user.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Collection;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cvc.dto.AccessControlDto;
import com.cvc.dto.CitizenDto;
import com.cvc.dto.ComplainDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.IpCaptureDto;
import com.cvc.dto.NotingDto;
import com.cvc.dto.OfficerDto;
import com.cvc.dto.OrganisationDto;
import com.cvc.dto.ReportDto;
import com.cvc.dto.ResetPasswordDto;
import com.cvc.dto.UserDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.service.impl.CommonServiceImpl;
import com.cvc.user.service.impl.DealingHandServiceImpl;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.util.MyUtill;
import com.google.common.io.Files;

@Controller
public class CommonController {
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Autowired
	UserServiceImpl userServiceImpl;

	@Autowired
	CommonServiceImpl commonServiceImpl;
	
	@Autowired
	DealingHandServiceImpl dealingHandServiceImpl;

	@Autowired
	DataSource dataSource;

	@RequestMapping(value = "/branchByOrgination", method = RequestMethod.POST)
	public @ResponseBody List<OrganisationDto> addUserDairyDetails(@RequestParam("orgId") String orgID) {
		System.out.println("/branchByOrgination"+orgID);
		logger.info("branchByOrgination method is call");
		return userServiceImpl.findSection(orgID);
	}


	@RequestMapping(value = "/loginTypeValue", method = RequestMethod.POST)
	public  @ResponseBody List<UserLoginAuthenticationDto> loginTypeValue(@RequestParam("loginvalue") String loginvalue) {
		logger.info("loginTypeValue page is call");
		/*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
*/		//HttpSession httpSession = request.getSession();
		//httpSession.setAttribute("loginId", loginvalue);
		//UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginvalue);
		//Collection<String> uRoleType = userLoginAuthenticationDto.getListRole();
		
		// model.addAttribute("uRoleType", uRoleType);
		return userServiceImpl.findRolltype(loginvalue);
		  
	}
	
	
	

	@RequestMapping(value = "/user/getAllOfficerBySection", method = RequestMethod.POST)
	public @ResponseBody List<OfficerDto> getAllOfficerBySection(@RequestParam("section") String section) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		logger.info("OfficerBySection method is call");
		return commonServiceImpl.findAllOfficer(loginId, section);
	}

	@RequestMapping(value = "/user/getComplainByNo", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getComplainByNo(@RequestParam("complainNo") Integer complainNo) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		logger.info("getComplainByNo method is call");
		return commonServiceImpl.findComplainByNo(loginId, complainNo);
	}

	
	@RequestMapping(value = "/user/getAuthorities", method = RequestMethod.POST)
	public @ResponseBody boolean getuserId(@RequestParam("userId") String userId) {
		logger.info("getComplainByNo method is call");
		return commonServiceImpl.findUserId(userId);
	}

	

	
	@RequestMapping(value = "/user/getDetailsByCno", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByCno(@RequestParam("complainNo") Integer complainNo,
			HttpServletRequest request) {
		logger.info("getDetailsByCno method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_CVO")) {
			return commonServiceImpl.findDetailsByCnoForCvo(loginId, complainNo);
		}else if (uRoleTpye.contains("ROLE_Diary") || uRoleTpye.contains("ROLE_HELP") ) {
			return commonServiceImpl.findDetailsByCnoForDiary(loginId, complainNo);
		}
		if(commonServiceImpl.findDetailsByCnoForDh(loginId, complainNo, uSection).isEmpty())
		{
			return commonServiceImpl.findDetailsByCnoForDiary(loginId, complainNo);
		}
		
		return commonServiceImpl.findDetailsByCnoForDh(loginId, complainNo, uSection);
	}

	
	@RequestMapping(value = "/user/getDetailsByCPACno", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByCPACno(@RequestParam("complainNo") String complainNo,
			HttpServletRequest request) {
		logger.info("getDetailsByCno method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		/*if (uRoleTpye.contains("ROLE_CVO")) {
			return commonServiceImpl.findDetailsByCnoForCvo(loginId, complainNo);
		}else if (uRoleTpye.contains("ROLE_Diary") || uRoleTpye.contains("ROLE_HELP") ) {
			return commonServiceImpl.findDetailsByCnoForDiary(loginId, complainNo);
		}*/
		return commonServiceImpl.findDetailsByCPACnoForDh(loginId, complainNo, uSection);
	}
	
	@RequestMapping(value = "/user/rtiCpaComplain", method = RequestMethod.GET)
	public String getrtiCpaComplain(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		//Integer complaintnumber = accessControlDto.getComplainNumber();
		String complaintnumberString = accessControlDto.getComplaint();
		
		httpSession.setAttribute("loginId", loginId);
		httpSession.setAttribute("desiganation", accessControlDto.getDesiganation());
		httpSession.setAttribute("name", accessControlDto.getName());
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		httpSession.setAttribute("complaintnumber", accessControlDto.getComplainNumber() );
		model.addAttribute("getrtiComplain", dealingHandServiceImpl.viewCPAComplain(accessControlDto.getComplaint()));
		logger.info("rtiCpaComplain page is call");
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO") || uRoleTpye.contains("ROLE_BO") || uRoleTpye.contains("ROLE_Diary")) {
			return "rtiCPA";
		} 
		return null;
	}
	
	@RequestMapping(value = "/user/allCPADetails", method = RequestMethod.GET)
	public String getaAllcpadetails(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		String complaintnumberString = Integer.toString(complaintnumber);
		httpSession.setAttribute("officerName", accessControlDto.getName());
		httpSession.setAttribute("desiganation", accessControlDto.getDesiganation());
		model.addAttribute("getrtiComplain", dealingHandServiceImpl.viewCPAComplain(accessControlDto.getComplaint()));
		logger.info("allcpaDetails page is call");
		return "allcpaDetails";
	}
	
	
	
	
	@RequestMapping(value = "/user/getDetailsByCMno", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByCMno(@RequestParam("complainMobileNo") String complainNo,HttpServletRequest request) {
		logger.info("complainMobileNo method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		 if (uRoleTpye.contains("ROLE_Diary") ) {
			return commonServiceImpl.findDetailsByCMobnoForDiary(loginId, complainNo);
		}
		return commonServiceImpl.findDetailsByCMobnoForDh(loginId, complainNo, uSection);
	}
	
	
	
	
	@RequestMapping(value = "/user/getDetailsByEmail", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByEmail(@RequestParam("complainEmail") String complainNo,HttpServletRequest request) {
		logger.info("complainEmail method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		 if (uRoleTpye.contains("ROLE_Diary") ) {
			return commonServiceImpl.findDetailsEmailForDiary(loginId, complainNo);
		}
		return commonServiceImpl.findDetailsEmailForDh(loginId, complainNo, uSection);
	}
	
	
	@RequestMapping(value = "/user/getDetailsByPincode", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByPincode(@RequestParam("complainPincode") Integer complainPincode,HttpServletRequest request) {
		logger.info("complainPincode method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		 if (uRoleTpye.contains("ROLE_Diary") ) {
			return commonServiceImpl.findDetailsPincodeForDiary(loginId, complainPincode);
		}
		return commonServiceImpl.findDetailsPincodeForDh(loginId, complainPincode, uSection);
	}
	
	
	
	
	@RequestMapping(value = "/user/getDetailsByDesiganation", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByDesiganation(@RequestParam("complainDesiganation") String complainDesiganation,HttpServletRequest request) {
		logger.info("complainDesiganation method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		 if (uRoleTpye.contains("ROLE_Diary") ) {
			return commonServiceImpl.findDetailsDesignationForDiary(loginId, complainDesiganation);
		}
		return commonServiceImpl.findDetailsDesignationForDh(loginId, complainDesiganation, uSection);
	}
	
	

	
	@RequestMapping(value = "/user/getDetailsByCagnstname", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByCagnstname(@RequestParam("complainAgnname") String complainAgnname,HttpServletRequest request) {
		logger.info("complainAgnname method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		 if (uRoleTpye.contains("ROLE_Diary") ) {
			return commonServiceImpl.findDetailsCagnstnameForDiary(loginId, complainAgnname);
		}
		return commonServiceImpl.findDetailsCagnstnameForDh(loginId, complainAgnname, uSection);
	}
	
	
	
	@RequestMapping(value = "/user/getDetailsByGistofalli", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByGistofalli(@RequestParam("complainGistofalligation") String complainGistofalligation,HttpServletRequest request) {
		logger.info("complainGistofalligation method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		 if (uRoleTpye.contains("ROLE_Diary") ) {
			return commonServiceImpl.findDetailsCgistodalliForDiary(loginId, complainGistofalligation);
		}
		return commonServiceImpl.findDetailsCgistodalliForDh(loginId, complainGistofalligation, uSection);
	}
	
	
	
	
	
	@RequestMapping(value = "/user/getDetailsByCname", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByCname(@RequestParam("complainName") String complainNo,
			HttpServletRequest request) {
		logger.info("getDetailsByCname method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_CVO")) {
			return commonServiceImpl.findDetailsByCnameForCvo(loginId, complainNo);
		}else if (uRoleTpye.contains("ROLE_Diary") || uRoleTpye.contains("ROLE_HELP")) {
			return commonServiceImpl.findDetailsByCnameForDiary(loginId, complainNo);
		}
		return commonServiceImpl.findDetailsByCnameForDh(loginId, complainNo, uSection);
	}

	
	
	
	@RequestMapping(value = "/user/updateSession", method = RequestMethod.POST)
	public @ResponseBody AccessControlDto sessionUpdate(@RequestParam("session") String session,
			@RequestParam("accessvalue") String accessValue, @RequestParam("session") String complianId, 
			@RequestParam("session") String fileNo, HttpServletRequest request) {
		AccessControlDto accessControlDto = new AccessControlDto();
		accessControlDto.setFlag(false);
		HttpSession httpSession = request.getSession();
		logger.info("session update call");
		accessControlDto.setComplaint(session);
		session=session.replace("/", "_");
		System.out.println("session------------------------------------------"+session);
		if (!session.isEmpty() && session != null) {
			if(session.split("_")[0].equals("complainNumber")) {
				String[] compIdSpt = session.split("_");
				Integer compId = Integer.parseInt(compIdSpt[1]);

				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				String loginId = auth.getName();

				UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
				String role=userLoginAuthenticationDto.getLoginRoll();
				if(!(role=="ROLE_Diary"||role=="ROLE_HELP")) 
				{
					System.out.println("compId---------------------------"+compId);
					if (compId != null) {
						getStatusDtails(compId);
					}
				}
				
				accessControlDto.setDesiganation(userLoginAuthenticationDto.getDesiganation());
				accessControlDto.setName(userLoginAuthenticationDto.getName());
				accessControlDto.setComplainNumber(Integer.parseInt(session.split("_")[1]));
				accessControlDto.setAccessId(accessValue);
				accessControlDto.setFlag(true);
				httpSession.setAttribute("accessControlDto", accessControlDto);
			}
			
			else if (!session.equals("") && session != null) {
				/*	Integer compId=null;
				if(session.contains("_"))
					{
				 compId = Integer.parseInt(session.split("_")[0]);
				 if (compId != null) {
						getStatusDtails(compId);
					}
					}
					else if(session.contains("/")) 
					{
						 compId = Integer.parseInt(session.split("/")[0]);
						 if (compId != null) {
								getStatusDtails(compId);
							}
					}
*/
				Integer compId = Integer.parseInt(session.split("_")[0]);

				if (compId != null) {
					getStatusDtails(compId);
				}
					
				
				Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				String loginId = auth.getName();
				
				UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);

				accessControlDto.setDesiganation(userLoginAuthenticationDto.getDesiganation());
				accessControlDto.setName(userLoginAuthenticationDto.getName());
				accessControlDto.setComplainNumber(compId);
				accessControlDto.setAccessId(accessValue);
				accessControlDto.setFlag(true);
				//accessControlDto.setComplaint(session);
				httpSession.setAttribute("accessControlDto", accessControlDto);
			}
			
		}
		return accessControlDto;
	}

	
	
	private void getStatusDtails(Integer compId) {

		JdbcTemplate jdbcTemplate = null;

		try {
			PreparedStatement preparedStatement = null;
			Connection conn = null;
			String role=null;

			String sql = "SELECT status,rolltype FROM complain where complaintnumber='" + compId + "'";
			jdbcTemplate = MyUtill.conn(dataSource);

			List<ComplainDto> complainDto = jdbcTemplate.query(sql, new RowMapper<ComplainDto>() {
				public ComplainDto mapRow(ResultSet rs, int rowNum) throws SQLException {
					ComplainDto complainDto1 = new ComplainDto();
					complainDto1.setStatus(rs.getInt("status"));
					complainDto1.setRollType(rs.getString("rolltype"));
					return complainDto1;
				}
			});

			ComplainDto dto = complainDto.get(0);
			Integer statusVal = dto.getStatus();
			role=dto.getRollType();

			if (statusVal != null && statusVal.equals(0)) {
				conn = jdbcTemplate.getDataSource().getConnection();
				String sqlUpdate = "update complain set status=? where complaintnumber='" + compId + "'";
				preparedStatement = conn.prepareStatement(sqlUpdate);
				preparedStatement.setInt(1, 1);
				preparedStatement.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}

	}

	@RequestMapping(value = "/user/insertUpdatedComplain", method = RequestMethod.POST)
	public String insertUpdatedComplain(@ModelAttribute("userForm") @Valid DairyDetailsDto dairyDetailsDto, NotingDto notingDto, HttpServletRequest request, Model model)
					throws ParseException {
	/*	if (bindingResult.hasErrors()) {
			logger.info("validation error in updateComplainDetails.");*/
			/*
			 * attr.addFlashAttribute(
			 * "org.springframework.validation.BindingResult.dairyDetailsDto",
			 * bindingResult); attr.addFlashAttribute("userForm",
			 * dairyDetailsDto);
			 */
			/*model.addAttribute("errMessage", bindingResult.getErrorCount() + " errors.");
			return "redirect:/user/updateComplainDetails";
		} else {*/
	/*	if(dairyDetailsDto.getBoDecision()== "null" || dairyDetailsDto.getBoDecision()== null) 
		{
			dairyDetailsDto.setBoDecision("");
		}
		*/
		if(dairyDetailsDto.getBoDecision()!= null)
		{
		  String newdec=dairyDetailsDto.getBoDecisionnew();		
		  dairyDetailsDto.setBoDecision(newdec);
		}
			
		else if(dairyDetailsDto.getBoDecision()==null && ( dairyDetailsDto.getBoDecisionnew().contains("IR") || dairyDetailsDto.getBoDecisionnew().contains("Filed") || dairyDetailsDto.getBoDecisionnew().contains("NA") ))
		{
			  String newdec=dairyDetailsDto.getBoDecisionnew();		
			  dairyDetailsDto.setBoDecision(newdec);
			
		}
		
		if(dairyDetailsDto.getBoirfinaldec()==null && ( dairyDetailsDto.getBoirfinaldectemp().contains("IR") || dairyDetailsDto.getBoirfinaldectemp().contains("Filed") || dairyDetailsDto.getBoirfinaldectemp().contains("NA") ))
		{
				dairyDetailsDto.setBoirfinaldec(dairyDetailsDto.getBoirfinaldectemp());
		}	
		
		
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String loginId = auth.getName(); // get logged in loginId
												// HttpSession
			HttpSession httpSession = request.getSession();
			logger.info(httpSession.toString());
			AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
			Integer complaintnumber = accessControlDto.getComplainNumber();
			UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
			String name=userLoginAuthenticationDto.getName();
			String uDesiganation = userLoginAuthenticationDto.getDesiganation();
			IpCaptureDto ipCaptureDto= (IpCaptureDto) request.getSession().getAttribute("IpCaptureDetail");
			if(notingDto.getForwradvalue().split(",")[0]==""||notingDto.getForwradvalue().split(",")[0]==null)
			{
				return "error";
			}else {
				userServiceImpl.updateComplainByDh(notingDto, dairyDetailsDto, complaintnumber, loginId,ipCaptureDto);
				commonServiceImpl.addNoting(notingDto, complaintnumber, loginId,name, uDesiganation,ipCaptureDto);
				commonServiceImpl.addForwardDetails(complaintnumber, loginId, notingDto, dairyDetailsDto,ipCaptureDto);
				model.addAttribute("forwardComplain", commonServiceImpl.viewComplain(complaintnumber));
				logger.info("complaintDone page is call");	
			}
		return "complaintDone";
	}

	@RequestMapping(value = "/user/goBack", method = RequestMethod.GET)
	public String insertUpdated(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_DH")) {
			model.addAttribute("allDiary", userServiceImpl.findAllDiary(uSection, loginId));
		} else if (uRoleTpye.contains("ROLE_SO")) {
			model.addAttribute("allDiary", commonServiceImpl.findAllDiarySo(uSection, loginId));
		} else if (uRoleTpye.contains("ROLE_Diary")) {
			return "redirect:/user/dairy/addDairyComplain";
		} else if (uRoleTpye.contains("ROLE_BO")) {
			model.addAttribute("allDiary", commonServiceImpl.findAllDiaryForBo(uSection, loginId));
			return "inboxBo";
		} else if (uRoleTpye.contains("ROLE_CVO")) {
			model.addAttribute("allDiary", commonServiceImpl.findAllDiaryForCvo(uSection, loginId));
			return "cvoHome";
		} else if (uRoleTpye.contains("ROLE_CLR")) {
			model.addAttribute("allDiary", commonServiceImpl.findAllDiaryForBo(uSection, loginId));
			return "inboxCLR";
		}
		logger.info("Inbox page is call");
		return "inbox";
	}
	
	
	@RequestMapping(value = "/user/acknowledgementFiled", method = RequestMethod.GET)
	public String getacknowledgementFiled(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		httpSession.setAttribute("loginId", loginId);
		List<OfficerDto> listodOfficerdto = commonServiceImpl.findDiaryStatus(complaintnumber);
		String officerName = listodOfficerdto.get(0).getDairyStatus();
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(officerName);
		httpSession.setAttribute("desiganation", userLoginAuthenticationDto.getDesiganation());
		httpSession.setAttribute("officerName", userLoginAuthenticationDto.getName());
		
		model.addAttribute("getAckComplain", commonServiceImpl.viewComplain(complaintnumber));
		logger.info("acknowledgement page is call");
		return "acknowledgementFiled";
	}
	
	

	@RequestMapping(value = "/user/acknowledgement", method = RequestMethod.GET)
	public String getacknowledgement(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		httpSession.setAttribute("loginId", loginId);
		List<OfficerDto> listodOfficerdto = commonServiceImpl.findDiaryStatus(complaintnumber);
		String officerName = listodOfficerdto.get(0).getDairyStatus();
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(officerName);
		httpSession.setAttribute("desiganation", userLoginAuthenticationDto.getDesiganation());
		httpSession.setAttribute("officerName", userLoginAuthenticationDto.getName());
		
		model.addAttribute("getAckComplain", commonServiceImpl.viewComplain(complaintnumber));
		logger.info("acknowledgement page is call");
		return "acknowledgementNa";
	}
	
	
	@RequestMapping(value = "/user/cvccpaAcknowledgment", method = RequestMethod.GET)
	public String getcvccpaAcknowledgment(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		
		Integer complaintnumber = accessControlDto.getComplainNumber();
		String complaintnumberString = Integer.toString(complaintnumber);
		httpSession.setAttribute("officerName", accessControlDto.getName());
		httpSession.setAttribute("desiganation", accessControlDto.getDesiganation());
		model.addAttribute("getrtiComplain", dealingHandServiceImpl.viewCPAComplain(accessControlDto.getComplaint()));
		
		
		logger.info("acknowledgement page is call");
		return "acknowledgementCpa";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/user/rti", method = RequestMethod.GET)
	public String getrti(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = Integer.parseInt(accessControlDto.getComplaint());
		httpSession.setAttribute("loginId", loginId);
		httpSession.setAttribute("desiganation", accessControlDto.getDesiganation());
		httpSession.setAttribute("name", accessControlDto.getName());
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		httpSession.setAttribute("complaintnumber", accessControlDto.getComplainNumber() );
		model.addAttribute("getrtiComplain", dealingHandServiceImpl.viewComplain(complaintnumber));
		logger.info("rti page is call");
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO") || uRoleTpye.contains("ROLE_BO")) {
			return "rtiDh";
		}else if (uRoleTpye.contains("ROLE_Diary")) {
			return "rti";
		} 
		return null;
	}
	
	
	
	
	
	@RequestMapping(value = "/user/allNotingDetails/{complaintType}", method = RequestMethod.GET)
	public String getallNoting(@PathVariable("complaintType")String complaintType,Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		httpSession.setAttribute("loginId", loginId);
		httpSession.setAttribute("desiganation", accessControlDto.getDesiganation());
		httpSession.setAttribute("name", accessControlDto.getName());
		httpSession.setAttribute("complaintnumber", accessControlDto.getComplainNumber() );
		String cpaComplaint =accessControlDto.getComplaint();
		model.addAttribute("getallNoting", cpaComplaint);
		if(complaintType.equalsIgnoreCase("cpa"))
		{
			model.addAttribute("mapOfNoting", commonServiceImpl.findAllCPANoting(cpaComplaint));
		}
		else{
			model.addAttribute("mapOfNoting", commonServiceImpl.findAllNoting(complaintnumber));
		}
		logger.info("allNotingDetails page is call");
		return "allNotingDetails";
	}
	
	

	@RequestMapping(value = "/user/cvcOm", method = RequestMethod.GET)
	public String getOm(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		List<OfficerDto> listodOfficerdto = commonServiceImpl.findDiaryStatus(complaintnumber);
		String officerName = listodOfficerdto.get(0).getDairyStatus();
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(officerName);
		httpSession.setAttribute("desiganation", userLoginAuthenticationDto.getDesiganation());
		httpSession.setAttribute("officerName", userLoginAuthenticationDto.getName());
		if (listodOfficerdto.get(0).isOmAckFlag()==true) {
			commonServiceImpl.upadteOmAckDate(complaintnumber,officerName);
		}
		model.addAttribute("getAckComplain", commonServiceImpl.viewComplain(complaintnumber));
		logger.info("getOm page is call");
		return "cvcOm";
	}
	
	@RequestMapping(value = "/user/cvccpaOm", method = RequestMethod.GET)
	public String getcpaOm(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		
		Integer complaintnumber = accessControlDto.getComplainNumber();
		String complaintnumberString = Integer.toString(complaintnumber);
		httpSession.setAttribute("officerName", accessControlDto.getName());
		httpSession.setAttribute("desiganation", accessControlDto.getDesiganation());
		model.addAttribute("getrtiComplain", dealingHandServiceImpl.viewCPAComplain(accessControlDto.getComplaint()));
		
		logger.info("getcpaOm page is call");
		return "cvccpaOm";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/user/allDetails", method = RequestMethod.GET)
	public String getaAlldetails(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		httpSession.setAttribute("officerName", accessControlDto.getName());
		httpSession.setAttribute("desiganation", accessControlDto.getDesiganation());
		model.addAttribute("getaAlldetailsComplain", dealingHandServiceImpl.viewComplain(complaintnumber));
		logger.info("getOm page is call");
		return "allDetails";
	}
	
	
	
	
	
	@RequestMapping(value = "/user/cvoOm", method = RequestMethod.GET)
	public String getCvoOm(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		List<OfficerDto> listodOfficerdto = commonServiceImpl.findDiaryStatus(complaintnumber);
		String officerName = listodOfficerdto.get(0).getDairyStatus();
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(officerName);
		httpSession.setAttribute("desiganation", userLoginAuthenticationDto.getDesiganation());
		httpSession.setAttribute("officerName", userLoginAuthenticationDto.getName());
		model.addAttribute("getAckComplain", commonServiceImpl.viewComplain(complaintnumber));
		logger.info("getCvoOm page is call");
		return "cvoOm";
	}

	@RequestMapping(value = "/user/conformationLetter", method = RequestMethod.GET)
	public String getconformationLetter(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		
		httpSession.setAttribute("loginId", loginId);
		List<OfficerDto> listodOfficerdto = commonServiceImpl.findDiaryStatus(complaintnumber);
		String officerName = listodOfficerdto.get(0).getDairyStatus();
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(officerName);
		httpSession.setAttribute("desiganation", userLoginAuthenticationDto.getDesiganation());
		httpSession.setAttribute("officerName", userLoginAuthenticationDto.getName());
		
		model.addAttribute("getAckComplain", commonServiceImpl.viewComplain(complaintnumber));
		logger.info("getOm page is call");
		return "conformationLetter";
	}
	
	
	@RequestMapping(value = "/user/reminderLetter", method = RequestMethod.GET)
	public String getreminderLetter(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		
		httpSession.setAttribute("loginId", loginId);
		List<OfficerDto> listodOfficerdto = commonServiceImpl.findDiaryStatus(complaintnumber);
		String officerName = listodOfficerdto.get(0).getDairyStatus();
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(officerName);
		httpSession.setAttribute("desiganation", userLoginAuthenticationDto.getDesiganation());
		httpSession.setAttribute("officerName", userLoginAuthenticationDto.getName());
		
		model.addAttribute("getReminderComplain", commonServiceImpl.viewComplain(complaintnumber));
		//logger.info("getOm page is call");
		return "reminderLetter";
	}
	@RequestMapping(value = "/user/dairy/outbox", method = RequestMethod.GET)
	public String outbox(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		model.addAttribute("allDiary", commonServiceImpl.findAllPendingDairyforDairy(loginId));
		logger.info("outbox page is call");
		return "outbox";
	}

	@RequestMapping(value = "/user/officerOutbox", method = RequestMethod.GET)
	public String officerOutbox(Model model, HttpServletRequest request) {
		logger.info("outbox page is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", userId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(userId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		String loginId = userLoginAuthenticationDto.getName();
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO") || uRoleTpye.contains("ROLE_CVO")) {
			model.addAttribute("allDiary", commonServiceImpl.findAllPendingDairy(loginId, uRoleTpye));
			return "officerOutbox";
		} else if (uRoleTpye.contains("ROLE_BO")) {
			model.addAttribute("allDiary", commonServiceImpl.findAllPendingDairy(loginId, uRoleTpye));
			return "officerOutboxBo";
		}
		else if (uRoleTpye.contains("ROLE_CLR")) {
			model.addAttribute("allDiary", commonServiceImpl.findAllPendingDairy(loginId, uRoleTpye));
			return "officerOutboxCLR";
		}
		return "error";
	}

	@RequestMapping(value = "/user/viewPendingComplainDetails", method = RequestMethod.GET)
	public String viewPendingComplain(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		logger.info("filedComplain page is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_Diary")) {
			model.addAttribute("pendingComplainDetails", commonServiceImpl.viewFiledComplain(complaintnumber));
			return "dairyFiledComplain";
		} else {
			model.addAttribute("pendingComplainDetails", commonServiceImpl.viewFiledComplain(complaintnumber));
		}
		return "filedComplain";
	}

	@RequestMapping(value = "/user/sentMail", method = RequestMethod.GET)
	public String sentMail(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO")) {
			model.addAttribute("sentComplain", commonServiceImpl.findAllSentComplain(loginId));
			logger.info("sentMail page is call");
			return "sentMail";
		} else if (uRoleTpye.contains("ROLE_BO")) {
			model.addAttribute("sentComplain", commonServiceImpl.findAllSentComplain(loginId));
			logger.info("sentMailForCvo page is call");
			return "sentMailBo";
		} else if (uRoleTpye.contains("ROLE_CVO")) {
			// model.addAttribute("sentComplain",
			// commonServiceImpl.findAllSentComplain(loginId));
			logger.info("sentMailForCvo page is call");
			return "sentMailCvo";
		} else if (uRoleTpye.contains("ROLE_CLR")) {
			model.addAttribute("sentComplain", commonServiceImpl.findAllSentComplain(loginId));
			logger.info("sentMailForCLR page is call");
			return "sentMailCLR";
		}
		return "error";
	}

	@RequestMapping(value = "/user/search", method = RequestMethod.GET)
	public String citizenMycomplaint(Model model, HttpServletRequest request, DairyDetailsDto dairyDetailsDto) {
		logger.info("search page is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO")) {
			return "search";
		} else if (uRoleTpye.contains("ROLE_BO")) {
			return "searchBo";
		}else if (uRoleTpye.contains("ROLE_CLR")) {
			return "searchCLR";
		}else if (uRoleTpye.contains("ROLE_Diary")) {
			return "dairySearch";
		} else if (uRoleTpye.contains("ROLE_HELP")) {
			return "helpLineSearch";
		}
		return "error";
	}
	
	
	@RequestMapping(value = "/user/searchCpaComplain", method = RequestMethod.GET)
	public String cpacomplaint(Model model, HttpServletRequest request, DairyDetailsDto dairyDetailsDto) {
		logger.info("search page is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO") || uRoleTpye.contains("ROLE_BO") || uRoleTpye.contains("ROLE_Diary") || uRoleTpye.contains("ROLE_HELP")) {
			return "searchCpaComplain";
		} 
		return "error";
	}
	
	
	@RequestMapping(value = "/user/101292.do.aspx", method = RequestMethod.GET)
	public String aspx(ResetPasswordDto resetPasswordDto, HttpServletRequest request, Model model) {
		return "aspx";
	}

	@RequestMapping(value = "/user/resetPassword", method = RequestMethod.GET)
	public String resetPassword(@ModelAttribute("pwdFrom") ResetPasswordDto resetPasswordDto,
			HttpServletRequest request) {
		logger.info("resetPassword method is called is called");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO")) {
			return "resetPassword";
		} else if (uRoleTpye.contains("ROLE_BO")) {
			return "resetPasswordBo";
		}else if (uRoleTpye.contains("ROLE_CLR")) {
			return "resetPasswordCLR";
		}  else if (uRoleTpye.contains("ROLE_CVO")) {
			return "resetPasswordCvo";
		}
		return "error";
	}

	@RequestMapping(value = "/user/changedPassword", method = RequestMethod.POST)
	public String updatePassword(@ModelAttribute("pwdFrom") @Valid ResetPasswordDto resetPasswordDto,
			BindingResult result, HttpServletRequest request, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		Integer pwdFlag = 0;
		if (result.hasErrors()) {
			logger.info("Validation Error in Password Changed.");
			return "resetPassword";
		} else {
			pwdFlag = commonServiceImpl.insertNewPassword(resetPasswordDto, loginId);
		}
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (pwdFlag == 1) {
			if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO")) {
				return "redirect:/";
				/*return "pwdSuccess";*/
			} else if (uRoleTpye.contains("ROLE_BO")) {
				return "redirect:/";
				/*return "pwdSuccessBo";*/
			} else
			{
				return "redirect:/";
			}
		} else if (pwdFlag == 0) {
			model.addAttribute("pwdError", "Look like your last password was same.");
			if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO")) {
				return "resetPassword";
			} else if (uRoleTpye.contains("ROLE_BO")) {
				return "resetPasswordBo";
			}
		}

		return "resetPassword";
	}

	@RequestMapping(value = "/user/report", method = RequestMethod.GET)
	public String viewReport(Model model) {
		logger.info("Report Page is Called.");
		return "report";
	}

	@RequestMapping(value = "/user/findReport", method = RequestMethod.POST)
	public @ResponseBody ReportDto getReport(@RequestParam("fromDate") String fromDate,
			@RequestParam("toDate") String toDate,@RequestParam("section") String uSection, HttpServletRequest request) {
		logger.info("reportBySection method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		//String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO") || uRoleTpye.contains("ROLE_BO")) {
			return userServiceImpl.findReport(fromDate, toDate, uSection, loginId);
		}
		return null;
	}
	
	@RequestMapping(value = "/user/getDetailsByComplaintNumber", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByComplaintNumber(@RequestParam("complainNo") String complainNo,
			HttpServletRequest request) {
		logger.info("getDetailsByComplaintNumber method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		if(complainNo.toLowerCase().contains("vigilance")) 
		{return commonServiceImpl.findDetailsByComplainNumber(complainNo);}
		else
		{return commonServiceImpl.findDetailsByOldComplainNumber(complainNo);}
		
		
		/*return commonServiceImpl.findDetailsByComplainNumber(complainNo);*/
	}

	
	
	@RequestMapping(value = "/user/getDetailsByOrganization", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByOrganization(@RequestParam("complainOrganization") String complainOrganization,HttpServletRequest request) {
		logger.info("complainOrganization method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		 if (uRoleTpye.contains("ROLE_Diary") ) {
			return commonServiceImpl.findDetailsOrganizationForDiary(loginId, complainOrganization);
		}
		return commonServiceImpl.findDetailsOrganizationForDh(loginId, complainOrganization, uSection);
	}
	
	@RequestMapping(value = "/user/AllegationDetail", method = RequestMethod.GET)
	public String getAllegationDetail(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		List<OfficerDto> listodOfficerdto = commonServiceImpl.findDiaryStatus(complaintnumber);
		/*String officerName = listodOfficerdto.get(0).getDairyStatus();
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(officerName);
		httpSession.setAttribute("desiganation", userLoginAuthenticationDto.getDesiganation());
		httpSession.setAttribute("officerName", userLoginAuthenticationDto.getName());*/
		model.addAttribute("getAckComplain", commonServiceImpl.viewComplain(complaintnumber));
		logger.info("getCvoOm page is call");
		return "AllegationDetail";
	}

	@RequestMapping(value = "/user/getAllOfficer", method = RequestMethod.POST)
	public @ResponseBody List<OfficerDto> getAllOfficer(@RequestParam("complaint") String complaint) {
		logger.info("Officer for dropdown method is call");
		return commonServiceImpl.findAllOfficerForAdmin(complaint);
	}
	@RequestMapping(value = "/user/admin/getComplaintAcc", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getComplaintAcc(@RequestParam("section") String section,@RequestParam("dairystatus") String dairystatus,HttpServletRequest request) {
		logger.info("Complaint for account transfer method is call");
		return commonServiceImpl.ComplaintsOfAcc(dairystatus,section);
	}
	@RequestMapping(value = "/user/admin/getComplaintTransfer", method = RequestMethod.POST)
	public @ResponseBody boolean getTransfer(@RequestParam("complaint") String complaint,@RequestParam("dairystatus") String dairystatus,@RequestParam("old_dairystatus") String old_dairystatus,HttpServletRequest request) {
		logger.info("Complaint for account transfer method is call");
		String ipAddress  = request.getHeader("X-FORWARDED-FOR");
		if(ipAddress == null)
		{
		  ipAddress = request.getRemoteAddr();
		}
		System.out.println("ipAddress......>:"+ipAddress);
		
		
		return commonServiceImpl.transferComplaint(dairystatus,complaint,old_dairystatus,ipAddress);
	}
	@RequestMapping(value = "/user/getAllCitizen", method = RequestMethod.POST)
	public @ResponseBody List<CitizenDto> getAllCitizen() {
		logger.info("Citizen Count method is call");
		return commonServiceImpl.findAllCitizen();
	}
	@RequestMapping(value = "/user/acknowledgementIRF", method = RequestMethod.GET)
	public String getacknowledgementIRF(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		httpSession.setAttribute("loginId", loginId);
		List<OfficerDto> listodOfficerdto = commonServiceImpl.findDiaryStatus(complaintnumber);
		String officerName = listodOfficerdto.get(0).getDairyStatus();
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(officerName);
		httpSession.setAttribute("desiganation", userLoginAuthenticationDto.getDesiganation());
		httpSession.setAttribute("officerName", userLoginAuthenticationDto.getName());
		
		model.addAttribute("getAckComplain", commonServiceImpl.viewComplain(complaintnumber));
		logger.info("IRF acknowledgement page is call");
		return "acknowledgementIRF";
	}
	
	@RequestMapping(value = "/user/acknowledgementDairy", method = RequestMethod.GET)
	public String getacknowledgementDairy(Model model, DairyDetailsDto dairyDetailsDto, HttpServletRequest request) {
		//Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		//String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		AccessControlDto accessControlDto = (AccessControlDto) httpSession.getAttribute("accessControlDto");
		Integer complaintnumber = accessControlDto.getComplainNumber();
		//httpSession.setAttribute("loginId", loginId);
		List<OfficerDto> listodOfficerdto = commonServiceImpl.findDiaryStatus(complaintnumber);
		String officerName = listodOfficerdto.get(0).getDairyStatus();
		//UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(officerName);
		//httpSession.setAttribute("desiganation", userLoginAuthenticationDto.getDesiganation());
		//httpSession.setAttribute("officerName", userLoginAuthenticationDto.getName());
		
		model.addAttribute("getAckComplain", commonServiceImpl.viewComplain(complaintnumber));
		logger.info("acknowledgement page is call");
		return "acknowledgementDairy";
	}
	
	@RequestMapping(value = "/user/getAllOfficerCVO", method = RequestMethod.GET)
	public @ResponseBody List<OfficerDto> getAllOfficerCVO(@RequestParam("complaint") String complaint) {
		logger.info("Officer for dropdown method is call");
		return commonServiceImpl.findAllOfficerForAdmin(complaint);
	}
	
	@RequestMapping(value = "/user/getAllCitizenCVO", method = RequestMethod.GET)
	public @ResponseBody List<CitizenDto> getAllCitizenCVO() {
		logger.info("Citizen Count method is call");
		return commonServiceImpl.findAllCitizen();
	}
	
	@RequestMapping(value = "/user/resetPasswordAdmin", method = RequestMethod.POST)
	public @ResponseBody String  resetPassword(@RequestParam("user") String user,@RequestParam("type") String type,HttpServletRequest request){
			logger.info("resetpassword page is call");
			if(commonServiceImpl.resetPassword(user,type))
			return "updateCredential";
			else
			return "error";
	}
	
	@RequestMapping(value = "/user/unlockUser", method = RequestMethod.POST)
	public @ResponseBody String unlockUser(@RequestParam("user") String user,@RequestParam("type") String type,HttpServletRequest request){
			logger.info("unlockUser page is call");
			if(commonServiceImpl.unlockUser(user,type))
			return "updateCredential";
			else
			return "error";
	}
	@RequestMapping(value = "/user/editProfile", method = RequestMethod.GET)
	public String editProfile(Model model, HttpServletRequest request,@ModelAttribute("editProfileForm") UserDto userDto) {
		logger.info("Edit profile page is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		model.addAttribute("userDetail", userLoginAuthenticationDto);
		if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO")) 
		{
			return "editProfile";
		} else if (uRoleTpye.contains("ROLE_BO")){
			return "editProfileBO";
		} else if (uRoleTpye.contains("ROLE_CLR")){
				return "editProfileCLR";
			}
		return "error";
	}
	@RequestMapping(value = "/user/editProfileUpdate", method = RequestMethod.POST)
	public String editProfileUpdate(Model model, HttpServletRequest request,@ModelAttribute("editProfileForm") UserDto userDto) {
		logger.info("Edit profile page is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		model.addAttribute("userDetail", userLoginAuthenticationDto);
		if(commonServiceImpl.editOfficerProfile(userDto, loginId))
		{
			if (uRoleTpye.contains("ROLE_DH") || uRoleTpye.contains("ROLE_SO")) 
			{
				return "editProfileSuccess";
			} else if (uRoleTpye.contains("ROLE_BO")||uRoleTpye.contains("ROLE_CLR")) 
			{
				return "editProfileSuccessBO";
			}
		}
		else 
		{
			return "error";
		}
		return "error";
	}
	
	@RequestMapping(value="/doLogout", method=RequestMethod.GET) //to handle request redirecting from controller as they need get method type function
	public String logout(HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) {
		
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			
			new SecurityContextLogoutHandler().logout(request, response, auth);
			return "redirect:/login";				
	}
	@RequestMapping(value = "/user/clearComplaintDecision", method = RequestMethod.POST)
	public @ResponseBody boolean clearDecision(@RequestParam("bodecision") boolean bodecision ,
			@RequestParam("bodecisiondate") boolean bodecisiondate,
			@RequestParam("boirfinaldec") boolean boirfinaldec,
			@RequestParam("bofinaldecdate") boolean bofinaldecdate,
			@RequestParam("cvoview") boolean cvoview,
			@RequestParam("status") boolean status,
			@RequestParam("complainstatus") boolean complainstatus,
			@RequestParam("complaint") String complaint,
			HttpServletRequest request) {
		logger.info("getDetailsByCno method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		boolean flag=false;
		if (uRoleTpye.contains("ROLE_ADMIN")) {
			flag= commonServiceImpl.clearComplaintDecision(complaint,bodecision,bodecisiondate,boirfinaldec,bofinaldecdate,cvoview,status,complainstatus);
		}
		return flag;
		}
	
	@RequestMapping(value ="/user/activate", method = RequestMethod.POST)
	public @ResponseBody String activateSelectedUser(@RequestParam("user") String user,@RequestParam("type") String type,HttpServletRequest request){
			logger.info("unlockUser page is call");
			if(commonServiceImpl.activateUser(user,type))
			return "updateCredential";
			else
			return "error";
	}
	@RequestMapping(value ="/user/deactivate", method = RequestMethod.POST)
	public @ResponseBody String deactivateSelectedUser(@RequestParam("user") String user,@RequestParam("type") String type,HttpServletRequest request){
			logger.info("unlockUser page is call");
			if(commonServiceImpl.deactivateUser(user,type))
			return "updateCredential";
			else
			return "error";
	}
	

	@RequestMapping(value = "/user/summarySheet", method = RequestMethod.GET)
	public String summarySheet(Model model, HttpServletRequest request) {
		logger.info("summarySheet page is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return "summarySheet";
	
	}
	
	@RequestMapping(value = "/user/getDetailsByCPACMno", method = RequestMethod.POST)
	public @ResponseBody List<DairyDetailsDto> getDetailsByCPACMno(@RequestParam("complainMobileNo") String complainNo,HttpServletRequest request) {
		logger.info("complainMobileNo method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return commonServiceImpl.findDetailsByCPACMobno(loginId, complainNo, uSection);
	}

	@RequestMapping(value = "/user/getDetailsByCPACname", method = RequestMethod.POST)
	public @ResponseBody List<DairyDetailsDto> getDetailsByCPACname(@RequestParam("complainName") String complainName,
			HttpServletRequest request) {
		logger.info("getDetailsByCname method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return commonServiceImpl.findDetailsByCPACName(loginId, complainName, uSection);
	}
	
	@RequestMapping(value = "/user/getDetailsByCPAEmail", method = RequestMethod.POST)
	public @ResponseBody List<DairyDetailsDto> getDetailsByCPAEmail(@RequestParam("complainEmail") String email,HttpServletRequest request) {
		logger.info("complainEmail method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		 
		return commonServiceImpl.findDetailsByCPAEmail(loginId, email, uSection);
	}
	
	@RequestMapping(value = "/user/getDetailsByCPAPincode", method = RequestMethod.POST)
	public @ResponseBody List<DairyDetailsDto> getDetailsByCPAPincode(@RequestParam("complainPincode") Integer complainPincode,HttpServletRequest request) {
		logger.info("complainPincode method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return commonServiceImpl.findDetailsByCPAPincode(loginId, complainPincode.toString(), uSection);
	}
	
	@RequestMapping(value = "/user/getDetailsByCPAagnstname", method = RequestMethod.POST)
	public @ResponseBody List<DairyDetailsDto> getDetailsByCPAagnstname(@RequestParam("complainAgnname") String complainAgnname,HttpServletRequest request) {
		logger.info("complainAgnname method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return commonServiceImpl.findDetailsByCPAagnstname(loginId, complainAgnname, uSection);
	}
	
	@RequestMapping(value = "/user/markImportant", method = RequestMethod.POST)
	public @ResponseBody boolean markImportant(@RequestParam("complaint") String complaint,HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		boolean flag=false;
		if (uRoleTpye.contains("ROLE_DH")||uRoleTpye.contains("ROLE_SO")||uRoleTpye.contains("ROLE_BO")) {
			flag= commonServiceImpl.markImportant(complaint);
		}
		return flag;
		}
	
	@RequestMapping(value = "/user/unmarkImportant", method = RequestMethod.POST)
	public @ResponseBody boolean unmarkImportant(@RequestParam("complaint") String complaint,HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		boolean flag=false;
		if (uRoleTpye.contains("ROLE_DH")||uRoleTpye.contains("ROLE_SO")||uRoleTpye.contains("ROLE_BO")) {
			flag= commonServiceImpl.unmarkImportant(complaint);
		}
		return flag;
		}
	
	@RequestMapping(value = "/user/impinbox", method = RequestMethod.GET)
	public String impInbox(Model model, HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		if (uRoleTpye.contains("ROLE_DH")) {
			model.addAttribute("allDiary", userServiceImpl.findAllDiaryImpInbox(uSection, loginId));
		} else if (uRoleTpye.contains("ROLE_SO")) {
			model.addAttribute("allDiary", commonServiceImpl.findAllDiarySoImpInbox(uSection, loginId));
		}  else if (uRoleTpye.contains("ROLE_BO")) {
			model.addAttribute("allDiary", commonServiceImpl.findAllDiaryForBoImpInbox(uSection, loginId));
			return "impinboxBo";
		} 
		logger.info("Imortant Inbox page is call");
		return "impinbox";
	}
	
	
	@RequestMapping(value = "/user/getDetailsByComplaintDate", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByComplaintDate(@RequestParam("complaintDate") Date complaintDate,HttpServletRequest request) {
		logger.info("complainDesiganation method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return commonServiceImpl.findDetailsComplaintDate(loginId, complaintDate, uSection);
	}
	
	@RequestMapping(value = "/user/getDetailsByCreatedDate", method = RequestMethod.POST)
	public @ResponseBody List<ComplainDto> getDetailsByCreatedDate(@RequestParam("createdDate") Date createdDate,HttpServletRequest request) {
		logger.info("complainDesiganation method is call");
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String loginId = auth.getName(); // get logged in loginId HttpSession
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("loginId", loginId);
		UserLoginAuthenticationDto userLoginAuthenticationDto = userServiceImpl.getUserAuthentication(loginId);
		String uSection = userLoginAuthenticationDto.getLoginRoll();
		Collection<String> uRoleTpye = userLoginAuthenticationDto.getListRole();
		
		return commonServiceImpl.findDetailsCreatedDate(loginId, createdDate, uSection);
	}
	
}
