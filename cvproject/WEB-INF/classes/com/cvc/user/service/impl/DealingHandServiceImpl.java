package com.cvc.user.service.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.cvc.dto.CitizenDto;
import com.cvc.dto.CvoDto;
import com.cvc.dto.DairyDetailsDto;
import com.cvc.user.service.DealingHandServiceI;
import com.cvc.util.MyUtill;
import com.google.common.collect.Lists;

@Service
public class DealingHandServiceImpl implements DealingHandServiceI {

	@Autowired
	DataSource dataSource;
	
	public List<DairyDetailsDto> viewComplain(Integer complaintnumber) {
		String sql = "SELECT * FROM complain WHERE complaintnumber = ?";
		Connection conn = null;
		JdbcTemplate jdbcTemplate=null;
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
				DairyDetailsDto dairyDetailsDto=new DairyDetailsDto();
				dairyDetailsDto.setComplaintNumber(rs.getInt("complaintnumber"));
				dairyDetailsDto.setComplainDate(rs.getString("complaindate"));
				dairyDetailsDto.setComplaintSentType(rs.getString("complaintsentfrom"));
				if(rs.getString("rolltype").equalsIgnoreCase("CITIZEN")) 
				{
					String name=rs.getString("dairyid");
					name=name.split("/")[0];
					System.out.println(name);
					
					dairyDetailsDto.setSenderName(getCitizenName(name));
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
				dairyDetailsDto.setSection(rs.getString("section"));;
				dairyDetailsDto.setWhetherFastTrack(rs.getString("whetherfasttrack"));
				dairyDetailsDto.setComplaintType(rs.getString("complainttype"));
				//dairyDetailsDto.setActionTaken(rs.getString("actiontaken"));
				
				
					if(rs.getString("actiontaken")==null || rs.getString("actiontaken").isEmpty() || rs.getString("actiontaken").length()==0 || rs.getString("actiontaken").contentEquals("null") )
					{
						dairyDetailsDto.setActionTaken("None");	
					}
					else
					{
						dairyDetailsDto.setActionTaken(rs.getString("actiontaken"));
					}
				
				dairyDetailsDto.setDairyStatus(rs.getString("dairystatus"));
				dairyDetailsDto.setGistOfAllegation(rs.getString("gistallegation"));
				if(rs.getString("uploadscandocument").isEmpty()){
					dairyDetailsDto.setFileName("No File Choosen");
				}else{
					dairyDetailsDto.setFileId(rs.getString("uploadscandocument"));
					dairyDetailsDto.setFileName(rs.getString("uploadscandocument").substring(28));
				}
				dairyDetailsDto.setComplaint(rs.getString("complaint"));
				dairyDetailsDto.setGistOfAllegation(rs.getString("gistallegation"));
				dairyDetailsDto.setDetailsAlligations(rs.getString("detailofallegation"));
				dairyDetailsDto.setBoDecisionDate(rs.getString("bodecisiondate"));
				
				dairyDetailsDto.setBoName(rs.getString("boname"));
				dairyDetailsDto.setBoirfinaldec(rs.getString("boirfinaldec"));
				dairyDetailsDto.setBoirfinaldecdate(rs.getString("bofinaldecdate"));
				dairyDetailsDto.setRoletype(rs.getString("rolltype"));
				dairyDetailsDto.setBoDecision(rs.getString("bodecision"));
				/*if(rs.getString("bodecision")==null) 
				{
					dairyDetailsDto.setBoDecision(" ");	
				}
				else
				{
					dairyDetailsDto.setBoDecision(rs.getString("bodecision"));
				}*/
				
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

	
	public List<DairyDetailsDto> viewCPAComplain(String complaintnumberString) {
		String Complaint=complaintnumberString.replace("_", "/");
		String sql = "SELECT *,(CASE WHEN IR='1' THEN 'IR' WHEN FACTUAL_REPORT='1' THEN 'Factual Report' WHEN FILED='1' THEN 'Filed' WHEN DIRECT_INVEST='1' THEN 'Direct Investigation' WHEN necessary_action='1' THEN 'NA' WHEN action_taken_report='1' THEN 'ATR' WHEN discrete_veri='1' THEN 'DV' ELSE 'Pending' END) AS bodecision FROM cpa_complaint WHERE complaint= ? ";
		Connection conn = null;
		JdbcTemplate jdbcTemplate=null;
		 PreparedStatement preparedStatement = null;
			ResultSet rs = null;
		List<DairyDetailsDto> liDairyDetailsDtos = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			 preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, Complaint);
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

	
	
	
	
	
	public void updateCvoInbox(Integer complaintnumber) {
		JdbcTemplate jdbcTemplate = null;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		String sql = "UPDATE complain SET cvoview = ? where complaintnumber = ?";
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setInt(1, 1);
			preparedStatement.setInt(2, complaintnumber);
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

	public List<CvoDto> viewCVOComplain(Integer complaintnumber) {
		String sql = "SELECT * FROM cvo WHERE complaintnumber like ?";
		Connection conn = null;
		JdbcTemplate jdbcTemplate=null;
		 PreparedStatement preparedStatement = null;
			ResultSet rs = null;
		List<CvoDto> liCvoDtos = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			 preparedStatement = conn.prepareStatement(sql);
			 String comp="%"+complaintnumber.toString()+"%";
			preparedStatement.setString(1, comp);
			 rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				CvoDto cvoDto=new CvoDto();
				cvoDto.setSourceOfComplaint(rs.getString("sourcecomplaint")==null?"":rs.getString("sourcecomplaint"));
				cvoDto.setGistOfAllegations(rs.getString("gistallegations")==null?"":rs.getString("gistallegations"));
				cvoDto.setDueDateReport(rs.getString("duedatereport")==null?"":rs.getString("duedatereport"));
				cvoDto.setCvoFileNumber(rs.getString("cvofilenumber")==null?"":rs.getString("cvofilenumber"));
				cvoDto.setObservation(rs.getString("observation")==null?"":rs.getString("observation"));
				cvoDto.setResponseOfficialConcerned(rs.getString("responseofficialconcerned")==null?"":rs.getString("responseofficialconcerned"));
				cvoDto.setCounterResponse(rs.getString("counterresponse")==null?"":rs.getString("counterresponse"));
				cvoDto.setConclusion(rs.getString("conclusion")==null?"":rs.getString("conclusion"));
				cvoDto.setResponsibilityOfficials(rs.getString("responsibilityofofficials")==null?"":rs.getString("responsibilityofofficials"));
				cvoDto.setRecommendationAction(rs.getString("recommendationaction")==null?"":rs.getString("recommendationaction"));
				cvoDto.setSystematicImprovement(rs.getString("systematicimprovement")==null?"":rs.getString("systematicimprovement"));
				cvoDto.setAssuranceMemo(rs.getString("assurancememo")==null?"":rs.getString("assurancememo"));
				cvoDto.setBiodataOfOfficials(rs.getString("biodataofficials")==null?"":rs.getString("biodataofficials"));
				cvoDto.setOfficerName(rs.getString("officername")==null?"":rs.getString("officername"));
				cvoDto.setOfficerDesignation(rs.getString("officerdesignation")==null?"":rs.getString("officerdesignation"));
				cvoDto.setInvestigationOpenDate(rs.getDate("investigationopendate")==null?null:rs.getDate("investigationopendate"));
				cvoDto.setInvestigationCloseDate(rs.getDate("investigationclosedate")==null?null:rs.getDate("investigationclosedate"));
				cvoDto.setDecision(rs.getString("decision")==null?"":rs.getString("decision"));
				cvoDto.setDecisionDate(rs.getDate("decisiondate")==null?null:rs.getDate("decisiondate"));
				cvoDto.setRemark(rs.getString("remark")==null?"":rs.getString("remark"));
				cvoDto.setCvcJuri(rs.getString("cvcjuri")==null?"":rs.getString("cvcjuri"));
				cvoDto.setReferFirstStage(rs.getString("referfirststage")==null?"":rs.getString("referfirststage"));
				cvoDto.setRecommendationActionDate(rs.getDate("recommendationactiondate")==null?null:rs.getDate("recommendationactiondate"));
				cvoDto.setReferFirstStageDate(rs.getDate("referfirststagedate")==null?null:rs.getDate("referfirststagedate"));
				cvoDto.setAssuranceMemoDate(rs.getDate("assurancememodate")==null?null:rs.getDate("assurancememodate"));
				liCvoDtos.add(cvoDto);
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
		return liCvoDtos;
		}
	public String getCitizenName(String citizenid) {
		String sql = "SELECT * FROM citizenregistration WHERE citizenid= ?";
		Connection conn = null;
		JdbcTemplate jdbcTemplate=null;
		 PreparedStatement preparedStatement = null;
			ResultSet rs = null;
		List<CitizenDto> citizenList = Lists.newArrayList();
		try {
			jdbcTemplate = MyUtill.conn(dataSource);
			conn = jdbcTemplate.getDataSource().getConnection();
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, citizenid);
			 rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				CitizenDto citizenDto=new CitizenDto();
				citizenDto.setName(rs.getString("name"));
				citizenList.add(citizenDto);
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
		return citizenList.get(0).getName();
		}
	
}
