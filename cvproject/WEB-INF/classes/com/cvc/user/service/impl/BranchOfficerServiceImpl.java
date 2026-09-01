package com.cvc.user.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.cvc.dto.CvoMonthyReportDto;
import com.cvc.dto.UserLoginAuthenticationDto;
import com.cvc.util.MyUtill;
import com.google.common.collect.Lists;

@Service
public class BranchOfficerServiceImpl {

	@Autowired
	DataSource dataSource;
	
	public List<CvoMonthyReportDto> getAllReportOfCvo(UserLoginAuthenticationDto userLoginAuthenticationDto) {
		JdbcTemplate jdbcTemplate = null;
		   Connection conn = null;
		   PreparedStatement preparedStatement = null;
			ResultSet rs = null;
		   String sql ;
			   sql=	"SELECT * FROM cvomonthlyreport WHERE   branchofficer = ?  ORDER BY reportsubmitdate DESC";
		
		List<CvoMonthyReportDto> listOfCvoMonthlyReportDto = Lists.newArrayList();	
		try {
				jdbcTemplate = MyUtill.conn(dataSource);
				conn = jdbcTemplate.getDataSource().getConnection();
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, userLoginAuthenticationDto.getUsername());
				rs = preparedStatement.executeQuery();
				
				while (rs.next()) {
					CvoMonthyReportDto cvoMonthyReportDto = new CvoMonthyReportDto();
					cvoMonthyReportDto.setOrganisation(rs.getString("organisation"));
					cvoMonthyReportDto.setCvoName(rs.getString("cvoname"));
					cvoMonthyReportDto.setReportSubmitDate(rs.getString("reportsubmitdate"));
					cvoMonthyReportDto.setMonth(rs.getInt("month"));
					cvoMonthyReportDto.setYear(rs.getInt("year"));
					cvoMonthyReportDto.setUploadedFileName(rs.getString("uploadedfile"));
					listOfCvoMonthlyReportDto.add(cvoMonthyReportDto);
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
		return listOfCvoMonthlyReportDto;
	}

}
