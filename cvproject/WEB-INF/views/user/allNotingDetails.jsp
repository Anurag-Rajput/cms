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
      padding-right: 161px; padding-left: 14cm; padding: 5px;margin-left: 231px;  border-left-width: 2px; border-top-width: 2px;">
       <br></br>
   
  <!-- <c:forEach items="${getallNoting}" var="complain"> -->
   								<div class="form-group">
										<label>&nbsp;Complaint No.: </label><span class="txt" style="color:red; font-size: 110%;">${getallNoting}</span>
										
									</div>
	<!-- </c:forEach> -->
					
					
					
					
   <div align="right">
         <input type="button" value="Print" onclick="window.print()" />
   </div> 
   
   				
   					
								
					<c:forEach var="noting" items="${mapOfNoting}">
												<label>
													Noting:&nbsp;&nbsp;&nbsp;${noting.notingMessage1}<br>
													Date and Time:&nbsp;&nbsp;&nbsp;${noting.notingdate}<br>
													Officer Name:&nbsp;&nbsp;&nbsp;${noting.noterName},<br>
													Desiganation:&nbsp;&nbsp;&nbsp;${noting.desiganation}<br>
													<hr></hr> 
												</label>
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
