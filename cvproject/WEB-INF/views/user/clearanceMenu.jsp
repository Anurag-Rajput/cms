<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
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

function formSubmit() {
    document.getElementById("logoutForm").submit();
}

</script>

</head>

<body id="page2">
<c:url var="logoutUrl" value="/user/j_spring_security_logout"></c:url>     

<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"     value="${_csrf.token}" />


<!--==============================header=================================-->
<header>
 <div class="">
    <div class="row-bot-bg">
      <div class="main">
	  <div class="wrapper">
      
		
		
		<div align="center" style="margin-top: 2.5cm;">
		<nav>
          <ul class="menu">
           
            <%--  <li><a href="<c:url value="/user/clr/addClearance"/>">Add New</a></li>
             <li><a href="<c:url value="/user/clr/pwdChanged"/>">Changed Password</a></li>
             <li><a href="<c:url value="/user/clr/searchClearance"/>">Search</a></li> --%>
			 <!--<li><a href="#">File Tracking</a></li> -->
			 
			             <li><a href="<c:url value="/user/goBack"/>">Home</a></li>
            <%-- <li>Report<ul><li><a href="<c:url value="/user/report"/>">Pending & Disposal(Section Wise)</a></li>
            <li><a href="<c:url value="/user/monthlyReport"/>">Monthly Report</a></li>
            <li><a href="<c:url value="/user/InterimIR"/>">Interim IR Report</a></li>
            <li><a href="<c:url value="/user/ComplainTypeReport"/>">Complaint Source Type Report</a></li>
            </ul></li>   --%>
            <li><a href="<c:url value="/user/goBack"/>">Inbox </a></li>
           <li><a href="<c:url value="/user/officerOutbox"/>">Outbox</a></li>
            <li><a href="<c:url value="/user/sentMail"/>">Sent</a></li>  
             
            <%-- <li><a href="<c:url value="/user/search"/>">Search</a></li> --%>
            
            <li>Search<ul><li><a href="<c:url value="/user/search"/>">New Complain</a></li>
            <li><a href="<c:url value="/user/searchCpaComplain"/>">CPA Complain</a></li>
            </ul></li> 
            <li><a href="<c:url value="/user/editProfile"/>">Edit Profile</a></li>
             <li><a href="<c:url value="/user/resetPassword"/>">Change Password</a></li>
          </ul>
           <ul class="menu1">
								<li><a
									href="javascript:formSubmit();" 
									class="btn btn-danger" title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></a></li>

							</ul>
        </nav>
      </div></div></div>
    </div>
  </div>
  
</header>
<!--==============================content================================-->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>

body {
 font-family: "Open Sans", helvetica, arial;
 }
table{
 width: 1200px; /* Set 100% for responsive design */
 border-collapse: collapse;
 margin: 30px 0px 30px;
 background-color: #fff;
 font-size: 13px;
 }
 
table tr {
 width: 100%;
 }
table th {
 background: #3055DC;
 color: white;
 font-weight: bold;
 font-size: 15px;
}
table td, th {
 padding: 4px 4px 4px 8px;
 border: 1px solid #ccc;
}
 
/* CSS3 Zebra Striping */
table tr:nth-of-type(odd) {
 background: #eee;
}
 
/* Automatic Serial Number Row */
.css-serial {
 counter-reset: serial-number; /* Set the serial number counter to 0 */
}
.css-serial td:first-child:before {
 counter-increment: serial-number; /* Increment the serial number counter */
 content: counter(serial-number); /* Display the counter */
}
tbody {
        /* Just for the demo          */
    overflow-y: auto;    /* Trigger vertical scroll    */
    overflow-x: hidden;  /* Hide the horizontal scroll */
}
	
</style>



<!-- </head>

<body id="page2" onload="getClock()"> -->


<form name="myform" id="myform" method="post" action="" >

<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper">
     
     	<article class="col-1">
						<div class="inner-text"
							style="width: 300%; background-color: rgb(231, 243, 255); color: #0E0D01;">
							Welcome: ${loginId}
							<div id="clock" style="color: red;"></div>
						</div>


					</article>
					<br/><br/>
      <div style="width: 450px; height: auto;">
	  
<table class="css-serial flexy"  >
<thead>
<tr>
 <th align="left" style="width:15%"><strong>Sr.No</strong></th>
 <th align="left" style="width:20%"><strong>Organization</strong></th>
 <th align="left" style="width:15%"><strong>Reference Number</strong></th>
  <th align="left" style="width:15%"><strong>Received From Employee</strong></th>
   <th align="left" style="width:15%"><strong>Created Date</strong></th>
    <th align="left" style="width:15%"><strong>Received Date</strong></th>
    <th align="left" style="width:15%"><strong>Roll Type</strong></th>
    <th align="left" style="width:15%"><strong>Bo Decision</strong></th>
</thead>


      <tbody>
<c:forEach items="${allDiary}" var="complain">
<tr>
 <c:choose>
      <c:when test="${complain.status=='0'}">
      <td align="center">&nbsp;<img src="<c:url value="/resources/user/images/newicon.gif"/>"/></td><!-- Intentionally left blank 1st td -->
    </c:when>
    
    <c:otherwise>
      <td align="center">&nbsp;</td>
    </c:otherwise>
  </c:choose>
 <td align="left" style="width:20%" onclick="sessionUpdate('complainNumber_${complain.complainNo}','0');"><a href="#" style="text-decoration:none; color:#10184E">${complain.organizationName}</a></td>
 <td align="left" style="width:15%" onclick="sessionUpdate('complainNumber_${complain.complainNo}','0');"><a href="#" style="text-decoration:none; color:#10184E"> ${complain.complaint}</a></td>
 <td align="left" style="width:15%" onclick="sessionUpdate('complainNumber_${complain.complainNo}','0');"><a href="#" style="text-decoration:none; color:#10184E">${complain.recipientName}</a></td>
 <td align="left" style="width:15%" onclick="sessionUpdate('complainNumber_${complain.complainNo}','0');"><a href="#" style="text-decoration:none; color:#10184E">${complain.createdDate}</a></td>
 <td align="left" style="width:15%" onclick="sessionUpdate('complainNumber_${complain.complainNo}','0');"><a href="#" style="text-decoration:none; color:#10184E">${complain.complaindate}</a></td>
 <td align="left" style="width:15%" onclick="sessionUpdate('complainNumber_${complain.complainNo}','0');"><a href="#" style="text-decoration:none; color:#10184E">${complain.rollType}</a></td> 
 <td align="left" style="width:15%" onclick="sessionUpdate('complainNumber_${complain.complainNo}','0');"><a href="#" style="text-decoration:none; color:#10184E">${complain.decision}</a></td>
</tr>   
   
    </c:forEach>
    </tbody>
</table>
</div>
</div>
                   </div>
</section>

</form>
</body>


</html>
<!--==============================footer=================================-->
<footer>
  <div class="main">
    <div class="aligncenter"> <span>Copyright &copy; <a href="#">Central vigilance commission</a> All Rights Reserved</span> </div>
  </div>
</footer>
</form>
</body>
</html>
