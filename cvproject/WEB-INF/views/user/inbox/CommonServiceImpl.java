package com.cvc.user.service.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cvc.dto.AllegationDto;
import com.cvc.dto.CitizenDto;
import com.cvc.dto.ComplainDto;
import com.cvc.dto.CvoDto;
import com.cvc.dto.PincodeDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.ForwardDto;
import com.cvc.dto.NotingDto;
import com.cvc.dto.OfficerDto;
import com.cvc.dto.OrganisationDto;
import com.cvc.dto.ResetPasswordDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.dto.VigClearanceDto;
import com.cvc.user.daoImpl.CommonDaoImpl;
import com.cvc.user.service.CommonServiceI;
import com.cvc.util.MyUtill;
import com.google.common.collect.Lists;

@Service
public class CommonServiceImpl implements CommonServiceI {

	@Autowired
	CommonDaoImpl commonDaoImpl;

	@Autowired
	DataSource dataSource;

	@Override
	public List<OrganisationDto> getAllOrganisation() {
		JdbcTemplate jdbcTemplate = null;
		String sql = "SELECT orgcod,organisationname1 FROM sectiondetail  ORDER BY  organisationname1";

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			List<OrganisationDto> organisationDto = jdbcTemplate.query(sql, new RowMapper<OrganisationDto>() {

				@Override
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


	@Override
	public List<AllegationDto> findAllAllegation() {
		JdbcTemplate jdbcTemplate = null;
		String sql = "SELECT allegationid,allegation FROM allegation";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			List<AllegationDto> allegationDto = jdbcTemplate.query(sql, new RowMapper<AllegationDto>() {

				@Override
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

	@Override
	public List<ComplainDto> findAllDiaryForBo(String uSection, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,status,boirfinaldec FROM complain WHERE   dairystatus= ? and complainstatus = ?    ORDER BY complaindate desc";
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
				complainDto.setRollType(rs.getString("rolltype"));
				complainDto.setStatus(rs.getInt("status"));
				
				if (rs.getString("boirfinaldec")=="null" || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec") == "" || rs.getString("boirfinaldec").length()==0) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
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

	@Override
	public List<OfficerDto> findAllOfficer(String loginId, String uSection) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql;
		List<OfficerDto> listOfOfficerDto = Lists.newArrayList();
		if (uSection.contains("/") && uSection != "") {
			sql = "SELECT usercode,userid,logintype,desiganation FROM registration where userid != ? and ( logintype != ? and logintype != ? )  and ( loginroll LIKE ? or loginroll LIKE ? ) and userid != ?";
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
			sql = "SELECT usercode,userid,logintype,desiganation FROM registration where userid != ? and ( logintype != ? and logintype != ?) and loginroll LIKE ?";
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
			sql = " SELECT usercode FROM registration where userid != ? and logintype != ?  ";
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

	@Override
	public void addNoting(NotingDto notingDto, Integer complaintNumber, String loginId, String uDesiganation) {
		commonDaoImpl.insertNotingDetails(notingDto, complaintNumber, loginId, uDesiganation);
	}
	
	@Override
	public void addVijClearanceOfficerDetail(VigClearanceDto vigClearanceDto, String fileno, String loginId, String uDesiganation) {
		commonDaoImpl.insertVijClearanceOfficerDetail(vigClearanceDto, fileno, loginId, uDesiganation);
	}
	

	@Override
	public List<NotingDto> findAllNoting(Integer complaintnumber) {
		JdbcTemplate jdbcTemplate = null;
		String sql = "SELECT notername,desiganation,notingmessage1,notingmessage2,notingmessage3,notingdate FROM noting  WHERE complaintnumber=? ORDER BY notingdate DESC";
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

	@Override
	public void addForwardDetails(Integer complaintnumber, String loginId, NotingDto notingDto,
			DairyDetailsDto dairyDetailsDto) {
		commonDaoImpl.insertForwardDetails(complaintnumber, loginId, notingDto, dairyDetailsDto);
	}

	@Override
	public List<DairyDetailsDto> viewComplain(Integer complaintnumber ) {
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
				dairyDetailsDto.setOrganisationCode(rs.getString("organisationcode"));
				dairyDetailsDto.setSection(rs.getString("section"));
				dairyDetailsDto.setBoFiledAckDate(rs.getString("boFiledAckDate"));				
				//dairyDetailsDto.setBoDecisionDate(rs.getDate("bodecisiondate").toString());				
				//dairyDetailsDto.setBoirfinaldecdate(rs.getString("bofinaldecdate").toString());
				dairyDetailsDto.setDairyStatus(rs.getString("dairystatus"));
				dairyDetailsDto.setWhetherFastTrack(rs.getString("whetherfasttrack"));
				dairyDetailsDto.setComplaintType(rs.getString("complainttype"));
				dairyDetailsDto.setActionTaken(rs.getString("actiontaken"));
				dairyDetailsDto.setFileName(rs.getString("uploadscandocument"));
				dairyDetailsDto.setBoDecision(rs.getString("bodecision"));
				dairyDetailsDto.setConfirmCVO(rs.getString("confirmcvo"));
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

	@Override
	public List<ComplainDto> findAllPendingDairy(String loginId, Collection<String> uRoleTpye) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql;
		if (uRoleTpye.contains("ROLE_CVO")) {
			sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,complainstatus FROM complain WHERE   closedby= ? and  complainstatus = ?     ORDER BY complaintnumber DESC";
		} else {
			sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,complainstatus FROM complain WHERE   closedby= ? and  complainstatus = ?    ORDER BY complaintnumber DESC";
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

	@Override
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

	@Override
	public List<ComplainDto> findAllDiarySo(String uSection, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,status,boirfinaldec FROM complain WHERE   dairystatus= ? and complainstatus = ?  ORDER BY complaindate desc";
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
				complainDto.setRollType(rs.getString("rolltype"));
				complainDto.setStatus(rs.getInt("status"));
				
				if (rs.getString("boirfinaldec")=="null" || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec") == "" || rs.getString("boirfinaldec").length()==0) {
					complainDto.setDecision("Pending");
				} else  {
					complainDto.setDecision(rs.getString("boirfinaldec"));
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

	@Override
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

	@Override
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
				citizenDto.setAddress1(rs.getString("address1"));
				citizenDto.setAddress2(rs.getString("address2"));
				citizenDto.setCity(rs.getString("city"));
				citizenDto.setState(rs.getString("state"));
				citizenDto.setPincode(rs.getInt("pincode"));
				citizenDto.setCitizenEmail(rs.getString("email"));
				citizenDto.setContactNumber(rs.getString("contactnumber"));
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

	@Override
	public List<ComplainDto> getCitizenComplain(String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		String sql = "SELECT sendername,organization,complaint,complaindate,createddate,section,uploadscandocument FROM complain WHERE sendername= ? ORDER BY complaintnumber DESC";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
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

	@Override
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
				complainDto.setSenderName(rs.getString("sendername"));
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

	@Override
	public List<OfficerDto> findAllBo() {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT name, bofficercode FROM registration WHERE logintype = ?";
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

	@Override
	public List<ComplainDto> findAllDiaryForCvo(String uSection, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype FROM complain WHERE dairystatus= ? and actiontaken != ? ORDER BY complaindate desc";
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
				complainDto.setRollType(rs.getString("rolltype"));
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

	@Override
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
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
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
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
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

	@Override
	public List<ComplainDto> findDetailsByCnoForDh(String loginId, Integer complainNo, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE complaintnumber = ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complainNo);
		//	preparedStatement.setString(2, "%" + uSection + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	
	@Override
	public List<ComplainDto> findDetailsByCPACnoForDh(String loginId, String complainNo, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,section,complaint,complaindate,createddate,bodecisiondate,filed FROM cpa_complaint WHERE complaint = ? ";
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
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setBoDecisionDate(rs.getString("boDecisionDate"));
				
				
				
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
	
	
	
	
	
	
	@Override
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
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setRollType(rs.getString("rolltype"));
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
		String sqlCount = "SELECT * FROM registration WHERE  userid = ?";
		String sql = "UPDATE registration set password = ?,passwordone = ?,passwordtwo= ? WHERE  userid = ? ";
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
		String sql = "select * from registration where userid = ?";
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

	public List<ComplainDto> findDetailsByCnameForDh(String loginId, String complainName, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "";
		if (uSection.contains("/")) {
			sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(sendername) like ? and  (section like  ? or section like  ? )";
		} else {
			sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(sendername) like ? and section like  ? ";
		}

		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainName.toUpperCase() + "%");
			if (uSection.contains("/")) {
				preparedStatement.setString(2, "%" + uSection.split("/")[0] + "%");
				preparedStatement.setString(3, "%" + uSection.split("/")[1] + "%");
				rs = preparedStatement.executeQuery();
			} else {
				preparedStatement.setString(2, "%" + uSection + "%");
				rs = preparedStatement.executeQuery();
			}

			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec")=="null" || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec") == "" || rs.getString("boirfinaldec").length()==0) {
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

	
	
	public Object allReadNaForReadComplainCvo(String orgCode, String loginId, String org) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,bofinaldecdate,cvoview FROM complain WHERE  boirfinaldec = ? and (organisationcode = ? or organization = ?) and cvoview = ? ORDER BY forwarddate";
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
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,bofinaldecdate,cvoview FROM complain WHERE  boirfinaldec = ? and (organisationcode = ? or organization = ?) and cvoview = ? ORDER BY forwarddate";
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
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE complaintnumber = ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complainNo);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsByCnameForDiary(String loginId, String complaintName) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE sendername like ?  order by sendername";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complaintName + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec")=="null" || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec") == "" || rs.getString("boirfinaldec").length()==0) {
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
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE mobileNo like  ?  ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainMobileNo + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsByComplainNumber(String complainNo) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate,complaintagainstname,gistallegation FROM complain WHERE complaint = ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, complainNo);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				complainDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
				complainDto.setAllegationDeatils(rs.getString("gistallegation"));
				if (rs.getString("dairystatus").length() > 1) {
					complainDto.setDairyStatus(rs.getString("dairystatus"));
				} else {
					complainDto.setDairyStatus("Section " + rs.getString("dairystatus"));
				}
				complainDto.setSection(rs.getString("section"));
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	// --------------------------------------------

	public List<ComplainDto> findDetailsByCMobnoForDiary(String loginId, String complainMobileNo) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE mobileNo like  ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainMobileNo + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsEmailForDiary(String loginId, String complainEmail) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(email) like ?   ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainEmail.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsEmailForDh(String loginId, String complainEmail, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(email) like ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainEmail.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsPincodeForDiary(String loginId, Integer complainPincode) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE pinno  = ? ";
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
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsPincodeForDh(String loginId, Integer complainPincode, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE pinno = ?  ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, complainPincode);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsCagnstnameForDiary(String loginId, String complainAgnname) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(complaintAgainstName)  like ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainAgnname.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsCagnstnameForDh(String loginId, String complainAgnname, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(complaintAgainstName) like ?  ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainAgnname.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsCgistodalliForDiary(String loginId, String complainGistofalligation) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(gistallegation) like ? ";
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
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsCgistodalliForDh(String loginId, String complainGistofalligation,
			String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(gistallegation) like ?  ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainGistofalligation.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsDesignationForDiary(String loginId, String complainDesiganation) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		System.out.println("h11");
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(designation) like ? ";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainDesiganation.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	public List<ComplainDto> findDetailsDesignationForDh(String loginId, String complainDesiganation, String uSection) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT sendername,organization,complaintnumber,complaint,complaindate,createddate,section,dairystatus,boirfinaldec,bofinaldecdate FROM complain WHERE UPPER(designation) like ?";
		List<ComplainDto> listofComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, "%" + complainDesiganation.toUpperCase() + "%");
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setSenderName(rs.getString("sendername"));
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
				if (rs.getString("boirfinaldec").equals("null") || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").length()==4) {
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

	


}