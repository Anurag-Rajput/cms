<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="Expires" content="-1"/>
	<meta http-equiv="pragma" content="no-cache" />
	<title>CVC</title>
		<link rel="stylesheet" href="<c:url value="/resources/user/css/reset.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/style.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/layout.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/prettyPhoto.css"/>" type="text/css" media="screen"></link>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/js/calendar-win2k-cold-1.css"/>" type="text/css" media="screen"></link>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-yui.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-replace.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/Dynalight_400.font.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/FF-cash.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.prettyPhoto.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/hover-image.js"/>"type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.easing.1.3.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.bxSlider.js"/>"type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/select/select2.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar-setup.js"/>"  type="text/javascript"></script><%-- 
<script src="<c:url value="/resources/user/js/calendar-en.js"/>"  type="text/javascript"></script> --%>
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<style>
.form-style-2 input.input-field,
input[type=text], select {
	height: 30px;
	width: 200px;
    padding: 6px 10px;
    margin: 8px 0;
    display: inline-block;
    border-radius: 1px;
    box-sizing: border-box;
     width: 140px;
     box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	border: 1px solid #C2C2C2;
	box-shadow: 1px 1px 4px #EBEBEB;
	-moz-box-shadow: 1px 1px 4px #EBEBEB;
	-webkit-box-shadow: 14px 12px 4px #EBEBEB;
	border-radius: 5px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 3px;
	padding: 7px;
	outline: none;
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 14px;
	
}
</style>
<!-- For Calender-->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/user/css/calendar.css"/>" />
<script src="<c:url value="/resources/user/js/calendar.js"/>"
	type="text/javascript"></script>
</head>


<c:url var="myurl" value="/user/updateClearanceDetails"/>
	<form:form name="myform" id="myform" method="post" action="${myurl}" enctype="multipart/form-data" commandName="userForm">
	
	
<section id="content">
  <div class="main">
    <div class="wrapper">
     <article class="col-1">
         <div class="inner-text" style="width:300%; background-color: white; color: #0E0D01;"> Login : &nbsp;${loginId}<br/>
            <small> </small> </div>
      </article>
      
      
       <div style="align:center; width: 100%; height: 600px;">
			<form role="form">
			
  
			
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A5CAF4" class="tab-txt" style="border-collapse:collapse;">
<td bgcolor="#FFFFFF">
<c:forEach items="${updateFileNoValue}" var="fiilNoValue">
		<form:form name="myform" id="myform" method="post" action="${myurl}" >
		
			<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">
		<c:choose>
											<c:when test="${fiilNoValue.clearanceType == 'VGC'}">
								<center>    VGC<input type="radio" id="clear" name="clearanceType" value="VGC" checked="checked"/>&nbsp;&nbsp;
											AIS<input type="radio"  id="clear" name="clearanceType"  value="AIS" />&nbsp;&nbsp;
											CVO<input type="radio" id="clear" name="clearanceType"  value="CVO" />
								</center>
											</c:when>
											<c:when test="${fiilNoValue.clearanceType == 'AIS'}">
								<center>    VGC<input type="radio" id="clear" name="clearanceType" value="VGC" />&nbsp;&nbsp;
											AIS<input type="radio"  id="clear" name="clearanceType"  value="AIS" checked="checked"/>&nbsp;&nbsp;
											CVO<input type="radio" id="clear" name="clearanceType"  value="CVO" />
								</center>
											</c:when>
											
											<c:when test="${fiilNoValue.clearanceType == 'CVO'}">
								<center>    VGC<input type="radio" id="clear" name="clearanceType" value="VGC" />&nbsp;&nbsp;
											AIS<input type="radio"  id="clear" name="clearanceType"  value="AIS" />&nbsp;&nbsp;
											CVO<input type="radio" id="clear" name="clearanceType"  value="CVO" checked="checked"/>
								</center>
											</c:when>
											
											
											<c:otherwise>
								<center>    VGC<input type="radio" id="clear" name="clearanceType" value="VGC" />&nbsp;&nbsp;
											AIS<input type="radio"  id="clear" name="clearanceType"  value="AIS" />&nbsp;&nbsp;
											CVO<input type="radio" id="clear" name="clearanceType"  value="CVO" />
								</center>
				</c:otherwise>
				
			</c:choose>
			
	<tr>
	    <td  width="30%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;&nbsp;File Number:  </td>
	    <td  width="70%" align="left" bgcolor="#E8F6F9"  class="headngblue" >
	    &nbsp;&nbsp;<span style="cursor:not-allowed"><input name="fileNo" id="fileNo"  value="${fiilNoValue.fileNo}" size="20" readonly="readonly" class="input-field"/></span>
	   </td>
	</tr>

	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Name Of Department:</td>
	    <%-- <td  width="40%" align="left" bgcolor="#E8F6F9"  class="headngblue">
	     &nbsp;&nbsp;<input name="nameOfDepart" id="nameOfDepart"  value="${fiilNoValue.nameOfDepart}" size="20" class="input-field"/>
	   </td> --%>
	   
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp; <select class="form-control select2" id="s_org"  name="nameOfDepart" style="width:300px;">
								<option value='${fiilNoValue.nameOfDepart}'>${fiilNoValue.nameOfDepart}</option>
								<c:forEach var="organisation" items="${mapOfOrganisation}">
									<option value='${organisation.organisationName}'>${organisation.organisationName}</option>
								</c:forEach>
							</select>
		</td>
	   
	   
	</tr>
	
	<tr>
	    <td  width="35%" align="" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Department Reference Number:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
	    &nbsp;&nbsp;<input name="departRefNo" id="departRefNo"  value="${fiilNoValue.departRefNo}" size="20" class="input-field"/>
	   </td>
	</tr>

	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Department Reference Date: </td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
	    &nbsp;&nbsp;<input name="departRefDate1" id="departRefDate1" value="${fiilNoValue.departRefDate1}" size="20" class="input-field"/>
	   </td>
	</tr>
        
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Department Reference Received Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
	    &nbsp;&nbsp;<input name="departRefRecvDate" id="departRefRecvDate"  value="${fiilNoValue.departRefRecvDate}" size="20" class="input-field"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Subject:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
	    &nbsp;&nbsp;<textarea   name="subject" rows="4px" cols="50" class="input-field">${fiilNoValue.subject}</textarea>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Purpose :</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		<%-- &nbsp;&nbsp;<input name="country" id="country"  value="${fiilNoValue.country}" size="20" class="input-field"/> --%>
		
		&nbsp;&nbsp;<select name="country" >
		
				<option value='${fiilNoValue.country}'>${fiilNoValue.country}</option>
				<option value = "EMPANELMENT">EMPANELMENT</option>
				<option value = "APPOINTMENT">APPOINTMENT</option>
				<option value = "PROMOTION">PROMOTION</option>
				<option value = "CONFIRMATION">CONFIRMATION</option>
				<option value = "EXTENSION">EXTENSION</option>
				<option value = "FOREIGN VISIT">FOREIGN VISIT</option>
				<option value = "ADDITIONAL CHARGES">ADDITIONAL CHARGES</option>
				<option value = "OTHER">OTHER</option>
            </select>
		</td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Number Of Officer:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
	     &nbsp;&nbsp;<input name="numberOfOfficer" id="numberOfOfficer"  value="${fiilNoValue.numberOfOfficer}" size="20" class="input-field"/>
	   </td>
	</tr>
	
    <tr>
      <td colspan="2">
 		   <table  width="1400px" border="1" align="center" cellpadding="10" cellspacing="1" class="tblbdr" id="dataTable">
			 <tr >
				<td  align="left" bgcolor="#E8F6F9"  width="10%" class="headngblue">Name Of Officer</td>
				<td  align="left" bgcolor="#E8F6F9" width="10%" class="headngblue">Service</td>
				<td  align="left" bgcolor="#E8F6F9" width="10%" class="headngblue">Batch</td>
				<td  align="left" bgcolor="#E8F6F9"  width="10%" class="headngblue">Cadre</td>
				<td  align="left" bgcolor="#E8F6F9" width="10%"  class="headngblue">Employee Code</td>
				<td  align="left" bgcolor="#E8F6F9" width="10%" class="headngblue">Final Decision</td>
				<td  align="left" bgcolor="#E8F6F9"  width="10%" class="headngblue">Final Decision Date</td>
				<td  align="left" bgcolor="#E8F6F9" width="10%" class="headngblue">Date Of Birth</td>
				<td  align="left" bgcolor="#E8F6F9" width="5" class="headngblue">Date Of Retirement</td>
			</tr>
		  </table>
		  <c:forEach items="${updateOfficerFileNoValue}" var="fiilNoOfficerValue">
			 <table  width="390px" border="1" align="center" cellpadding="10" cellspacing="1" class="tblbdr" id="dataTable">
				<tr>
					<td  align="left" bgcolor="#E8F6F9"  class="headngblue"><input type="text"  value="${fiilNoOfficerValue.nameOfOfficer}" size="20"  name="nameOfOfficer"/></td>
					<td  align="left" bgcolor="#E8F6F9"  class="headngblue"><input type="text"  value="${fiilNoOfficerValue.service}" size="20"  name="service"/></td>
					<td  align="left" bgcolor="#E8F6F9"  class="headngblue"><input type="text"  value="${fiilNoOfficerValue.batch}" size="20"  name="batch"/></td>
					<td  align="left" bgcolor="#E8F6F9"  class="headngblue"><input type="text"  value="${fiilNoOfficerValue.cadre}" size="20"  name="cadre"/></td>
					<td  align="left" bgcolor="#E8F6F9"  class="headngblue"><input type="text"  value="${fiilNoOfficerValue.empCode}" size="15"  name="empCode"/></td>
					<td  align="left" bgcolor="#E8F6F9"  class="headngblue"><input type="text"  value="${fiilNoOfficerValue.finalDecisionDd}" size="20"  name="finalDecisionDd"/></td>
					<td  align="left" bgcolor="#E8F6F9"  class="headngblue"><input type="text"  value="${fiilNoOfficerValue.finalDecisionDate}" size="20"  name="finalDecisionDate"/></td>
					<td  align="left" bgcolor="#E8F6F9"  class="headngblue"><input type="text"  value="${fiilNoOfficerValue.dateOfBirth}" size="15"  name="dateOfBirth"/></td>
					<td  align="left" bgcolor="#E8F6F9"  class="headngblue"><input type="text"  value="${fiilNoOfficerValue.dateOfRetirement}" size="15"  name="dateOfRetirement"/></td>
				</tr>
			  </table>	
		    </c:forEach>		
		  </td>
	    </tr>
	
		<tr>
   			 <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Letter to CBI Date:</td>
    		 <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt"/>
			&nbsp;&nbsp;<input name="letterToCBIDate" id="letterToCBIDate"  value="${fiilNoValue.letterToCBIDate}" size="20" class="input-field"/>		
   			</td>
		</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Letter to Section Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="letterToSectionDate" id="letterToSectionDate"  value="${fiilNoValue.letterToSectionDate}" size="20" class="input-field"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Letter to Concerned Organization:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp; <select class="form-control select2" id="s_org"  name="letterToConcerned" style="width:300px;">
								<option value='${fiilNoValue.letterToConcerned}'>${fiilNoValue.letterToConcerned}</option>
								<c:forEach var="organisation" items="${mapOfOrganisation}">
									<option value='${organisation.organisationName}'>${organisation.organisationName}</option>
								</c:forEach>
							</select>
		</td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Complete Profile:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
	    <c:choose>
											<c:when test="${fiilNoValue.completeProfile == 'Yes'}">
												<input type="radio"  name="completeProfile" value="Yes" checked="checked"/>Yes
												<input type="radio"  name="completeProfile" value="No" />No
											</c:when>
											<c:when test="${fiilNoValue.completeProfile == 'No'}">
												<input type="radio"  name="completeProfile" value="Yes" />Yes
												<input type="radio"  name="completeProfile" value="No" checked="checked"/>No
											</c:when>
											
											<c:otherwise>
												<input type="radio"  name="completeProfile" value="Yes" />Yes
												<input type="radio"  name="completeProfile" value="No" />No
											</c:otherwise>
				
		</c:choose>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;<input name="returnToDepart"   value="${fiilNoValue.returnToDepart}" size="20"/>
	    </td>
	</tr>
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Feedback Received From CBI Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="feedbackReceivedFromCBIDate" id="feedbackReceivedFromCBIDate"  value="${fiilNoValue.feedbackReceivedFromCBIDate}"  size="20" />
	   </td>
	</tr>
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Feedback Received  From Section:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="feedbackReceivedFromSection" id="feedbackReceivedFromSection"  value="${fiilNoValue.feedbackReceivedFromSection}"  size="20" class="input-field"/>
		 
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Feedback Received From Concerned Organization:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="feedbackReceivedFromOrganization" id="feedbackReceivedFromOrganization"  value="${fiilNoValue.feedbackReceivedFromOrganization}"  size="20" />
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;File Submitted By DH Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="fileSubmittedByDHDate" id="fileSubmittedByDHDate"  value="${fiilNoValue.fileSubmittedByDHDate}"  size="20" />
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Date On File:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="dateOnFile" id="dateOnFile"  value="${fiilNoValue.dateOnFile}" size="20" />
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Letter Issue Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="letterIssueDate" id="letterIssueDate"   value="${fiilNoValue.letterIssueDate}" size="20" />
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Upload Document:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
	   		 	  
				<a href="<c:url value= "/resources/clearance/${fiilNoValue.fileId}"/>" target="_blank">Attached Document</a>
	   </td>							
	</tr>
	
</table>

</form:form>
	</c:forEach>
</td>
</table>
	
 <input type="hidden" name="csrf"  value="${_csrf.token}" /> 
  <br>   
			
 <div class="form-group" align="right">
              <label><button type="submit" class="button-2"  name="save" >Update</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			  <div class="form-list" align="left">
			  <a href="<c:url value="/user/clr/vigClearance"/>"> <button type="button" class="button-2" data-toggle="modal" data-target="#myModal"  name="submit" value="close">Close </button></a>&nbsp;&nbsp;
	   		   <a href="<c:url value="/user/clr/searchClearance"/>">  <button type="button" class="button-2" data-toggle="modal" data-target="#myModal"  name="submit" value="Go Back">Go Back </button></a>&nbsp;&nbsp;
	   
	   	</div>
 </div>

</article>
    </div>
    
    
    
    
    
  </div>
</section>
</form:form>
</html>