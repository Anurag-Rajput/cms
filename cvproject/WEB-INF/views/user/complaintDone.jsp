<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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

<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

</script>
<script>
function myFunction() {
    window.print();
}
</script>


<style type="text/css"> 
.exactCenter { width:700px; height:500px; position: fixed; background-color: #00FF00; top: 30%; left: 30%; margin-top: -100px; margin-left: -100px; } 


</style> 

 
</head>

<body >
<!--==============================header=================================-->
<header>
 <div align="middle">
 <img src="<c:url value="/resources/user/images/cvc_logo1.PNG"/>" width="120" height="120" align="left">
   
  </div>
  
</header>
<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper">
 
 


 <br><br>

<form name="myform" id="myform" method="post" action="" method="get" >

<div align="center">

 <h3>Forwarded Successfully <img src="<c:url value="/resources/user/images/dholler-ok.png"/>" align="middle" width="40" height="40"></h3>
</div>

   <c:forEach var="fComplain" items="${forwardComplain}">
<div >
<h3> <a href="<c:url value="/user/goBack"/>" style="text-decoration:none; size:100px; color:#10184E">Go Back</a></h3>
 <div align="right">
 <button onclick="myFunction()">Print this page</button>
   </div>
   
   </div>
  <div align="center">
  <table width="50%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A5CAF4" class="tab-txt" style="border-collapse:collapse;">



<td bgcolor="#FFFFFF">
			
<table width="100%"  border="0" align="centre" cellpadding="4" cellspacing="2" class="tblbdr">
		
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Complaint No: </td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt" style="color:red; font-size: 110%;">${fComplain.complaint}</span>
   
	   </td>
	</tr>

<tbody>
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Sender's Name: </td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.senderName}</span>
	   </td>
	</tr>
        
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Address:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.address}</span>
	   </td>
	</tr>
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Address2:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.address2}</span>
	   </td>
	</tr>
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">State:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.state}</span>
	   </td>
	</tr>
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">City:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.city}</span>
	   </td>
	</tr>
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Pin No:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.pinno}</span>
	   </td>
	</tr>
	 <tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">E-mail:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.email}</span>
	   </td>
	</tr>

	 <tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Mobile Number:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.mobileNo}</span>
	   </td>
	</tr>
     
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Complaint Against Name:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.complaintAgainstName}</span>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Designation:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.designation}</span>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Organization:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.organization}</span>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Section:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.section}</span>
	    
	   </td>
	</tr>
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Whether Fast Track:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.whetherFastTrack}</span>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Complaint Type:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.complaintType}</span>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">Forwarded To:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.confirmCVO}</span>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"> Upload Scan Document:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">${fComplain.uploadScanDocument}</span>
	   </td>
	</tr>
	
	
	</table><br><br><br>
	</td>
	
		
</table> 




 </div>
 </c:forEach>
</div>
 </div>
  </div>
</section>

<!--==============================footer=================================-->
<footer>
  <div class="main">
    <div class="aligncenter"> <span>Copyright &copy; <a href="#">Central vigilance commission</a> All Rights Reserved</span> </div>
  </div>
</footer>
</form>
</body>
</html>
