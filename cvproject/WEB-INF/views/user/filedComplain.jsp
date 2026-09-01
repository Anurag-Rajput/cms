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

</head>
<header>
 <div class="">
    <div class="row-bot-bg">
      <div class="main">
	  <div class="wrapper">
         <%-- <center>  <h2>&nbsp;central &nbsp;vigilance commission </h2>  </center> 
		<div class="fright"> 
  <a href="logout.jsp" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x">logout</i></a> </div>
		 <div class="fleft"> <img src="images/cvc_logo.PNG" />
          <div class="inner-text"> Login :${sessionScope.user} <br/>
            <small><%=new Date(session.getLastAccessedTime())%> </small> </div>
        </div> --%>
	<div align="center" style="margin-top: 2.5cm;">	
		<nav>
		
          <ul class="menu">
            <li><a href="<c:url value="/user/goBack"/>">Home</a></li>
            <li><a href="<c:url value="/user/goBack"/>">Inbox </a></li>
           <li><a href="<c:url value="/user/officerOutbox"/>">Outbox</a></li>
            <%--   <li><a href="<c:url value="/user/sentMail/"/>">Sent</a></li>   --%>
            <li><a href="<c:url value="/user/search"/>">Search</a></li>
            
          </ul>
           <ul class="menu1">
            <li><a
									href="<c:url value="/user/j_spring_security_logout"/>"
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
<section id="content">
	<div class="main">
		<c:forEach items="${pendingComplainDetails}" var="complain">
			<div class="wrapper">
				<form name="myform" id="myform"
					action="<c:url value="/user/addDairyComplain"/>">
					<article>
						<div class="inner-text" style="width: 300%; color: #0E0D01;">
							Welcome:${loginId} <br /> <small></small>

						</div>
					</article>
					<article class="fright">
						<div class="fright">
							<div class="fright">
								<div align="center"
									style="width: 515px; background-color: rgb(218, 237, 241); color: #0E0D01;">
									<h3>Complaint Cell</h3>
								</div>
								<div class="form-group">
									<label>&nbsp;Date of Complaint </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.complainDate}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Sender's Name:</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.senderName}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Address </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.address}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Address2 </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.address2}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;City</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.city}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;State</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.state}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Pin code</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.pinno}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;E-mail </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.email}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Mobile Number </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.mobileNo}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Complainee Name </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.complaintAgainstName}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Designation </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.designation}">

									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Organization </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.organization}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Branch </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.section}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Whether Fast Track</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.whetherFastTrack}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Complaint Type </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.complaintType}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Action Taken </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.actionTaken}">

									</div>
								</div>

								<%-- <input type="text"  size=20 value="${complain.actionTaken}"> --%>


								
								<!-- ------------Section------------------ -->
								<div class="form-group">
									<label>&nbsp;Complaint No.</label>
									<div class="form-list" style="color: red; font-size: 110%;">
										<b> ${complain.complaint}</b>
									</div>
								</div>
								<!--Other-->
								<br> <br>
								</div>
								</div>
								</article>
				</form>
			</div>
		</c:forEach>
	</div>
</section>
</html>
								