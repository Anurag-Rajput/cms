package com.cvc.user.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.cvc.dto.DairyDetailsDto;
import com.cvc.dto.ResetPasswordDto;
import com.cvc.security.PasswordCheck;
import com.cvc.util.MyUtill;

@Service
public class CitizenServiceImpl {
	
	@Autowired
	DataSource dataSource;
	
	
	public Integer insertNewPasswordforCitizen(ResetPasswordDto resetPasswordDto, String loginId) {
		JdbcTemplate jdbcTemplate = null;
		   Connection conn = null;
		   PreparedStatement preparedStatement = null;
			ResultSet rs = null;
			 String password = "";
			 String passwordOne = "";
			 String passwordTwo = "";
			 int flag = 0;		
			 String decrypt = resetPasswordDto.getOldPassword().substring(32);
				
		String sqlCount=	"SELECT * FROM citizenregistration WHERE  citizenid = ?";
		String sql = "UPDATE citizenregistration set password = ?,passwordone = ?,passwordtwo= ?  WHERE  citizenid = ? ";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sqlCount);
			preparedStatement.setString(1, loginId);
			rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				password = rs.getString("password");
				passwordOne= rs.getString("passwordone");
				passwordTwo= rs.getString("passwordtwo");
			}
			
			if (preparedStatement != null) {
				try {
					preparedStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if((MyUtill.getMd5(password+MyUtill.getMd5(decrypt))+decrypt).equals(resetPasswordDto.getOldPassword()) && !password.equals(resetPasswordDto.getNewPassword()) && !passwordOne.equals(resetPasswordDto.getNewPassword()) && !passwordTwo.equals(resetPasswordDto.getNewPassword())  ){
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, resetPasswordDto.getNewPassword());
				preparedStatement.setString(2, password);
				preparedStatement.setString(3, passwordOne);
				preparedStatement.setString(4, loginId);
				preparedStatement.executeUpdate();
				flag =1;
			}else{
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

}
