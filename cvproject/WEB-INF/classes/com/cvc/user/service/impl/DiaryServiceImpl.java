package com.cvc.user.service.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.cvc.dto.CitizenDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.UserDto;
import com.cvc.user.daoImpl.CommonDaoImpl;
import com.cvc.user.service.DiaryServiceI;
import com.cvc.util.MyUtill;
import com.google.common.collect.Lists;

@Service
public class DiaryServiceImpl implements DiaryServiceI{

	@Autowired
	CommonDaoImpl commonDaoImpl;
	
	@Autowired
	DataSource dataSource;
	
	
	public void insertUserDetails(UserDto dairyDto) throws ParseException {
		commonDaoImpl.insertUser(dairyDto);
	}
	
	
	public void addDairyDetails(DairyDetailsDto dairyDetailsDto, File file, String loginId, String roll, HttpServletRequest request) throws ParseException {
		commonDaoImpl.insertDairyDetails(dairyDetailsDto,file,loginId,roll,request);
	}

	
	public List<DairyDetailsDto> getDairy(HttpServletRequest request){
	String sql = "SELECT DISTINCT * FROM complain WHERE dairyid = ?";
	String dairyId = (String)request.getSession().getAttribute("dairyid");
	JdbcTemplate jdbcTemplate=null;
	Connection conn = null;
	   PreparedStatement preparedStatement = null;
		ResultSet rs = null;
	List<DairyDetailsDto>listofDairyDetailsDto=Lists.newArrayList();
	try {
		jdbcTemplate = MyUtill.conn(dataSource);
		conn = jdbcTemplate.getDataSource().getConnection();
		 preparedStatement=conn.prepareStatement(sql);
		preparedStatement.setString(1, dairyId);
		
		 rs = preparedStatement.executeQuery();
		while (rs.next()) {
			DairyDetailsDto dairyDetailsDto=new DairyDetailsDto();	
			dairyDetailsDto.setComplaintNumber(rs.getInt("complaintnumber"));
			dairyDetailsDto.setComplainDate(rs.getString("complaindate"));
			dairyDetailsDto.setComplaintSentType(rs.getString("complaintsentfrom"));
			dairyDetailsDto.setSenderName(rs.getString("sendername"));
			dairyDetailsDto.setAddress(rs.getString("address"));
			dairyDetailsDto.setAddress2(rs.getString("address2"));
			dairyDetailsDto.setCity(rs.getString("city"));
			dairyDetailsDto.setState(rs.getString("state"));
			dairyDetailsDto.setPinno(rs.getInt("pinno"));
			dairyDetailsDto.setEmail(rs.getString("email"));
			dairyDetailsDto.setMobileNo(rs.getString("mobileno"));
			dairyDetailsDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
			dairyDetailsDto.setDesignation(rs.getString("designation"));
			dairyDetailsDto.setOrganization(rs.getString("organization"));
			dairyDetailsDto.setSection(rs.getString("section"));
			dairyDetailsDto.setWhetherFastTrack(rs.getString("whetherfasttrack"));
			dairyDetailsDto.setComplaintType(rs.getString("complainttype"));
			dairyDetailsDto.setActionTaken(rs.getString("actiontaken"));
			dairyDetailsDto.setDetailsAlligations(rs.getString("detailofallegation"));
			
		
			if(rs.getString("uploadscandocument").isEmpty()){
				dairyDetailsDto.setFileName("No File Choosen");
				
			}
			else{
				dairyDetailsDto.setFileId(rs.getString("uploadscandocument"));
				dairyDetailsDto.setFileName(rs.getString("uploadscandocument").substring(28));
			}
			listofDairyDetailsDto.add(dairyDetailsDto);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		/**
		 * Close the resultSet
		 */
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
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

	return listofDairyDetailsDto;
	} 	

	
	
	public void addMoreOrganization(DairyDetailsDto dairyDetailsDto, String complainNumber) {
		commonDaoImpl.insertMoreOrganization(dairyDetailsDto,complainNumber);
	}


	
	public void updateCNumber(String complainNumber,HttpServletRequest request) {
		commonDaoImpl.insertCNumber(complainNumber,request);
	}

	public void insertCitizenDetails(CitizenDto citizenDto) {
		commonDaoImpl.insertCitizen(citizenDto);
	}


	}
