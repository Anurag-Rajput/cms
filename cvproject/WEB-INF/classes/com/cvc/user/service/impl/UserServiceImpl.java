package com.cvc.user.service.impl;

import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

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
import com.cvc.dto.VigClearanceDto;
import com.cvc.user.daoImpl.CommonDaoImpl;
import com.cvc.user.service.UserServiceI;
import com.cvc.util.MyUtill;
import com.google.common.collect.Lists;

@Service
public class UserServiceImpl implements UserServiceI {

	@Autowired
	CommonDaoImpl commonDaoImpl;

	@Autowired
	DataSource dataSource;

	
	public UserLoginAuthenticationDto getUserAuthentication(String userName) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM registration WHERE userid= ? and status=true";
		List<UserLoginAuthenticationDto> userLoginAuthenticationDto1 = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, userName);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				UserLoginAuthenticationDto userLoginAuthenticationDto = new UserLoginAuthenticationDto();
				userLoginAuthenticationDto.setUsername(rs.getString("userid"));
				userLoginAuthenticationDto.setPassword(rs.getString("password"));
				userLoginAuthenticationDto.setName(rs.getString("name"));
				userLoginAuthenticationDto.setUserPID(rs.getInt("usercode"));
				userLoginAuthenticationDto.setLoginRoll(rs.getString("loginroll"));
				userLoginAuthenticationDto.setOrg(rs.getString("organisation"));
				userLoginAuthenticationDto.setDesiganation(rs.getString("desiganation"));
				userLoginAuthenticationDto.setCvoCode(rs.getString("cvocode"));
				userLoginAuthenticationDto.setEmail(rs.getString("email"));
				userLoginAuthenticationDto.setMobile(rs.getString("mobilenumber"));
				if (rs.getInt("isLocked") == 3) {
					userLoginAuthenticationDto.setAccountLocked(false);
				} else {
					userLoginAuthenticationDto.setAccountLocked(true);
				}
				if (rs.getInt("firstlogin") == 0) {
					userLoginAuthenticationDto.setFirstLogin(true);
				} else {
					userLoginAuthenticationDto.setFirstLogin(false);
				}

				Collection<String> role = Lists.newArrayList();
				role.add(rs.getString("logintype"));
				userLoginAuthenticationDto.setListRole(role);
				userLoginAuthenticationDto1.add(userLoginAuthenticationDto);
			}
			for (UserLoginAuthenticationDto userLoginAuthenticationDto : userLoginAuthenticationDto1) {
				return userLoginAuthenticationDto;

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

		return null;
	}

	
	public boolean updateFalseUserAccount(String userName) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		Integer isLocked = 0, count = 0;
		String token;
		boolean flag = false;
		String sql = "SELECT * FROM registration WHERE userid= ? and status=true";
		String sqlCitizen = "SELECT * FROM citizenregistration WHERE citizenid= ? ";
		String sqlLockUpdate = "UPDATE registration SET islocked = ?, lastmodified = ? where userid = ?";
		String sqlLockUpdateCitizen = "UPDATE citizenregistration SET islocked = ?, lastmodified = ? where citizenid = ?";
		String sqlUnlock = "update  registration set islocked = ? where userid in(select userid from registration where lastmodified < now() -'1 day'::interval )";
		String sqlUnlockCitizen = "update  citizenregistration set islocked = ? where citizenid in(select citizenid from citizenregistration where lastmodified < now() -'1 day'::interval )";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, userName);

			rs = preparedStatement.executeQuery();
			if (rs.next() == true) {
				token = "commission";
				isLocked = rs.getInt("islocked");
			} else {
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
				token = "citizen";
				preparedStatement = conn.prepareStatement(sqlCitizen);
				preparedStatement.setString(1, userName);

				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					isLocked = rs.getInt("islocked");
				}

			}
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (isLocked < 3 && token.equals("commission")) {
				count = isLocked + 1;
				preparedStatement = conn.prepareStatement(sqlLockUpdate);
				preparedStatement.setInt(1, count);
				preparedStatement.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
				preparedStatement.setString(3, userName);
				preparedStatement.executeUpdate();
				flag = false;
			} else if (isLocked < 3 && token.equals("citizen")) {
				count = isLocked + 1;
				preparedStatement = conn.prepareStatement(sqlLockUpdateCitizen);
				preparedStatement.setInt(1, count);
				preparedStatement.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
				preparedStatement.setString(3, userName);
				preparedStatement.executeUpdate();
				flag = false;
			} else if (isLocked == 3 && token.equals("commission")) {
				preparedStatement = conn.prepareStatement(sqlUnlock);
				preparedStatement.setInt(1, 0);
				preparedStatement.executeUpdate();
				flag = true;
			} else if (isLocked == 3 && token.equals("citizen")) {
				preparedStatement = conn.prepareStatement(sqlUnlockCitizen);
				preparedStatement.setInt(1, 0);
				preparedStatement.executeUpdate();
				flag = true;
			}

		} catch (Exception e) {
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

	
	public UserLoginAuthenticationDto getUserName(String userId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM registration WHERE userid= ? ";
		List<UserLoginAuthenticationDto> userLoginAuthenticationDto1 = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, userId);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				UserLoginAuthenticationDto userLoginAuthenticationDto = new UserLoginAuthenticationDto();
				userLoginAuthenticationDto.setUsername(rs.getString("name"));
				userLoginAuthenticationDto.setOrg(rs.getString("organisation"));
				userLoginAuthenticationDto.setCvoCode(rs.getString("cvocode"));
				userLoginAuthenticationDto1.add(userLoginAuthenticationDto);
			}

			for (UserLoginAuthenticationDto userLoginAuthenticationDto : userLoginAuthenticationDto1) {
				return userLoginAuthenticationDto;
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

		return null;

	}

	
	public List<OrganisationDto> findSection(String orgID) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT section,orgcod FROM sectiondetail WHERE organisationname1= ? ";
		List<OrganisationDto> listofOrganisationDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, orgID);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrganisationDto organisationDto = new OrganisationDto();
				organisationDto.setOrgSection(rs.getString("section"));
				organisationDto.setOrganisationCode(rs.getString("orgcod"));
				listofOrganisationDto.add(organisationDto);
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
					listofOrganisationDto.size();
		return listofOrganisationDto;
	}

	
	public List<ComplainDto> findAllDiary(String uSection, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,boirfinaldec,status,important FROM complain WHERE (dairystatus= ? or dairystatus = ANY(?)) and complainstatus = ?  ORDER BY complaindate desc";
		/*String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,status FROM complain WHERE   dairystatus= ? and complainstatus = ?  ORDER BY forwarddate";*/
		
		String[] arrOfStr = uSection.split("/");
		
		
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setArray(2, conn.createArrayOf("varchar", arrOfStr));
			preparedStatement.setInt(3, 0);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				
				
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
				
				/*if (rs.getString("boirfinaldec")=="null" || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec") == "" || rs.getString("boirfinaldec").length()==0) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}*/
				
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").equalsIgnoreCase("") || rs.getString("boirfinaldec").length()==4||rs.getString("boirfinaldec").equalsIgnoreCase("null")) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				
				complainDto.setStatus(rs.getInt("status"));
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

	public void updateComplainByDh(NotingDto notingDto, DairyDetailsDto dairyDetailsDto, Integer complaintnumber,
			String loginId,IpCaptureDto ipCaptureDto) throws ParseException {
		commonDaoImpl.insertUpdatedComplain(notingDto, dairyDetailsDto, complaintnumber, loginId,ipCaptureDto);
	}

	
	public void updateClearance(VigClearanceDto vigClearanceDto, String fileNo11, String loginId)throws ParseException {
		commonDaoImpl.insertUpdatedClearanceDetails( vigClearanceDto,  fileNo11,  loginId);
		
	}
	
	
	public UserLoginAuthenticationDto getCitizenAuthentication(String username) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM citizenregistration WHERE citizenid= ? ";
		List<UserLoginAuthenticationDto> userLoginAuthenticationDto1 = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, username);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				UserLoginAuthenticationDto userLoginAuthenticationDto = new UserLoginAuthenticationDto();
				userLoginAuthenticationDto.setUsername(rs.getString("citizenid"));
				userLoginAuthenticationDto.setPassword(rs.getString("password"));
				userLoginAuthenticationDto.setLoginRoll(rs.getString("logintype"));
				if (rs.getInt("isLocked") == 3) {
					userLoginAuthenticationDto.setAccountLocked(false);
				} else {
					userLoginAuthenticationDto.setAccountLocked(true);
				}

				if (rs.getInt("firstlogin") == 0) {
					userLoginAuthenticationDto.setFirstLogin(true);
				} else {
					userLoginAuthenticationDto.setFirstLogin(false);
				}
				Collection<String> role = Lists.newArrayList();
				role.add(rs.getString("logintype"));
				userLoginAuthenticationDto.setListRole(role);
				userLoginAuthenticationDto1.add(userLoginAuthenticationDto);
			}

			for (UserLoginAuthenticationDto userLoginAuthenticationDto : userLoginAuthenticationDto1) {
				return userLoginAuthenticationDto;

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

		return null;
	}

	public void updateComplainByOfficer(DairyDetailsDto dairyDetailsDto, Integer complaintnumber, String loginId) {
		commonDaoImpl.insertFiledDetails(dairyDetailsDto, complaintnumber, loginId);

	}

	public ReportDto findReport(String fromDate, String toDate, String uSection, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		

		String sql1 = "select count(*) from complain where  section = ? and  createddate between ? and ?";
		String sql2 = "select count(*) from complain where  section = ? and boirfinaldec in ('Filed','NA','IR') and  bofinaldecdate between ? and ?";
		String sql3 = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null  or  bofinaldecdate > ? )  and createddate <=  ? ";

		int recipts = 0;
		int tPending = 0;
		int tDispposed = 0;

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql1);
			preparedStatement.setString(1, uSection);
			preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				recipts = rs.getInt(1);
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

			preparedStatement = conn.prepareStatement(sql2);
			preparedStatement.setString(1, uSection);
			preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				tDispposed = rs.getInt(1);
			}
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			preparedStatement = conn.prepareStatement(sql3);
			preparedStatement.setString(1, uSection);
			preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				tPending = rs.getInt(1);
			}

			// broughtForward = jdbcTemplate.queryForObject(sql, Integer.class);

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
		ReportDto reportDto = new ReportDto();
		// reportDto.setBroughtForward(broughtForward);
		reportDto.setRecipt(recipts);
		reportDto.setTotalPending(tPending);
		reportDto.setTotalDispose(tDispposed);
		reportDto.setSection(uSection);

		return reportDto;

	}

	public Boolean findUserName(String userName) {
		Boolean flag = false;
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM registration WHERE userid= ? ";
		int total = 0;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, userName);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				total = rs.getInt(1);
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
		if (total == 1) {
			flag = true;
		} else {
			flag = false;
		}

		return flag;
	}

	public void updatePasswordBySystem(String userName, String password) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		String sqlUpdatePassword = "UPDATE registration SET password = ? where userid = ?";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sqlUpdatePassword);
			preparedStatement.setString(1, MyUtill.getMd5(MyUtill.getMd5(password)));
			preparedStatement.setString(2, userName);
			preparedStatement.executeUpdate();

		} catch (Exception e) {
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

	public Boolean findCitizenUserName(String userName) {
		Boolean flag = false;
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM citizenregistration WHERE citizenid= ? ";
		int total = 0;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, userName);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				total = rs.getInt(1);
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
		if (total == 1) {
			flag = true;
		} else {
			flag = false;
		}

		return flag;
	}

	public void updatePasswordBySystemForCitizen(String userName, String password) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		String sqlUpdatePassword = "UPDATE citizenregistration SET password = ? where citizenid = ?";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sqlUpdatePassword);
			preparedStatement.setString(1, MyUtill.getMd5(MyUtill.getMd5(password)));
			preparedStatement.setString(2, userName);
			preparedStatement.executeUpdate();

		} catch (Exception e) {
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

	public void updateLogs(String usernameParameter, Timestamp timestamp, String hostAddress, String message) {
		JdbcTemplate jdbcTemplate = null;
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			jdbcTemplate.update("INSERT INTO \"logs\"(username,ipaddress,status,time) VALUES(?,?,?,?)",
					usernameParameter, hostAddress, message, timestamp);

		} finally {
			MyUtill.connClose(jdbcTemplate);
		}

	}

	public boolean updateFirstProfile(String loginId, UserDto userDto) throws ParseException {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		ResultSet rs=null;
		boolean flag = false;
		PreparedStatement preparedStatement = null;

		String sqlUpdateProfile = "UPDATE registration SET mobilenumber=?,email=?,organisation=?,firstlogin=?,cvocode= ?,name=?,lastmodified=?,loginroll=? where userid = ?";
		/*String sqlUpdateProfile = "UPDATE registration SET password = ?,mobilenumber=?,email=?,organisation=?,passwordone=?,passwordtwo=?,loginroll=?,firstlogin=?,cvocode= ?,name=?,lastmodified=? where userid = ?";*/
		String sql = "select * from sectiondetail where organisationname1=?";
		try {
			if (!loginId.isEmpty()) {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, userDto.getOrganisation());
				rs=preparedStatement.executeQuery();
				
				while(rs.next())
				{
					userDto.setCvoCode(rs.getString("orgcod"));
				}
				preparedStatement.close();
				rs.close();
				
				preparedStatement = conn.prepareStatement(sqlUpdateProfile);
				/*preparedStatement.setString(1, userDto.getPassword());*/
				preparedStatement.setString(1, userDto.getMobileNumber());
				preparedStatement.setString(2, userDto.getUserEmail());
				preparedStatement.setString(3, userDto.getOrganisation());
				/*preparedStatement.setString(5, userDto.getPassword());*/
				/*preparedStatement.setString(6, userDto.getPassword());*/
				
				
				if(userDto.isFirstLogin()) 
				{
					preparedStatement.setInt(4, 0);
				}
				else
				{
					preparedStatement.setInt(4, 1);
				}
				
				preparedStatement.setString(5, userDto.getCvoCode());
				preparedStatement.setString(6, userDto.getUserName());
				preparedStatement.setTimestamp(7, getTimeStamp());
				preparedStatement.setString(8, userDto.getLoginType());
				preparedStatement.setString(9, loginId);
				preparedStatement.executeUpdate();
				flag = true;
			} else {
				flag = false;
			}

		} catch (Exception e) {
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

	public boolean updateCitizenProfile(String citizenId, CitizenDto citizenDto) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		boolean flag = false;
		PreparedStatement preparedStatement = null;

		String sqlUpdateProfile = "UPDATE citizenregistration SET password = ?,securityquestion=?,securityanswer=?,address1=?,address2=?,state=?,city=?,email=?,pincode=?,contactnumber =?,passwordone=?,passwordtwo=?,firstlogin=? where citizenid = ?";
		try {
			if (!citizenId.isEmpty()) {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sqlUpdateProfile);
				preparedStatement.setString(1, citizenDto.getPassword());
				preparedStatement.setString(2, citizenDto.getSecurityQuestion());
				preparedStatement.setString(3, citizenDto.getSecurityAnswer());
				preparedStatement.setString(4, citizenDto.getAddress1());
				preparedStatement.setString(5, citizenDto.getAddress2());
				preparedStatement.setString(6, citizenDto.getState());
				preparedStatement.setString(7, citizenDto.getCity());
				preparedStatement.setString(8, citizenDto.getCitizenEmail());
				preparedStatement.setInt(9, citizenDto.getPincode());
				preparedStatement.setString(10, citizenDto.getContactNumber());
				preparedStatement.setString(11, citizenDto.getPassword());
				preparedStatement.setString(12, citizenDto.getPassword());
				preparedStatement.setInt(13, 1);
				preparedStatement.setString(14, citizenId);
				preparedStatement.executeUpdate();
				flag = true;
			} else {
				flag = false;
			}

		} catch (Exception e) {
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


	public void sendToDataRecord(Integer complaintnumber, String loginId, IpCaptureDto ipCaptureDto) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String sqlClosedComplain = "UPDATE complain set complainstatus = ?,closedby = ? ,ipcapture =? ,byuserid=?,ondate=?WHERE complaintnumber = ?";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sqlClosedComplain);
			preparedStatement.setInt(1, 1 );
			preparedStatement.setString(2, loginId );
			preparedStatement.setString(3, ipCaptureDto.getIpAddress() );
			preparedStatement.setString(4, ipCaptureDto.getByUserId() );
			preparedStatement.setString(5, ipCaptureDto.getOnDate() );
			preparedStatement.setInt(6, complaintnumber );
			preparedStatement.executeUpdate();
		} catch (Exception e) {
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

	public void openComplainFromDataRecord(Integer complaintnumber, String loginId) {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;

		String sqlClosedComplain = "UPDATE complain set complainstatus = ?,closedby = ? WHERE complaintnumber = ?";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sqlClosedComplain);
			preparedStatement.setInt(1, 0 );
			preparedStatement.setString(2, loginId );
			preparedStatement.setInt(3, complaintnumber );
			preparedStatement.executeUpdate();
		} catch (Exception e) {
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

	public List<UserLoginAuthenticationDto>  findRolltype(String loginvalue) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "select distinct(logintype),userid,loginroll from registration where userid=?";
		List<UserLoginAuthenticationDto> userLoginAuthenticationDto = new ArrayList();	
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginvalue);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				UserLoginAuthenticationDto userdto = new UserLoginAuthenticationDto();
				
				userdto.setLoginRoll(rs.getString("logintype"));
				userdto.setName(rs.getString("userid"));
				userdto.setDesiganation(rs.getString("loginroll"));
				userLoginAuthenticationDto.add(userdto);
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
		userLoginAuthenticationDto.size();
		return userLoginAuthenticationDto;
	}

	//Function to update citizen profile as on 27-03-2018
	public boolean citizenProfileUpdation(String citizenId, CitizenDto citizenDto) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		boolean flag = false;
		PreparedStatement preparedStatement = null;
		String sqlUpdateProfile="";
		if(!citizenDto.getSecurityQuestion().equalsIgnoreCase(""))
		{
		 sqlUpdateProfile = "UPDATE citizenregistration SET securityquestion=?,securityanswer=?,address1=?,address2=?,state=?,city=?,email=?,pincode=?,contactnumber =? where citizenid = ?";
		
		}
		else
		{
			sqlUpdateProfile = "UPDATE citizenregistration SET address1=?,address2=?,state=?,city=?,email=?,pincode=?,contactnumber =? where citizenid = ?";	
		}
		
		
		try {
			if (!citizenId.isEmpty()) {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sqlUpdateProfile);
				if(!citizenDto.getSecurityQuestion().equalsIgnoreCase(""))
				{
					preparedStatement.setString(1, citizenDto.getSecurityQuestion());
					preparedStatement.setString(2, citizenDto.getSecurityAnswer());
					preparedStatement.setString(3, citizenDto.getAddress1());
					preparedStatement.setString(4, citizenDto.getAddress2());
					preparedStatement.setString(5, citizenDto.getState());
					preparedStatement.setString(6, citizenDto.getCity());
					preparedStatement.setString(7, citizenDto.getCitizenEmail());
					preparedStatement.setInt(8, citizenDto.getPincode());
					preparedStatement.setString(9, citizenDto.getContactNumber());
					preparedStatement.setString(10, citizenId);
				}
				else
				{					
					preparedStatement.setString(1, citizenDto.getAddress1());
					preparedStatement.setString(2, citizenDto.getAddress2());
					preparedStatement.setString(3, citizenDto.getState());
					preparedStatement.setString(4, citizenDto.getCity());
					preparedStatement.setString(5, citizenDto.getCitizenEmail());
					preparedStatement.setInt(6, citizenDto.getPincode());
					preparedStatement.setString(7, citizenDto.getContactNumber());
					preparedStatement.setString(8, citizenId);
				}
				preparedStatement.executeUpdate();
				flag = true;
			} else {
				flag = false;
			}

		} catch (Exception e) {
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


	public static Timestamp getTimeStamp()
	{
	    // Calendar information
	    Calendar calendar       = Calendar.getInstance();
	    java.util.Date now      = calendar.getTime();
	    Timestamp dbStamp       = new Timestamp(now.getTime());
	    return dbStamp;
	}
	
	public List<ComplainDto> findAllDiaryImpInbox(String uSection, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,boirfinaldec,status,important FROM complain WHERE (dairystatus= ? or dairystatus = ANY(?)) and complainstatus = ? and important=true ORDER BY complaindate desc";
		/*String sql = "SELECT organization,recipientname,complaintnumber,complaint,complaindate,createddate,rolltype,status FROM complain WHERE   dairystatus= ? and complainstatus = ?  ORDER BY forwarddate";*/
		
		String[] arrOfStr = uSection.split("/");
		
		
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, loginId);
			preparedStatement.setArray(2, conn.createArrayOf("varchar", arrOfStr));
			preparedStatement.setInt(3, 0);
			rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplainNo(rs.getString("complaintnumber"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setRecipientName(rs.getString("recipientname"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setComplaindate(rs.getString("complaindate"));
				
				
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
				
				/*if (rs.getString("boirfinaldec")=="null" || rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec") == "" || rs.getString("boirfinaldec").length()==0) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}*/
				
				if (rs.getString("boirfinaldec") == null || rs.getString("boirfinaldec").equalsIgnoreCase("") || rs.getString("boirfinaldec").length()==4||rs.getString("boirfinaldec").equalsIgnoreCase("null")) {
					complainDto.setDecision("Pending");
				} else {
					complainDto.setDecision(rs.getString("boirfinaldec"));
				}
				
				complainDto.setStatus(rs.getInt("status"));
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
}
