package com.cvc.user.service.impl;

import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;
import com.cvc.dto.AllegationDto;

import com.cvc.dto.CVCAdviceDto;
import com.cvc.dto.CitizenDto;
import com.cvc.dto.ComplainDto;

import com.cvc.dto.CvoDto;
import com.cvc.dto.PincodeDto;

import com.cvc.dto.DairyDetailsDto;

import com.cvc.dto.Email;
import com.cvc.dto.EmailSmsUserDto;
import com.cvc.dto.ForwardDto;
import com.cvc.dto.IpCaptureDto;
import com.cvc.dto.NotingDto;
import com.cvc.dto.OfficerDto;
import com.cvc.dto.OrganisationDto;
import com.cvc.dto.ResetPasswordDto;

import com.cvc.dto.UserDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.dto.VigClearanceDto;
import com.cvc.user.controller.DiaryController;
import com.cvc.user.controller.EmailSMSController;
import com.cvc.user.daoImpl.CommonDaoImpl;
import com.cvc.user.service.CommonServiceI;
import com.cvc.util.MyUtill;
import com.google.common.collect.Lists;

import scala.math.BigInt;

@Service
public class CommonServiceImpl implements CommonServiceI {

	@Autowired
	CommonDaoImpl commonDaoImpl;
	
	@Autowired
	DealingHandServiceImpl dealingHandServiceImpl;

	@Autowired
	DataSource dataSource;

	public List<OrganisationDto> getCitizenOrganisation() {
		JdbcTemplate jdbcTemplate = null;
		String sql = "select * from sectiondetail where status=TRUE order by organisationname1";
		
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			List<OrganisationDto> organisationDto = jdbcTemplate.query(sql, new RowMapper<OrganisationDto>() {

				public OrganisationDto mapRow(ResultSet rs, int rowNum) throws SQLException {
					OrganisationDto organisationDto = new OrganisationDto();
					organisationDto.setOrganisationCode(rs.getString("orgcod"));
					organisationDto.setOrganisationName(rs.getString("organisationname1"));
					return organisationDto;
				}
			});
			return organisationDto;
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}
	}
	
	public List<OrganisationDto> getAllOrganisation() {
		JdbcTemplate jdbcTemplate = null;
		String sql = "select * from sectiondetail where status=TRUE order by organisationname1";
		
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			List<OrganisationDto> organisationDto = jdbcTemplate.query(sql, new RowMapper<OrganisationDto>() {

				public OrganisationDto mapRow(ResultSet rs, int rowNum) throws SQLException {
					OrganisationDto organisationDto = new OrganisationDto();
					organisationDto.setOrganisationCode(rs.getString("orgcod"));
					organisationDto.setOrganisationName(rs.getString("organisationname1"));
					return organisationDto;
				}
			});
			return organisationDto;
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}
	}
	
	
	
	public List<PincodeDto> getcitybyState(String stateselected)
	{
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "select distinct(districtname) from pincode where statename=? order by districtname";
		List<PincodeDto> cityDto = new ArrayList();	
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, stateselected);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				PincodeDto pindto = new PincodeDto();
				
				//pindto.setStatename(rs.getString("statename"));
				pindto.setDistrictname(rs.getString("districtname"));
				
				cityDto.add(pindto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		cityDto.size();
		return cityDto;
	}

		
	
	
		
	public List<PincodeDto> getpinbyCity(String stateselected)
	{
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "select distinct(pincode) from pincode where districtname=? order by pincode ";
		List<PincodeDto> cityDto = new ArrayList();	
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, stateselected);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				PincodeDto pindto = new PincodeDto();
				
				//pindto.setStatename(rs.getString("statename"));
				pindto.setPincode(rs.getString("pincode"));
				
				cityDto.add(pindto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		cityDto.size();
		return cityDto;
	}

	public List<PincodeDto>  getPincodeData() {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		/*String sql = "select distinct(pincode),statename,districtname from pincode";*/
		String sql = "select distinct(statename) from pincode order by statename" ;
		List<PincodeDto> allStates = new ArrayList();	
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
			PincodeDto pincodeData=new PincodeDto();
			pincodeData.setStatename(rs.getString("statename"));
		/*	pincodeData.setDistrictname(rs.getString("districtname"));
			pincodeData.setPincode(rs.getString("pincode"));*/
			allStates.add(pincodeData);
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return allStates;
	}


	
	public List<AllegationDto> findAllAllegation() {
		JdbcTemplate jdbcTemplate = null;
		String sql = "SELECT allegationid,allegation FROM allegation";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			List<AllegationDto> allegationDto = jdbcTemplate.query(sql, new RowMapper<AllegationDto>() {

				
				public AllegationDto mapRow(ResultSet rs, int rowNum) throws SQLException {
					AllegationDto allegationDto = new AllegationDto();
					allegationDto.setAllegationId(rs.getInt("allegationid"));
					allegationDto.setAllegation(rs.getString("allegation"));
					return allegationDto;
				}
			});
			return allegationDto;
		} finally {
			MyUtill.connClose(jdbcTemplate);
		}
	}

	
	public List<ComplainDto> findAllDiaryForBo(String uSection, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,status,boirfinaldec,important FROM complain WHERE   dairystatus= ? and complainstatus = ?    ORDER BY complaindate desc";
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setInt(2, 0);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				//complainDto.setRollType(rs.getString("rolltype"));
				complainDto.setStatus(rs.getInt("status"));
				
				if(rs.getString("rolltype").matches("Complaint Cell") || rs.getString("rolltype").matches("Diary")) 
				{
					complainDto.setRollType("Complaint Cell");
				}
				else if(rs.getString("rolltype").matches("CITIZEN"))
				{
					complainDto.setRollType("Online");
				}
				else if(rs.getString("rolltype").matches("HelpLine"))
				{
					complainDto.setRollType("Tollfree");
				}
				else
				{
					complainDto.setRollType("Unknown Source");
				}
				
				
				if ( rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").equalsIgnoreCase("") || rs.getString("boirfinaldec").length()==4 ||rs.getString("boirfinaldec").equalsIgnoreCase("null")) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				complainDto.setImportant(rs.getBoolean("important"));
				listOfComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listOfComplainDto;
	}


	
	public List<OfficerDto> findAllOfficer(String loginId, String uSection) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql;
		List<OfficerDto> listOfOfficerDto = Lists.newArrayList();
		if (uSection.contains("Cordn") && uSection != "") {
			sql = "SELECT * FROM registration where userid != ? and ( logintype != ? and logintype != ? )  and ( loginroll LIKE ? ) and status=true order by userid";
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, loginId);
				preparedStatement.setString(2, "ROLE_Diary");
				preparedStatement.setString(3, "ROLE_CVO");
				preparedStatement.setString(4, uSection);
				
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					OfficerDto officerDto = new OfficerDto();
					officerDto.setOfficerCode(rs.getString("usercode"));
					officerDto.setOfficerDesiganation(rs.getString("desiganation"));
					officerDto.setOfficerName(rs.getString("userid"));
					officerDto.setLoginType(rs.getString("logintype"));
					listOfOfficerDto.add(officerDto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
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
		} else if (uSection.contains("/") && uSection != "") {
			sql = "SELECT * FROM registration where userid != ? and ( logintype != ? and logintype != ? )  and ( loginroll LIKE ? or loginroll LIKE ? ) and loginroll not like 'Cordn%' and userid != ? and status=true";
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, loginId);
				preparedStatement.setString(2, "ROLE_Diary");
				preparedStatement.setString(3, "ROLE_CVO");
				preparedStatement.setString(4, "%" + uSection.split("/")[0] + "%");
				preparedStatement.setString(5, "%" + uSection.split("/")[1] + "%");
				preparedStatement.setString(6, loginId);
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					OfficerDto officerDto = new OfficerDto();
					officerDto.setOfficerCode(rs.getString("usercode"));
					officerDto.setOfficerDesiganation(rs.getString("desiganation"));
					officerDto.setOfficerName(rs.getString("userid"));
					officerDto.setLoginType(rs.getString("logintype"));
					listOfOfficerDto.add(officerDto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
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
		} else if (uSection != "") {
			sql = "SELECT usercode,userid,logintype,desiganation FROM registration where userid != ? and ( logintype != ? and logintype != ?) and loginroll LIKE ? and loginroll not like 'Cordn%' and status=true";
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, loginId);
				preparedStatement.setString(2, "ROLE_Diary");
				preparedStatement.setString(3, "ROLE_CVO");
				preparedStatement.setString(4, "%" + uSection + "%");
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					OfficerDto officerDto = new OfficerDto();
					officerDto.setOfficerCode(rs.getString("usercode"));
					officerDto.setOfficerDesiganation(rs.getString("desiganation"));
					officerDto.setOfficerName(rs.getString("userid"));
					officerDto.setLoginType(rs.getString("logintype"));
					listOfOfficerDto.add(officerDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
		} else {
			sql = " SELECT usercode FROM registration where userid != ? and logintype != ? and status=true ";
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, loginId);
				preparedStatement.setString(2, "ROLE_Diary");
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					OfficerDto officerDto = new OfficerDto();
					officerDto.setOfficerCode(rs.getString("usercode"));
					officerDto.setOfficerDesiganation(rs.getString("desiganation"));
					officerDto.setOfficerName(rs.getString("userid"));
					officerDto.setLoginType(rs.getString("logintype"));
					listOfOfficerDto.add(officerDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
		}

		return listOfOfficerDto;
	}

	
	public void addNoting(NotingDto notingDto, Integer complaintNumber, String loginId,String name, String uDesiganation,IpCaptureDto ipCaptureDto) {
		commonDaoImpl.insertNotingDetails(notingDto, complaintNumber, loginId,name, uDesiganation,ipCaptureDto);
	}
	
	
	public void addVijClearanceOfficerDetail(VigClearanceDto vigClearanceDto, String fileno, String loginId, String uDesiganation) {
		commonDaoImpl.insertVijClearanceOfficerDetail(vigClearanceDto, fileno, loginId, uDesiganation);
	}
	

	
	public List<NotingDto> findAllNoting(Integer complaintnumber) {
		JdbcTemplate jdbcTemplate = null;
		String sql = "SELECT notername,name,noting.desiganation,notingmessage1,notingmessage2,notingmessage3,notingdate FROM noting where complaintnumber=?  ORDER BY notingdate DESC";
		
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<NotingDto> listOfNotingDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complaintnumber);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				NotingDto notingDto = new NotingDto();
				notingDto.setNoterName(rs.getString("notername"));
				notingDto.setName(rs.getString("name"));
				notingDto.setDesiganation(rs.getString("desiganation"));
				notingDto.setNotingMessage1(rs.getString("notingmessage1"));
				notingDto.setNotingMessage2(rs.getString("notingmessage2"));
				notingDto.setNotingMessage3(rs.getString("notingmessage3"));
				notingDto.setNotingdate(rs.getString("notingdate"));
				listOfNotingDto.add(notingDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return listOfNotingDto;
	}

	
	public List<NotingDto> findAllCPANoting(String complaintnumber) {
		JdbcTemplate jdbcTemplate = null;
		String sql = "SELECT notername,desiganation,notingmessage1,notingmessage2,notingmessage3,notingdate FROM cpa_noting  WHERE complaint=? ORDER BY notingdate DESC";
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<NotingDto> listOfNotingDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, complaintnumber.toString());
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				NotingDto notingDto = new NotingDto();
				notingDto.setNoterName(rs.getString("notername"));
				notingDto.setDesiganation(rs.getString("desiganation"));
				notingDto.setNotingMessage1(rs.getString("notingmessage1"));
				notingDto.setNotingMessage2(rs.getString("notingmessage2"));
				notingDto.setNotingMessage3(rs.getString("notingmessage3"));
				notingDto.setNotingdate(rs.getString("notingdate"));
				listOfNotingDto.add(notingDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return listOfNotingDto;
	}

	
	
	public void addForwardDetails(Integer complaintnumber, String loginId, NotingDto notingDto,
			DairyDetailsDto dairyDetailsDto,IpCaptureDto ipCaptureDto) {
		commonDaoImpl.insertForwardDetails(complaintnumber, loginId, notingDto, dairyDetailsDto,ipCaptureDto);
	}

	
	public List<DairyDetailsDto> viewComplain(Integer complaintnumber ) {
		String sql = "select * from complain left join citizenregistration on complain.dairyid like CONCAT(citizenregistration.citizenid,'/%') where complain.complaintnumber=?";
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<DairyDetailsDto> liDairyDetailsDtos = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complaintnumber);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				DairyDetailsDto dairyDetailsDto = new DairyDetailsDto();
				dairyDetailsDto.setComplaint(rs.getString("complaint"));
				dairyDetailsDto.setComplainDate(rs.getString("complaindate"));
				
				if(rs.getString("rolltype").contentEquals("CITIZEN") ) 
				{
					dairyDetailsDto.setSenderName(rs.getString("name"));
				}
				else
				{
					dairyDetailsDto.setSenderName(rs.getString("sendername"));
				}
				
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
				dairyDetailsDto.setOrganisationCode(rs.getString("organisationcode"));
				dairyDetailsDto.setSection(rs.getString("section"));
				dairyDetailsDto.setBoFiledAckDate(rs.getString("boirackdate"));
				
				
				
				
				
				if(rs.getDate("bodecisiondate")!=null)
				{
					dairyDetailsDto.setBoDecisionDate(rs.getDate("bodecisiondate").toString());
				}
					
				if(rs.getDate("bofinaldecdate")!=null){
				dairyDetailsDto.setBoirfinaldecdate(rs.getDate("bofinaldecdate").toString());
				}
				dairyDetailsDto.setDairyStatus(rs.getString("dairystatus"));
				dairyDetailsDto.setWhetherFastTrack(rs.getString("whetherfasttrack"));
				dairyDetailsDto.setComplaintType(rs.getString("complainttype"));
				dairyDetailsDto.setActionTaken(rs.getString("actiontaken"));
				dairyDetailsDto.setFileName(rs.getString("uploadscandocument"));
				dairyDetailsDto.setBoDecision(rs.getString("bodecision"));
				/*if(rs.getString("bodecision")==null) 
				{
					dairyDetailsDto.setBoDecision("");
					dairyDetailsDto.setBoDecisionnew("");
				}else
				{
					dairyDetailsDto.setBoDecision(rs.getString("bodecision"));	
					dairyDetailsDto.setBoDecisionnew(rs.getString("bodecision"));
				}*/
				
				dairyDetailsDto.setConfirmCVO(rs.getString("confirmcvo"));
				if(rs.getDate("boircondate")!=null){
					dairyDetailsDto.setBoircondate(rs.getDate("boircondate").toString());
					}
				dairyDetailsDto.setDetailsAlligations(rs.getString("detailofallegation"));
				liDairyDetailsDtos.add(dairyDetailsDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return liDairyDetailsDtos;
	}

	
	public List<ComplainDto> findAllPendingDairy(String loginId, Collection<String> uRoleTpye) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql;
		if (uRoleTpye.contains("ROLE_CVO")) {
			sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,complainstatus FROM complain WHERE   closedby= ? and  complainstatus = ?     ORDER BY complaintnumber DESC";
		} else {
			sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,complainstatus,boirfinaldec FROM complain WHERE   closedby= ? and  complainstatus = ?    ORDER BY complaintnumber DESC";
		}
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setInt(2, 1);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setDecision(rs.getString("boirfinaldec"));
				if (rs.getInt("complainstatus") == 1) {
					complainDto.setComplaintStatus("Closed");
				}

				listOfComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listOfComplainDto;
	}

	
	public List<DairyDetailsDto> viewFiledComplain(Integer complaintnumber) {
		String sql = "SELECT DISTINCT * FROM complain WHERE complaintnumber = ?";
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<DairyDetailsDto> liDairyDetailsDtos = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complaintnumber);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				DairyDetailsDto dairyDetailsDto = new DairyDetailsDto();
				dairyDetailsDto.setComplaint(rs.getString("complaint"));
				dairyDetailsDto.setComplainDate(rs.getString("complaindate"));
				if(rs.getString("rolltype").contentEquals("CITIZEN") ) 
				{
					dairyDetailsDto.setSenderName(rs.getString("name"));
				}
				else
				{
					dairyDetailsDto.setSenderName(rs.getString("sendername"));
				}
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
				;
				dairyDetailsDto.setWhetherFastTrack(rs.getString("whetherfasttrack"));
				dairyDetailsDto.setComplaintType(rs.getString("complainttype"));
				dairyDetailsDto.setActionTaken(rs.getString("actiontaken"));
				dairyDetailsDto.setFileName(rs.getString("uploadscandocument"));
				dairyDetailsDto.setComplaint(rs.getString("complaint"));
				liDairyDetailsDtos.add(dairyDetailsDto);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return liDairyDetailsDtos;
	}

	
	public List<ComplainDto> findAllDiarySo(String uSection, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,status,boirfinaldec,important FROM complain WHERE   dairystatus= ? and complainstatus = ?  ORDER BY complaindate desc";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setInt(2, 0);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				//complainDto.setRollType(rs.getString("rolltype"));
				complainDto.setStatus(rs.getInt("status"));
				
				if(rs.getString("rolltype").matches("Complaint Cell") || rs.getString("rolltype").matches("Diary")) 
				{
					complainDto.setRollType("Complaint Cell");
				}
				else if(rs.getString("rolltype").matches("CITIZEN"))
				{
					complainDto.setRollType("Online");
				}
				else if(rs.getString("rolltype").matches("HelpLine"))
				{
					complainDto.setRollType("Tollfree");
				}
				else
				{
					complainDto.setRollType("Unknown Source");
				}
				
				if (rs.getString("boirfinaldec")=="null" || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").equalsIgnoreCase("") || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else  {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				
				complainDto.setImportant(rs.getBoolean("important"));
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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

		return listofComplainDto;
	}

	
	public List<ForwardDto> findAllSentComplain(String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT distinct complaintnumber,compliant,fromuser,touser,forwarddate FROM forward WHERE fromuser= ?  order by forwarddate desc";
		List<ForwardDto> listOfForwardDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ForwardDto forwardDto = new ForwardDto();
				forwardDto.setComplainNo(rs.getInt("complaintnumber"));
				forwardDto.setSentFrom(rs.getString("fromuser"));
				forwardDto.setSentTo(rs.getString("touser"));
				forwardDto.setSentDate(rs.getString("forwarddate"));
				forwardDto.setCompliant(rs.getString("compliant"));
				listOfForwardDto.add(forwardDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listOfForwardDto;
	}

	/*
	 * public void revretSentMail(Integer complaintnumber, String loginId) {
	 * JdbcTemplate jdbcTemplate = null;
	 * 
	 * jdbcTemplate = MyUtill.conn(dataSource); try { jdbcTemplate.update(
	 * "UPDATE complain SET dairystatus = '"+loginId+
	 * "' WHERE complaintnumber = '"+complaintnumber+"'" ); jdbcTemplate.update(
	 * "UPDATE forward SET touser = '"+loginId+
	 * "', lastmovement = 'R' WHERE complaintnumber = '"+complaintnumber+
	 * "' AND lastmovement = 'Y' " ); } finally{
	 * MyUtill.connClose(jdbcTemplate); }
	 * 
	 * }
	 */

	
	public List<CitizenDto> getCitizenDetials(String loginId) {
		String sql = "SELECT DISTINCT * FROM citizenregistration WHERE citizenid = ?";
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<CitizenDto> listofCitizenDtos = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				 CitizenDto citizenDto = new CitizenDto();
	                citizenDto.setAddress1(rs.getString("address1")==null?"":rs.getString("address1"));
	                citizenDto.setAddress2(rs.getString("address2")==null?"":rs.getString("address2"));
	                citizenDto.setAddress3(rs.getString("address3")==null?"":rs.getString("address3"));
	                citizenDto.setCity(rs.getString("city")==null?"":rs.getString("city"));
	                citizenDto.setState(rs.getString("state")==null?"":rs.getString("state"));
	                citizenDto.setPincode(rs.getInt("pincode")==0?Integer.valueOf(0):rs.getInt("pincode"));
	                citizenDto.setCitizenEmail(rs.getString("email")==null?"":rs.getString("email"));
	                citizenDto.setContactNumber(rs.getString("contactnumber")==null?"":rs.getString("contactnumber"));
	                citizenDto.setSecurityQuestion(rs.getString("securityquestion")==null?"":rs.getString("securityquestion"));
	                citizenDto.setSecurityAnswer(rs.getString("securityanswer")==null?"":rs.getString("securityanswer"));
	                listofCitizenDtos.add(citizenDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofCitizenDtos;
	}

	
	public List<ComplainDto> getCitizenComplain(String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		String sql = "SELECT sendername,organization,complaint,complaindate,createddate,section,uploadscandocument,boirfinaldec FROM complain WHERE dairyid like ? ORDER BY complaintnumber DESC";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId+'/'+'%');
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setSection(rs.getString("section"));
				complainDto.setUploadDocument(rs.getString("uploadscandocument"));

				
				if (rs.getString("boirfinaldec")=="null" || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec") == "" || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				}
				else if(rs.getString("boirfinaldec").matches("IR")){
					complainDto.setDecision("Investigating as per the policy of the commission.");
				}
				else if(rs.getString("boirfinaldec").matches("NA")){
					complainDto.setDecision("As the commission has sent your complaint for necessary action, it does not expect any report from the CVO of the organisation concerned. The CVO is expected to scrutinise the complaint within a period of one month of receipt of the complaint from the Commission and decide if any action is required. You may ,therefore, if required, find out the status of your complaint from CVO,"+complainDto.getOrganizationName()+"");
				}
				else if(rs.getString("boirfinaldec").matches("Filed")){
					complainDto.setDecision("Your complaint has been duly examined in the Commision in terms of its Complaint Handling Policy and having regard to the nature of the issue raised therein, the same has been filed.");
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	
	public List<ComplainDto> findComplainByNo(String loginId, Integer complainNo) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		String sql = "SELECT sendername,organization,complaint,complaindate,createddate,section FROM complain WHERE sendername= ?  and complaintnumber = ?";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setInt(2, complainNo);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setSection(rs.getString("section"));
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	
	public List<OfficerDto> findAllBo() {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT name, bofficercode FROM registration WHERE logintype = ? and status=true";
		List<OfficerDto> listOfOfficerDto = Lists.newArrayList();

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "ROLE_BO");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				OfficerDto officerDto = new OfficerDto();
				officerDto.setOfficerName(rs.getString("name"));
				officerDto.setOfficerCode(rs.getString("bofficercode"));
				listOfOfficerDto.add(officerDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listOfOfficerDto;
	}

	
	public List<ComplainDto> findAllDiaryForCvo(String uSection, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,status FROM complain WHERE dairystatus= ? and actiontaken != ? ORDER BY forwarddate";
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setString(2, "Filed");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				//complainDto.setRollType(rs.getString("rolltype"));
				
				if(rs.getString("rolltype").matches("Complaint Cell") || rs.getString("rolltype").matches("Diary")) 
				{
					complainDto.setRollType("Complaint Cell");
				}
				else if(rs.getString("rolltype").matches("CITIZEN"))
				{
					complainDto.setRollType("Online");
				}
				else if(rs.getString("rolltype").matches("HelpLine"))
				{
					complainDto.setRollType("Tollfree");
				}
				else
				{
					complainDto.setRollType("Unknown Source");
				}
				complainDto.setStatus(rs.getInt("status"));
				listOfComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return listOfComplainDto;
	}

	public void addDetailsByCvo(CvoDto cvoDto) {
		commonDaoImpl.insertDetailsByCvo(cvoDto);
	}

	public void addClearance(VigClearanceDto vigClearanceDto, File file, String loginId, String roll,
			HttpServletRequest request) {
		commonDaoImpl.insertClearance(vigClearanceDto, file, loginId, roll, request);

	}

	
	public List<ComplainDto> findDetailsByCno(String loginId, Integer complainNo) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section FROM complain WHERE complaintnumber = ? and dairystatus= ?  ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complainNo);
			preparedStatement.setString(2, loginId);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setSection(rs.getString("section"));
				
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsByCnoForCvo(String loginId, Integer complainNo) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section FROM complain WHERE dairystatus= ?  and complaintnumber = ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setInt(2, complainNo);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setSection(rs.getString("section"));
				
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	
	public List<ComplainDto> findDetailsByCnoForDh(String loginId, Integer complainNo, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
		String sql = "SELECT * FROM complain WHERE complaintnumber = ? and section in ("+sec+")";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complainNo);
			//preparedStatement.setString(2, "%" + uSection + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				

				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setFileNo(rs.getString("filenumber"));
				complainDto.setBoirremidate(rs.getString("boirremidate"));
				complainDto.setBoircondate(rs.getString("boircondate"));
				complainDto.setBoirconrecdate(rs.getString("boirconrecdate"));
				complainDto.setBoirackdate(rs.getString("boirackdate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				
				complainDto.setBofiledackdate(rs.getString("bofiledackdate"));
				complainDto.setBoNaAckDate(rs.getString("boNaAckDate"));
				complainDto.setBoNaOmDate(rs.getString("boNaOmDate"));
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	
	
	public List<ComplainDto> findDetailsByCPACnoForDh(String loginId, String complainNo, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
		String sql = "SELECT sendername,organization,section,complaint,complaintnumber,complaindate,createddate,bodecisiondate,filed FROM cpa_complaint WHERE complaintnumber like ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, complainNo);
		//	preparedStatement.setString(2, "%" + uSection + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setSection(rs.getString("section"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setBoDecisionDate(rs.getString("boDecisionDate"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));

				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				
				if (rs.getString("filed") == "1") {
					complainDto.setFiled("Pending");
				}
				else {
					complainDto.setFiled(rs.getString("Filed"));
				}
				
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}
	
	
	
	
	
	
	
	public List<ComplainDto> findAllPendingDairyforDairy(String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype FROM complain WHERE   actiontaken = ? and dairystatus= ? ORDER BY complaintnumber DESC";
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "Filed");
			preparedStatement.setString(2, loginId);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setRollType(rs.getString("rolltype"));
				
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				
				listOfComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listOfComplainDto;
	}

	public Integer insertNewPassword(ResetPasswordDto resetPasswordDto, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String password = "";
		String passwordOne = "";
		String passwordTwo = "";
		int flag = 0;
		String decrypt = resetPasswordDto.getOldPassword().substring(32);
		String sqlCount = "SELECT * FROM registration WHERE  userid = ? and status=true";
		String sql = "UPDATE registration set password = ?,passwordone = ?,passwordtwo= ? WHERE  userid = ? and status=true";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sqlCount);
			preparedStatement.setString(1, loginId);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				password = rs.getString("password");
				passwordOne = rs.getString("passwordone");
				passwordTwo = rs.getString("passwordtwo");
			}

			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if ((MyUtill.getMd5(password + MyUtill.getMd5(decrypt)) + decrypt).equals(resetPasswordDto.getOldPassword())
					&& !password.equals(resetPasswordDto.getNewPassword())
					&& !passwordOne.equals(resetPasswordDto.getNewPassword())
					&& !passwordTwo.equals(resetPasswordDto.getNewPassword())) {
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, resetPasswordDto.getNewPassword());
				preparedStatement.setString(2, password);
				preparedStatement.setString(3, passwordOne);
				preparedStatement.setString(4, loginId);
				preparedStatement.executeUpdate();
				flag = 1;
			} else {
				flag = 0;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return flag;

	}

	public boolean findUserId(String userId) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "select * from registration where userid = ? and status=true";
		String sql1 = "select * from citizenregistration where citizenid = ?";
		boolean flag = false;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, userId);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				flag = true;
			}

			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (flag == false) {
				preparedStatement = conn.prepareStatement(sql1);
				preparedStatement.setString(1, userId);
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					flag = true;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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

		return flag;
	}

	public List<ComplainDto> findDetailsByCnameForCvo(String loginId, String complainName) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section FROM complain WHERE dairystatus= ?  and sendername like ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setString(2, "%" + complainName + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setSection(rs.getString("section"));
				
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsByCnameForDh(String loginId, String complainName, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "";
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
/*		sec="section in ("+sec+")";
		System.out.println(sec);*/

		sql = "SELECT * FROM complain WHERE UPPER(sendername) like ? and section in ("+sec+")";
		
		/*if (uSection.split("/").length==2) {
			sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(sendername) like ? and  (section like  ? or section like  ? )";
		} else if (uSection.split("/").length==3) 
			{
				sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(sendername) like ? and  (section like  ? or section like  ? or section like ? )";
			}
			else
			{			
				sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(sendername) like ? and section like  ? ";
			}*/

		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainName.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
		/*	if (uSection.split("/").length==2) {
				preparedStatement.setString(2, "%" + uSection.split("/")[0] + "%");
				preparedStatement.setString(3, "%" + uSection.split("/")[1] + "%");
				rs = preparedStatement.executeQuery();
			} else if (uSection.split("/").length==3) 
			{
				preparedStatement.setString(2, "%" + uSection.split("/")[0] + "%");
				preparedStatement.setString(3, "%" + uSection.split("/")[1] + "%");
				preparedStatement.setString(4, "%" + uSection.split("/")[2] + "%");					
				rs = preparedStatement.executeQuery();
			}
			else
			{
				preparedStatement.setString(2, "%" + uSection + "%");
				rs = preparedStatement.executeQuery();
			}*/

			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec") == "" || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsByCname(String loginId, String complainNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object allReadNaForCvo(String orgCode, String loginId, String org) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,bofinaldecdate,cvoview FROM complain WHERE  boirfinaldec = ? and (organisationcode = ? or organization = ?) ORDER BY forwarddate";
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "NA");
			preparedStatement.setString(2, orgCode);
			preparedStatement.setString(3, org);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("bofinaldecdate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setStatus(rs.getInt("cvoview"));
				
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				
				listOfComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return listOfComplainDto;
	}

	
	
	public Object allReadNaForReadComplainCvo(String orgCode, String loginId, String org) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT complain.organization,complain.recipientname,complain.complaintnumber,complain.complaint,complain.complaindate,complain.bofinaldecdate,complain.cvoview,cvo.decision,cvo.decisiondate FROM complain left join cvo on complain.complaint=cvo.complaintnumber  WHERE  complain.boirfinaldec = ? and (complain.organisationcode = ? or complain.organization = ?) and complain.cvoview = ? and cvo.decision is null and cvo.decisiondate is null ORDER BY complain.forwarddate";
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "NA");
			preparedStatement.setString(2, orgCode);
			preparedStatement.setString(3, org);
			preparedStatement.setInt(4, 1);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("bofinaldecdate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setStatus(rs.getInt("cvoview"));
				listOfComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return listOfComplainDto;
	}
	
	
	
	public Object allUnReadNaForUnReadComplainCvo(String orgCode, String loginId, String org) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT complain.organization,complain.recipientname,complain.complaintnumber,complain.complaint,complain.complaindate,complain.bofinaldecdate,complain.cvoview,cvo.decision,cvo.decisiondate FROM complain left join cvo on complain.complaint=cvo.complaintnumber  WHERE  complain.boirfinaldec = ? and (complain.organisationcode = ? or complain.organization = ?) and complain.cvoview = ? and cvo.decision is null and cvo.decisiondate is null ORDER BY complain.forwarddate";
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "NA");
			preparedStatement.setString(2, orgCode);
			preparedStatement.setString(3, org);
			preparedStatement.setInt(4, 0);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("bofinaldecdate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setStatus(rs.getInt("cvoview"));
				listOfComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return listOfComplainDto;
	}
	
	
	
	

	public List<ComplainDto> findDetailsByCnoForDiary(String loginId, Integer complainNo) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM complain WHERE complaintnumber = ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complainNo);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				
				
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				
			
				
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
								
				complainDto.setComplaintStatus(rs.getString("complainstatus"));
				complainDto.setStatus(rs.getInt("status"));
				complainDto.setCvoview(rs.getInt("cvoview"));
				
				
				
				if (rs.getString("bodecisiondate") == null) {
					complainDto.setBoDecisionDate("Pending");
				} else {
					complainDto.setBoDecisionDate(rs.getString("bodecisiondate"));
				}
				if (rs.getString("bodecision") == null) {
					complainDto.setBoDecision("Pending");
				} else {
					complainDto.setBoDecision(rs.getString("bodecision"));
				}
				
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				
				complainDto.setRollType("other");
				
				listofComplainDto.add(complainDto);
				}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;

	}

	public List<ComplainDto> findDetailsByCnameForDiary(String loginId, String complaintName) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM complain WHERE  UPPER(sendername)  like  ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complaintName.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if(rs.getString("dairystatus")==null)
				{
					complainDto.setDairyStatus("Not Present In Database");
				}
				else if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				if(rs.getString("section")==null) 
				{
					complainDto.setSection("Not Present In Database");
				}
				else
				{
					complainDto.setSection(rs.getString("section"));
				}
				
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec") == "" || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<OfficerDto> findDiaryStatus(Integer complaintnumber) {
		String sql = "SELECT * FROM complain WHERE complaintnumber = ?";
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<OfficerDto> listofAckDetails = Lists.newArrayList();
		
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complaintnumber);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OfficerDto officerDto = new OfficerDto();
				if(rs.getString("ackgenby")== null || rs.getString("ackgenby").equals("")){
					officerDto.setDairyStatus(rs.getString("dairystatus"));
				}else{
					officerDto.setDairyStatus(rs.getString("ackgenby"));
				}
				if(rs.getString("bonaackdate")== null || rs.getString("bonaackdate").equals("")){
					officerDto.setNaAckFlag(true);
				}else{
					officerDto.setNaAckFlag(false);
				}
				
				if(rs.getString("bofiledackdate")== null || rs.getString("bofiledackdate").equals("")){
					officerDto.setFiledAckFlag(true);
				}else{
					officerDto.setFiledAckFlag(false);
				}
				if(rs.getString("bonaomdate")== null || rs.getString("bonaomdate").equals("")){
					officerDto.setOmAckFlag(true);
				}else{
					officerDto.setOmAckFlag(false);
				}
				
				listofAckDetails.add(officerDto);
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofAckDetails;
	}

	public void upadteNaAckDate(Integer complaintnumber, String ackGenBy) {
		String sql = "UPDATE complain SET bonaackdate = ?, ackgenby = ?   WHERE complaintnumber = ?";
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
			preparedStatement.setString(2, ackGenBy);
			preparedStatement.setInt(3, complaintnumber);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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

	}

	public List<ComplainDto> findDetailsByCMobnoForDh(String loginId, String complainMobileNo, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE mobileNo like  ?  and section in ("+sec+")";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainMobileNo + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if ( rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsByComplainNumber(String complainNo) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM complain WHERE complaint ilike ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%"+complainNo.toLowerCase()+"%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				
				complainDto.setOrganizationName(rs.getString("confirmcvo"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
				complainDto.setAllegationDeatils((rs.getString("gistallegation")==""||rs.getString("gistallegation")==null)?"":rs.getString("gistallegation"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	// --------------------------------------------

	public List<ComplainDto> findDetailsByCMobnoForDiary(String loginId, String complainMobileNo) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM complain WHERE mobileNo like  ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainMobileNo + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				complainDto.setRollType("other");
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsEmailForDiary(String loginId, String complainEmail) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM complain WHERE UPPER(email) like ?   ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainEmail.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if ( rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;

	}

	public List<ComplainDto> findDetailsEmailForDh(String loginId, String complainEmail, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
		String sql = "SELECT * FROM complain WHERE UPPER(email) like ? and section in ("+sec+")";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainEmail.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if ( rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;

	}

	public List<ComplainDto> findDetailsPincodeForDiary(String loginId, Integer complainPincode) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM complain WHERE pinno  = ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			// preparedStatement.setString(1, "%"+complainPincode+"%");
			preparedStatement.setInt(1, complainPincode);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if ( rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsPincodeForDh(String loginId, Integer complainPincode, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
		String sql = "SELECT * FROM complain WHERE pinno = ?  and section in ("+sec+")";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complainPincode);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if ( rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;

	}

	public List<ComplainDto> findDetailsCagnstnameForDiary(String loginId, String complainAgnname) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM complain WHERE UPPER(complaintAgainstName)  like ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainAgnname.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if ( rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsCagnstnameForDh(String loginId, String complainAgnname, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(complaintAgainstName) like ?  and section in ("+sec+")";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainAgnname.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsCgistodalliForDiary(String loginId, String complainGistofalligation) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM complain WHERE UPPER(gistallegation) like ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			// preparedStatement.setString(1, complainGistofalligation);
			preparedStatement.setString(1, "%" + complainGistofalligation.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsCgistodalliForDh(String loginId, String complainGistofalligation,
			String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
		String sql = "SELECT * FROM complain WHERE UPPER(gistallegation) like ?  and section in ("+sec+")";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainGistofalligation.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;

	}

	public List<ComplainDto> findDetailsDesignationForDiary(String loginId, String complainDesiganation) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		System.out.println("h11");
		String sql = "SELECT * FROM complain WHERE UPPER(designation) like ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainDesiganation.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsDesignationForDh(String loginId, String complainDesiganation, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
		String sql = "SELECT * FROM complain WHERE UPPER(designation) like ? and section in ("+sec+")";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainDesiganation.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;

	}

	public void upadteOmAckDate(Integer complaintnumber, String officerName) {
		// TODO Auto-generated method stub
		
	}

	public List<VigClearanceDto> findDetailsByFileNoForClearance(String fileNo) {
		
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		/*String sql = "SELECT fileno,nameofofficer,service,batch,cadre,empcode,finaldecisiondd,finaldecisiondate,dateofbirth,dateofretirement FROM vijclearancedetail WHERE fileNo = ? ";*/
		/*String sql = "select * from vijclearancedetail hdr full join vijclearanceofficerdetail dtl on hdr.fileno=dtl.file_no where hdr.fileno = ? ";*/
		String sql = "select * from vijclearancedetail  where UPPER(fileNo) like ?  ";
		
		List<VigClearanceDto> listofVigClearanceDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
		//	preparedStatement.setString(1, fileNo);
			preparedStatement.setString(1, "%" + fileNo.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				VigClearanceDto vigClearanceDto = new VigClearanceDto();
				
				vigClearanceDto.setFileNo(rs.getString("fileno"));
				vigClearanceDto.setNameOfDepart(rs.getString("nameofdepart"));
				vigClearanceDto.setDepartRefNo(rs.getString("departRefNo"));
				vigClearanceDto.setCountry(rs.getString("country"));
				vigClearanceDto.setLetterToConcerned(rs.getString("letterToConcerned"));
				vigClearanceDto.setDateOnFile(rs.getString("dateOnFile"));
				listofVigClearanceDto.add(vigClearanceDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofVigClearanceDto;
		
		
	}

	public List<VigClearanceDto> viewClearance(String fileno) {
		
		String sql = "SELECT * FROM vijclearancedetail WHERE fileNo = ?";
		Connection conn = null;
		JdbcTemplate jdbcTemplate=null;
		 PreparedStatement preparedStatement = null;
			ResultSet rs = null;
		List<VigClearanceDto> liVigClearanceDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			 preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, fileno);
			 rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				
				VigClearanceDto vigClearanceDto = new VigClearanceDto();
				vigClearanceDto.setClearanceType(rs.getString("clearanceType"));
				vigClearanceDto.setFileNo(rs.getString("fileno"));
				vigClearanceDto.setNameOfDepart(rs.getString("nameofdepart"));
				vigClearanceDto.setDepartRefNo(rs.getString("departRefNo"));
				vigClearanceDto.setDepartRefDate1(rs.getString("departRefDate1"));
				vigClearanceDto.setDepartRefRecvDate(rs.getString("departRefRecvDate"));
				vigClearanceDto.setSubject(rs.getString("subject"));
				vigClearanceDto.setCountry(rs.getString("country"));
				vigClearanceDto.setNumberOfOfficer(rs.getInt("numberOfOfficer"));
				vigClearanceDto.setLetterToCBIDate(rs.getString("letterToCBIDate"));
				vigClearanceDto.setLetterToSectionDate(rs.getString("letterToSectionDate"));
				vigClearanceDto.setLetterToConcerned(rs.getString("letterToConcerned"));
				vigClearanceDto.setCompleteProfile(rs.getString("completeProfile"));
				vigClearanceDto.setReturnToDepart(rs.getString("returnToDepart"));
				vigClearanceDto.setFeedbackReceivedFromCBIDate(rs.getString("feedbackReceivedFromCBIDate"));
				vigClearanceDto.setFeedbackReceivedFromSection(rs.getString("feedbackReceivedFromSection"));
				vigClearanceDto.setFeedbackReceivedFromOrganization(rs.getString("feedbackReceivedFromOrganization"));
				vigClearanceDto.setFileSubmittedByDHDate(rs.getString("fileSubmittedByDHDate"));
				vigClearanceDto.setDateOnFile(rs.getString("dateOnFile"));
				vigClearanceDto.setLetterIssueDate(rs.getString("letterIssueDate"));
				
				
				if(rs.getString("uploadScanDocument").isEmpty()){
					vigClearanceDto.setFileName("No File Choosen");
				}else{
					vigClearanceDto.setFileId(rs.getString("uploadScanDocument"));
					vigClearanceDto.setFileName(rs.getString("uploadScanDocument").substring(28));
				}
				liVigClearanceDto.add(vigClearanceDto);
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
		return liVigClearanceDto;
	}

	@SuppressWarnings("finally")
	public List<VigClearanceDto> viewClearanceOfficerDetail(String fileNo11) {

		String sql = "SELECT * FROM vijclearanceofficerdetail WHERE fileNo = ?";
		Connection conn = null;
		JdbcTemplate jdbcTemplate=null;
		 PreparedStatement preparedStatement = null;
			ResultSet rs = null;
		List<VigClearanceDto> liVigClearanceDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			 preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, fileNo11);
			 rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				
				VigClearanceDto vigClearanceDto = new VigClearanceDto();
				
				vigClearanceDto.setNameOfOfficer(rs.getString("nameOfOfficer"));
				vigClearanceDto.setService(rs.getString("service"));
				vigClearanceDto.setBatch(rs.getString("batch"));
				vigClearanceDto.setCadre(rs.getString("cadre"));
				vigClearanceDto.setEmpCode(rs.getString("empCode"));
				vigClearanceDto.setFinalDecisionDd(rs.getString("finalDecisionDd"));
				vigClearanceDto.setFinalDecisionDate(rs.getString("finalDecisionDate"));
				vigClearanceDto.setDateOfBirth(rs.getString("dateOfBirth"));
				vigClearanceDto.setDateOfRetirement(rs.getString("dateOfRetirement"));
				
				liVigClearanceDto.add(vigClearanceDto);
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

		return liVigClearanceDto;
	}
}

	public 	List<CitizenDto> getEmailPhone(String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "select email,contactnumber from citizenregistration where citizenid=?";
		List<CitizenDto> citizenDto = new ArrayList();	
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				CitizenDto pindto = new CitizenDto();
				
				//pindto.setStatename(rs.getString("statename"));
				pindto.setCitizenEmail(rs.getString("email"));
				pindto.setContactNumber(rs.getString("contactNumber"));
				
				
				citizenDto.add(pindto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		
		return citizenDto;
	}

	
	public void setEmailPhone(String loginId,String email) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		String sqlemail = "UPDATE citizenregistration  SET email = ? where citizenid=?";
		String sqlphone = "UPDATE citizenregistration  SET contactnumber = ? where citizenid=?";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			if(email.contains("@"))
			{
				preparedStatement = conn.prepareStatement(sqlemail);	
			}
			else
			{
				preparedStatement = conn.prepareStatement(sqlphone);
			}
			
			
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, loginId);
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

	
	public List<ComplainDto> findDetailsOrganizationForDiary(String loginId, String complainOrganization) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		System.out.println("h11");
		String sql = "SELECT * FROM complain WHERE UPPER(organization) like ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainOrganization.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public List<ComplainDto> findDetailsOrganizationForDh(String loginId, String complainOrganization, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sec=null;
		for(int i=0;i<uSection.split("/").length;i++)
		{
			sec="'"+uSection.split("/")[i]+"'"+","+sec;
		}
		System.out.println(sec);
		String sql = "SELECT * FROM complain WHERE UPPER(organization) like ? and section in ("+sec+")";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainOrganization.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				
				listofComplainDto.add(complainDto);
				//System.out.println(listofComplainDto.size());
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;

	}

	public List<OfficerDto> findAllOfficerForAdmin(String complaint) {
	
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = null;
		List<OfficerDto> listOfOfficerDto = Lists.newArrayList();
		
		if(complaint.equalsIgnoreCase("complaintTransfer"))
		{
			sql = "SELECT * FROM registration where ( logintype = 'ROLE_DH' or logintype = 'ROLE_SO' or logintype = 'ROLE_BO' or logintype = 'ROLE_CLR' or logintype = 'ROLE_COORD') and status=true order by name";
		}
		if(complaint.equalsIgnoreCase("citizen")) 
		{
			sql = "SELECT * FROM registration where logintype!='ROLE_ADMIN' order by userid,desiganation";
		}	
		
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					OfficerDto officerDto = new OfficerDto();
					officerDto.setOfficerCode(rs.getString("usercode"));
					officerDto.setOfficerDesiganation(rs.getString("desiganation"));
					officerDto.setOfficerName(rs.getString("userid"));
					officerDto.setLoginType(rs.getString("logintype"));
					officerDto.setDairyStatus(rs.getString("loginroll"));
					listOfOfficerDto.add(officerDto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
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
				
			}
		
		
		return listOfOfficerDto;
	}

	public List<ComplainDto> ComplaintsOfAcc(String dairystatus, String section) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM complain WHERE dairystatus= ? or dairystatus= ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, dairystatus);
			preparedStatement.setString(2, section);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
				}
				else
				{
					complainDto.setSenderName(rs.getString("sendername"));
				}
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaint"));
				
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				if (rs.getString("bofinaldecdate") == null) {
					complainDto.setDecisiondate("Pending");
				} else {
					complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
				}
				if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
					complainDto.setComplaint("Not Found");
				} else {
					complainDto.setComplaint(rs.getString("complaint"));
				}
				listofComplainDto.add(complainDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listofComplainDto;
	}

	public boolean transferComplaint(String dairystatus, String complaint,String old_dairystatus, String ipAddress) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		boolean flag=false;
		
		String sql = "update complain set dairystatus= ? where complaint=?";
		
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, dairystatus);
			preparedStatement.setString(2, complaint);
			preparedStatement.executeUpdate();
			flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			/**
			 * Close the resultSet
			 */
			
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
		if(flag)
		{		
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				jdbcTemplate.update("INSERT INTO \"transfer\"(fromaccount,toaccount,timestamp,ipaddress,complaint) VALUES(?,?,?,?,?)",
						old_dairystatus,dairystatus,new Timestamp(System.currentTimeMillis()),ipAddress,complaint);

			} finally {
				MyUtill.connClose(jdbcTemplate);
			}
		}
		
		return flag;
	}

	public List<CitizenDto> findAllCitizen() {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql;
		long size=0;
		List<CitizenDto> listOfCitizenDto = Lists.newArrayList();
		
		sql = "SELECT * FROM citizenregistration order by citizenid";
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					CitizenDto citizenDto = new CitizenDto();
					size++;
					citizenDto.setSize(size);
					citizenDto.setCitizenId(rs.getString("citizenid"));
					citizenDto.setName(rs.getString("name"));
					listOfCitizenDto.add(citizenDto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
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
				
			}
		
		
		return listOfCitizenDto;
	}

	public Object cvoCorner(String orgCode, String loginId, String org) {

		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		
		ComplainDto data=new ComplainDto();
		data.setSection(orgCode);
		data.setOrganizationName(org);
		data.setSenderName(loginId);
		listofComplainDto.add(data);
		return listofComplainDto;
	}
	public List<OfficerDto> findAllUserId(String Role) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		/*String sql = "SELECT * FROM registration WHERE logintype = ?";*/
		String sql = "SELECT * FROM registration where status=true";
		List<OfficerDto> listOfOfficerDto = Lists.newArrayList();

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			/*if(Role.equalsIgnoreCase("ROLE_ADMIN"))
			{
				Role="ROLE_CVO";
			}
			preparedStatement.setString(1,Role);*/
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				OfficerDto officerDto = new OfficerDto();
				officerDto.setOfficerCode(rs.getString("userid"));
				listOfOfficerDto.add(officerDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
		return listOfOfficerDto;
	}
	
	public boolean resetPassword(String user,String type) {
		String sql = null;
		String sqluser = null;
		boolean flag=false;
		char[] password=random_password(10);
		String passwordToHash=String.valueOf(password);
		System.out.println(passwordToHash);
		
		String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(passwordToHash.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        System.out.println(generatedPassword);
		
        
		
		
		if(type.equalsIgnoreCase("officer")) 
		{
			/*sql="update registration set password='e9c60bf0c26090dbd4028bfecf20b41a' where userid=?";*/
			sql="update registration set password=? where userid=?"; 
			sqluser="select email,mobilenumber from registration where userid=?";
		}
		else if(type.equalsIgnoreCase("citizen"))
		{
			/*sql="update citizenregistration set password='e9c60bf0c26090dbd4028bfecf20b41a' where citizenid=?";*/
			sql="update citizenregistration set password=? where citizenid=?";
			sqluser="select email,contactnumber from citizenregistration where citizenid=?";
		}
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String email = null,mob = null;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sqluser);
			preparedStatement.setString(1, user);
			rs=preparedStatement.executeQuery();
			
			while (rs.next()) {
				
				email=(rs.getString(1)==null)?"":rs.getString(1);
				mob=(rs.getString(2).length()<10)?"":rs.getString(2);
				System.out.println(email+"------------------"+mob);
			
			}
			preparedStatement.close();
			rs.close();
			
			DiaryController sendPassword=new DiaryController();
			String Msg="Your password has been reset successfully.Your new password is "+passwordToHash+" please don't share it with anyone.To login please visit:http://portal.cvc.gov.in/cvproject/";
			
			if(email!=""||email!=null||mob.length()==10)
			{	try {
					Email mail=new Email();
					mail.setSenderEmail("portal-cvc@nic.in");
					mail.setRecepientEmail(email);
					mail.setSubject("Central Vigilance Commission - Password Reset");
					mail.setEmailContent(Msg);
					sendPassword.sendMail(mail);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					flag=false;
					return flag;
				}
				
			}
			if(mob.length()==10)
			{	try {
				
					sendPassword.sendSMS(mob, Msg);
					
					
					} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					flag=false;
					return flag;
					}
				
			}
			
			/*if(email.isEmpty()||mob.isEmpty()||email.equalsIgnoreCase("")||(mob.length()<10))
			{
				flag=false;
				return flag;
				//either physical mail or officer address hardcode
			}*/
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, generatedPassword);
			preparedStatement.setString(2, user);
			preparedStatement.executeUpdate();
			flag=true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag= false;
		} finally {
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
		return flag;
	}
	
	public boolean unlockUser(String user,String type) {
		String sql = null;
		boolean flag=false;
		
		if(type.equalsIgnoreCase("officer")) 
		{
			sql="update registration set islocked=0, status=true where userid=?"; 
		}
		else if(type.equalsIgnoreCase("citizen"))
		{
			sql="update citizenregistration set islocked=0 where citizenid=?";			
		}
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, user);
			preparedStatement.executeUpdate();
			flag=true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag= false;
		} finally {
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
		return flag;
	}
	
	public List<EmailSmsUserDto> getEmailSmsReceipientList(String roleType)
	{
		List<EmailSmsUserDto> receipientList= new ArrayList<EmailSmsUserDto>();
		
		String roleTypeArr[]= roleType.replace("'","").split(",");
		String RoleArrayToString="";
		 for(int i=0;i<roleTypeArr.length;i++)
		 {
			 if(i==0)
			 {
				 RoleArrayToString = "'"+roleTypeArr[i]+"'"; 
			 }
			 else
			 {
				 RoleArrayToString = RoleArrayToString+",'"+roleTypeArr[i]+"'";
			 }
		 }
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql;
		
		sql = "select distinct name,organisation,desiganation,logintype,email,mobileNumber from registration where desiganation is not null and desiganation<>'' and logintype in ("+RoleArrayToString+") and (length(Trim(mobileNumber))>1 or length(Trim(email))>0)  order by desiganation,organisation,name";
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					EmailSmsUserDto emailSmsUserDto = new EmailSmsUserDto();
					emailSmsUserDto.setName(rs.getString("name"));
					emailSmsUserDto.setDesignation(rs.getString("desiganation"));
					emailSmsUserDto.setOrg(rs.getString("organisation"));
					emailSmsUserDto.setEmailId(rs.getString("email"));
					emailSmsUserDto.setMobileNumber(rs.getString("mobileNumber"));
					emailSmsUserDto.setUserRole(rs.getString("logintype"));
					receipientList.add(emailSmsUserDto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
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
				
			}
		
		
		return receipientList;
	}
	
	public List<String> getRoleTypeList()
	{
		List<String> roleList= new ArrayList<String>();

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql;
		
		sql = "select distinct logintype from registration where logintype is not null order by logintype ";
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				rs = preparedStatement.executeQuery();

				while (rs.next()) {									
					roleList.add(rs.getString("logintype"));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
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
				
			}
		
		
		return roleList;
	}
	 static char[] random_password(int len)
	    {
	        System.out.println("Generating password using random() : ");
	        System.out.print("Your new password is : ");
	 
	        // A strong password has Cap_chars, Lower_chars,
	        // numeric value and symbols. So we are using all of
	        // them to generate our password
	        String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	        String Small_chars = "abcdefghijklmnopqrstuvwxyz";
	        String numbers = "0123456789";
	                String symbols = "@#$&!%*";
	 
	 
	        String values = Capital_chars +symbols+ Small_chars + numbers;
	 
	        // Using random method
	        Random rndm_method = new Random();
	 
	        char[] password = new char[len];
	 
	        for (int i = 0; i < len; i++)
	        {
	            // Use of charAt() method : to get character value
	            // Use of nextInt() as it is scanning the value as int
	        	
	        	if(i<4){
	        		password[i] =
	        				Capital_chars.charAt(rndm_method.nextInt(Capital_chars.length()));	
	        	}
	        	if(i==4) {
	        		password[i] =
	        				symbols.charAt(rndm_method.nextInt(symbols.length()));
	        	}
	        	if(i>4&&i<8) {
	        		password[i] =
	        				Small_chars.charAt(rndm_method.nextInt(Small_chars.length()));
	        	}
	        	if(i==8||i==9) {
	        		password[i] =
	        				numbers.charAt(rndm_method.nextInt(numbers.length()));
	        	}
	            
	 
	        }
	        return password;
	    }
	 
	 public boolean editOfficerProfile(UserDto userDto,String loginId) {
			
			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			boolean flag=false;
			String sql = "UPDATE registration SET name=? ,desiganation=?,email=?,mobilenumber=? WHERE userid=? ";
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, userDto.getUserName());
				preparedStatement.setString(2, userDto.getDesiganation());
				preparedStatement.setString(3, userDto.getUserEmail());
				preparedStatement.setString(4, userDto.getMobileNumber());
				preparedStatement.setString(5, loginId);
				preparedStatement.executeUpdate();
				flag=true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return flag;
		}
	 
	 public boolean clearComplaintDecision(String complaint, boolean bodecision, boolean bodecisiondate, boolean boirfinaldec,
				boolean bofinaldecdate, boolean cvoview, boolean status, boolean complainstatus) {
			
			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			boolean flag=false;
			String sql = "UPDATE complain SET ";
			int i=0;
			if(bodecision) 
			{
				sql=sql+"bodecision=?, ";
				i++;
			}
			if(bodecisiondate) 
			{
				sql=sql+"bodecisiondate=?::Date, ";
				i++;
			}
			if(boirfinaldec) 
			{
				sql=sql+"boirfinaldec=?, ";
				i++;
			}
			if(bofinaldecdate) 
			{
				sql=sql+"bofinaldecdate=?, ";
				i++;
			}
			if(cvoview) 
			{
				sql=sql+"cvoview=?, ";
				i++;
			}
			if(status) 
			{
				sql=sql+"status=?, ";
				i++;
			}
			if(complainstatus) 
			{
				sql=sql+"complainstatus=?, ";
				i++;
			}
			sql=sql.substring(0,sql.length()-2);
			sql=sql+" where complaint=?";
			

			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				
				preparedStatement.setString(i+1,complaint);
				
				if(complainstatus) 
				{
					preparedStatement.setInt(i,0);
					i--;
				}
				if(status) 
				{
					preparedStatement.setInt(i,0);
					i--;
				}
				if(cvoview) 
				{
					preparedStatement.setInt(i,0);
					i--;
				}
				if(bofinaldecdate) 
				{
					preparedStatement.setDate(i,null);
					i--;
				}
				if(boirfinaldec) 
				{
					preparedStatement.setString(i,null);
					i--;
				}
				if(bodecisiondate) 
				{
					preparedStatement.setDate(i,null);
					i--;
				}
				if(bodecision) 
				{
					preparedStatement.setString(i,null);
					i--;
				}
			
				preparedStatement.executeUpdate();
				flag=true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return flag;
		}
	 
	 public boolean activateUser(String user,String type) {
			String sql = null;
			boolean flag=false;
			
			if(type.equalsIgnoreCase("officer")) 
			{
				sql="update registration set status=true where userid=?"; 
			}
			else if(type.equalsIgnoreCase("citizen"))
			{
				sql="";			
			}
			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, user);
				preparedStatement.executeUpdate();
				flag=true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				flag= false;
			} finally {
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
			return flag;
		}

	 public boolean deactivateUser(String user,String type) {
			String sql = null;
			boolean flag=false;
			
			if(type.equalsIgnoreCase("officer")) 
			{
				sql="update registration set status=false where userid=?"; 
			}
			else if(type.equalsIgnoreCase("citizen"))
			{
				sql="";			
			}
			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, user);
				preparedStatement.executeUpdate();
				flag=true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				flag= false;
			} finally {
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
			return flag;
		}

	 
	 
	 public List<DairyDetailsDto> findDetailsByCPACMobno(String loginId, String complainMobileNo, String uSection) {

			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sec=null;
			for(int i=0;i<uSection.split("/").length;i++)
			{
				sec="'"+uSection.split("/")[i]+"'"+","+sec;
			}
			System.out.println(sec);
			String sql = "SELECT *,(CASE WHEN IR='1' THEN 'IR' WHEN FACTUAL_REPORT='1' THEN 'Factual Report' WHEN FILED='1' THEN 'Filed' WHEN DIRECT_INVEST='1' THEN 'Direct Investigation' WHEN necessary_action='1' THEN 'NA' WHEN action_taken_report='1' THEN 'ATR' WHEN discrete_veri='1' THEN 'DV' ELSE 'Pending' END) AS bodecision FROM cpa_complaint WHERE mobileno ilike ? ";
			List<DairyDetailsDto> liDairyDetailsDtos = Lists.newArrayList();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, "%" + complainMobileNo + "%");
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					DairyDetailsDto dairyDetailsDto=new DairyDetailsDto();
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setCreatedDate(rs.getString("createdDate"));
					dairyDetailsDto.setComplainDate(rs.getString("complaindate"));
					dairyDetailsDto.setSenderName(rs.getString("sendername"));
					dairyDetailsDto.setAddress(rs.getString("address"));
					dairyDetailsDto.setEmail(rs.getString("email"));
					dairyDetailsDto.setMobileNo(rs.getString("mobileno"));
					dairyDetailsDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
					dairyDetailsDto.setOrganization(rs.getString("organization"));
					dairyDetailsDto.setSection(rs.getString("section"));;
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setMinistry_name(rs.getString("ministry_name"));
					dairyDetailsDto.setComplaint_summary(rs.getString("complaint_summary"));
					dairyDetailsDto.setComplaint_description(rs.getString("complaint_description"));
					dairyDetailsDto.setBoDecisionDate(rs.getString("boDecisionDate"));
					
					dairyDetailsDto.setOrg_file_name(rs.getString("org_file_name"));
					dairyDetailsDto.setEnc_file_name(rs.getString("enc_file_name"));
					dairyDetailsDto.setFile_location(rs.getString("file_location"));
					dairyDetailsDto.setBoDecision(rs.getString("bodecision"));
					liDairyDetailsDtos.add(dairyDetailsDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return liDairyDetailsDtos;
		}
	 
	 public List<DairyDetailsDto> findDetailsByCPACName(String loginId, String sendername, String uSection) {

			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sec=null;
			for(int i=0;i<uSection.split("/").length;i++)
			{
				sec="'"+uSection.split("/")[i]+"'"+","+sec;
			}
			System.out.println(sec);
			String sql = "SELECT *,(CASE WHEN IR='1' THEN 'IR' WHEN FACTUAL_REPORT='1' THEN 'Factual Report' WHEN FILED='1' THEN 'Filed' WHEN DIRECT_INVEST='1' THEN 'Direct Investigation' WHEN necessary_action='1' THEN 'NA' WHEN action_taken_report='1' THEN 'ATR' WHEN discrete_veri='1' THEN 'DV' ELSE 'Pending' END) AS bodecision FROM cpa_complaint WHERE sendername ilike ? ";
			List<DairyDetailsDto> liDairyDetailsDtos = Lists.newArrayList();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, "%" + sendername + "%");
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					DairyDetailsDto dairyDetailsDto=new DairyDetailsDto();
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setCreatedDate(rs.getString("createdDate"));
					dairyDetailsDto.setComplainDate(rs.getString("complaindate"));
					dairyDetailsDto.setSenderName(rs.getString("sendername"));
					dairyDetailsDto.setAddress(rs.getString("address"));
					dairyDetailsDto.setEmail(rs.getString("email"));
					dairyDetailsDto.setMobileNo(rs.getString("mobileno"));
					dairyDetailsDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
					dairyDetailsDto.setOrganization(rs.getString("organization"));
					dairyDetailsDto.setSection(rs.getString("section"));;
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setMinistry_name(rs.getString("ministry_name"));
					dairyDetailsDto.setComplaint_summary(rs.getString("complaint_summary"));
					dairyDetailsDto.setComplaint_description(rs.getString("complaint_description"));
					dairyDetailsDto.setBoDecisionDate(rs.getString("boDecisionDate"));
					
					dairyDetailsDto.setOrg_file_name(rs.getString("org_file_name"));
					dairyDetailsDto.setEnc_file_name(rs.getString("enc_file_name"));
					dairyDetailsDto.setFile_location(rs.getString("file_location"));
					dairyDetailsDto.setBoDecision(rs.getString("bodecision"));
					liDairyDetailsDtos.add(dairyDetailsDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return liDairyDetailsDtos;
		}
	 
	 public List<DairyDetailsDto> findDetailsByCPAEmail(String loginId, String email, String uSection) {

			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sec=null;
			for(int i=0;i<uSection.split("/").length;i++)
			{
				sec="'"+uSection.split("/")[i]+"'"+","+sec;
			}
			System.out.println(sec);
			String sql = "SELECT *,(CASE WHEN IR='1' THEN 'IR' WHEN FACTUAL_REPORT='1' THEN 'Factual Report' WHEN FILED='1' THEN 'Filed' WHEN DIRECT_INVEST='1' THEN 'Direct Investigation' WHEN necessary_action='1' THEN 'NA' WHEN action_taken_report='1' THEN 'ATR' WHEN discrete_veri='1' THEN 'DV' ELSE 'Pending' END) AS bodecision FROM cpa_complaint WHERE email ilike ? ";
			List<DairyDetailsDto> liDairyDetailsDtos = Lists.newArrayList();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, "%" + email + "%");
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					DairyDetailsDto dairyDetailsDto=new DairyDetailsDto();
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setCreatedDate(rs.getString("createdDate"));
					dairyDetailsDto.setComplainDate(rs.getString("complaindate"));
					dairyDetailsDto.setSenderName(rs.getString("sendername"));
					dairyDetailsDto.setAddress(rs.getString("address"));
					dairyDetailsDto.setEmail(rs.getString("email"));
					dairyDetailsDto.setMobileNo(rs.getString("mobileno"));
					dairyDetailsDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
					dairyDetailsDto.setOrganization(rs.getString("organization"));
					dairyDetailsDto.setSection(rs.getString("section"));;
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setMinistry_name(rs.getString("ministry_name"));
					dairyDetailsDto.setComplaint_summary(rs.getString("complaint_summary"));
					dairyDetailsDto.setComplaint_description(rs.getString("complaint_description"));
					dairyDetailsDto.setBoDecisionDate(rs.getString("boDecisionDate"));
					
					dairyDetailsDto.setOrg_file_name(rs.getString("org_file_name"));
					dairyDetailsDto.setEnc_file_name(rs.getString("enc_file_name"));
					dairyDetailsDto.setFile_location(rs.getString("file_location"));
					dairyDetailsDto.setBoDecision(rs.getString("bodecision"));
					liDairyDetailsDtos.add(dairyDetailsDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return liDairyDetailsDtos;
		}
	 
	 public List<DairyDetailsDto> findDetailsByCPAPincode(String loginId, String pincode, String uSection) {

			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sec=null;
			for(int i=0;i<uSection.split("/").length;i++)
			{
				sec="'"+uSection.split("/")[i]+"'"+","+sec;
			}
			System.out.println(sec);
			String sql = "SELECT *,(CASE WHEN IR='1' THEN 'IR' WHEN FACTUAL_REPORT='1' THEN 'Factual Report' WHEN FILED='1' THEN 'Filed' WHEN DIRECT_INVEST='1' THEN 'Direct Investigation' WHEN necessary_action='1' THEN 'NA' WHEN action_taken_report='1' THEN 'ATR' WHEN discrete_veri='1' THEN 'DV' ELSE 'Pending' END) AS bodecision FROM cpa_complaint WHERE doc_id ilike ? ";
			List<DairyDetailsDto> liDairyDetailsDtos = Lists.newArrayList();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, "%" + pincode + "%");
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					DairyDetailsDto dairyDetailsDto=new DairyDetailsDto();
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setCreatedDate(rs.getString("createdDate"));
					dairyDetailsDto.setComplainDate(rs.getString("complaindate"));
					dairyDetailsDto.setSenderName(rs.getString("sendername"));
					dairyDetailsDto.setAddress(rs.getString("address"));
					dairyDetailsDto.setEmail(rs.getString("email"));
					dairyDetailsDto.setMobileNo(rs.getString("mobileno"));
					dairyDetailsDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
					dairyDetailsDto.setOrganization(rs.getString("organization"));
					dairyDetailsDto.setSection(rs.getString("section"));;
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setMinistry_name(rs.getString("ministry_name"));
					dairyDetailsDto.setComplaint_summary(rs.getString("complaint_summary"));
					dairyDetailsDto.setComplaint_description(rs.getString("complaint_description"));
					dairyDetailsDto.setBoDecisionDate(rs.getString("boDecisionDate"));
					
					dairyDetailsDto.setOrg_file_name(rs.getString("org_file_name"));
					dairyDetailsDto.setEnc_file_name(rs.getString("enc_file_name"));
					dairyDetailsDto.setFile_location(rs.getString("file_location"));
					dairyDetailsDto.setBoDecision(rs.getString("bodecision"));
					liDairyDetailsDtos.add(dairyDetailsDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return liDairyDetailsDtos;
		}
	 
	 
	 public List<DairyDetailsDto> findDetailsByCPAagnstname(String loginId, String agnstname, String uSection) {

			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sec=null;
			for(int i=0;i<uSection.split("/").length;i++)
			{
				sec="'"+uSection.split("/")[i]+"'"+","+sec;
			}
			System.out.println(sec);
			String sql = "SELECT *,(CASE WHEN IR='1' THEN 'IR' WHEN FACTUAL_REPORT='1' THEN 'Factual Report' WHEN FILED='1' THEN 'Filed' WHEN DIRECT_INVEST='1' THEN 'Direct Investigation' WHEN necessary_action='1' THEN 'NA' WHEN action_taken_report='1' THEN 'ATR' WHEN discrete_veri='1' THEN 'DV' ELSE 'Pending' END) AS bodecision FROM cpa_complaint WHERE complaint_against_name ilike ? ";
			List<DairyDetailsDto> liDairyDetailsDtos = Lists.newArrayList();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, "%" + agnstname + "%");
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					DairyDetailsDto dairyDetailsDto=new DairyDetailsDto();
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setCreatedDate(rs.getString("createdDate"));
					dairyDetailsDto.setComplainDate(rs.getString("complaindate"));
					dairyDetailsDto.setSenderName(rs.getString("sendername"));
					dairyDetailsDto.setAddress(rs.getString("address"));
					dairyDetailsDto.setEmail(rs.getString("email"));
					dairyDetailsDto.setMobileNo(rs.getString("mobileno"));
					dairyDetailsDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
					dairyDetailsDto.setOrganization(rs.getString("organization"));
					dairyDetailsDto.setSection(rs.getString("section"));;
					dairyDetailsDto.setComplaint(rs.getString("complaint"));
					dairyDetailsDto.setMinistry_name(rs.getString("ministry_name"));
					dairyDetailsDto.setComplaint_summary(rs.getString("complaint_summary"));
					dairyDetailsDto.setComplaint_description(rs.getString("complaint_description"));
					dairyDetailsDto.setBoDecisionDate(rs.getString("boDecisionDate"));
					
					dairyDetailsDto.setOrg_file_name(rs.getString("org_file_name"));
					dairyDetailsDto.setEnc_file_name(rs.getString("enc_file_name"));
					dairyDetailsDto.setFile_location(rs.getString("file_location"));
					dairyDetailsDto.setBoDecision(rs.getString("bodecision"));
					liDairyDetailsDtos.add(dairyDetailsDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return liDairyDetailsDtos;
		}
	 
	 public boolean markImportant(String complaint) {
			String sql = null;
			boolean flag=false;
			
			
				sql="update complain set important=true where complaint=?"; 
			
			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, complaint);
				preparedStatement.executeUpdate();
				flag=true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				flag= false;
			} finally {
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
			return flag;
		}
	 
	 public boolean unmarkImportant(String complaint) {
			String sql = null;
			boolean flag=false;
			
			
				sql="update complain set important=false where complaint=?"; 
			
			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, complaint);
				preparedStatement.executeUpdate();
				flag=true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				flag= false;
			} finally {
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
			return flag;
		}

	 public List<ComplainDto> findAllDiarySoImpInbox(String uSection, String loginId) {
			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			List<ComplainDto> listofComplainDto = Lists.newArrayList();
			String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,status,boirfinaldec,important FROM complain WHERE   dairystatus= ? and complainstatus = ? and important=true  ORDER BY complaindate desc";
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, loginId);
				preparedStatement.setInt(2, 0);
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					ComplainDto complainDto = new ComplainDto();
					complainDto.setOrganizationName(rs.getString("organization"));
					complainDto.setComplainNo(rs.getString("complaintnumber"));
					complainDto.setComplaint(rs.getString("complaint"));
					complainDto.setRecipientName(rs.getString("recipientname"));
					complainDto.setCreatedDate(rs.getString("createddate"));
					complainDto.setComplaindate(rs.getString("complaindate"));
					//complainDto.setRollType(rs.getString("rolltype"));
					complainDto.setStatus(rs.getInt("status"));
					
					if(rs.getString("rolltype").matches("Complaint Cell") || rs.getString("rolltype").matches("Diary")) 
					{
						complainDto.setRollType("Complaint Cell");
					}
					else if(rs.getString("rolltype").matches("CITIZEN"))
					{
						complainDto.setRollType("Online");
					}
					else if(rs.getString("rolltype").matches("HelpLine"))
					{
						complainDto.setRollType("Tollfree");
					}
					else
					{
						complainDto.setRollType("Unknown Source");
					}
					
					if (rs.getString("boirfinaldec")=="null" || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").equalsIgnoreCase("") || rs.getString("boirfinaldec").length()==4) {
						complainDto.setDecision("Pending");
					} else  {
						complainDto.setDecision(rs.getString("boirfinaldec"));
					}
					
					complainDto.setImportant(rs.getBoolean("important"));
					listofComplainDto.add(complainDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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

			return listofComplainDto;
		}

	 public List<ComplainDto> findAllDiaryForBoImpInbox(String uSection, String loginId) {
			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,status,boirfinaldec,important FROM complain WHERE   dairystatus= ? and complainstatus = ? and important=true    ORDER BY complaindate desc";
			List<ComplainDto> listOfComplainDto = Lists.newArrayList();

			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, loginId);
				preparedStatement.setInt(2, 0);
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					ComplainDto complainDto = new ComplainDto();
					complainDto.setOrganizationName(rs.getString("organization"));
					complainDto.setComplainNo(rs.getString("complaintnumber"));
					complainDto.setComplaint(rs.getString("complaint"));
					complainDto.setRecipientName(rs.getString("recipientname"));
					complainDto.setCreatedDate(rs.getString("createddate"));
					complainDto.setComplaindate(rs.getString("complaindate"));
					//complainDto.setRollType(rs.getString("rolltype"));
					complainDto.setStatus(rs.getInt("status"));
					
					if(rs.getString("rolltype").matches("Complaint Cell") || rs.getString("rolltype").matches("Diary")) 
					{
						complainDto.setRollType("Complaint Cell");
					}
					else if(rs.getString("rolltype").matches("CITIZEN"))
					{
						complainDto.setRollType("Online");
					}
					else if(rs.getString("rolltype").matches("HelpLine"))
					{
						complainDto.setRollType("Tollfree");
					}
					else
					{
						complainDto.setRollType("Unknown Source");
					}
					
					
					if ( rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").equalsIgnoreCase("") || rs.getString("boirfinaldec").length()==4 ||rs.getString("boirfinaldec").equalsIgnoreCase("null")) {
						complainDto.setDecision("Pending");
					} else {
						complainDto.setDecision(rs.getString("boirfinaldec"));
					}
					complainDto.setImportant(rs.getBoolean("important"));
					listOfComplainDto.add(complainDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return listOfComplainDto;
		}	 
	 
	 
	 public List<ComplainDto> findDetailsByOldComplainNumber(String OldComplainNo) {

			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sql = "select comp_no,file_no,compl_name,name,dec_date from comp_ir_2005 where comp_no like ?";
			List<ComplainDto> listofComplainDto = Lists.newArrayList();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, OldComplainNo);
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					ComplainDto complainDto = new ComplainDto();
					ComplainDto temp = new ComplainDto();
					complainDto.setComplaint(rs.getString("comp_no"));
					complainDto.setFileNo(rs.getString("file_no"));
					complainDto.setSenderName(rs.getString("compl_name"));
					complainDto.setComplaintAgainstName(rs.getString("name"));
					complainDto.setDecisiondate(rs.getString("dec_date"));
					
					if(rs.getString("file_no")!=null)
					{
						temp= tempFindDetailsByOldComplainNumber(rs.getString("file_no"));
						complainDto.setFactual_report(temp.getFactual_report());
						complainDto.setCreatedDate(temp.getCreatedDate());
					}
					else
					{
						complainDto.setFactual_report("CVO RECOMMENDATION REPORT NOT YET RECEIVED");
						complainDto.setCreatedDate("CVO RECOMMENDATION REPORT NOT YET RECEIVED");
					}
					complainDto.setDecision("OldComplaint");
					listofComplainDto.add(complainDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return listofComplainDto;
		}
	 public ComplainDto tempFindDetailsByOldComplainNumber(String FileNo) {

			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sql = "select rec_dt,fssendt from fnsstage where file_no like ?";
			ComplainDto complainDto = new ComplainDto();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, FileNo);
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					
					complainDto.setFactual_report(rs.getString("rec_dt"));
					complainDto.setCreatedDate(rs.getString("fssendt"));
					return complainDto;
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return complainDto;
		}
	 
	 
		public List<ComplainDto> findDetailsComplaintDate(String loginId, Date complaintDate, String uSection) {

			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sec=null;
			for(int i=0;i<uSection.split("/").length;i++)
			{
				sec="'"+uSection.split("/")[i]+"'"+","+sec;
			}
			System.out.println(sec);
			String sql = "SELECT * FROM complain WHERE complaindate = ? and section in ("+sec+")";
			
			if(uSection.equalsIgnoreCase("Diary"))
			{
				sql = "SELECT * FROM complain WHERE complaindate = ?";
			}
			
			List<ComplainDto> listofComplainDto = Lists.newArrayList();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setDate(1, complaintDate);
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					ComplainDto complainDto = new ComplainDto();
					if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
					{
						String name=rs.getString("dairyid");
						name=name.split("/")[0];
						System.out.println(name);
						
						complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
					}
					else
					{
						complainDto.setSenderName(rs.getString("sendername"));
					}
					complainDto.setOrganizationName(rs.getString("organization"));
					complainDto.setComplainNo(rs.getString("complaintnumber"));
					
					complainDto.setCreatedDate(rs.getString("createddate"));
					complainDto.setComplaindate(rs.getString("complaindate"));
					if (rs.getString("dairystatus")==null) {
						complainDto.setDairyStatus("Not Present In Database");
					} else if (rs.getString("dairystatus").length() > 1) {
						complainDto.setDairyStatus(rs.getString("dairystatus"));
					} else {
						complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
					}
					if(rs.getString("section")==null){
						complainDto.setSection("Not Present In Database");
					}else {
						complainDto.setSection(rs.getString("section"));
					}
					if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
						complainDto.setDecision("Pending");
					} else {
						complainDto.setDecision(rs.getString("boirfinaldec"));
					}
					if (rs.getString("bofinaldecdate") == null) {
						complainDto.setDecisiondate("Pending");
					} else {
						complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
					}
					if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
						complainDto.setComplaint("Not Found");
					} else {
						complainDto.setComplaint(rs.getString("complaint"));
					}
					listofComplainDto.add(complainDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return listofComplainDto;

		}
	 
		public List<ComplainDto> findDetailsCreatedDate(String loginId, Date createdDate, String uSection) {

			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			String sec=null;
			for(int i=0;i<uSection.split("/").length;i++)
			{
				sec="'"+uSection.split("/")[i]+"'"+","+sec;
			}
			System.out.println(sec);

			String sql = "SELECT * FROM complain WHERE createddate = ? and section in ("+sec+")";
			
			if(uSection.equalsIgnoreCase("Diary")) 
			{
				sql = "SELECT * FROM complain WHERE createddate = ? ";
			}
			
			List<ComplainDto> listofComplainDto = Lists.newArrayList();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setDate(1,createdDate);
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					ComplainDto complainDto = new ComplainDto();
					if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
					{
						String name=rs.getString("dairyid");
						name=name.split("/")[0];
						System.out.println(name);
						
						complainDto.setSenderName(dealingHandServiceImpl.getCitizenName(name));
					}
					else
					{
						complainDto.setSenderName(rs.getString("sendername"));
					}
					complainDto.setOrganizationName(rs.getString("organization"));
					complainDto.setComplainNo(rs.getString("complaintnumber"));
					
					complainDto.setCreatedDate(rs.getString("createddate"));
					complainDto.setComplaindate(rs.getString("complaindate"));
					if (rs.getString("dairystatus").length() > 1) {
						complainDto.setDairyStatus(rs.getString("dairystatus"));
					} else {
						complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
					}
					complainDto.setSection(rs.getString("section"));
					if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
						complainDto.setDecision("Pending");
					} else {
						complainDto.setDecision(rs.getString("boirfinaldec"));
					}
					if (rs.getString("bofinaldecdate") == null) {
						complainDto.setDecisiondate("Pending");
					} else {
						complainDto.setDecisiondate(rs.getString("bofinaldecdate"));
					}
					if (rs.getString("complaint") == null || rs.getString("complaint") == "" ) {
						complainDto.setComplaint("Not Found");
					} else {
						complainDto.setComplaint(rs.getString("complaint"));
					}
					listofComplainDto.add(complainDto);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
			return listofComplainDto;

		}
		
		public Object allClosedNaForCvo(String orgCode, String loginId, String org) {
			JdbcTemplate jdbcTemplate = null;
			Connection conn = null;
			PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			
			//String sql = "select cvo.complaintnumber,cvo.investigationclosedate,complain.complaint,complain.confirmcvo,complain.organisationcode from cvo join complain on complain.complaint=cvo.complaintnumber where complain.confirmcvo ilike ? and complain.organisationcode ilike ? and cvo.investigationclosedate is not null";
			String sql = "select cvo.complaintnumber,cvo.decision,cvo.decisiondate,cvo.remark,complain.complaint,complain.confirmcvo,complain.organisationcode from cvo join complain on complain.complaint=cvo.complaintnumber where (complain.confirmcvo ilike ? or complain.organisationcode ilike ?) and cvo.decision is not null";
			List<CvoDto> listOfCvoDto = Lists.newArrayList();
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, org);
				preparedStatement.setString(2, orgCode);
				rs = preparedStatement.executeQuery();
				while (rs.next()) {
					CvoDto cvoDto = new CvoDto();
					cvoDto.setComplaintnumber(rs.getString("complaintnumber"));
					cvoDto.setDecision(rs.getString("decision"));
					cvoDto.setDecisionDate(rs.getDate("decisionDate"));
					cvoDto.setRemark(rs.getString("remark"));
					
					listOfCvoDto.add(cvoDto);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
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
			return listOfCvoDto;
		}
		
		

}
	

