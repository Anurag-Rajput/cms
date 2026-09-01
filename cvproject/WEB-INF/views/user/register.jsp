<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<head>
<style>
.error {
	color: #FFFFFF;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	/* border: 3px solid #ff0000; */
	padding: 8px;
	margin: 16px;
}
</style>
<!-- For Calender-->
<%-- <link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/css/calendar.css"/>"  /> --%>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/css/selecttext.css"/>"  />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  />
<%-- <script language="javascript" src="<c:url value="/resources/user/js/calendar.js"/>"  type="text/javascript"></script> --%>
<script language="javascript" src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script language="javascript" src="<c:url value="/resources/user/js/select/select2.js"/>"  ></script>
<script src="<c:url value="/resources/user/js/bCrypt.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/md5.js"/>" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  ></link>
<%-- <script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script> --%>
<script  src="<c:url value="/resources/user/js/jquery.validate.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/jquery.validate.min.js"/>"  type="text/javascript"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel='stylesheet' type='text/css' href='../resources/user/css/datePicker.css'/>
<script src="../resources/user/js/datePicker.js"></script>
<script>


$(document).ready(
		function() {
				
			$( "#dateOfTenure") .datepicker({
		        changeMonth: true,
		        changeYear: true,
		        dateFormat:"dd-mm-yy",
		        minDate: "now"
		      });
});
function validatePassword() {
    var newPassword = document.getElementById('password').value;
         if(newPassword.search((/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[#$%&()*+,-./:;<=>?@\^_`{|}~]).*$/)) ){
        document.getElementById("error").innerHTML="Should contain 1 digit,1 Sepical Character, 1 small, 1 capital letter and minimum 8 character";
        document.getElementById("btn-save").disabled=true;
  }else{
	  document.getElementById("error").innerHTML = "";
	  document.getElementById("btn-save").disabled=false;
  }
    
}
</script>
<script type="text/javascript">  
        function GeneratePwd() { 
        	 
            if (document.getElementById("password").value != "") {  
                document.getElementById("password").value = calcMD5(document.getElementById("password").value);  
            }  
        }  
        
        function isNumeric() { 
        	 var mobileNumber = document.getElementById('mobileNumber').value;
             if(mobileNumber.search(/^[0-9\b]+$/) ){
            document.getElementById("error1").innerHTML="Digit Only";
            document.getElementById("btn-save").disabled=true;
      }else{
    	  validatePassword();      }
        }  
        
</script>  

<script>
	function findUserId() {
		
		var userId = document.getElementById("userID").value;
			$.ajax({
				url : "<c:url value='/user/getAuthorities'/>",
				type : "POST",
				data : {
					"userId" : userId
				},
				success : function(response) {
					if(response==true){
						$('#userIdError').show();
						$('#userIdError1').hide();
						 document.getElementById('btn-save').disabled=true;
					}else{
						$('#userIdError').hide();
						$('#userIdError1').show();
						 document.getElementById('btn-save').disabled=false;
					}
					
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}
</script>
<script>
$(document).ready(function(){
    $('#myOptions').change(function(){
       $(this).val() == "ROLE_BO" ? $('#myTextBox').show() : $('#myTextBox').hide();
       $(this).val() == "ROLE_CVO" ? $('#myTextBox1').show() : $('#myTextBox1').hide();
    });
});
</script>

<script>
$(document).ready(function() {
	$('#userIdError').hide();
	$('#userIdError1').hide();
	document.getElementById("btn-save").disabled=true;
	$('#s_org').select2({
		placeholder : "Select organization",
		allowClear : true
	});
	
	$("#s_orgcod").select2({
		placeholder : "Select organization code",
		allowClear : true
	});
});
</script>	

<!-- For Validation-->
<script type="text/javascript"	src="<c:url value="/resources/user/js/gen_validatorv31.js"/>" ></script>


<%@page import="java.sql.*"%>
<title>Registration Form</title>
<style type="text/css">
h3{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; color:SlateBlue;
text-align: center; text-decoration: underline }
table{font-family: Calibri; color:white; font-size: 11pt; font-style: normal;width: 50%;
text-align:; background-color: SlateBlue; border-collapse: collapse; border: 2px solid navy}
table.inner{border: 0px}
</style>

<style type="text/css">
    #progressbar {
        width: 400px;
    }
</style>
</head>
 
<body>
<c:url var="myurl" value="/addUserDetails"/>
<h3>Central Vigilance Commission</h3>
<form:form action="${myurl}" method="post" id="myform" autocomplete="off" name="myform" commandName="register">
 <div id="progressbar"></div>
<center><table align="center" cellpadding = "10">
<tr>
<td>Name</td>
<td><form:input type="text" path="userName" name="userName" autocomplete="off" maxlength="15"/>
<input type="hidden" name="csrf"	value="${_csrf.token}"/>
<form:errors path="userName" cssClass="error"/>
(max 10 characters a-z and A-Z)
</td>
</tr>

 <tr>
<td>User ID</td>
<td><form:input type="text" path="userID"  autocomplete="off" id="userID" name="userID" maxlength="15" />
<input type="button" value="Check" onclick="findUserId();"/>
<div align="center"><label style="color: red; ">
        <c:out  value='${errorEntry}' />
        </label></div>
<div id="userIdError" style="color: red;">User Id Already Exist.</div>
<div id="userIdError1" style="color: green;">User Id Valid.</div>
<form:errors path="userID" cssClass="error"/></td>

</tr>
<tr>
<td>Password</td>
<td>
<form:input type="password" id="password" name="password" onkeypress="validatePassword();"   autocomplete="off" path="password"  />
<label id="error" style=" color: red; font: bold; "/>
<form:errors path="password" cssClass="error"/></td>
</tr>

 <tr>
<td>Mobile No.</td>
<td><form:input type="text" path="mobileNumber" autocomplete="off" onkeypress="isNumeric();" name="mobileNumber" id="mobileNumber" maxlength="10"/>
<label id="error1" style="color: red;"/>
<form:errors path="mobileNumber" cssClass="error"/>
</td>
</tr>

<tr>
<td>Email</td>
<td><form:input type="text" name="userEmail" path="userEmail" autocomplete="off"  maxlength="50"/>
<form:errors path="userEmail" cssClass="error"/></td>
</tr>


<tr>
<td>Organization</td>
<td>										
						 <form:select class="form-control" id="s_org" path="organisation" name="organisation" style="width:300px;">
								<form:option value="NONE" selected="selected">Select Organization</form:option>
								<c:forEach var="organisation" items="${mapOfOrganisation}">
									<form:option value='${organisation.organisationName}'>${organisation.organisationName}</form:option>
								</c:forEach>
							</form:select>
						<form:errors path="organisation" cssClass="error"/>
						
						
    
</td>
</tr>

 

<tr>
<td>Login Type:</td>
<td><select id="myOptions" name="loginType" style="width:100px" required>
						<option value="ROLE_Diary">Diary</option>  
						<option value="ROLE_DH">Dealing Hand</option>                 
                    	<option value="ROLE_SO">Section Officer</option> 
                    	<option value="ROLE_BO">Branch Officer</option>
                    	<option value="ROLE_CVO">CVO</option> 
                    	<option value="ROLE_CLR">Coord-2</option>
                    	<option value="ROLE_CVC">CVC</option>
                        <option value="ROLE_COORD">Coord-1</option>  
                        <option value="ROLE_OTHER">Others</option>  </select>
                        <form:errors path="loginType" cssClass="error"></form:errors>
</td>
</tr>
					<tr id="myTextBox" class="hiddenField" ><td>Branch Officer Code:</td>
					<td>
					<form:input type="text" name="boCode" path="boCode" />
					<form:errors path="boCode" cssClass="error"/>
					</td>
					</tr>
					
					<tr id="myTextBox1" class="hiddenField" ><td>CVO Code:</td>
					<td>
					 <select class="form-control" id="s_orgcod"  name="cvoCode" style="width:300px;">
								<option value="NONE" selected="selected">-- Select Code--</option>
								<c:forEach var="organisation" items="${mapOfOrganisation}">
									<option value='${organisation.organisationCode}'>${organisation.organisationCode}</option>
								</c:forEach>
							</select>
							<form:errors path="organisation" cssClass="error"></form:errors>
					</td>
					</tr>
<tr>
<td>Login Roll:</td>
<td>
	<!-- 	<input type="text" name="loginRoll" style="width:100px" required/> -->
					 <select name="loginRoll" style="width:100px" required>
						<option >Diary </option>
						<option >Complaint Cell </option>                      
                    	<option value="1">Vigilance-1</option>  
                    	<option value="2">Vigilance-2</option>  
                       	<option value="3">Vigilance-3</option>  
                        <option value="4">Vigilance-4</option>  
                        <option value="5">Vigilance-5</option>  
                        <option value="6">Vigilance-6</option>  
                        <option value="7">Vigilance-7</option>  
                        <option value="8">Vigilance-8</option>  
                        <option value="9">Vigilance-9</option>
					    <option value="CVO">CVO</option> 
					    <option value="Cordn-1" >Cordn-1</option>
					    <option value="Cordn-2">Cordn-2</option>
  					</select> 
  					<form:errors path="loginRoll" cssClass="error"></form:errors>
</td>
</tr>
<tr>
<td>Designation</td>
<td><form:input type="text" name="desiganation" path="desiganation" autocomplete="off" maxlength="15" />
<form:errors path="desiganation" cssClass="error"/></td>
</tr> 

<tr>
<td>Date of Retirement/Tenure</td>
<td><input id="dateOfTenure"  name="dateOfTenure"  size="20" readonly="readonly"/>
<%-- <td><input id="dateOfTenure"  name="dateOfTenure"  size="20" required readonly/> &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>"  border="0" onclick="displayCalendar(document.myform.dateOfTenure,'dd-mm-yyyy',this);" /> --%>
<form:errors path="dateOfTenure" cssClass="error"></form:errors>
</td>
</tr>

<tr>
<td colspan="2" align="center">

</td>
</tr> 

				<tr>
                    <td>Image#</td>
                    <td>
                       
                            <img id="captcha_id" name="imgCaptcha" src="captcha.jpg"/>
                             <a href="javascript:;"
                        title="change captcha text"
                        onclick="document.getElementById('captcha_id').src = 'captcha.jpg?' + Math.random();  return false">
                            <img src= "<c:url value="/resources/user/images/refresh.png"/>"/>
                    </a>
                        
                    </td>
 
                   
 
                </tr>
                 <tr>
                    <td>Enter above Image text#</td>
                    <td><input type="text" name="captcha" /></td>
                </tr>
                
                
</table>
</center>
<br/><br/>
<div><label style="color: red;">${message}</label></div>
							
<br></br>
<div class="form-group" align="center">
 <input type="submit" id="btn-save" onclick="GeneratePwd();" value="Submit"/>
<input type="reset" value="Reset"/>
<a href="<c:url value="/"/>" style="margin-left:30px;">Back to login</a>
</div>
 </form:form>
 
 
</body>
</html>