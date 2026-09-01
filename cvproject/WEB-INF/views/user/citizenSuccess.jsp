<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
 <title>CVC CITIZEN</title>
  <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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
<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

</script>
<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
	
	
	function UpdateProfile()
	{
		document.getElementById("updateProfile").submit();
	}
</script>

<header>
	<div align="fleft">
		<div class="row-bot-bg">
			<div class="main">
				<div class="wrapper">
					<c:url var="logoutUrl" value="/user/j_spring_security_logout"></c:url>

					<form action="${logoutUrl}" method="post" id="logoutForm">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					
					<c:url var="updateProfile" value="/user/public/updateCitizenProfile/view"></c:url>
					<form action="${updateProfile}" method="post" id="updateProfile">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>

					<div align="left" style="margin-top: 2.5cm;">
						<nav>
							<ul class="menu">
								<li><a
									href="<c:url value="/user/public/citizenMyComplaint"/>"
									style="margin-left: 30px;">My Previous Complaint</a></li>
								<li><a href="<c:url value="/user/public/citizen"/>"
									style="margin-left: 30px;">Add New Complaint</a></li>
								<li><a href="#"
									style="margin-left: 30px;" onclick="UpdateProfile();">Edit Profile</a></li>
								<li><a
									href="<c:url value="/user/public/citizenResetPassword"/>"
									style="margin-left: 30px;">Change Password</a></li>
							</ul>

							<ul class="menu1">
								<li><a href="javascript:formSubmit();" class="btn "
									title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></a></li>

							</ul>
						</nav>

					</div>

				</div>
			</div>
		</div>
	</div>

</header>

</head>
<body>



<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper">
     
      <article class="col-1">
         <div class="inner-text" style="width:300%; background-color: rgb(231, 243, 255); color: #0E0D01;"> <br/>
            <small></small> </div>
      </article>
      <article class="fright">
      <div class="fright">
      <div style="width: 500px; height: 600px;">
			<form role="form">
			 <div   style="width:500px; background-color: rgb(231, 243, 255); color: #0E0D01;" ></div>
			 
			
			</form>
		</div>
        
      </div>
	</article> 
      
    
    
    
    
    	<c:forEach items="${compaincell}" var="complain">
    <table width="50%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A5CAF4" class="tab-txt" style="border-collapse:collapse;">



<td bgcolor="#FFFFFF">
	<img src="<c:url value="/resources/user/images/done.gif-c200"/>" align="middle" width="30" height="30"/><label>Complaint has been successfully registered.</label>
	<br></br>		
<table width="100%"  border="0" align="centre" cellpadding="4" cellspacing="2" class="tblbdr">
		
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Complaint No: </td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt" style="color:red; font-size: 110%;">${complainNumber}</span>
	
	  
	  
	   </td>
	</tr>

	

<tbody>
                                       
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Complaint Against Name:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">${complain.complaintAgainstName}<span class="txt">
	  
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Designation:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">${complain.designation}<span class="txt">
	
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Organization:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">${complain.organization}<span class="txt">
	
	   </td>
	</tr>
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"> Upload Scan Document:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">${complain.fileName}<span class="txt">
	     	      
	   </td>
	</tr>
	
	
	
	</table><br><br><br>
	</td>
	
		
</table> 

</c:forEach>
                   </div>
                     </div>

</section>

</body>
</html>
