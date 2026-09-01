<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function validateFields()
{
	
	var name=document.getElementById('userName').value;
	var designation=document.getElementById('desiganation').value;
	var email=document.getElementById('userEmail').value;
	var mob=document.getElementById('mobileNumber').value;
	if(name.search(/^[a-z|A-Z\s\b]+$/))
	{
		alert("Please input correct name.");
		return false;
	}
	if(designation.search(/^[a-z|A-Z\s\b]+$/))
	{
		alert("Please input correct designation.)");
		return false;
	}
	if(email.search(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Please input correct email format(abc@xyz.com)");
		return false;
	}
	if(mob.search(/^(\+\d{1,3}[- ]?)?\d{10}$/) && ! (number.match(/0{5,}/)) )
	{
		alert("Please input correct mobile number.");
		return false;
	}

	return true;
/* 	alert("got it");
	$("#myForm").submit();  */
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:url var="myurl" value="/user/editProfileUpdate" />
<form:form  id="myForm" method="post" action="${myurl}" commandName="editProfileForm">

<div class="main">
	<div class="wrapper">
	<div align="center">
		<label style="color: red;"> <c:out value='${errMessage}' />
			</label>
	</div>
					
		<div class="fcenter">
			<div align="center">
					<div style="width: 515px; background-color: rgb(218, 237, 241); color: #0E0D01;">
						<h5>Edit Profile</h5>
					</div>
						<div align="center"	style="background-color: rgb(255, 201, 167); color: #0E0D01;"></div>
				<div style="width: 500px; height: 500px;">				 
							
						<div class="form-group">
							<br><br> &nbsp;Name:
							<div class="form-list">
								<form:input  type="text" id="userName" path="userName" value="${userDetail.name}"/>
							</div>
						</div>
						<br>
     				<div class="form-group">
						<br><br> &nbsp;Designation:
						<div class="form-list">
							<form:input  type="text" id="desiganation" path="desiganation" value="${userDetail.desiganation}"/>
						</div>
					</div>
						<br>
					<div class="form-group">
						<br><br> &nbsp;Email:
						<div class="form-list">
							<form:input  type="text" id="userEmail" path="userEmail" value="${userDetail.email}"/>
						</div>
					</div>
						<br>				
					<div class="form-group">
						<br><br> &nbsp;Mobile Number:
						<div class="form-list">
							<form:input  type="text" id="mobileNumber" path="mobileNumber" value="${userDetail.mobile}"/>
						</div>
					</div>
						<br>
						<input type="hidden" name="csrf" value="${_csrf.token}" /> 
					<div class="form-group">
						<label><button type="submit" id="submit" class="button-2" style="width: 70px;" name="save" onclick="return validateFields();">Save</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="button-2" style="width: 70px;" name="reset">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>		

</form:form>



</body>
</html>