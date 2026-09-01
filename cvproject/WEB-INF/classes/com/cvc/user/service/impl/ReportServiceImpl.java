package com.cvc.user.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.cvc.dto.ComplainDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.ForwardDto;
import com.cvc.dto.MonthlyCommonDto;
import com.cvc.dto.OfficerDto;
import com.cvc.dto.OrganisationDto;
import com.cvc.dto.TransferDto;
import com.cvc.dto.UserDto;
import com.cvc.util.MyUtill;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

@Service
public class ReportServiceImpl {

	@Autowired
	DataSource dataSource;

	@Autowired
	CommonServiceImpl commonServiceImpl;
	
	public List<ComplainDto> findAllPendingComplain(String loginId, String fromDate, String toDate, String uSection) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "select * from complain where  section = ?  and ( bofinaldecdate is null  or  bofinaldecdate > ? )   ORDER BY forwarddate DESC";
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, uSection);
			preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
				complainDto.setDesignation(rs.getString("designation"));
				complainDto.setDairyStatus(rs.getString("dairystatus"));
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

	public List<ComplainDto> findAllDisposedComplain(String loginId, String fromDate, String toDate, String uSection) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sql = "select organization,complaint,createddate,sendername,complaintagainstname,designation,dairystatus,closedby from complain where  section = ? and boirfinaldec in ('Filed','NA','IR') and  bofinaldecdate between ? and ? ORDER BY forwarddate DESC";
		List<ComplainDto> listOfComplainDto = Lists.newArrayList();

		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, uSection);
			preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto complainDto = new ComplainDto();
				complainDto.setOrganizationName(rs.getString("organization"));
				complainDto.setComplaint(rs.getString("complaint"));
				complainDto.setCreatedDate(rs.getString("createddate"));
				complainDto.setSenderName(rs.getString("sendername"));
				complainDto.setComplaintAgainstName(rs.getString("complaintagainstname"));
				complainDto.setDesignation(rs.getString("designation"));
				if(rs.getString("closedby")==""||rs.getString("closedby")==null||rs.getString("closedby").isEmpty()) 
				{
					complainDto.setDairyStatus("Open With :"+rs.getString("dairystatus"));
				}else {
				complainDto.setDairyStatus(rs.getString("closedby"));
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
	
	@SuppressWarnings("resource")
	public List<ComplainDto> getInterimIRList(String section) {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		 
		String interimIrSql = "select * from complain where bodecision='IR' and bofinaldecdate is null and boirfinaldec is null and section=?";
		List<ComplainDto> interimIrListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(interimIrSql);
			preparedStatement.setString(1, section);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto interimIrDto = new ComplainDto();
				interimIrDto.setComplaint(rs.getString("complaint"));
				interimIrDto.setComplaindate(rs.getString("complaindate")); 
				interimIrDto.setCreatedDate(rs.getString("createdDate"));
				interimIrDto.setBoDecisionDate(rs.getString("boDecisionDate"));
				interimIrDto.setDairyStatus(rs.getString("dairyStatus"));
				interimIrDto.setDecision(rs.getString("bodecision"));
				interimIrDto.setFileNo(rs.getString("filenumber"));
				interimIrDto.setSenderName(rs.getString("sendername"));
				
				interimIrListDto.add(interimIrDto);
				
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
		return interimIrListDto;
	
	}
	
	
	
	@SuppressWarnings("resource")
	public List<ComplainDto> getTotalPendingDetailsbySection(String fromDate, String toDate,String diaryStatus,String section) {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		 
		String pendingSql = "select * from complain where section=? and dairystatus = ?  and ( bofinaldecdate is null  or  bofinaldecdate > ? )  and createddate <=  ? ";
		List<ComplainDto> monthlyComplainReportDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(pendingSql);
			preparedStatement.setString(1, section);
			preparedStatement.setString(2, diaryStatus);
			preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
			preparedStatement.setDate(4,java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto pendingDto = new ComplainDto();
				pendingDto.setSection(rs.getString("section"));
				pendingDto.setComplaint(rs.getString("complaint"));
				pendingDto.setOrganizationName(rs.getString("organization"));
				pendingDto.setComplaindate(rs.getString("complaindate"));
				pendingDto.setCreatedDate(rs.getString("createddate"));
				if(rs.getInt("complainstatus")==0)
				{
				pendingDto.setDairyStatus(rs.getString("dairystatus"));
				}
				else
				{
					pendingDto.setDairyStatus(rs.getString("dairystatus")+": Sent to Record Room");
				}
				monthlyComplainReportDto.add(pendingDto);
				
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
		return monthlyComplainReportDto;
	
	}
	
	
	public List<MonthlyCommonDto> getTotalPendingCountIR(String fromDate, String toDate) {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		 
		String detailIRSql = "select count(*),organization from complain where  boirfinaldec = 'IR' and  bofinaldecdate between ? and ? group by organization";
	
		List<MonthlyCommonDto> monthlyComplainReportIRDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(detailIRSql);
			preparedStatement.setDate(1, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(2,java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				MonthlyCommonDto pendingIRDto = new MonthlyCommonDto();
				pendingIRDto.setOther(rs.getInt(1));				
				pendingIRDto.setOrganization(rs.getString("organization"));
				
				monthlyComplainReportIRDto.add(pendingIRDto);
				
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
		return monthlyComplainReportIRDto;
	
	}
	
	
	@SuppressWarnings("resource")
	public List<ComplainDto> getTotalPendingIRDetailsbySection(String fromDate, String toDate,String index) {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		 
		String detailIRSql = "select * from complain where  section = ? and  boirfinaldec = 'IR' and bofinaldecdate between ? and ?";
		String totalIRsql="select * from complain where boirfinaldec = 'IR' and bofinaldecdate between ? and ?";
		List<ComplainDto> monthlyComplainReportIRDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(detailIRSql);
			preparedStatement.setString(1, index);
			preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(3,java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto pendingIRDto = new ComplainDto();
				pendingIRDto.setSection(rs.getString("section"));
				pendingIRDto.setComplaint(rs.getString("complaint"));
				pendingIRDto.setOrganizationName(rs.getString("organization"));
				pendingIRDto.setComplaindate(rs.getString("complaindate"));
				pendingIRDto.setCreatedDate(rs.getString("createddate"));
				pendingIRDto.setIr(rs.getString("filenumber"));
				pendingIRDto.setBoDecisionDate(rs.getString("bofinaldecdate"));
				if(rs.getInt("complainstatus")==0)
				{
					pendingIRDto.setDairyStatus(rs.getString("dairystatus"));
				}
				else
				{
					pendingIRDto.setDairyStatus(rs.getString("dairystatus")+": Sent to Record Room");
				}
				monthlyComplainReportIRDto.add(pendingIRDto);
				
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
		return monthlyComplainReportIRDto;
	
	}
	
	
	
	@SuppressWarnings("resource")
public List<MonthlyCommonDto> getComplaintTypeReport(String fromDate, String toDate) {

		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<MonthlyCommonDto> complaintypeListforcitizenDto = Lists.newArrayList();
		
		
		 
		String complainofcitizenSql = "select count(*) , rolltype from complain where rolltype='CITIZEN' and createddate between ? and ?  group by rolltype";
		String complainofdairySql = "select count(*) from complain where (rolltype='Complaint Cell' or rolltype='Diary' )and createddate between ? and ?";
		String complainofhelplineSql = "select count(*),rolltype from complain where rolltype='HelpLine' and createddate between ? and ? group by rolltype";
		 
		
		
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(complainofcitizenSql);
			preparedStatement.setDate(1,java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(2,java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

		
		while (rs.next()) {
			MonthlyCommonDto monthlyCommonReportDto = new MonthlyCommonDto();
			monthlyCommonReportDto.setIr(rs.getInt(1));
			monthlyCommonReportDto.setBoName("Citizen");
			/*monthlyCommonReportDto.setBoName(rs.getString("rolltype"));*/
			complaintypeListforcitizenDto.add(monthlyCommonReportDto);
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
		
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(complainofdairySql);
			preparedStatement.setDate(1,java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(2,java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();
			String rolltype=null;
		
		while (rs.next()) {
			MonthlyCommonDto monthlyCommonReportDto = new MonthlyCommonDto();
			monthlyCommonReportDto.setIr(rs.getInt(1));
			monthlyCommonReportDto.setBoName("Diary");
			complaintypeListforcitizenDto.add(monthlyCommonReportDto);
			
		}
		
			} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
		
		
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(complainofhelplineSql);
			preparedStatement.setDate(1,java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(2,java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

		
		while (rs.next()) {
			MonthlyCommonDto monthlyCommonReportDto = new MonthlyCommonDto();
			monthlyCommonReportDto.setIr(rs.getInt(1));
			monthlyCommonReportDto.setBoName(rs.getString("rolltype"));
			complaintypeListforcitizenDto.add(monthlyCommonReportDto);
		}
		
			} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
		
	return complaintypeListforcitizenDto;

	}
	
	@SuppressWarnings("resource")
	public List<MonthlyCommonDto> getmonthlyReportforCoord(String fromDate, String toDate) {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<MonthlyCommonDto>listMonthlyCommonDto=Lists.newArrayList();
		

		String broughtForwardSql = "select count(*) from complain where section =  ? and createddate < ? and ( bofinaldecdate is null or  bofinaldecdate >= ?)";
		String totalRecieptSql = "select count(*) from complain where  section = ? and  createddate between ? and ?";
		String totalDispossedSql = "select count(*) from complain where  section = ? and boirfinaldec in ('Filed','NA','IR') and  bofinaldecdate between ? and ?";
		String naSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'NA' and bofinaldecdate between ? and ?";
		String filedSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'Filed' and bofinaldecdate between ? and ?";
		String irSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'IR' and bofinaldecdate between ? and ?";
		String othersSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'OTHER' and bofinaldecdate between ? and ?";
		String lessThanOneMonthSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null or  bofinaldecdate > ? ) and createddate between ? and ?";		
		String betweenOneAndThreeMonthSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null or  bofinaldecdate > ? ) and ( createddate >= ? and createddate < ? )";
		String greaterThanThreeMonthSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null or  bofinaldecdate > ? ) and createddate < ?";
		String pendingSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null  or  bofinaldecdate > ? )  and createddate <=  ? ";
		
		String signedSql = "select count(*) from complain where  section = ? and complainttype in ('Signed') and  createddate between ? and ?";		
		String pseudonymousSql = "select count(*) from complain where  section = ? and complainttype in ('Pseudonymous') and  createddate between ? and ?";
		String anonymousSql = "select count(*) from complain where  section = ? and complainttype in ('Anonymous') and  createddate between ? and ?";
		String typependingSql = "select((select count(*) from complain where section=? and createddate between ? and ?) -(select count(*) from complain where section=? and complainttype in ('Signed','Pseudonymous','Anonymous') and createddate between ? and ?))";
		
		

	     int broughtForward=0;
		 int receipt=0;
		 int totalDisposal=0;
		 int totalPending=0;
		 int ir=0;
		 int fd=0;
		 int na=0;
		 int other = 0;
		 int pendingLastMonth=0;
		 int pendingLastThreeMonth=0;
		 int pendingMoreThanThreeMonth=0;
		 int totalMonth=0;
		 
		 int signed=0;
		 int pseudonymous=0;
		 int anonymous=0;
		 int pending=0;
		
for(int i=1;i<=10;i++){
	MonthlyCommonDto monthlyCommonReportDto = new MonthlyCommonDto();
	
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(broughtForwardSql);
			if(i==10) {
				preparedStatement.setString(1,"Cordn-2");
			}
			else {
				preparedStatement.setString(1, String.valueOf(i));
			}
			
			preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(3, java.sql.Date.valueOf(fromDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				monthlyCommonReportDto.setBroughtForward(rs.getInt(1));
				broughtForward=broughtForward+rs.getInt(1);

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
		}

			try {
				preparedStatement = conn.prepareStatement(totalRecieptSql);
				
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				
				
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setReceipt(rs.getInt(1));
					receipt=receipt+rs.getInt(1);
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
				} /**
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
			}

			try {
				preparedStatement = conn.prepareStatement(totalDispossedSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setTotalDisposal(rs.getInt(1));
					totalDisposal=totalDisposal+rs.getInt(1);

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
			}

			try {
				preparedStatement = conn.prepareStatement(filedSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setFd(rs.getInt(1));
					fd=fd+rs.getInt(1);
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

			}
			
			
			try {
				preparedStatement = conn.prepareStatement(naSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setNa(rs.getInt(1));
					na=na+rs.getInt(1);

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

			}

			try {
				preparedStatement = conn.prepareStatement(irSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setIr(rs.getInt(1));
					ir=ir+rs.getInt(1);

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

			}
			
			try {
				preparedStatement = conn.prepareStatement(othersSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setOther(rs.getInt(1));
					other=other+rs.getInt(1);

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

			}
			
			
			

			try {
				preparedStatement = conn.prepareStatement(lessThanOneMonthSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(dateManipulation(-1,toDate))); 
				preparedStatement.setDate(4, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPendingLastMonth(rs.getInt(1));
					pendingLastMonth=pendingLastMonth+rs.getInt(1);
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
			}

			try {
				preparedStatement = conn.prepareStatement(betweenOneAndThreeMonthSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
			    preparedStatement.setDate(3, java.sql.Date.valueOf(dateManipulation(-3,toDate))); 
				preparedStatement.setDate(4, java.sql.Date.valueOf(dateManipulation(-1,toDate)));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPendingLastThreeMonth(rs.getInt(1));
					pendingLastThreeMonth=pendingLastThreeMonth+rs.getInt(1);

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
			}

			try {
				preparedStatement = conn.prepareStatement(greaterThanThreeMonthSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(dateManipulation(-3,toDate)));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPendingMoreThanThreeMonth(rs.getInt(1));
					pendingMoreThanThreeMonth=pendingMoreThanThreeMonth+rs.getInt(1);
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
				
			}
			try {
				preparedStatement = conn.prepareStatement(signedSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setSigned(rs.getInt(1));
					signed=signed+rs.getInt(1);

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
			}

			try {
				preparedStatement = conn.prepareStatement(pseudonymousSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPseudonymous(rs.getInt(1));
					pseudonymous=pseudonymous+rs.getInt(1);

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
			}
			
			try {
				preparedStatement = conn.prepareStatement(anonymousSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setAnonymous(rs.getInt(1));
					anonymous=anonymous+rs.getInt(1);

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
			}
			
			
			try {
				preparedStatement = conn.prepareStatement(typependingSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				if(i==10)
				{
					preparedStatement.setString(4, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(4, String.valueOf(i));
				}
				preparedStatement.setDate(5, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(6, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPending(rs.getInt(1));
					pending=pending+rs.getInt(1);

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
			}
			
			
			try {
				preparedStatement = conn.prepareStatement(pendingSql);
				if(i==10)
				{
					preparedStatement.setString(1, "Cordn-2");
				}
				else
				{
					preparedStatement.setString(1, String.valueOf(i));
				}
				preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
				preparedStatement.setDate(3,java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setTotalPending(rs.getInt(1));
					totalPending=totalPending+rs.getInt(1);

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
			}
			
			listMonthlyCommonDto.add(monthlyCommonReportDto);
}

    MonthlyCommonDto monthlyCommonReportDto = new MonthlyCommonDto(); 
    monthlyCommonReportDto.setBroughtForward(broughtForward);
    monthlyCommonReportDto.setFd(fd);
    monthlyCommonReportDto.setIr(ir);
    monthlyCommonReportDto.setNa(na);
    monthlyCommonReportDto.setOther(other);
    monthlyCommonReportDto.setPendingLastMonth(pendingLastMonth);
    monthlyCommonReportDto.setPendingLastThreeMonth(pendingLastThreeMonth);      
    monthlyCommonReportDto.setPendingMoreThanThreeMonth(pendingMoreThanThreeMonth);
    monthlyCommonReportDto.setReceipt(receipt);
    monthlyCommonReportDto.setTotalDisposal(totalDisposal);
    monthlyCommonReportDto.setTotalMonth(totalMonth);
    monthlyCommonReportDto.setTotalPending(totalPending);
    monthlyCommonReportDto.setAnonymous(anonymous);
    monthlyCommonReportDto.setPseudonymous(pseudonymous);
    monthlyCommonReportDto.setSigned(signed);
    monthlyCommonReportDto.setPending(pending);
    listMonthlyCommonDto.add(monthlyCommonReportDto);
    
    MyUtill.connClose(jdbcTemplate);
	return listMonthlyCommonDto;

	}
		

	@SuppressWarnings("resource")
	public List<MonthlyCommonDto> getMonthlyReoprt(String fromDate, String toDate,String section) {
		
		

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<MonthlyCommonDto>listMonthlyCommonDto=Lists.newArrayList();
		

		String broughtForwardSql = "select count(*) from complain where section =  ? and createddate < ? and ( bofinaldecdate is null or  bofinaldecdate >= ?)";
		String totalRecieptSql = "select count(*) from complain where  section = ? and  createddate between ? and ?";
		String totalDispossedSql = "select count(*) from complain where  section = ? and boirfinaldec in ('Filed','NA','IR') and  bofinaldecdate between ? and ?";
		String naSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'NA' and bofinaldecdate between ? and ?";
		String filedSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'Filed' and bofinaldecdate between ? and ?";
		String irSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'IR' and bofinaldecdate between ? and ?";
		String othersSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'OTHER' and bofinaldecdate between ? and ?";
		String lessThanOneMonthSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null or  bofinaldecdate > ? ) and createddate between ? and ?";		
		String betweenOneAndThreeMonthSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null or  bofinaldecdate > ? ) and ( createddate >= ? and createddate < ? )";
		String greaterThanThreeMonthSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null or  bofinaldecdate > ? ) and createddate < ?";
		String pendingSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null  or  bofinaldecdate > ? )  and createddate <=  ? ";
		
		String signedSql = "select count(*) from complain where  section = ? and complainttype in ('Signed') and  createddate between ? and ?";		
		String pseudonymousSql = "select count(*) from complain where  section = ? and complainttype in ('Pseudonymous') and  createddate between ? and ?";
		String anonymousSql = "select count(*) from complain where  section = ? and complainttype in ('Anonymous') and  createddate between ? and ?";
		String typependingSql = "select((select count(*) from complain where section=? and createddate between ? and ?) -(select count(*) from complain where section=? and complainttype in ('Signed','Pseudonymous','Anonymous') and createddate between ? and ?))";
		
		

		MonthlyCommonDto monthlyCommonReportDto = new MonthlyCommonDto();
		
			try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(broughtForwardSql);
				preparedStatement.setString(1, section);
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(fromDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setBroughtForward(rs.getInt(1));
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
			}

				try {
					preparedStatement = conn.prepareStatement(totalRecieptSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setReceipt(rs.getInt(1));
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
					} /**
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
				}

				try {
					preparedStatement = conn.prepareStatement(totalDispossedSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setTotalDisposal(rs.getInt(1));
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
				}

				try {
					preparedStatement = conn.prepareStatement(filedSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setFd(rs.getInt(1));
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

				}
				
				
				try {
					preparedStatement = conn.prepareStatement(naSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setNa(rs.getInt(1));
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

				}

				try {
					preparedStatement = conn.prepareStatement(irSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setIr(rs.getInt(1));
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

				}
				
				try {
					preparedStatement = conn.prepareStatement(othersSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setOther(rs.getInt(1));
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

				}
				
				
				

				try {
					preparedStatement = conn.prepareStatement(lessThanOneMonthSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(dateManipulation(-1,toDate))); 
					preparedStatement.setDate(4, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setPendingLastMonth(rs.getInt(1));
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
				}

				try {
					preparedStatement = conn.prepareStatement(betweenOneAndThreeMonthSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
				    preparedStatement.setDate(3, java.sql.Date.valueOf(dateManipulation(-3,toDate))); 
					preparedStatement.setDate(4, java.sql.Date.valueOf(dateManipulation(-1,toDate)));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setPendingLastThreeMonth(rs.getInt(1));
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
				}

				try {
					preparedStatement = conn.prepareStatement(greaterThanThreeMonthSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(dateManipulation(-3,toDate)));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setPendingMoreThanThreeMonth(rs.getInt(1));
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
					
				}
				try {
					preparedStatement = conn.prepareStatement(signedSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setSigned(rs.getInt(1));
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
				}

				try {
					preparedStatement = conn.prepareStatement(pseudonymousSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setPseudonymous(rs.getInt(1));
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
				}
				
				try {
					preparedStatement = conn.prepareStatement(anonymousSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setAnonymous(rs.getInt(1));
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
				}
				
				
				try {
					preparedStatement = conn.prepareStatement(typependingSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
					preparedStatement.setString(4, section);
					preparedStatement.setDate(5, java.sql.Date.valueOf(fromDate));
					preparedStatement.setDate(6, java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setPending(rs.getInt(1));
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
				}
				
				
				try {
					preparedStatement = conn.prepareStatement(pendingSql);
					preparedStatement.setString(1, section);
					preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
					preparedStatement.setDate(3,java.sql.Date.valueOf(toDate));
					rs = preparedStatement.executeQuery();

					while (rs.next()) {
						monthlyCommonReportDto.setTotalPending(rs.getInt(1));
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
				}
				
				listMonthlyCommonDto.add(monthlyCommonReportDto);
				MyUtill.connClose(jdbcTemplate);
				return listMonthlyCommonDto;
/*
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		List<MonthlyCommonDto>listMonthlyCommonDto=Lists.newArrayList();
		

		String broughtForwardSql = "select count(*) from complain where section =  ? and createddate < ? and ( bofinaldecdate is null or  bofinaldecdate >= ?)";
		String totalRecieptSql = "select count(*) from complain where  section = ? and  createddate between ? and ?";
		String totalDispossedSql = "select count(*) from complain where  section = ? and boirfinaldec in ('Filed','NA','IR') and  bofinaldecdate between ? and ?";
		String naSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'NA' and bofinaldecdate between ? and ?";
		String filedSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'Filed' and bofinaldecdate between ? and ?";
		String irSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'IR' and bofinaldecdate between ? and ?";
		String othersSql = "select count(*) from complain where  section = ? and  boirfinaldec = 'OTHER' and bofinaldecdate between ? and ?";
		String lessThanOneMonthSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null or  bofinaldecdate > ? ) and createddate between ? and ?";		
		String betweenOneAndThreeMonthSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null or  bofinaldecdate > ? ) and ( createddate >= ? and createddate < ? )";
		String greaterThanThreeMonthSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null or  bofinaldecdate > ? ) and createddate < ?";
		String pendingSql = "select count(*) from complain where  section = ?  and ( bofinaldecdate is null  or  bofinaldecdate > ? )  and createddate <=  ? ";
		
		String signedSql = "select count(*) from complain where  section = ? and complainttype in ('Signed') and  createddate between ? and ?";		
		String pseudonymousSql = "select count(*) from complain where  section = ? and complainttype in ('Pseudonymous') and  createddate between ? and ?";
		String anonymousSql = "select count(*) from complain where  section = ? and complainttype in ('Anonymous') and  createddate between ? and ?";
		String typependingSql = "select((select count(*) from complain where section=? and createddate between ? and ?) -(select count(*) from complain where section=? and complainttype in ('Signed','Pseudonymous','Anonymous') and createddate between ? and ?))";
		
		

	     int broughtForward=0;
		 int receipt=0;
		 int totalDisposal=0;
		 int totalPending=0;
		 int ir=0;
		 int fd=0;
		 int na=0;
		 int other = 0;
		 int pendingLastMonth=0;
		 int pendingLastThreeMonth=0;
		 int pendingMoreThanThreeMonth=0;
		 int totalMonth=0;
		 
		 int signed=0;
		 int pseudonymous=0;
		 int anonymous=0;
		 int pending=0;
		
for(int i=1;i<10;i++){
	MonthlyCommonDto monthlyCommonReportDto = new MonthlyCommonDto();
	
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(broughtForwardSql);
			preparedStatement.setString(1, String.valueOf(i));
			preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(3, java.sql.Date.valueOf(fromDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				monthlyCommonReportDto.setBroughtForward(rs.getInt(1));
				broughtForward=broughtForward+rs.getInt(1);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			*//**
			 * Close the resultSet
			 *//*
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			*//**
			 * Close the preparedStatement
			 *//*
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

			try {
				preparedStatement = conn.prepareStatement(totalRecieptSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setReceipt(rs.getInt(1));
					receipt=receipt+rs.getInt(1);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} *//**
					 * Close the preparedStatement
					 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

			try {
				preparedStatement = conn.prepareStatement(totalDispossedSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setTotalDisposal(rs.getInt(1));
					totalDisposal=totalDisposal+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

			try {
				preparedStatement = conn.prepareStatement(filedSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setFd(rs.getInt(1));
					fd=fd+rs.getInt(1);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}
			
			
			try {
				preparedStatement = conn.prepareStatement(naSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setNa(rs.getInt(1));
					na=na+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}

			try {
				preparedStatement = conn.prepareStatement(irSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setIr(rs.getInt(1));
					ir=ir+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}
			
			try {
				preparedStatement = conn.prepareStatement(othersSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setOther(rs.getInt(1));
					other=other+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}
			
			
			

			try {
				preparedStatement = conn.prepareStatement(lessThanOneMonthSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(dateManipulation(-1,toDate))); 
				preparedStatement.setDate(4, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPendingLastMonth(rs.getInt(1));
					pendingLastMonth=pendingLastMonth+rs.getInt(1);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

			try {
				preparedStatement = conn.prepareStatement(betweenOneAndThreeMonthSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
			    preparedStatement.setDate(3, java.sql.Date.valueOf(dateManipulation(-3,toDate))); 
				preparedStatement.setDate(4, java.sql.Date.valueOf(dateManipulation(-1,toDate)));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPendingLastThreeMonth(rs.getInt(1));
					pendingLastThreeMonth=pendingLastThreeMonth+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

			try {
				preparedStatement = conn.prepareStatement(greaterThanThreeMonthSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(dateManipulation(-3,toDate)));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPendingMoreThanThreeMonth(rs.getInt(1));
					pendingMoreThanThreeMonth=pendingMoreThanThreeMonth+rs.getInt(1);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
			try {
				preparedStatement = conn.prepareStatement(signedSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setSigned(rs.getInt(1));
					signed=signed+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

			try {
				preparedStatement = conn.prepareStatement(pseudonymousSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPseudonymous(rs.getInt(1));
					pseudonymous=pseudonymous+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			try {
				preparedStatement = conn.prepareStatement(anonymousSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setAnonymous(rs.getInt(1));
					anonymous=anonymous+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			
			try {
				preparedStatement = conn.prepareStatement(typependingSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
				preparedStatement.setString(4, String.valueOf(i));
				preparedStatement.setDate(5, java.sql.Date.valueOf(fromDate));
				preparedStatement.setDate(6, java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setPending(rs.getInt(1));
					pending=pending+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			
			try {
				preparedStatement = conn.prepareStatement(pendingSql);
				preparedStatement.setString(1, String.valueOf(i));
				preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
				preparedStatement.setDate(3,java.sql.Date.valueOf(toDate));
				rs = preparedStatement.executeQuery();

				while (rs.next()) {
					monthlyCommonReportDto.setTotalPending(rs.getInt(1));
					totalPending=totalPending+rs.getInt(1);

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				*//**
				 * Close the resultSet
				 *//*
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				*//**
				 * Close the preparedStatement
				 *//*
				if (preparedStatement != null) {
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				*//**
				 * Close the connection
				 *//*
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			listMonthlyCommonDto.add(monthlyCommonReportDto);
}

    MonthlyCommonDto monthlyCommonReportDto = new MonthlyCommonDto(); 
    monthlyCommonReportDto.setBroughtForward(broughtForward);
    monthlyCommonReportDto.setFd(fd);
    monthlyCommonReportDto.setIr(ir);
    monthlyCommonReportDto.setNa(na);
    monthlyCommonReportDto.setOther(other);
    monthlyCommonReportDto.setPendingLastMonth(pendingLastMonth);
    monthlyCommonReportDto.setPendingLastThreeMonth(pendingLastThreeMonth);      
    monthlyCommonReportDto.setPendingMoreThanThreeMonth(pendingMoreThanThreeMonth);
    monthlyCommonReportDto.setReceipt(receipt);
    monthlyCommonReportDto.setTotalDisposal(totalDisposal);
    monthlyCommonReportDto.setTotalMonth(totalMonth);
    monthlyCommonReportDto.setTotalPending(totalPending);
    monthlyCommonReportDto.setAnonymous(anonymous);
    monthlyCommonReportDto.setPseudonymous(pseudonymous);
    monthlyCommonReportDto.setSigned(signed);
    monthlyCommonReportDto.setPending(pending);
    listMonthlyCommonDto.add(monthlyCommonReportDto);
    
    MyUtill.connClose(jdbcTemplate);
	return listMonthlyCommonDto;*/

	}

	private String dateManipulation(int months,String currentDate) {
		Date date = null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = format.parse(currentDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, months);
		
		
		return format.format(cal.getTime());

	}

	public List<ComplainDto> getCvoDetail(String fromDate, String toDate) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		 
		String cvoSql = "select * from registration where logintype='ROLE_CVO' and createdate between ? and ? order by name";
		List<ComplainDto> cvoListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(cvoSql);
			preparedStatement.setDate(1, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(2, java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto cvoDto = new ComplainDto();
				cvoDto.setComplainNo(rs.getString("userid"));
				cvoDto.setSenderName(rs.getString("name"));
				cvoDto.setOrganizationName(rs.getString("organisation"));
				cvoDto.setIr(rs.getString("email"));
				cvoDto.setRollType(rs.getString("cvocode"));
				cvoDto.setMobileNo(rs.getString("mobilenumber"));
				cvoDto.setFiled(rs.getString("lastmodified"));
				
				cvoListDto.add(cvoDto);
				
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
		return cvoListDto;
	}

	public List<ComplainDto> getCvoActReport(String fromDate, String toDate) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		Statement Statement = null;
		ResultSet rs = null;
		
		 
		/*String cvoSqlDrop = "DROP TABLE IF EXISTS temp1;";*/
		/*String cvoSql="DROP TABLE IF EXISTS temp1;"
				+ "CREATE TEMP TABLE temp1 AS"
				+ " select c.organization,count(c.*),reg.userid from complain c inner join registration reg on  c.organization= reg.organisation and reg.logintype='ROLE_CVO' where c.boirfinaldec= 'NA' and bofinaldecdate between '"+fromDate+"' and '"+toDate+"' group by organization,userid;"
				+ " select t1.*,max(lo.time)  from temp1 t1 inner join logs lo ON lo.username=t1.userid and lo.status='successfull' group by t1.organization,t1.count,t1.userid order by t1.organization,t1.userid;";
		*/
		
/*		String cvoSql="DROP TABLE IF EXISTS temp1;\r\n" + 
				"		CREATE TEMP TABLE temp1 AS\r\n" + 
				"\r\n" + 
				
				"	select c.organisationcode,count(c.organisationcode) as NA,reg.userid from complain c left join registration reg on  c.organisationcode= reg.cvocode where c.boirfinaldec= 'NA' and reg.logintype='ROLE_CVO' and bofinaldecdate between '"+fromDate+"' and '"+toDate+"'   group by organisationcode,userid;\r\n" + 
				"\r\n" + 
				"		DROP TABLE IF EXISTS temp2;\r\n" + 
				"		CREATE TEMP TABLE temp2 AS\r\n" + 
				"		select t1.*,count(lo.time)as cnt1,max(lo.time)as logs  from temp1 t1 left join logs lo ON lo.username=t1.userid and lo.status='successfull' group by t1.organisationcode,t1.NA,t1.userid order by t1.organisationcode,t1.userid;\r\n" + 
				"\r\n" + 
				"		DROP TABLE IF EXISTS temp3;\r\n" + 
				"		CREATE TEMP TABLE temp3 AS\r\n" + 
				"		select complain.organisationcode,count(complain.organisationcode) as closed from complain left join cvo on complain.complaint=cvo.complaintnumber where cvo.investigationclosedate is not null and cvo.investigationclosedate between '"+fromDate+"' and '"+toDate+"' group by complain.organisationcode;\r\n" + 
				"\r\n" + 
				"		select sectiondetail.organisationname1,sectiondetail.orgcod,userid,NA,closed,cnt1,logs from temp2 left join temp3 on temp2.organisationcode=temp3.organisationcode left join sectiondetail on temp2.organisationcode=sectiondetail.orgcod";*/
		
		
		String cvoSql="DROP TABLE IF EXISTS temp1;\r\n" + 
				"CREATE TEMP TABLE temp1 AS\r\n" + 
				"select c.organisationcode,count(c.organisationcode) as NA_COUNT,reg.userid from complain c left join registration reg on  c.organisationcode= reg.cvocode where c.boirfinaldec= 'NA' and reg.logintype='ROLE_CVO' and bofinaldecdate between '"+fromDate+"' and '"+toDate+"'   group by organisationcode,userid;\r\n" + 
				"\r\n" + 
				"DROP TABLE IF EXISTS temp2;\r\n" + 
				"CREATE TEMP TABLE temp2 AS\r\n" + 
				"select t1.*,count(lo.time)as cnt1,max(lo.time)as logs  from temp1 t1 left join logs lo ON lo.username=t1.userid and lo.status='successfull' group by t1.organisationcode,t1.NA_COUNT,t1.userid order by t1.organisationcode,t1.userid;\r\n" + 
				"\r\n" + 
				"DROP TABLE IF EXISTS temp3;\r\n" + 
				"CREATE TEMP TABLE temp3 AS\r\n" + 
				"select complain.organisationcode,count(complain.organisationcode) as filed from complain left join cvo on complain.complaint=cvo.complaintnumber where cvo.decisiondate is not null and cvo.decisiondate between '"+fromDate+"' and '"+toDate+"'  and cvo.decision ilike 'filed' group by complain.organisationcode;\r\n" + 
				"\r\n" + 
				"DROP TABLE IF EXISTS temp4;\r\n" + 
				"CREATE TEMP TABLE temp4 AS\r\n" + 
				"select complain.organisationcode,count(complain.organisationcode) as na from complain left join cvo on complain.complaint=cvo.complaintnumber where cvo.decisiondate is not null and cvo.decisiondate between '"+fromDate+"' and '"+toDate+"'  and cvo.decision ilike 'na' group by complain.organisationcode;\r\n" + 
				"\r\n" + 
				"DROP TABLE IF EXISTS temp5;\r\n" + 
				"CREATE TEMP TABLE temp5 AS\r\n" + 
				"select complain.organisationcode,count(complain.organisationcode) as ir from complain left join cvo on complain.complaint=cvo.complaintnumber where cvo.decisiondate is not null and cvo.decisiondate between '"+fromDate+"' and '"+toDate+"'  and cvo.decision ilike 'ir' group by complain.organisationcode;\r\n" + 
				"\r\n" + 
				"select sectiondetail.organisationname1,sectiondetail.orgcod,userid,NA_COUNT,filed,na,ir,cnt1,logs from temp2 \r\n" + 
				"left join temp5 on temp2.organisationcode=temp5.organisationcode \r\n" + 
				"left join temp4 on temp2.organisationcode=temp4.organisationcode \r\n" + 
				"left join temp3 on temp2.organisationcode=temp3.organisationcode \r\n" + 
				"left join sectiondetail on temp2.organisationcode=sectiondetail.orgcod order by sectiondetail.organisationname1,filed,na,ir";
		List<ComplainDto> cvoListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
		
			Statement = conn.createStatement();
			
			
			boolean result = Statement.execute(cvoSql);
			  while (true)
			   if(result){
			    rs = Statement.getResultSet();
			    	while (rs.next()) 
			    	{
			    		ComplainDto cvoDto = new ComplainDto();
						cvoDto.setOrganizationName(rs.getString(1));//orgname
						cvoDto.setDairyStatus(rs.getString(2));//org code
						cvoDto.setComplainNo(rs.getString(3));//user id
						cvoDto.setSenderName(rs.getString(4));//na count
						cvoDto.setComplaindate(rs.getString(5));//filed
						cvoDto.setBoNaAckDate(rs.getString(6));
						cvoDto.setIr(rs.getString(7));
						cvoDto.setBoDecisionDate(rs.getString(8));//Login count
						cvoDto.setBoDecision(rs.getString(9));//last login
						cvoListDto.add(cvoDto);
			    		}
			    	break; 
			   		} 
			   else {
			    int updateCount = Statement.getUpdateCount();
			    if (updateCount == -1){
			    break; 
			  }
			    result = Statement.getMoreResults();
			
			/*rs = Statement.executeQuery(cvoSql);
			
			while (rs.next()) {
				ComplainDto cvoDto = new ComplainDto();
				cvoDto.setOrganizationName(rs.getString("organization"));
				cvoDto.setComplainNo(rs.getString("count"));
				cvoDto.setSenderName(rs.getString("userid"));
				cvoDto.setComplaindate(rs.getString("time"));
				cvoListDto.add(cvoDto);*/
				
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
			if (Statement != null) {
				try {
					Statement.close();
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
		return cvoListDto;
	}

	public List<ComplainDto> getCvoNaCount(String fromDate, String toDate, String org) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		String cvoSql="select * from complain where boirfinaldec='NA' and organisationcode =? and bofinaldecdate between ? and ?";
		
		List<ComplainDto> cvoListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(cvoSql);
			preparedStatement.setString(1, org);
			preparedStatement.setDate(2, java.sql.Date.valueOf(fromDate));
			preparedStatement.setDate(3, java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto cvoDto = new ComplainDto();
				cvoDto.setComplainNo(rs.getString("complaint"));
				cvoDto.setSenderName(rs.getString("sendername"));
				cvoDto.setOrganizationName(rs.getString("confirmcvo"));
				cvoDto.setDecision(rs.getString("boirfinaldec"));
				cvoDto.setBoDecisionDate(rs.getString("bofinaldecdate"));
				cvoDto.setComplaindate(rs.getString("complaindate"));
				cvoDto.setCreatedDate(rs.getString("createddate"));
				cvoDto.setDairyStatus(rs.getString("dairystatus"));
				
				cvoListDto.add(cvoDto);
				
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
		return cvoListDto;
		
	}
	
	public List<ComplainDto> getCvoNaClosedCount(String fromDate, String toDate, String org,String decision) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		String cvoSql="select * from complain left join cvo on complain.complaint=cvo.complaintnumber where cvo.decisiondate is not null and cvo.decisiondate between '"+fromDate+"' and '"+toDate+"'  and complain.organisationcode=? and decision ilike '"+decision+"'";
		
		List<ComplainDto> cvoListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(cvoSql);
			preparedStatement.setString(1, org);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto cvoDto = new ComplainDto();
				cvoDto.setComplainNo(rs.getString("complaint"));
				cvoDto.setCreatedDate(rs.getString("createddate"));
				cvoDto.setBoDecision(rs.getString("decision"));
				cvoDto.setBoDecisionDate(rs.getString("bofinaldecdate"));
				cvoDto.setDecisiondate(rs.getString("decisiondate"));
				
				cvoListDto.add(cvoDto);
				
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
		return cvoListDto;
		
	}
	
	public List<ComplainDto> getCvoLoginCount(String fromDate, String toDate, String userId) {

		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		String cvoSql="select * from logs where username=? order by time desc";
		
		List<ComplainDto> cvoListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(cvoSql);
			preparedStatement.setString(1, userId);
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ComplainDto cvoDto = new ComplainDto();
				cvoDto.setCreatedDate(rs.getString("time"));
				cvoDto.setDairyStatus(rs.getString("ipaddress"));
				
				
				cvoListDto.add(cvoDto);
				
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
		return cvoListDto;
		
	}
	@SuppressWarnings("resource")
	public List<ComplainDto> getfirstStage(String advcode, String orgCode) {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String sSQL;
		
		if(advcode.equalsIgnoreCase("MA")) 
		{
			sSQL="SELECT fstage.file_no, fstage.fsadvcode, fstage.fssendt, fstage.compreqd, fstage.comprecd, fstage.fsrecon_dept_code, fstage.chrg_sht_iss, fstage.io_reqd,\r\n" + 
					"	   ind_det.lname,fname, ind_det.desig, ind_det.dept_ref_no, final.disp_order_penalty,final.fin_ord_issd,orgadd.ORGNAM1\r\n" + 
					"	FROM orgadd RIGHT OUTER JOIN ind_det ON orgadd.ORGCOD = ind_det.org RIGHT OUTER JOIN\r\n" + 
					"	fstage ON UPPER(ind_det.file_no) = UPPER(fstage.file_no) AND ind_det.sno = fstage.sno LEFT OUTER JOIN\r\n" + 
					"	final ON UPPER(fstage.file_no) = UPPER(final.file_no) AND fstage.sno = final.sno LEFT OUTER JOIN\r\n" + 
					"	cdi_nom ON UPPER(fstage.file_no) = UPPER(cdi_nom.file_no) AND fstage.sno = cdi_nom.sno LEFT OUTER JOIN\r\n" + 
					"	sstage ON UPPER(fstage.file_no)=UPPER(sstage.file_no) AND fstage.sno=sstage.sno\r\n" + 
					"	\r\n" + 
					"WHERE  ((fstage.Section<>2 and (fstage.fsadvcode = ? OR fstage.fsadvcode ='MP')) or (fstage.Section =2 and fstage.fsadvcode = 'MA' and final.Major_penalty_recd = 1)or (fstage.Section =2 and fstage.fsadvcode = 'MA'))\r\n" + 
					"	AND fstage.fssendt is not NULL 	and (fstage.fsrecon_dept_code IS NULL OR\r\n" + 
					"	fstage.fsrecon_dept_code = '') AND (cdi_nom.cdi_apptd =(B'0') OR cdi_nom.cdi_apptd IS NULL) AND\r\n" + 
					"	(sstage.ssadvcode is null OR sstage.ssadvcode ='') AND (final.disp_order_penalty IS NULL OR  final.disp_order_penalty = '')\r\n" + 
					"	AND ind_det.org = ? ";
		}
		else
		{
			sSQL="SELECT fstage.file_no, fstage.fsadvcode, fstage.fssendt, fstage.compreqd, fstage.comprecd, fstage.fsrecon_dept_code, fstage.chrg_sht_iss, fstage.io_reqd, \r\n" + 
					"	ind_det.lname,fname, ind_det.desig, ind_det.dept_ref_no, final.disp_order_penalty,final.fin_ord_issd,orgadd.ORGNAM1 \r\n" + 
					"	FROM orgadd RIGHT OUTER JOIN ind_det ON orgadd.ORGCOD = ind_det.org RIGHT OUTER JOIN\r\n" + 
					"	fstage ON UPPER(ind_det.file_no) = UPPER(fstage.file_no) AND ind_det.sno = fstage.sno LEFT OUTER JOIN\r\n" + 
					"	final ON UPPER(fstage.file_no) = UPPER(final.file_no) AND fstage.sno = final.sno LEFT OUTER JOIN\r\n" + 
					"	cdi_nom ON UPPER(fstage.file_no) = UPPER(cdi_nom.file_no) AND fstage.sno = cdi_nom.sno LEFT OUTER JOIN\r\n" + 
					"	sstage ON UPPER(fstage.file_no)=UPPER(sstage.file_no) AND fstage.sno=sstage.sno \r\n" + 
					"	WHERE fstage.section = ind_det.section AND UPPER(fstage.file_no) = UPPER(ind_det.file_no) AND \r\n" + 
					"	fstage.sno = ind_det.sno AND \r\n" + 
					"	ind_det.org = orgadd.ORGCOD AND \r\n" + 
					"	fstage.compreqd=(B'1') AND \r\n" + 
					"	fstage.comprecd=(B'0') AND \r\n" + 
					"	(fstage.fsrecon_dept_code is null or \r\n" + 
					"	fstage.fsrecon_dept_code ='') AND fstage.fsadvcode =  ?\r\n" + 
					"	AND fstage.fssendt is not NULL \r\n" + 
					"	and (sstage.ssadvcode is null OR sstage.ssadvcode ='')\r\n" + 
					"	AND (final.disp_order_penalty is null or final.disp_order_penalty ='')\r\n" + 
					"	AND ind_det.org = ?\r\n" + 
					"	ORDER BY\r\n" + 
					"	fstage.fssendt,ind_det.file_no ASC";
		}
		
	
		List<ComplainDto> interimIrListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sSQL);
			preparedStatement.setString(1, advcode);
			preparedStatement.setString(2, orgCode);
			rs = preparedStatement.executeQuery();
			int i=0;
			while (rs.next()) {
				ComplainDto interimIrDto = new ComplainDto();
				i++;
				interimIrDto.setComplainNo(i+"");
				interimIrDto.setComplaint(rs.getString("file_no"));
				interimIrDto.setComplaindate(rs.getString("fssendt")); 
				
				if(rs.getString("fname")==null)
				{
					interimIrDto.setBoDecisionDate(rs.getString("lname"));
				}
				else
				{
					interimIrDto.setBoDecisionDate(rs.getString("fname")+" "+rs.getString("lname"));
				}
				
				interimIrDto.setDairyStatus(rs.getString("desig"));
				interimIrDto.setDecision(rs.getString("dept_ref_no"));
				
				
				interimIrListDto.add(interimIrDto);
				
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
		return interimIrListDto;
	
	}

	public List<ComplainDto> getsecondStage(String advcode,String orgCode) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		String sSQL="SELECT sstage.file_no, sstage.ssadvcode, sstage.sssendt, sstage.ssrecon_dept_code, sstage.ssrecon_comm_sen_dt,\r\n" + 
				"ind_det.lname,fname, ind_det.desig, ind_det.dept_ref_no,orgadd.ORGNAM1,final.disp_order_penalty  \r\n" + 
				"\r\n" + 
				"FROM sstage LEFT OUTER JOIN final ON sstage.sno = final.sno AND UPPER(sstage.file_no) = UPPER(final.file_no),\r\n" + 
				"ind_det ind_det,orgadd orgadd \r\n" + 
				"\r\n" + 
				"WHERE \r\n" + 
				"sstage.section = ind_det.section AND \r\n" + 
				"UPPER(sstage.file_no) = UPPER(ind_det.file_no) AND\r\n" + 
				"sstage.sno = ind_det.sno AND \r\n" + 
				"ind_det.org = orgadd.ORGCOD AND \r\n" + 
				"( sstage.ssadvcode = ? \r\n" + 
				" AND ind_det.org = ? \r\n" + 
				" AND sstage.sssendt is not NULL) \r\n" + 
				" AND (sstage.ssrecon_dept_code is Null or sstage.ssrecon_dept_code ='') \r\n" + 
				" AND (final.disp_order_penalty is null or final.disp_order_penalty ='') ";
		

		List<ComplainDto> interimIrListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sSQL);
			preparedStatement.setString(1, advcode);
			preparedStatement.setString(2, orgCode);
			rs = preparedStatement.executeQuery();
			int i=0;
			while (rs.next()) {
				ComplainDto interimIrDto = new ComplainDto();
				i++;
				interimIrDto.setComplainNo(i+"");
				interimIrDto.setComplaint(rs.getString("file_no"));
				interimIrDto.setComplaindate(rs.getString("sssendt")); 
				
				
				if(rs.getString("fname")==null)
				{
					interimIrDto.setBoDecisionDate(rs.getString("lname"));
				}
				else
				{
					interimIrDto.setBoDecisionDate(rs.getString("fname")+" "+rs.getString("lname"));
				}
				
				
				interimIrDto.setDairyStatus(rs.getString("desig"));
				interimIrDto.setDecision(rs.getString("dept_ref_no"));
				
				
				interimIrListDto.add(interimIrDto);
				
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
		return interimIrListDto;
	}

	public List<ComplainDto> getcomplaintPending(String orgCode) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		String sSQL="SELECT \r\n" + 
				"    vig_case.file_no, vig_case.comp_typ,vig_case.inv_typ, vig_case.inv_dt,vig_case.inv_agen,ind_det.fname,\r\n" + 
				" ind_det.lname, ind_det.desig, ind_det.dept_ref_no,orgadd.ORGNAM1 \r\n" + 
				"FROM \r\n" + 
				"    orgadd RIGHT OUTER JOIN ind_det ON orgadd.ORGCOD = ind_det.org LEFT OUTER JOIN \r\n" + 
				"    fstage ON UPPER(ind_det.file_no) = UPPER(fstage.file_no) AND \r\n" + 
				"   ind_det.sno = fstage.sno RIGHT OUTER JOIN vig_case ON UPPER(ind_det.file_no) = UPPER(vig_case.file_no) \r\n" + 
				"WHERE \r\n" + 
				"     (vig_case.source in ('OTH','CVC')) AND \r\n" + 
				"    (vig_case.inv_agen ='CVO') AND vig_case.inv_typ is not null and \r\n" + 
				"    (vig_case.sent_inv = (B'1')) AND (fstage.agen_rec IS NULL or fstage.agen_rec ='')  \r\n" + 
				" AND ind_det.org = ? \r\n" + 
				" and (fstage.fsadvcode IS NULL or fstage.fsadvcode ='' or fstage.fsadvcode ='DS')\r\n" + 
				" ORDER BY \r\n" + 
				"  vig_case.inv_typ,vig_case.inv_dt, vig_case.file_no ASC";
		

		List<ComplainDto> interimIrListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sSQL);
			preparedStatement.setString(1, orgCode);
			rs = preparedStatement.executeQuery();
			int i=0;
			while (rs.next()) {
				ComplainDto interimIrDto = new ComplainDto();
				i++;
				interimIrDto.setComplainNo(i+"");
				interimIrDto.setComplaint(rs.getString("file_no"));
				interimIrDto.setComplaindate(rs.getString("comp_typ")); 
				interimIrDto.setCreatedDate(rs.getString("inv_typ"));
				interimIrDto.setBoDecisionDate(rs.getString("inv_agen"));
				interimIrDto.setBoirackdate(rs.getString("inv_dt"));				
				
				
				if(rs.getString("fname")==null)
				{
					interimIrDto.setDecision(rs.getString("lname"));
				}
				else
				{
					interimIrDto.setDecision(rs.getString("fname")+" "+rs.getString("lname"));
				}
				
				
				interimIrDto.setRecipientName(rs.getString("desig"));  
				interimIrDto.setAllegationDeatils(rs.getString("dept_ref_no"));
				
				interimIrListDto.add(interimIrDto);
				
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
		return interimIrListDto;
	}

	public List<ComplainDto> getfurtherClarification(String orgCode) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		String sSQL="SELECT * FROM pend LEFT OUTER JOIN ind_det ON UPPER(pend.file_no) = UPPER(ind_det.file_no) AND pend.sno = ind_det.sno WHERE pend.pend_type = 'FI' AND pend.comp_dt IS NULL AND ind_det.org = ? order by pend.file_no ";
		

		List<ComplainDto> interimIrListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sSQL);
			preparedStatement.setString(1, orgCode);
			rs = preparedStatement.executeQuery();
			int i=0;
			while (rs.next()) {
				ComplainDto interimIrDto = new ComplainDto();
				i++;
				interimIrDto.setComplainNo(i+"");
				interimIrDto.setComplaint(rs.getString("file_no"));
				interimIrDto.setComplaindate(rs.getString("pend_date")); 
				interimIrDto.setCreatedDate(rs.getString("ref_type"));
				
				if(rs.getString("fname")==null)
				{
					interimIrDto.setBoirackdate(rs.getString("lname"));
				}
				else
				{
					interimIrDto.setBoirackdate(rs.getString("fname")+" "+rs.getString("lname"));
				}
				
								
				interimIrDto.setDairyStatus(rs.getString("desig"));
				interimIrDto.setDecision(rs.getString("dept_ref_no"));
				
				interimIrListDto.add(interimIrDto);
				
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
		return interimIrListDto;
	}

	public List<ComplainDto> getdepartmentalInquiry(String orgCode) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		/*String sSQL="select fstage.file_no,ind_det.dept_ref_no,ind_det.fname,ind_det.lname,ind_det.desig,sstage.sssendt,cdi_nom.dt_apptd from ind_det\r\n" + 
				"inner join fstage on UPPER(fstage.file_no) = UPPER(ind_det.file_no) and fstage.sno= ind_det.sno\r\n" + 
				"inner join sstage on UPPER(sstage.file_no)=UPPER(ind_det.file_no) and sstage.sno= ind_det.sno\r\n" + 
				"inner join cdi_nom on UPPER(cdi_nom.file_no) = UPPER(ind_det.file_no) and cdi_nom.sno= ind_det.sno where ind_det.org = ?";*/
		
		String sSQL="SELECT orgadd.SECTION, orgadd.ORGCOD, ind_det.section AS Expr1, ind_det.file_no, ind_det.sno, ind_det.lname, ind_det.fname, ind_det.desig, ind_det.org,ind_det.dept_ref_no, fstage.fsadvcode, fstage.fscompdt, fstage.fssendt, cdi_nom.dt_apptd\r\n" + 
				"FROM orgadd INNER JOIN\r\n" + 
				"ind_det ON ind_det.org = orgadd.ORGCOD AND ind_det.section = orgadd.SECTION RIGHT OUTER JOIN\r\n" + 
				"fstage LEFT OUTER JOIN\r\n" + 
				"sstage ON fstage.sno = sstage.sno AND UPPER(fstage.file_no) = UPPER(sstage.file_no) LEFT OUTER JOIN\r\n" + 
				"cdi_nom ON UPPER(fstage.file_no) = UPPER(cdi_nom.file_no) AND fstage.sno = cdi_nom.sno ON UPPER(fstage.file_no) = UPPER(ind_det.file_no) AND fstage.sno = ind_det.sno LEFT OUTER JOIN\r\n" + 
				"final ON UPPER(fstage.file_no) = UPPER(final.file_no) AND fstage.sno = final.sno\r\n" + 
				"WHERE (cdi_nom.io_type = 'D') AND (cdi_nom.cdi_apptd = '1') AND (cdi_nom.io_rep_recd = '0') AND (sstage.ssadvcode = '' OR\r\n" + 
				"sstage.ssadvcode IS NULL) AND (cdi_nom.disp_auth_comm_dt IS NULL) AND (final.disp_order_penalty = '' OR\r\n" + 
				"final.disp_order_penalty IS NULL) AND (final.fin_penal = '' OR\r\n" + 
				"final.fin_penal IS NULL) AND (ind_det.org = ?)\r\n" + 
				"ORDER BY orgadd.ORGNAM1, fstage.fssendt";

		List<ComplainDto> interimIrListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sSQL);
			preparedStatement.setString(1, orgCode);
			rs = preparedStatement.executeQuery();
			int i=0;
			while (rs.next()) {
				ComplainDto interimIrDto = new ComplainDto();
				i++;
				interimIrDto.setComplainNo(i+"");
				interimIrDto.setComplaint(rs.getString("file_no"));
				interimIrDto.setComplaindate(rs.getString("dept_ref_no")); 
				
				if(rs.getString("fname")==null)
				{
					interimIrDto.setBoDecisionDate(rs.getString("lname"));	
				}
				else
				{
					interimIrDto.setBoDecisionDate(rs.getString("fname")+" "+rs.getString("lname"));
				}
				
				interimIrDto.setBoirackdate(rs.getString("desig"));				
				interimIrDto.setDairyStatus(rs.getString("fssendt"));
				interimIrDto.setDecision(rs.getString("dt_apptd"));
				
				interimIrListDto.add(interimIrDto);
				
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
		return interimIrListDto;
	}
	
	public List<DairyDetailsDto> getCSVLastUpdate() {
		
		String sql = "select max(lastupdate) from csvupdate";
		Connection conn = null;
		JdbcTemplate jdbcTemplate=null;
		 PreparedStatement preparedStatement = null;
			ResultSet rs = null;
		List<DairyDetailsDto> liDairyDetailsDtos = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			 preparedStatement = conn.prepareStatement(sql);
			 rs = preparedStatement.executeQuery();
			
			 while (rs.next()) {
					DairyDetailsDto dairyDetailsDto=new DairyDetailsDto();

					dairyDetailsDto.setComplainDate(rs.getString("max"));
					
					liDairyDetailsDtos.add(dairyDetailsDto);
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
		return liDairyDetailsDtos;
		}
	
	public List<ComplainDto> getUserWisecomplaintReport(String section) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		Statement Statement = null;
		ResultSet rs = null;

		/*String sSQL="select * from registration where loginroll ilike ? and logintype != 'ROLE_CVO' and logintype != 'ROLE_Diary' and logintype != 'ROLE_HELP' and logintype != 'ROLE_CITIZEN' and logintype != 'ROLE_CLR' and logintype != 'ROLE_ADMIN' and logintype != 'ROLE_COORD'";*/

		/*String sSQL="select compliant,touser,forwarddate, DATE_PART('day', now()::timestamp- forwarddate::timestamp)as date_diff, reg.loginroll as section from forward as f\r\n" + 
				"left join registration as reg on reg.userid=f.touser\r\n" + 
				"where lastmovement ='Y' and compliant<>'' and complaintnumber not in (select distinct complaintnumber from complain where boirfinaldec  is not null and boirfinaldec  !='' and boirfinaldec  !='null'  ) and  reg.loginroll like ? and reg.loginroll not like '%Cordn%' order by touser,date_diff desc";*/
		
		String sSQL="DROP TABLE IF EXISTS temp1;\r\n" + 
				"CREATE TEMP TABLE temp1 AS\r\n" + 
				"select complaintnumber,fromuser,forwarddate as recieved_date from forward where forwardserialno=1 and complaintnumber in (select complaintnumber from complain where (boirfinaldec is null or boirfinaldec =''));\r\n" + 
				"\r\n" + 
				"DROP TABLE IF EXISTS temp2;\r\n" + 
				"CREATE TEMP TABLE temp2 AS\r\n" + 
				"select forward.complaintnumber,forward.fromuser,forward.touser,forward.forwarddate,forward.forwardserialno from forward \r\n" + 
				"where complaintnumber in (select complaintnumber from complain where (boirfinaldec is null or boirfinaldec ='')) and forward.lastmovement='Y' order by forward.complaintnumber;\r\n" + 
				"\r\n" + 
				"DROP TABLE IF EXISTS temp3;\r\n" + 
				"CREATE TEMP TABLE temp3 AS\r\n" + 
				"select temp2.complaintnumber,complain.section,temp1.fromuser,temp2.touser,temp1.recieved_date,temp2.forwarddate ,temp2.forwardserialno as transfered_count,TRUNC(DATE_PART('day', temp2.forwarddate::timestamp - temp1.recieved_date::timestamp)/7) as pending_weeks from temp1 \r\n" + 
				"join temp2 on temp1.complaintnumber=temp2.complaintnumber \r\n" + 
				"join complain on temp1.complaintnumber=complain.complaintnumber \r\n" + 
				"where DATE_PART('day', temp2.forwarddate::timestamp - temp1.recieved_date::timestamp) > 0 order by complain.section,pending_weeks,transfered_count;\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"select section,sum(case when pending_weeks =0 then 1 else 0 end)as \"less_than_a_week\", \r\n" + 
				"sum(case when (pending_weeks >0 and pending_weeks <=1) then 1 else 0 end)as \"between_one_and_two\",\r\n" + 
				"sum(case when (pending_weeks >1 and pending_weeks <=2) then 1 else 0 end)as \"between_two_and_three\",\r\n" + 
				"sum(case when (pending_weeks >2 and pending_weeks <=3) then 1 else 0 end)as \"between_three_and_four\",\r\n" + 
				"sum(case when (pending_weeks >3) then 1 else 0 end)as \"more_than_four\" from temp3 group by section order by  section;";
		List<ComplainDto> complainListDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
		
			Statement = conn.createStatement();
			
			
			boolean result = Statement.execute(sSQL);
			 while (true)
				   if(result){
				    rs = Statement.getResultSet();
				    	while (rs.next()) 
				    	{
							ComplainDto complainDto = new ComplainDto();
							complainDto.setSection(rs.getString("section"));
							complainDto.setCompliant(rs.getString("less_than_a_week"));
							complainDto.setDairyStatus(rs.getString("between_one_and_two"));
							complainDto.setDecisiondate(rs.getString("between_two_and_three"));
							complainDto.setBoDecisionDate(rs.getString("between_three_and_four"));
							complainDto.setComplaintAgainstName(rs.getString("more_than_four"));
							int total=Integer.parseInt(rs.getString("less_than_a_week"))+Integer.parseInt(rs.getString("between_one_and_two"))+Integer.parseInt(rs.getString("between_two_and_three"))+Integer.parseInt(rs.getString("between_three_and_four"))+Integer.parseInt(rs.getString("more_than_four"));
							complainDto.setSenderName(String.valueOf(total));
							complainListDto.add(complainDto);
				    		}
				    	break; 
				   		} 
				   else {
				    int updateCount = Statement.getUpdateCount();
				    if (updateCount == -1){
				    break; 
				  }
				    result = Statement.getMoreResults();
			
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
			if (Statement != null) {
				try {
					Statement.close();
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
		return complainListDto;
	}
public List<MonthlyCommonDto> getTotalPendingAllVig(String fromDate, String toDate) {
		
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		 
		String detailIRSql = "select count(*),organization  from complain where  ( bofinaldecdate is null  or  bofinaldecdate > ? )  and createddate <=  ? group by organization order by count desc";
	
		List<MonthlyCommonDto> monthlyComplainReportIRDto = Lists.newArrayList();
		 
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(detailIRSql);
			preparedStatement.setDate(1, java.sql.Date.valueOf(toDate));
			preparedStatement.setDate(2,java.sql.Date.valueOf(toDate));
			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				MonthlyCommonDto pendingIRDto = new MonthlyCommonDto();
				pendingIRDto.setOther(rs.getInt(1));				
				pendingIRDto.setOrganization(rs.getString("organization"));
				
				monthlyComplainReportIRDto.add(pendingIRDto);
				
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
		return monthlyComplainReportIRDto;
	
	}

public List<ForwardDto> summarySheetForward(String loginId,String onDate) {

	JdbcTemplate jdbcTemplate = null;
	Connection conn = null;
	PreparedStatement preparedStatement = null;
	ResultSet rs = null;
	String day,month,year;
	day=onDate.split("-")[0];
	month=onDate.split("-")[1];
	year=onDate.split("-")[2];

	System.out.println(day+"/"+month+"/"+year);
	String sql = "select * from forward where fromuser =? and extract(day from forwarddate)=cast(? as double precision) and extract(month from forwarddate)=cast(? as double precision) and extract(year from forwarddate)=cast(? as double precision)";
	List<ForwardDto> listofComplainDto = Lists.newArrayList();
	try {
		jdbcTemplate = MyUtill.conn(dataSource);
		conn = jdbcTemplate.getDataSource().getConnection();
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, loginId);
		preparedStatement.setString(2, day);
		preparedStatement.setString(3, month);
		preparedStatement.setString(4, year);
		rs = preparedStatement.executeQuery();
		while (rs.next()) {
			ForwardDto forwardDto = new ForwardDto();
			forwardDto.setCompliant(rs.getString("compliant"));
			forwardDto.setSentTo(rs.getString("touser"));
			listofComplainDto.add(forwardDto);
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

public List<ForwardDto> summarySheetReceived(String loginId,String onDate) {

	JdbcTemplate jdbcTemplate = null;
	Connection conn = null;
	PreparedStatement preparedStatement = null;
	ResultSet rs = null;
	String day,month,year;
	day=onDate.split("-")[0];
	month=onDate.split("-")[1];
	year=onDate.split("-")[2];

	System.out.println(day+"/"+month+"/"+year);
	String sql = "select * from forward where touser =? and extract(day from forwarddate)=cast(? as double precision) and extract(month from forwarddate)=cast(? as double precision) and extract(year from forwarddate)=cast(? as double precision)";
	List<ForwardDto> listofComplainDto = Lists.newArrayList();
	try {
		jdbcTemplate = MyUtill.conn(dataSource);
		conn = jdbcTemplate.getDataSource().getConnection();
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, loginId);
		preparedStatement.setString(2, day);
		preparedStatement.setString(3, month);
		preparedStatement.setString(4, year);
		rs = preparedStatement.executeQuery();
		while (rs.next()) {
			ForwardDto forwardDto = new ForwardDto();
			forwardDto.setCompliant(rs.getString("compliant"));
			forwardDto.setSentTo(rs.getString("fromuser"));
			listofComplainDto.add(forwardDto);
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

public List<ForwardDto> summarySheetClosed(String loginId,String onDate) {

	JdbcTemplate jdbcTemplate = null;
	Connection conn = null;
	PreparedStatement preparedStatement = null;
	ResultSet rs = null;
	String day,month,year;
	day=onDate.split("-")[0];
	month=onDate.split("-")[1];
	year=onDate.split("-")[2];

	switch(month) 
	{
	 case "01" : month="jan";
	      		break; 
	 case "02" : month="feb";
				break;
	 case "03" : month="mar";
				break;
	 case "04" : month="apr";
				break;
	 case "05" : month="may";
				break;
	 case "06" : month="jun";
				break;
	 case "07" : month="jul";
	 			break;
	 case "08" : month="aug";
				break;
	 case "09" : month="sep";
				break;
	 case "10" : month="oct";
				break;
	 case "11" : month="nov";
				break;
	 case "12" : month="dec";
				break;
	}
	
	System.out.println(day+"/"+month+"/"+year);
	String sql = "select * from complain where closedby=? and ondate ilike ? and ondate ilike ? and ondate ilike ? and complainstatus=?";
	List<ForwardDto> listofComplainDto = Lists.newArrayList();
	try {
		jdbcTemplate = MyUtill.conn(dataSource);
		conn = jdbcTemplate.getDataSource().getConnection();
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setString(1, loginId);
		preparedStatement.setString(2, "%"+day+"%");
		preparedStatement.setString(3, "%"+month+"%");
		preparedStatement.setString(4, "%"+year+"%");
		preparedStatement.setInt(5, 1);
		rs = preparedStatement.executeQuery();
		while (rs.next()) {
			ForwardDto forwardDto = new ForwardDto();
			forwardDto.setCompliant(rs.getString("complaint"));
			listofComplainDto.add(forwardDto);
			
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

@SuppressWarnings("resource")
public List<ComplainDto> getTotalPendingDetailsbyId(String fromDate, String toDate,String index) {
	
	JdbcTemplate jdbcTemplate = null;
	Connection conn = null;
	Statement Statement = null;
	ResultSet rs = null;
	
	 
	String pendingSql = 	
	"DROP TABLE IF EXISTS temp1;\r\n" + 
	"CREATE TEMP TABLE temp1 AS\r\n" + 
	"select complain.dairystatus,registration.name,registration.desiganation,count(complain.dairystatus) from complain \r\n" + 
	"join registration on registration.userid=complain.dairystatus \r\n" + 
	"where  section = '"+index+"'  and ( bofinaldecdate is null  or  bofinaldecdate > '"+toDate+"' )  and createddate <=  '"+toDate+"' and logintype in ('ROLE_SO','ROLE_BO') group by dairystatus,registration.name,registration.desiganation;\r\n" + 
	"\r\n" + 
	"DROP TABLE IF EXISTS temp2;\r\n" + 
	"CREATE TEMP TABLE temp2 AS\r\n" + 
	"select complain.dairystatus,registration.name,registration.desiganation,count(complain.dairystatus) from complain \r\n" + 
	"join registration on (registration.loginroll=complain.section or registration.loginroll ilike '%'||complain.section||'%')\r\n" + 
	"where  section = '"+index+"'  and ( bofinaldecdate is null  or  bofinaldecdate > '"+toDate+"' )  and createddate <=  '"+toDate+"' and complain.dairystatus=complain.section and logintype='ROLE_DH' and registration.status='true' group by dairystatus,registration.name,registration.desiganation;\r\n" + 
	"select * from temp1 union all select * from temp2;\r\n" + 
	"\r\n" + 
	"\r\n" + 
	"";
	List<ComplainDto> complainListDto = Lists.newArrayList();
	 
	try {
		jdbcTemplate = MyUtill.conn(dataSource);
		conn = jdbcTemplate.getDataSource().getConnection();
	
		Statement = conn.createStatement();
		
		
		boolean result = Statement.execute(pendingSql);
		 while (true)
			   if(result){
			    rs = Statement.getResultSet();
			    	while (rs.next()) 
			    	{
						ComplainDto complainDto = new ComplainDto();

						complainDto.setDairyStatus(rs.getString("dairystatus"));
						complainDto.setRecipientName(rs.getString("name"));
						complainDto.setDesignation(rs.getString("desiganation"));
						complainDto.setStatus(rs.getInt("count"));
						complainDto.setSection(index);

						complainListDto.add(complainDto);
			    		}
			    	break; 
			   		} 
			   else {
			    int updateCount = Statement.getUpdateCount();
			    if (updateCount == -1){
			    break; 
			  }
			    result = Statement.getMoreResults();
		
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
	return complainListDto;

}

public List<TransferDto> getDetailsEndToEnd(int complaintnumber) {

	JdbcTemplate jdbcTemplate = null;
	Connection conn = null;
	PreparedStatement preparedStatement = null;
	ResultSet rs = null;
	String sql = "select * from forward where complaintnumber=? order by forwardserialno";
	List<TransferDto> listOfComplainDto = Lists.newArrayList();

	try {
		jdbcTemplate = MyUtill.conn(dataSource);
		conn = jdbcTemplate.getDataSource().getConnection();
		preparedStatement = conn.prepareStatement(sql);
		preparedStatement.setInt(1, complaintnumber);
		rs = preparedStatement.executeQuery();

		while (rs.next()) {
			TransferDto transferDto = new TransferDto();
			transferDto.setFromUser(rs.getString("fromuser"));
			transferDto.setToUser(rs.getString("touser"));
			transferDto.setForwardDate(rs.getString("forwardDate"));
			transferDto.setForwardSerialNo(rs.getString("forwardSerialNo"));
			transferDto.setCurrentSection(rs.getString("currentSection"));

			listOfComplainDto.add(transferDto);
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
