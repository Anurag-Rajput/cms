package com.cvc.user.daoImpl;

import static org.junit.Assume.assumeNoException;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cvc.dto.CVCAdviceDto;
import com.cvc.dto.CitizenDto;
import com.cvc.dto.CvoDto;
import com.cvc.dto.CvoMonthyReportDto;
import com.cvc.dto.DairyDetailsDto;

import com.cvc.dto.IpCaptureDto;
import com.cvc.dto.NotingDto;

import com.cvc.dto.UserDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.dto.VigClearanceDto;

import com.cvc.user.daoI.CommonDaoI;
import com.cvc.user.service.impl.UserServiceImpl;
import com.cvc.user.session.CitizenDetails;
import com.cvc.util.MyUtill;
import com.cvc.util.RandomUnqieId;
import com.google.common.collect.Maps;

@Service
public class CommonDaoImpl implements CommonDaoI {

	@Autowired
	DataSource dataSource;
	
	@Autowired
	UserServiceImpl userServiceImpl;
	
 

	
	public void insertUser(UserDto dairyDto) throws ParseException {
		JdbcTemplate jdbcTemplate = null;
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		Date date = format.parse(dairyDto.getDateOfTenure());
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			jdbcTemplate.update(
					"INSERT INTO \"registration\"(userid,password,name,mobilenumber,email,organisation,logintype,loginroll,desiganation,tenure,createdate,bofficercode,cvocode,passwordone,passwordtwo,status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
					dairyDto.getUserID(), dairyDto.getPassword(), dairyDto.getUserName(),
					dairyDto.getMobileNumber(), dairyDto.getUserEmail(), dairyDto.getOrganisation(),
					dairyDto.getLoginType(), dairyDto.getLoginRoll(), dairyDto.getDesiganation(),
					date,new Date(),dairyDto.getBoCode(),dairyDto.getCvoCode(),dairyDto.getPassword(),dairyDto.getPassword(),true);
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}

	}

	public void insertDairyDetails(DairyDetailsDto dairyDetailsDto, File file, String loginId, String roll, HttpServletRequest request) throws ParseException {
		
		JdbcTemplate jdbcTemplate = null;
		String filepath=""; 
	     HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("loginId", loginId);
		    CitizenDetails citizenDetails= (CitizenDetails)httpSession.getAttribute("citizen");
		 String dairyid=(String) httpSession.getAttribute("dairyid");
		 UserLoginAuthenticationDto userLoginAuthenticationDto = null;
			if(userServiceImpl.getUserAuthentication(loginId)!=null){
			userLoginAuthenticationDto=userServiceImpl.getUserAuthentication(loginId);
			}else{
			 userLoginAuthenticationDto=userServiceImpl.getCitizenAuthentication(loginId);
			}
	     Collection<String> rollTpye= userLoginAuthenticationDto.getListRole();
	    
		IpCaptureDto ipCaptureDto= (IpCaptureDto) request.getSession().getAttribute("IpCaptureDetail");
		
		if(rollTpye.contains("ROLE_Diary")){
			SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
			Date date = format.parse(dairyDetailsDto.getComplainDate());
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			
			if(file!=null){
				filepath=RandomUnqieId.filePath(file.getAbsolutePath(), "complain");
			}
			if (dairyDetailsDto.getActionTaken().equals("Filed")){
			jdbcTemplate.update(
					"INSERT INTO \"complain\"(dairystatus,sendername, complaindate, address, address2, state, city, pinno, email, mobileno, complaintagainstname, designation, section,organization,  whetherfasttrack,  complainttype, actiontaken, uploadscandocument, documentstatus, createddate ,usercode,dairyid,recipientname,rolltype,organisationcode,complaintsentfrom,bofinaldecdate,boirfinaldec,bodecision,bodecisiondate,status,ipcapture,byuserid,ondate)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
					loginId ,dairyDetailsDto.getSenderName(),
				    date, dairyDetailsDto.getAddress(), dairyDetailsDto.getAddress2(),
					dairyDetailsDto.getState(), dairyDetailsDto.getCity(), dairyDetailsDto.getPinno(),
					dairyDetailsDto.getEmail(), dairyDetailsDto.getMobileNo(),
					dairyDetailsDto.getComplaintAgainstName(), dairyDetailsDto.getDesignation(),
					dairyDetailsDto.getSection(),dairyDetailsDto.getOrganization(),
					dairyDetailsDto.getWhetherFastTrack(),
					dairyDetailsDto.getComplaintType(), dairyDetailsDto.getActionTaken(),
					filepath,
					dairyDetailsDto.getDocumentStatus(),new Date(),userLoginAuthenticationDto.getUserPID(),dairyid,loginId,roll,dairyDetailsDto.getOrganisationCode(),dairyDetailsDto.getComplaintSentType(),new Date(),"Filed","Filed",new Date(),0,ipCaptureDto.getIpAddress(),ipCaptureDto.getByUserId(),ipCaptureDto.getOnDate());
			}else {
				jdbcTemplate.update(
						"INSERT INTO \"complain\"(dairystatus,sendername, complaindate, address, address2, state, city, pinno, email, mobileno, complaintagainstname, designation, section,organization,  whetherfasttrack,  complainttype, actiontaken, uploadscandocument, documentstatus, createddate ,usercode,dairyid,recipientname,rolltype,boirfinaldec,organisationcode,complaintsentfrom,status,ipcapture,byuserid,ondate)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
						dairyDetailsDto.getSection(),dairyDetailsDto.getSenderName(),
					    date, dairyDetailsDto.getAddress(), dairyDetailsDto.getAddress2(),
						dairyDetailsDto.getState(), dairyDetailsDto.getCity(), dairyDetailsDto.getPinno(),
						dairyDetailsDto.getEmail(), dairyDetailsDto.getMobileNo(),
						dairyDetailsDto.getComplaintAgainstName(), dairyDetailsDto.getDesignation(),
						dairyDetailsDto.getSection(),dairyDetailsDto.getOrganization(),
						dairyDetailsDto.getWhetherFastTrack(),
						dairyDetailsDto.getComplaintType(), dairyDetailsDto.getActionTaken(),
						filepath,
						dairyDetailsDto.getDocumentStatus(),new Date(),userLoginAuthenticationDto.getUserPID(),dairyid,loginId,roll,null,dairyDetailsDto.getOrganisationCode(),dairyDetailsDto.getComplaintSentType(),0,ipCaptureDto.getIpAddress(),ipCaptureDto.getByUserId(),ipCaptureDto.getOnDate());
			}
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}
		}else if(rollTpye.contains("ROLE_CITIZEN")){
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				if(file!=null){
					System.out.println("file------------"+file);
					jdbcTemplate.update(
							"INSERT INTO \"complain\"(dairystatus,sendername, complaindate, address, address2, state, city, pinno, email, mobileno, complaintagainstname, designation, section,organization,  whetherfasttrack,  complainttype, uploadscandocument, documentstatus, createddate ,usercode,dairyid,recipientname,rolltype,detailofallegation,boirfinaldec,organisationcode,complaintsentfrom,ipcapture,byuserid,ondate)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
							 dairyDetailsDto.getSection(),loginId,
						    new Date(), citizenDetails.getcAddress1(), citizenDetails.getcAddress2()+" "+citizenDetails.getcAddress3()==null?"":citizenDetails.getcAddress3(),
						    citizenDetails.getcState(), citizenDetails.getcCcity(),citizenDetails.getcPpincode(),
						    citizenDetails.getcEmail(), citizenDetails.getcPhNumber(),
							dairyDetailsDto.getComplaintAgainstName(), dairyDetailsDto.getDesignation(),
							dairyDetailsDto.getSection(),dairyDetailsDto.getOrganization(),
							dairyDetailsDto.getWhetherFastTrack(),
							/*dairyDetailsDto.getComplaintType()*/"Signed",
							RandomUnqieId.filePath(file.getAbsolutePath(),"complain"),
							dairyDetailsDto.getDocumentStatus(),new Date(),userLoginAuthenticationDto.getUserPID(),dairyid,loginId,roll.split("_")[1],dairyDetailsDto.getDetailsAlligations(),null,dairyDetailsDto.getOrganisationCode(),dairyDetailsDto.getComplaintSentType(),ipCaptureDto.getIpAddress(),ipCaptureDto.getByUserId(),ipCaptureDto.getOnDate());
				}
				
				if(file==null)
				{
					jdbcTemplate.update(
							"INSERT INTO \"complain\"(dairystatus,sendername, complaindate, address, address2, state, city, pinno, email, mobileno, complaintagainstname, designation, section,organization,  whetherfasttrack,  complainttype, uploadscandocument, documentstatus, createddate ,usercode,dairyid,recipientname,rolltype,detailofallegation,organisationcode,complaintsentfrom,ipcapture,byuserid,ondate)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
							 dairyDetailsDto.getSection(),loginId,
						    new Date(), citizenDetails.getcAddress1(), citizenDetails.getcAddress2()+" "+citizenDetails.getcAddress3(),
						    citizenDetails.getcState(), citizenDetails.getcCcity(),citizenDetails.getcPpincode(),
						    citizenDetails.getcEmail(), citizenDetails.getcPhNumber(),
							dairyDetailsDto.getComplaintAgainstName(), dairyDetailsDto.getDesignation(),
							dairyDetailsDto.getSection(),dairyDetailsDto.getOrganization(),
							dairyDetailsDto.getWhetherFastTrack(),
							/*dairyDetailsDto.getComplaintType()*/"Signed",
							"",
							dairyDetailsDto.getDocumentStatus(),new Date(),userLoginAuthenticationDto.getUserPID(),dairyid,loginId,roll.split("_")[1],dairyDetailsDto.getDetailsAlligations(),dairyDetailsDto.getOrganisationCode(),dairyDetailsDto.getComplaintSentType(),ipCaptureDto.getIpAddress(),ipCaptureDto.getByUserId(),ipCaptureDto.getOnDate());
				}
				
			} finally {
				MyUtill.connClose(jdbcTemplate);
			}
		}else if(rollTpye.contains("ROLE_HELP")){

			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				jdbcTemplate.update(
						"INSERT INTO \"complain\"(dairystatus,sendername, complaindate, address, address2, state, city, pinno, email, mobileno, complaintagainstname, designation, section,organization,  whetherfasttrack,  complainttype, actiontaken, uploadscandocument, documentstatus, createddate ,usercode,dairyid,recipientname,rolltype,boirfinaldec,organisationcode,detailofallegation,complaintsentfrom,ipcapture,byuserid,ondate)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
						dairyDetailsDto.getSection(),dairyDetailsDto.getSenderName(),
					    new Date(), dairyDetailsDto.getAddress(), dairyDetailsDto.getAddress2(),
						dairyDetailsDto.getState(), dairyDetailsDto.getCity(), dairyDetailsDto.getPinno(),
						dairyDetailsDto.getEmail(), dairyDetailsDto.getMobileNo(),
						dairyDetailsDto.getComplaintAgainstName(), dairyDetailsDto.getDesignation(),
						dairyDetailsDto.getSection(),dairyDetailsDto.getOrganization(),
						dairyDetailsDto.getWhetherFastTrack(),
						"Signed", dairyDetailsDto.getActionTaken(),
						filepath,
						dairyDetailsDto.getDocumentStatus(),new Date(),userLoginAuthenticationDto.getUserPID(),dairyid,loginId,roll,null,dairyDetailsDto.getOrganisationCode(),dairyDetailsDto.getDetailsAlligations(),dairyDetailsDto.getComplaintSentType(),ipCaptureDto.getIpAddress(),ipCaptureDto.getByUserId(),ipCaptureDto.getOnDate());
			} finally {
				MyUtill.connClose(jdbcTemplate);
			}
		
		}
	}

	public void insertMoreOrganization(DairyDetailsDto dairyDetailsDto, String complainNumber) {
		JdbcTemplate jdbcTemplate = null;
		Map<String, String> mapof = null;
        for (int i = 0; i <dairyDetailsDto.getMoreOraganization().size(); i++) {
        	mapof=Maps.newHashMap();
        	mapof.put(dairyDetailsDto.getMoreOraganization().get(i), dairyDetailsDto.getMoreDesiganation().get(i));
        	
		}
		
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			for (Map.Entry<String, String> entry : mapof.entrySet()) {
			    jdbcTemplate.update(
						"INSERT INTO \"morecomplainee\"(complaineename,desiganation,complaintnumber)VALUES(?,?,?)",
						entry.getKey(),entry.getValue(),complainNumber);
				
			}
			
          
		} catch(Exception e){
			e.printStackTrace();
		}
		finally {
			MyUtill.connClose(jdbcTemplate);
		}
		
	}

	public void insertCNumber(String complainNumber, HttpServletRequest request) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		String dairyId = (String) request.getSession().getAttribute("dairyid");
		String sql = "UPDATE complain SET complaint = ? where dairyid = ?";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, complainNumber);
			preparedStatement.setString(2, dairyId);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			/**
			 * Close the preparedStatement
			 */
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			/**
			 * Close the connection
			 */
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			MyUtill.connClose(jdbcTemplate);
			}
		}


	
	public void insertUpdatedComplain(NotingDto notingDto, DairyDetailsDto dairyDetailsDto, Integer complaintNumber, String loginId,IpCaptureDto ipCaptureDto) throws ParseException {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		if(dairyDetailsDto.getActionTaken()==null){
			dairyDetailsDto.setActionTaken("");
		}
		
		System.out.println("inserUpdateComplaint--------------------"+dairyDetailsDto.getConfirmCVO());
		
		
		String sqlFiled = "UPDATE complain SET dairystatus = ?,complaindate = ?,sendername = ?,"
				+ " address = ?,address2 = ?,state = ?,city = ?,"
				+ "pinno = ?,email =?,mobileno = ?,complaintagainstname = ?,bofiledackdate = ?,"
				+ "designation = ?,organization = ?,section = ?,whetherfasttrack = ?,"
				+ "complainttype = ?,actiontaken = ?,bodecision = ?,gistallegation = ?,recipientname = ?,"
						+ "bofinaldecdate =?,boirfinaldec = ?,boname = ?,bofileddate = ? , organisationcode = ?,status = ?,confirmcvo = ?, bodecisiondate = ? ,ipcapture=?,byuserid=?,ondate=?"
				+ "where complaintnumber = ?";
		
		
		String sql = "UPDATE complain SET dairystatus = ?,complaindate = ?,sendername = ?,"
							+ " address = ?,address2 = ?,state = ?,city = ?,"
							+ "pinno = ?,email = ?,mobileno = ?,complaintagainstname = ?,"
							+ "designation = ?,organization = ?,section = ?,whetherfasttrack = ?,"
									+ "forwarddate = ?,boname = ?,"
							+ "complainttype = ?,actiontaken = ?,bodecision = ?,gistallegation = ?,recipientname = ? , organisationcode = ?,status = ?, confirmcvo = ? ,ipcapture=?,byuserid=?,ondate=?"
							+ "where complaintnumber = ?";
		
		
		String sqlForNa = "UPDATE complain SET dairystatus = ?,complaindate = ?,sendername = ?,"
							+ " address = ?,address2 = ?,state = ?,city = ?,"
							+ "pinno = ?,email = ?,mobileno = ?,complaintagainstname = ?,"
							+ "designation = ?,organization = ?,section = ?,whetherfasttrack = ?,forwarddate = ?,"
							+ "complainttype = ?,actiontaken = ? ,bodecision=?,gistallegation = ?,recipientname = ?,"
									+ "bofinaldecdate =?,boirfinaldec = ?,boname = ?,bonaackdate = ?,bonaomdate = ? , organisationcode = ?,status = ? , confirmcvo = ?, bodecisiondate = ? ,ipcapture=?,byuserid=?,ondate=?"
							+ "where complaintnumber = ?";
		
		String sqlForIr = "UPDATE complain SET dairystatus = ?,complaindate = ?,sendername = ?,"
							+ " address = ?,address2 = ?,state = ?,city = ?,"
							+ "pinno = ?,email = ?,mobileno = ?,complaintagainstname = ?,"
							+ "designation = ?,organization = ?,section = ?,whetherfasttrack = ?,forwarddate = ?,"
							+ "complainttype = ?,actiontaken = ?,bodecision = ?,gistallegation = ?,recipientname = ?,"
									+ "boname = ?,boircondate = ?,boirremidate = ?,boirconrecdate = ?,"
											+ "boirfinaldec = ?,bofinaldecdate =?,filenumber = ?,boirackdate = ? , organisationcode = ?,status = ?, confirmcvo = ?, bodecisiondate = ? ,ipcapture=?,byuserid=?,ondate=?"
							+ "where complaintnumber = ?";
		
		String sqlForOthers = "UPDATE complain SET dairystatus = ?,complaindate = ?,sendername = ?,"
				+ " address = ?,address2 = ?,state = ?,city = ?,"
				+ "pinno = ?,email = ?,mobileno = ?,complaintagainstname = ?,"
				+ "designation = ?,organization = ?,section = ?,whetherfasttrack = ?,forwarddate = ?,"
				+ "complainttype = ?,actiontaken = ?,bodecision = ?,gistallegation = ?,recipientname = ?,"
						+ "boname = ?,boircondate = ?,boirremidate = ?,boirconrecdate = ?,"
								+ "boirfinaldec = ?,bofinaldecdate =?,filenumber=?,boirackdate = ? , organisationcode = ?,status = ?, confirmcvo = ?"
				+ "where complaintnumber = ?";

	/*	if(((dairyDetailsDto.getBoirfinaldec().isEmpty()||dairyDetailsDto.getBoirfinaldec()==""||dairyDetailsDto.getBoirfinaldec()==null)&&
		(!dairyDetailsDto.getBoirfinaldecdate().isEmpty()||dairyDetailsDto.getBoirfinaldecdate()!=""||dairyDetailsDto.getBoirfinaldecdate()!=null))||
		((!dairyDetailsDto.getBoirfinaldec().isEmpty()||dairyDetailsDto.getBoirfinaldec()!=""||dairyDetailsDto.getBoirfinaldec()!=null)&&
		(dairyDetailsDto.getBoirfinaldecdate().isEmpty()||dairyDetailsDto.getBoirfinaldecdate()==""||dairyDetailsDto.getBoirfinaldecdate()==null)))
		{
			try {
				 return;				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/

		
		
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date fd;
		java.sql.Date sqlDate;
		if(dairyDetailsDto.getBoDecisionDate()=="")
		{	
			
			sqlDate = null;
		}			
		else{
		fd = formatter.parse(dairyDetailsDto.getBoDecisionDate());		
		sqlDate = new java.sql.Date(fd.getTime());
		}
		
		/*if(dairyDetailsDto.getBoDecision().equalsIgnoreCase("null") || dairyDetailsDto.getBoDecision().equalsIgnoreCase("undefined") || dairyDetailsDto.getBoDecision()=="undefined") 
		{
			dairyDetailsDto.setBoDecision("");
		}*/
		System.out.println("dairyDetailsDto.getBoDecision()--------------"+dairyDetailsDto.getBoDecision());
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
		/*	System.out.println("dairyDetailsDto.getBoDecision()!= null"+dairyDetailsDto.getBoDecision()!= null);
		    System.out.println("dairyDetailsDto.getBoDecision()!= null string"+dairyDetailsDto.getBoDecision()!="null");
			System.out.println("dairyDetailsDto.getBoDecision()!= blank string"+dairyDetailsDto.getBoDecision()!= "");*/
			conn = jdbcTemplate.getDataSource().getConnection();
			conn.setAutoCommit(false);
			if(dairyDetailsDto.getBoDecision()!= null){
				
				if(dairyDetailsDto.getBoDecision().equals("NA")){
					
					preparedStatement = conn.prepareStatement(sqlForNa);
					preparedStatement.setString(1, notingDto.getForwradvalue().split(",")[0]);
					preparedStatement.setDate(2, java.sql.Date.valueOf(dairyDetailsDto.getComplainDate()));
					preparedStatement.setString(3, dairyDetailsDto.getSenderName());
					preparedStatement.setString(4, dairyDetailsDto.getAddress());
					preparedStatement.setString(5, dairyDetailsDto.getAddress2());
					preparedStatement.setString(6, dairyDetailsDto.getState());
					preparedStatement.setString(7, dairyDetailsDto.getCity());
					preparedStatement.setInt(8, dairyDetailsDto.getPinno());
					preparedStatement.setString(9, dairyDetailsDto.getEmail());
					preparedStatement.setString(10, dairyDetailsDto.getMobileNo());
					preparedStatement.setString(11, dairyDetailsDto.getComplaintAgainstName());
					preparedStatement.setString(12, dairyDetailsDto.getDesignation());
					preparedStatement.setString(13, dairyDetailsDto.getOrganization());
					
					preparedStatement.setString(14, dairyDetailsDto.getSection());
					preparedStatement.setString(15, dairyDetailsDto.getWhetherFastTrack());
					preparedStatement.setTimestamp(16, new Timestamp(System.currentTimeMillis()));
					preparedStatement.setString(17, dairyDetailsDto.getComplaintType());
					preparedStatement.setString(18, dairyDetailsDto.getActionTaken());
					preparedStatement.setString(19,  dairyDetailsDto.getBoDecision());
					preparedStatement.setString(20, dairyDetailsDto.getGistOfAllegation());
					preparedStatement.setString(21, loginId);
					preparedStatement.setDate(22,  sqlDate);
					//preparedStatement.setTimestamp(22, new Timestamp(System.currentTimeMillis()));
					preparedStatement.setString(23,  dairyDetailsDto.getBoDecision());
					preparedStatement.setString(24, dairyDetailsDto.getBoName());
					if (dairyDetailsDto.getBoNaAckDate() == "") {
						preparedStatement.setNull(25, java.sql.Types.TIMESTAMP);
					} else {
						preparedStatement.setDate(25, java.sql.Date.valueOf(dairyDetailsDto.getBoNaAckDate()) );
					}
					if (dairyDetailsDto.getBoNaOmDate()== "") {
						preparedStatement.setNull(26,  java.sql.Types.TIMESTAMP);
					} else {
						preparedStatement.setDate(26, java.sql.Date.valueOf(dairyDetailsDto.getBoNaOmDate()) );
					}
					preparedStatement.setString(27, dairyDetailsDto.getOrganisationCode());
					preparedStatement.setInt(28, 0);
					preparedStatement.setString(29, dairyDetailsDto.getConfirmCVO());
					preparedStatement.setDate(30,  sqlDate);
					
					preparedStatement.setString(31,  ipCaptureDto.getIpAddress());
					preparedStatement.setString(32,  ipCaptureDto.getByUserId());
					preparedStatement.setString(33,  ipCaptureDto.getOnDate());
					
					preparedStatement.setInt(34, complaintNumber);
					preparedStatement.executeUpdate();
			}else if(dairyDetailsDto.getBoDecision().equals("IR")){
				
				
				Date bodecf;
				java.sql.Date bofina;
				
				
				preparedStatement = conn.prepareStatement(sqlForIr);
				preparedStatement.setString(1, notingDto.getForwradvalue().split(",")[0]);
				preparedStatement.setDate(2, java.sql.Date.valueOf(dairyDetailsDto.getComplainDate()));
				preparedStatement.setString(3, dairyDetailsDto.getSenderName());
				preparedStatement.setString(4, dairyDetailsDto.getAddress());
				preparedStatement.setString(5, dairyDetailsDto.getAddress2());
				preparedStatement.setString(6, dairyDetailsDto.getState());
				preparedStatement.setString(7, dairyDetailsDto.getCity());
				preparedStatement.setInt(8, dairyDetailsDto.getPinno());
				preparedStatement.setString(9, dairyDetailsDto.getEmail());
				preparedStatement.setString(10, dairyDetailsDto.getMobileNo());
				preparedStatement.setString(11, dairyDetailsDto.getComplaintAgainstName());
				preparedStatement.setString(12, dairyDetailsDto.getDesignation());
				preparedStatement.setString(13, dairyDetailsDto.getOrganization());
				preparedStatement.setString(14, dairyDetailsDto.getSection());
				preparedStatement.setString(15, dairyDetailsDto.getWhetherFastTrack());
				preparedStatement.setTimestamp(16, new Timestamp(System.currentTimeMillis()));
				preparedStatement.setString(17, dairyDetailsDto.getComplaintType());
				preparedStatement.setString(18, dairyDetailsDto.getActionTaken());
				preparedStatement.setString(19, dairyDetailsDto.getBoDecision());
				preparedStatement.setString(20, dairyDetailsDto.getGistOfAllegation());
				preparedStatement.setString(21, loginId);
				preparedStatement.setString(22, dairyDetailsDto.getBoName());
				if (dairyDetailsDto.getBoircondate() == "") {
					preparedStatement.setNull(23, java.sql.Types.DATE);
				} else {
					preparedStatement.setDate(23, java.sql.Date.valueOf(dairyDetailsDto.getBoircondate()));
				}
				if(dairyDetailsDto.getBoirremdate()==""){
					preparedStatement.setNull(24, java.sql.Types.DATE);
				}else{
					preparedStatement.setDate(24, java.sql.Date.valueOf(dairyDetailsDto.getBoirremdate()));
				}
				if (dairyDetailsDto.getBoirconrecdate()== "") {
					preparedStatement.setNull(25, java.sql.Types.DATE);
				}else{
					preparedStatement.setDate(25, java.sql.Date.valueOf(dairyDetailsDto.getBoirconrecdate()));
				}
				
				preparedStatement.setString(26, dairyDetailsDto.getBoirfinaldec());
				
				if(dairyDetailsDto.getBoirfinaldecdate()!="")
				{
					
					bodecf=formatter.parse(dairyDetailsDto.getBoirfinaldecdate());
					bofina = new java.sql.Date(bodecf.getTime());
					preparedStatement.setDate(27,  bofina);
				}
				else
				{					
					preparedStatement.setNull(27,  java.sql.Types.TIMESTAMP);
				
				}
				
				//preparedStatement.setString(27, dairyDetailsDto.getBoirfinaldecdate());
				
				
				/*if(dairyDetailsDto.getStageIR().equals("IRF"))
				{
				preparedStatement.setString(26, dairyDetailsDto.getBoirfinaldec());
				preparedStatement.setTimestamp(27, new Timestamp(System.currentTimeMillis()));
				}
				else
				{
					preparedStatement.setString(26, null);
					preparedStatement.setTimestamp(27, null);
				}*/
				
				preparedStatement.setString(28, dairyDetailsDto.getBoirfileno());
				if (dairyDetailsDto.getBoirackdate() == "") {
					preparedStatement.setNull(29, java.sql.Types.DATE);
				} else {
					preparedStatement.setDate(29, java.sql.Date.valueOf(dairyDetailsDto.getBoirackdate()));
				}
				preparedStatement.setString(30, dairyDetailsDto.getOrganisationCode());
				preparedStatement.setInt(31, 0);
				preparedStatement.setString(32, dairyDetailsDto.getConfirmCVO());
				
				preparedStatement.setDate(33,  sqlDate);
				
				preparedStatement.setString(34,  ipCaptureDto.getIpAddress());
				preparedStatement.setString(35,  ipCaptureDto.getByUserId());
				preparedStatement.setString(36,  ipCaptureDto.getOnDate());
				//preparedStatement.setString(33,dairyDetailsDto.getBoDecisionDate()));
				preparedStatement.setInt(37, complaintNumber);
				preparedStatement.executeUpdate();
			}else if(dairyDetailsDto.getBoDecision().contains("Filed")){
				
				preparedStatement = conn.prepareStatement(sqlFiled);
				preparedStatement.setString(1, notingDto.getForwradvalue().split(",")[0]);
				preparedStatement.setDate(2,  java.sql.Date.valueOf(dairyDetailsDto.getComplainDate()) );
				preparedStatement.setString(3, dairyDetailsDto.getSenderName());
				preparedStatement.setString(4, dairyDetailsDto.getAddress());
				preparedStatement.setString(5, dairyDetailsDto.getAddress2());
				preparedStatement.setString(6, dairyDetailsDto.getState());
				preparedStatement.setString(7, dairyDetailsDto.getCity());
				preparedStatement.setInt(8, dairyDetailsDto.getPinno());
				preparedStatement.setString(9, dairyDetailsDto.getEmail());
				preparedStatement.setString(10, dairyDetailsDto.getMobileNo());
				preparedStatement.setString(11, dairyDetailsDto.getComplaintAgainstName());
				if (dairyDetailsDto.getBoFiledAckDate() == "" || dairyDetailsDto.getBoFiledAckDate() == null) {
					preparedStatement.setNull(12, java.sql.Types.TIMESTAMP);
				} else {
					preparedStatement.setDate(12, java.sql.Date.valueOf(dairyDetailsDto.getBoFiledAckDate()));
				}
				/*preparedStatement.setNull(12, java.sql.Types.TIMESTAMP);*/
				preparedStatement.setString(13, dairyDetailsDto.getDesignation());
				preparedStatement.setString(14, dairyDetailsDto.getOrganization());
				preparedStatement.setString(15, dairyDetailsDto.getSection());
				preparedStatement.setString(16, dairyDetailsDto.getWhetherFastTrack());
				preparedStatement.setString(17, dairyDetailsDto.getComplaintType());
				preparedStatement.setString(18, dairyDetailsDto.getActionTaken());
				preparedStatement.setString(19,  dairyDetailsDto.getBoDecision());
				preparedStatement.setString(20, dairyDetailsDto.getGistOfAllegation());
				preparedStatement.setString(21, loginId);
				preparedStatement.setDate(22,  sqlDate);				
				//preparedStatement.setTimestamp(22, new Timestamp(System.currentTimeMillis()));
				preparedStatement.setString(23, "Filed");
				preparedStatement.setString(24, dairyDetailsDto.getBoName());
				preparedStatement.setTimestamp(25, new Timestamp(System.currentTimeMillis()));
				preparedStatement.setString(26, dairyDetailsDto.getOrganisationCode());
				preparedStatement.setInt(27, 0);
				preparedStatement.setString(28, dairyDetailsDto.getConfirmCVO());
				preparedStatement.setDate(29,  sqlDate);
				
				preparedStatement.setString(30,  ipCaptureDto.getIpAddress());
				preparedStatement.setString(31,  ipCaptureDto.getByUserId());
				preparedStatement.setString(32,  ipCaptureDto.getOnDate());
				
				preparedStatement.setInt(33, complaintNumber);
				preparedStatement.executeUpdate();
				}
			}
			    
			else {
				
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, notingDto.getForwradvalue().split(",")[0]);
				preparedStatement.setDate(2, java.sql.Date.valueOf(dairyDetailsDto.getComplainDate()));
				preparedStatement.setString(3, dairyDetailsDto.getSenderName());
				preparedStatement.setString(4, dairyDetailsDto.getAddress());
				preparedStatement.setString(5, dairyDetailsDto.getAddress2());
				preparedStatement.setString(6, dairyDetailsDto.getState());
				preparedStatement.setString(7, dairyDetailsDto.getCity());
				//preparedStatement.setInt(8, dairyDetailsDto.getPinno());
				if(dairyDetailsDto.getPinno()==null || dairyDetailsDto.getPinno()==0)
				{
					preparedStatement.setNull(8, java.sql.Types.INTEGER);;
				}
				else
				{
					preparedStatement.setInt(8, dairyDetailsDto.getPinno());
				}
				
				preparedStatement.setString(9, dairyDetailsDto.getEmail());
				preparedStatement.setString(10, dairyDetailsDto.getMobileNo());
				preparedStatement.setString(11, dairyDetailsDto.getComplaintAgainstName());
				preparedStatement.setString(12, dairyDetailsDto.getDesignation());
				preparedStatement.setString(13, dairyDetailsDto.getOrganization());
				preparedStatement.setString(14, dairyDetailsDto.getSection());
				preparedStatement.setString(15, dairyDetailsDto.getWhetherFastTrack());
				preparedStatement.setTimestamp(16, new Timestamp(System.currentTimeMillis()));
				preparedStatement.setString(17, dairyDetailsDto.getBoName());
				preparedStatement.setString(18, dairyDetailsDto.getComplaintType());
				preparedStatement.setString(19, dairyDetailsDto.getActionTaken());
				preparedStatement.setString(20, dairyDetailsDto.getBoDecision());
				preparedStatement.setString(21, dairyDetailsDto.getGistOfAllegation());
				preparedStatement.setString(22, loginId);
				preparedStatement.setString(23, dairyDetailsDto.getOrganisationCode());
				preparedStatement.setInt(24, 0);
				preparedStatement.setString(25, dairyDetailsDto.getConfirmCVO());
				
				preparedStatement.setString(26,  ipCaptureDto.getIpAddress());
				preparedStatement.setString(27,  ipCaptureDto.getByUserId());
				preparedStatement.setString(28,  ipCaptureDto.getOnDate());
				
				preparedStatement.setInt(29, complaintNumber);
				preparedStatement.executeUpdate();
			}
			
		
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			/**
			 * Close the preparedStatement
			 */
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					try {
						conn.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			/**
			 * Close the connection
			 */
			if (conn != null) {
				try {
					conn.commit();
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			MyUtill.connClose(jdbcTemplate);
			
		}
	}

	
	public void insertUpdatedClearanceDetails(VigClearanceDto vigClearanceDto, String fileNo11, String loginId) {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
	
	
		String sqlForClearanceDetail = "Update vijclearancedetail SET  clearancetype =?, nameofdepart = ?, departrefno = ?, departrefdate1 = ?, departrefrecvdate = ?,"
										+ "subject = ?, country = ?,  numberofofficer = ?, lettertocbidate = ?, lettertosectiondate = ?, lettertoconcerned = ?,"
										+ "completeprofile = ?, returntodepart = ?, feedbackreceivedfromcbidate= ?, feedbackreceivedfromsection = ?, feedbackreceivedfromorganization = ?,"
										+ "dateOnfile = ?, filesubmittedbydhdate = ?, letterissuedate = ?"
										+ "where fileNo = ?";
				
			try
			{
					jdbcTemplate = MyUtill.conn(dataSource);
					conn = jdbcTemplate.getDataSource().getConnection();
					preparedStatement = conn.prepareStatement(sqlForClearanceDetail);
					preparedStatement.setString(1,vigClearanceDto.getClearanceType());
					preparedStatement.setString(2, vigClearanceDto.getNameOfDepart());
					preparedStatement.setString(3, vigClearanceDto.getDepartRefNo());
					
					try {
						
						
						preparedStatement.setDate(4,java.sql.Date.valueOf(vigClearanceDto.getDepartRefDate1()));
									
						preparedStatement.setDate(5,java.sql.Date.valueOf(vigClearanceDto.getDepartRefRecvDate()));
						
						
						preparedStatement.setString(6, vigClearanceDto.getSubject());
						preparedStatement.setString(7, vigClearanceDto.getCountry());
						preparedStatement.setInt(8, vigClearanceDto.getNumberOfOfficer());
						
						if(vigClearanceDto.getLetterToCBIDate()!=null && !vigClearanceDto.getLetterToCBIDate().equals(""))
						{
							preparedStatement.setDate(9,java.sql.Date.valueOf(vigClearanceDto.getLetterToCBIDate()));
						}else{
							preparedStatement.setDate(9,null);
						}
						
						if(vigClearanceDto.getLetterToSectionDate()!=null && !vigClearanceDto.getLetterToSectionDate().equals(""))
						{
							preparedStatement.setDate(10,java.sql.Date.valueOf(vigClearanceDto.getLetterToCBIDate()));
						}else{
							preparedStatement.setDate(10,null);
						}
						
						preparedStatement.setString(11,vigClearanceDto.getLetterToConcerned());
						preparedStatement.setString(12, vigClearanceDto.getCompleteProfile());
						
						if(vigClearanceDto.getReturnToDepart()!=null && !vigClearanceDto.getReturnToDepart().equals(""))
						{
							preparedStatement.setDate(13, java.sql.Date.valueOf(vigClearanceDto.getReturnToDepart()));
						}else{
							preparedStatement.setDate(13,null);
						}
						
						if(vigClearanceDto.getFeedbackReceivedFromCBIDate()!=null && !vigClearanceDto.getFeedbackReceivedFromCBIDate().equals(""))
						{
							preparedStatement.setDate(14,java.sql.Date.valueOf(vigClearanceDto.getFeedbackReceivedFromCBIDate()));
						}else{
							preparedStatement.setDate(14,null);
						}
						
						preparedStatement.setString(15, vigClearanceDto.getFeedbackReceivedFromSection());

						if(vigClearanceDto.getFeedbackReceivedFromOrganization()!=null && !vigClearanceDto.getFeedbackReceivedFromOrganization().equals(""))
						{
							preparedStatement.setDate(16,java.sql.Date.valueOf(vigClearanceDto.getFeedbackReceivedFromOrganization()));
						}else{
							preparedStatement.setDate(16,null);
						}
						
						if(vigClearanceDto.getDateOnFile()!=null && !vigClearanceDto.getDateOnFile().equals(""))
						{
							preparedStatement.setDate(17,java.sql.Date.valueOf(vigClearanceDto.getDateOnFile()));
						}else{
							preparedStatement.setDate(17,null);
						}
						
						if(vigClearanceDto.getFileSubmittedByDHDate()!=null && !vigClearanceDto.getFileSubmittedByDHDate().equals(""))
						{
							preparedStatement.setDate(18,java.sql.Date.valueOf(vigClearanceDto.getFileSubmittedByDHDate()));
						}else{
							preparedStatement.setDate(18,null);
						}
						
						if(vigClearanceDto.getLetterIssueDate()!=null && !vigClearanceDto.getLetterIssueDate().equals(""))
						{
							preparedStatement.setDate(19,java.sql.Date.valueOf(vigClearanceDto.getLetterIssueDate()));
							
						}else{
							preparedStatement.setDate(19, null);
						}
						preparedStatement.setString(20, vigClearanceDto.getFileNo());
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					preparedStatement.executeUpdate();
					
					preparedStatement=null;
					String delteQry = "delete from vijclearanceofficerdetail WHERE fileno=?";
					preparedStatement = conn.prepareStatement(delteQry);
					preparedStatement.setString(1, vigClearanceDto.getFileNo());
					preparedStatement.executeUpdate();
					
					insertVijClearanceOfficerDetail(vigClearanceDto, vigClearanceDto.getFileNo(),loginId, "SSS");
					
			
		   } catch (SQLException e) {
			   e.printStackTrace();
		   } finally {
			/**
			 * Close the preparedStatement
			 */
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			/**
			 * Close the connection
			 */
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			MyUtill.connClose(jdbcTemplate);
			
		}
	}

	
	
	
	
	public void insertNotingDetails(NotingDto notingDto, Integer complaintNumber, String loginId,String name, String uDesiganation,IpCaptureDto ipCaptureDto) {
		JdbcTemplate jdbcTemplate = null;

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			jdbcTemplate.update(
					"INSERT INTO \"noting\"(complaintnumber,notername,name,desiganation,notingmessage1,notingmessage2,notingmessage3,forwardto,notingdate,ipcapture,byuserid,ondate) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)",
					complaintNumber,loginId,name,uDesiganation,notingDto.getNotingMessage1(),notingDto.getNotingMessage2(),notingDto.getNotingMessage3(),notingDto.getForwardto().split(",")[0],
					new Date(),ipCaptureDto.getIpAddress(),ipCaptureDto.getByUserId(),ipCaptureDto.getOnDate()
					);
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}
	}
	
	
	
	
	public void insertForwardDetails(Integer complaintnumber, String loginId, NotingDto notingDto, DairyDetailsDto dairyDetailsDto,IpCaptureDto ipCaptureDto) {
		JdbcTemplate jdbcTemplate = null;
		String sqlsqlForwardSerialNo = "UPDATE forward set forwardserialno = ? WHERE  complaintnumber = ? and forwardno = ? ";
		String sqlForwardLastMove = "UPDATE forward set lastmovement = ? WHERE  complaintnumber = ? and forwardno != ?";
		String sqlCount = "SELECT COUNT(*) FROM forward WHERE complaintnumber = ?";
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		int total = 0;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			Long forwardNo = RandomUnqieId.unique();
			conn = jdbcTemplate.getDataSource().getConnection();
			conn.setAutoCommit(false);
			jdbcTemplate.update(
					"INSERT INTO \"forward\"(lastmovement,complaintnumber,fromuser,touser,forwarddate,forwardno,compliant,currentsection,ipcapture,byuserid,ondate) VALUES('Y',?,?,?,?,?,?,?,?,?,?)",
					complaintnumber,loginId,notingDto.getForwardto().split(",")[0],new Date(),forwardNo,dairyDetailsDto.getComplaint(),dairyDetailsDto.getSection(),ipCaptureDto.getIpAddress(),ipCaptureDto.getByUserId(),ipCaptureDto.getOnDate());
			
			preparedStatement = conn.prepareStatement(sqlCount);
			preparedStatement.setInt(1, complaintnumber);
			 rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				total=rs.getInt(1);
			}
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					try {
						conn.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			preparedStatement = conn.prepareStatement(sqlsqlForwardSerialNo);
			preparedStatement.setInt(1, total);
			preparedStatement.setInt(2, complaintnumber);
			preparedStatement.setLong(3, forwardNo);
			preparedStatement.executeUpdate();
			
			preparedStatement = conn.prepareStatement(sqlForwardLastMove);
			preparedStatement.setString(1, "N");
			preparedStatement.setInt(2, complaintnumber);
			preparedStatement.setLong(3, forwardNo);
			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			/**
			 * Close the resultSet
			 */
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					try {
						conn.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			/**
			 * Close the preparedStatement
			 */
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					try {
						conn.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			/**
			 * Close the connection
			 */
			if (conn != null) {
				try {
					conn.commit();
					conn.close();
				} catch (SQLException e) {
					try {
						conn.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			MyUtill.connClose(jdbcTemplate);

		}
	}

	@SuppressWarnings("deprecation")
	
	public void insertCitizen(CitizenDto citizenDto) {
		JdbcTemplate jdbcTemplate = null;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			
			jdbcTemplate.update(
					
					"INSERT INTO \"citizenregistration\" (citizenid,password,securityquestion,securityanswer,salutation,name,age,idcardnumber,address1,address2,state,city,email,contactnumber,pincode,passwordone,passwordtwo,createddate,logintype,address3,stdcode,landline) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'ROLE_CITIZEN',?,?,?)",
					citizenDto.getCitizenId(), citizenDto.getPassword(),citizenDto.getSecurityQuestion(),citizenDto.getSecurityAnswer(),
					citizenDto.getSalutation(),citizenDto.getName(),citizenDto.getAge(),citizenDto.getIdcardnumber(),citizenDto.getAddress1(),
					citizenDto.getAddress2(),citizenDto.getState().toUpperCase(),citizenDto.getCity().toUpperCase(),citizenDto.getCitizenEmail(),citizenDto.getContactNumber(),
					citizenDto.getPincode()	, citizenDto.getPassword(), citizenDto.getPassword(),citizenDto.getCreatedDate(),citizenDto.getAddress3(),"+91"+citizenDto.getSTDcode(),citizenDto.getLandLine());
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}

	}

	
	public void insertDetailsByCvo(CvoDto cvoDto) {
		JdbcTemplate jdbcTemplate = null;
		boolean flag=checkComplaint(cvoDto.getComplaintnumber(),"cvo");
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			if(flag) {
			jdbcTemplate.update(
					"INSERT INTO \"cvo\"(complaintnumber,sourcecomplaint,gistallegations,duedatereport,cvofilenumber,observation,responseofficialconcerned,counterresponse,conclusion,responsibilityofofficials,recommendationaction,systematicimprovement,assurancememo,biodataofficials,officername,officerdesignation,investigationopendate,investigationclosedate,decision,decisionDate,remark,cvcjuri,referfirststage,recommendationactiondate,referfirststagedate,assurancememodate) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
					cvoDto.getComplaintnumber(), cvoDto.getSourceOfComplaint(), cvoDto.getGistOfAllegations(),
					cvoDto.getDueDateReport(), cvoDto.getCvoFileNumber(), cvoDto.getObservation(),
					cvoDto.getResponseOfficialConcerned(), cvoDto.getCounterResponse(), cvoDto.getConclusion(),
					cvoDto.getResponsibilityOfficials(), cvoDto.getRecommendationAction(),
					cvoDto.getSystematicImprovement(), cvoDto.getAssuranceMemo(), cvoDto.getBiodataOfOfficials(),cvoDto.getOfficerName(),cvoDto.getOfficerDesignation(),cvoDto.getInvestigationOpenDate(),cvoDto.getInvestigationCloseDate(),cvoDto.getDecision(),cvoDto.getDecisionDate(),cvoDto.getRemark(),cvoDto.getCvcJuri(),cvoDto.getReferFirstStage(),cvoDto.getRecommendationActionDate(),cvoDto.getReferFirstStageDate(),cvoDto.getAssuranceMemoDate());
			}
			else
			{
				jdbcTemplate.update(
						"UPDATE cvo set sourcecomplaint=?,gistallegations=?,duedatereport=?,cvofilenumber=?,observation=?,responseofficialconcerned=?,counterresponse=?,conclusion=?,responsibilityofofficials=?,recommendationaction=?,systematicimprovement=?,assurancememo=?,biodataofficials=?,officername=?,officerdesignation=?,investigationopendate=?,investigationclosedate=?,decision=?,decisionDate=?,remark=?,cvcjuri=?,referfirststage=?,recommendationactiondate=?,referfirststagedate=?,assurancememodate=? where complaintnumber=? ",
						cvoDto.getSourceOfComplaint(), cvoDto.getGistOfAllegations(),
						cvoDto.getDueDateReport(), cvoDto.getCvoFileNumber(), cvoDto.getObservation(),
						cvoDto.getResponseOfficialConcerned(), cvoDto.getCounterResponse(), cvoDto.getConclusion(),
						cvoDto.getResponsibilityOfficials(), cvoDto.getRecommendationAction(),
						cvoDto.getSystematicImprovement(), cvoDto.getAssuranceMemo(), cvoDto.getBiodataOfOfficials(),cvoDto.getOfficerName(),cvoDto.getOfficerDesignation(),cvoDto.getInvestigationOpenDate(),cvoDto.getInvestigationCloseDate(),cvoDto.getDecision(),cvoDto.getDecisionDate(),cvoDto.getRemark(),cvoDto.getCvcJuri(),cvoDto.getReferFirstStage(),cvoDto.getRecommendationActionDate(),cvoDto.getReferFirstStageDate(),cvoDto.getAssuranceMemoDate(),cvoDto.getComplaintnumber());
			}
		} finally {
			
			MyUtill.connClose(jdbcTemplate);
		}
		
	}

	
	
	public void insertVijClearanceOfficerDetail(VigClearanceDto vigClearanceDto, String fileno, String loginId, String uDesiganation) {
		JdbcTemplate jdbcTemplate = null;
		
		try{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		
		String[] date12 = vigClearanceDto.getFinalDecisionDate().split(",");
		String[] date13 = vigClearanceDto.getDateOfBirth().split(",");
		String[] date14 = vigClearanceDto.getDateOfRetirement().split(",");
		
		/*Date[] date12;
		Date[] date13;
		Date[] date14;*/
		
		/*if(vigClearanceDto.getFinalDecisionDate().equals("")){
	    	 date12 = null;
	    }else{
	    	date12 = format.parse(vigClearanceDto.getFinalDecisionDate().split(","));
	    }
		
		 if(vigClearanceDto.getDateOfBirth().equals("")){
	    	 date13 = null;
	    }else{
	    	date13 = format.parse(vigClearanceDto.getDateOfBirth().split(","));
	    }
		
		 
	    if(vigClearanceDto.getDateOfRetirement().equals("")){
	    	 date14 = null;
	    }else{
	    	date14 = format.parse(vigClearanceDto.getDateOfRetirement().split(","));
	    }*/
	    
	   
		

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			
			String[] offcrName = vigClearanceDto.getNameOfOfficer().split(",");
			String[] service = vigClearanceDto.getService().split(",");
			String[] batch = vigClearanceDto.getBatch().split(",");
			String[] cardr = vigClearanceDto.getCadre().split(",");
			String[] empCode = vigClearanceDto.getEmpCode().split(",");
			String[] fnlDesc = vigClearanceDto.getFinalDecisionDd().split(",");	
			
			
			
			int count = offcrName.length;
			
			if(count>0)
			{
				for(int i=0; i<count; i++)
				{
					jdbcTemplate.update(
						"INSERT INTO \"vijclearanceofficerdetail\"(fileno,nameofofficer,service,batch,cadre,empcode,finaldecisiondd,finaldecisiondate,dateofbirth,dateofretirement) VALUES(?,?,?,?,?,?,?,?,?,?)",
						vigClearanceDto.getFileNo(), offcrName[i],service[i],batch[i],cardr[i],empCode[i],fnlDesc[i],format.parse(date12[i]),format.parse(date13[i]),format.parse(date14[i]));
				}
			}
			
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}
		
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}
		
	}
	
	
	
	
	public void insertClearance(VigClearanceDto vigClearanceDto, File file, String loginId, String roll,HttpServletRequest request) {
			JdbcTemplate jdbcTemplate = null;
			String filepath="";
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			//Date date = format.parse(vigClearanceDto.getDepartRefDate1());
			Date date1;
			Date date6 ;
			Date date7 ;
			Date date8 ;
			Date date9 ;
			Date date10 ;
			Date date11;
			Date date13;
			Date date12;
			Date date14;
			Date date15;
			Date date16;
			Date date17;
			
			
			
			if (vigClearanceDto.getDepartRefRecvDate().equals("")) {
				date1 = null;
			}else{
				date1 =  format.parse(vigClearanceDto.getDepartRefRecvDate());
			}
			
			if (vigClearanceDto.getLetterToCBIDate().equals("")) {
				date6 = null;
			}else{
				date6 = format.parse(vigClearanceDto.getLetterToCBIDate());
			}
			
			if (vigClearanceDto.getLetterToSectionDate().equals("")) {
				date7 = null;
			}else{
				date7 = format.parse(vigClearanceDto.getLetterToSectionDate());
			}
			
			if (vigClearanceDto.getFeedbackReceivedFromCBIDate().equals("")) {
				date8 = null;
			}else{
				date8 = format.parse(vigClearanceDto.getFeedbackReceivedFromCBIDate());
			}
			
			if (vigClearanceDto.getFeedbackReceivedFromOrganization().equals("")) {
				date9 = null;
			}else{
				date9 = format.parse(vigClearanceDto.getFeedbackReceivedFromOrganization());
			}
			if (vigClearanceDto.getDepartRefDate1().equals("")) {
				date10 = null;
			}else{
				date10  = format.parse(vigClearanceDto.getDepartRefDate1());
			}
			if (vigClearanceDto.getFileSubmittedByDHDate().equals("")) {
				date11 = null;
			}else{
				date11  = format.parse(vigClearanceDto.getFileSubmittedByDHDate());
			}
		    if(vigClearanceDto.getFinalDecisionDate().equals("")){
		    	 date12 = null;
		    }else{
		    	date12 = format.parse(vigClearanceDto.getFinalDecisionDate());
		    }
			
		    if(vigClearanceDto.getDateOfRetirement().equals("")){
		    	 date14 = null;
		    }else{
		    	date14 = format.parse(vigClearanceDto.getDateOfRetirement());
		    }
		    
		    if(vigClearanceDto.getDateOfBirth().equals("")){
		    	 date13 = null;
		    }else{
		    	date13 = format.parse(vigClearanceDto.getDateOfBirth());
		    }
		    if(vigClearanceDto.getDateOnFile().equals("")){
		    	date15 = null;
		    }else{
		    	date15 = format.parse(vigClearanceDto.getDateOnFile());
		    }
		    if(vigClearanceDto.getLetterIssueDate().equals("")){
		    	date16 = null;
		    }else{
		    	date16 = format.parse(vigClearanceDto.getLetterIssueDate());
		    }
		    if(vigClearanceDto.getReturnToDepart().equals("")){
		    	date17 = null;
		    }else{
		    	date17 = format.parse(vigClearanceDto.getReturnToDepart());
		    }
			
		    
		    
		    
			
			if(file!=null){
				filepath=RandomUnqieId.filePath(file.getAbsolutePath(), "clearance-documents");
			}
			jdbcTemplate = MyUtill.conn(dataSource);
			
			jdbcTemplate.update(
					"INSERT INTO \"vijclearancedetail\"(fileno,clearancetype,nameofdepart,departrefno,departrefdate1,departrefrecvdate,subject,country,city,numberofofficer,lettertocbidate,lettertosectiondate,lettertoconcerned,"
					+ "completeprofile,returntodepart,feedbackreceivedfromcbidate,feedbackreceivedfromsection,feedbackreceivedfromorganization,dateOnfile,filesubmittedbydhdate,letterissuedate,uploadscandocument) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
					vigClearanceDto.getFileNo(),vigClearanceDto.getClearanceType(),vigClearanceDto.getNameOfDepart(),vigClearanceDto.getDepartRefNo(),date10,date1,
					vigClearanceDto.getSubject(),vigClearanceDto.getCountry(),vigClearanceDto.getCity(),vigClearanceDto.getNumberOfOfficer(),
					date6,date7,
					vigClearanceDto.getLetterToConcerned(),vigClearanceDto.getCompleteProfile(),date17,date8,vigClearanceDto.getFeedbackReceivedFromSection(),
					date9,date15,date11,date16,filepath);
			
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}
		
	}

	
	public void insertFiledDetails(DairyDetailsDto dairyDetailsDto, Integer complaintnumber, String loginId) {
		
		JdbcTemplate jdbcTemplate = null;
		
		
		
		String sqlNone = "UPDATE complain SET dairystatus = ?,complaindate = ?,sendername = ?,"
				+ " address = ?,address2 = ?,state = ?,city = ?,"
				+ "pinno = ?,email = ?,mobileno = ?,complaintagainstname = ?,"
				+ "designation = ?,organization = ?,section = ?,whetherfasttrack = ?,"
						+ "boname = ?,"
				+ "complainttype = ?,actiontaken = ?,bodecision = ?,gistallegation = ?,recipientname = ? , organisationcode = ?"
				+ "where complaintnumber = ?";
		
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			if(dairyDetailsDto.getBoDecision()!=null){
				
			} 
			else if (dairyDetailsDto.getBoDecision()==null) {
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sqlNone);
				preparedStatement.setString(1, loginId);
				preparedStatement.setDate(2,  java.sql.Date.valueOf(dairyDetailsDto.getComplainDate()) );
				preparedStatement.setString(3, dairyDetailsDto.getSenderName());
				preparedStatement.setString(4, dairyDetailsDto.getAddress());
				preparedStatement.setString(5, dairyDetailsDto.getAddress2());
				preparedStatement.setString(6, dairyDetailsDto.getState());
				preparedStatement.setString(7, dairyDetailsDto.getCity());
				preparedStatement.setInt(8, dairyDetailsDto.getPinno());
				preparedStatement.setString(9, dairyDetailsDto.getEmail());
				preparedStatement.setString(10, dairyDetailsDto.getMobileNo());
				preparedStatement.setString(11, dairyDetailsDto.getComplaintAgainstName());
				preparedStatement.setString(12, dairyDetailsDto.getDesignation());
				preparedStatement.setString(13, dairyDetailsDto.getOrganization());
				preparedStatement.setString(14, dairyDetailsDto.getSection());
				preparedStatement.setString(15, dairyDetailsDto.getWhetherFastTrack());
				preparedStatement.setString(16, dairyDetailsDto.getBoName());
				preparedStatement.setString(17, dairyDetailsDto.getComplaintType());
				preparedStatement.setString(18, dairyDetailsDto.getActionTaken());
				preparedStatement.setString(19, dairyDetailsDto.getBoDecision());
				preparedStatement.setString(20, dairyDetailsDto.getGistOfAllegation());
				preparedStatement.setString(21, loginId);
				preparedStatement.setString(22, dairyDetailsDto.getOrganisationCode());
				preparedStatement.setInt(23, complaintnumber);
				preparedStatement.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			/**
			 * Close the preparedStatement
			 */
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			/**
			 * Close the connection
			 */
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			MyUtill.connClose(jdbcTemplate);
		}
	}

	public void insertCvoReport(String loginId, CvoMonthyReportDto cvoMonthyReportDto, File file, UserLoginAuthenticationDto userLoginAuthenticationDto) {
		
		JdbcTemplate jdbcTemplate = null;
		String filepath=""; 
		
		if(file!=null){
			filepath=RandomUnqieId.filePath(file.getAbsolutePath(), "cvo-report");
		}
		
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			jdbcTemplate.update(
					"INSERT INTO \"cvomonthlyreport\"(month,year,cvoid,organisationcode,organisation,branchofficer,branchofficercode,reportsubmitdate,cvoname,uploadedfile) VALUES(?,?,?,?,?,?,?,?,?,?)",
					cvoMonthyReportDto.getMonth(),cvoMonthyReportDto.getYear(),loginId,userLoginAuthenticationDto.getCvoCode(),userLoginAuthenticationDto.getOrg(),cvoMonthyReportDto.getBranchOfficer(),
					cvoMonthyReportDto.getBranchOfficerCode(),new Date(),userLoginAuthenticationDto.getUsername(),filepath);
			
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}

	}

	
public boolean checkComplaint(String complaint,String tableName) 
{
	JdbcTemplate jdbcTemplate = null;
	Connection conn = null;
	PreparedStatement preparedStatement = null;
	ResultSet rs=null;
	boolean flag=false;
	
	String sql = "select count(*)as count from "+tableName+" where complaintnumber = ?";
	try {
		jdbcTemplate = MyUtill.conn(dataSource);
		conn = jdbcTemplate.getDataSource().getConnection();
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, complaint);
		rs=preparedStatement.executeQuery();
		
		while(rs.next())
		{
			int cnt = rs.getInt("count");
			boolean countFlag=(cnt > 0);
			if(countFlag)
			{
				flag=false;
				return flag;
			}
			else
			{
				flag=true;
				return flag;
			}
		}
		flag=true;
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		/**
		 * Close the preparedStatement
		 */
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/**
		 * Close the connection
		 */
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		MyUtill.connClose(jdbcTemplate);
		}
	
	return flag;

}


}
