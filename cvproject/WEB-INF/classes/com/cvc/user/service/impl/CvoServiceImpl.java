package com.cvc.user.service.impl;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.cvc.dto.CvoDto;
import com.cvc.dto.CvoMonthyReportDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.user.daoImpl.CommonDaoImpl;
import com.cvc.util.FileUpload;
import com.cvc.util.MyUtill;
import com.cvc.util.SingletonProperties;
import com.google.common.collect.Lists;

@Service
public class CvoServiceImpl {
	
	@Autowired
	CommonDaoImpl commonDaoImpl;
	
	@Autowired
	DataSource dataSource;

	public void insertCvoMonthlyReport(String loginId, CvoMonthyReportDto cvoMonthyReportDto, HttpServletRequest request, UserLoginAuthenticationDto userLoginAuthenticationDto) throws Exception {
		if (cvoMonthyReportDto.getUploadedReport().getSize() != 0) {
			
				String rootPath=SingletonProperties.getUploadcvoProperty().getProperty("fileUploadPathCvo").trim();
			
			
				/*String rootPath = request.getSession().getServletContext().getRealPath("/CVC/cvo-report");*/
				
				File fileUpload = FileUpload.uploadFile(cvoMonthyReportDto.getUploadedReport(), rootPath);
				 commonDaoImpl.insertCvoReport(loginId,cvoMonthyReportDto,fileUpload,userLoginAuthenticationDto);
		}
		
	}

	public boolean getMonthyReport(String loginId, CvoMonthyReportDto cvoMonthyReportDto,
			UserLoginAuthenticationDto userLoginAuthenticationDto) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		int total = 0;
		boolean flag = false;
		String sql=	"SELECT COUNT(*) FROM cvomonthlyreport WHERE   month= ? AND year = ? AND cvoid = ?";
			
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setInt(1, cvoMonthyReportDto.getMonth());
				preparedStatement.setInt(2, cvoMonthyReportDto.getYear());
				preparedStatement.setString(3, loginId);
			rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				total = rs.getInt(1);
			}
			
			if (total == 1) {
				flag = true;
			}else {
				 flag = false;
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

	public List<CvoDto> getDetailsOfComplain(Integer complaintnumber) {
		String sql = "SELECT * FROM cvo WHERE complaintnumber like ?";
		Connection conn = null;
		JdbcTemplate jdbcTemplate=null;
		 PreparedStatement preparedStatement = null;
			ResultSet rs = null;
		List<CvoDto> listOfCvoDtos = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			 preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, complaintnumber+"%");
			 rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				CvoDto cvoDto = new CvoDto();
				cvoDto.setSourceOfComplaint(rs.getString("sourcecomplaint"));
				cvoDto.setGistOfAllegations(rs.getString("gistallegations"));
				cvoDto.setDueDateReport(rs.getString("duedatereport"));
				cvoDto.setCvoFileNumber(rs.getString("cvofilenumber"));
				cvoDto.setObservation(rs.getString("observation"));
				cvoDto.setResponseOfficialConcerned(rs.getString("responseofficialconcerned"));
				cvoDto.setCounterResponse(rs.getString("counterresponse"));
				cvoDto.setConclusion(rs.getString("conclusion"));
				cvoDto.setResponsibilityOfficials(rs.getString("responsibilityofofficials"));
				cvoDto.setRecommendationAction(rs.getString("recommendationaction"));
				cvoDto.setSystematicImprovement(rs.getString("systematicimprovement"));
				cvoDto.setAssuranceMemo(rs.getString("assurancememo"));
				cvoDto.setBiodataOfOfficials(rs.getString("biodataofficials"));
				
				listOfCvoDtos.add(cvoDto);
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
		return listOfCvoDtos;
	}

}
