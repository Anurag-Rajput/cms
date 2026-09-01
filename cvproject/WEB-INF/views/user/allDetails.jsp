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
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  ></link><%-- 
<link rel="stylesheet" href="<c:url value="/resources/user/js/calendar-win2k-cold-1.css"/>" type="text/css" media="screen"></link> --%>
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
<%-- <header>
 <div class="">
    <div class="row-bot-bg">
      <div class="main">
	  <div class="wrapper">
      
		
		
		 <div align="center" style="margin-top: 2.5cm;">
		<nav>
           <ul class="menu">
            <li><a href="/cvproject/user/goBack">Home</a></li>
            <li><a href="/cvproject/user/report">Report</a></li>   
            <li><a href="/cvproject/user/goBack">Inbox </a></li>
           <li><a href="/cvproject/user/officerOutbox">Outbox</a></li>
            <li><a href="/cvproject/user/sentMail">Sent</a></li>   
            <li><a href="/cvproject/user/search">Search</a></li>
             <li><a href="/cvproject/user/resetPassword">Change Password</a></li>
            
          </ul>
           <ul class="menu1">
								<li><a
									href="javascript:formSubmit();" 
									class="btn btn-danger" title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></a></li>

							</ul>
        </nav>
      </div> </div></div>
    </div>
  </div>
  
</header> --%>
<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper">
      <article class="col-1">
         <div class="inner-text" > Login : &nbsp;${loginId}
             </div>
      </article>
      <article class="center">
      <br></br> <br></br> 
      

<div style="width: 710px; color: navy; background-color: #f3f3f3; border: 2px solid #3a8aff; border-radius: 25px; height: 860px; 
      padding-right: 161px; padding-left: 14cm; padding: 5px;margin-left: 231px;  border-left-width: 2px; border-top-width: 2px; overflow-y: auto;">
       <br></br>
   
   <div align="right">
         <input type="button" value="Print" onclick="window.print()" />
   </div> 
   <c:forEach items="${getaAlldetailsComplain}" var="complain">
   <table>
   								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Date of Complaint </label></td>
										<td><div class="form-list" style="padding-left: 4cm;">
											${complain.complainDate}
										</div></td>
								</div> </tr>
  
   								
   								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Complaint Sent from: </label></td>
										<td><div class="form-list" >
											${complain.complaintSentType}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Sender's Name </label></td>
										<td><div class="form-list" >
											${complain.senderName}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Address :</label></td>
										<td><div class="form-list">
											${complain.address},${complain.city}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;City</label></td>
									<td><div class="form-list" >
											${complain.city}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;State</label></td>
									<td><div class="form-list">
											${complain.state}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Pin No.</label></td>
									<td><div class="form-list">
											${complain.pinno}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;E-mail :</label></td>
									<td><div class="form-list">
											${complain.email}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Mobile Number : </label></td>
									<td><div class="form-list">
											${complain.mobileNo}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Complainee Name: </label></td>
									<td><div class="form-list">
											${complain.complaintAgainstName}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Designation :</label></td>
									<td><div class="form-list">
											${complain.designation}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Organization :</label></td>
									<td><div class="form-list">
											${complain.organization}

										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Branch :</label></td>
									<td><div class="form-list">
											${complain.section}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Whether Fast Track:</label></td>
										<td><div class="form-list">
											${complain.whetherFastTrack}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Complaint Type :</label></td>
										<td><div class="form-list">
											${complain.complaintType}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Action Taken: </label></td>
										<td><div class="form-list">
											${complain.actionTaken}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Upload Document :</label></td>
										<td><div class="form-list">
											<c:if test="${complain.fileId!=''}">
								            <a style="color:blue;"  onclick="window.open('<c:url value='/uploadDoc/${complain.fileId}'/>','nyWindow','width=600,Height=400,top=100,left=400');">Click Here</a>
	                                     </c:if>
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Detail of Allegation :</label></td>
										<td><div class="form-list">
											${complain.detailsAlligations}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Complaint No.: </label></td>
										<td><div class="form-list">
											${complain.complaint}
										</div></td>
								</div></tr>
								
								
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Gist of allegation :</label></td>
										<td><div class="form-list">
											${complain.gistOfAllegation}
										</div></td>
								</div></tr>
								
								
								
								
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Bo's Decision &nbsp;</label></td>
										<td><div class="form-list">
											${complain.boDecision}
										</div></td>
								</div></tr>
								
								
								
								
		</table>						
								
								
								
								
   </c:forEach>
   
</div>






	</article>
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
