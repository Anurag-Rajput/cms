<!DOCTYPE HTML>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
	<head>
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="<c:url value="/resources/vigcases/assets/css/main.css"/>" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		
		<title>CVC</title>
	<link rel="stylesheet" href="<c:url value="/resources/user/css/reset.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/style.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/layout.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/prettyPhoto.css"/>" type="text/css" media="screen"></link>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  ></link>

<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-yui.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-replace.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/Dynalight_400.font.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/FF-cash.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.prettyPhoto.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.easing.1.3.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.bxSlider.js"/>"type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/select/select2.js"/>"  type="text/javascript"></script>
	</head>
	 

<style type="text/css">
    form{
        margin: 20px 0;
    }
    form input, button{
        padding: 5px;
    }
    table{
        width: 100%;
        margin-bottom: 20px;
		border-collapse: collapse;
    }
    table, th, td{
        border: 1px solid #cdcdcd;
    }
    table th, table td{
        padding: 10px;
        text-align: left;
    }
</style>
	<!-- Scripts -->
			<script src="<c:url value="/resources/vigcases/assets/js/jquery.min.js"/>"></script>
			<script src="<c:url value="/resources/vigcases/assets/js/skel.min.js"/>"></script>
			<script src="<c:url value="/resources/vigcases/assets/js/util.js"/>"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<c:url value="/resources/vigcases/assets/js/main.js"/>"></script>
			<div class="container" style="height: 20px;">
					  <img src="<c:url value="/resources/vigcases/images/Central-Vigilance-Commission.jpg"/>"  width="130%;" height="110" style="border-left-width: 0px; border-top-width: 0px; margin-left: -180px;" /> 
					</div>
			
	<header style="background-color: rgb(63,70,78); ">
			<div class="main" style="height: 45px;">
					

					<div align="left" style="margin-top: 2.5cm;">
						<nav>
							<ul class="menu">
								<li><a href="#">Home</a></li>
								<li><a href="#">Search</a></li>
								 <li><a href="#">Change Password</a></li>
								  <li >&nbsp;</li>
								   <li >&nbsp;</li>
								    <li >&nbsp;</li>
								     <li >&nbsp;</li>
								      <li >&nbsp;</li>
								       <li >&nbsp;</li>
								 <li ><a href="#">Logout</a></li>
							</ul>

							
						</nav>
					</div>

			</div>
<br>

</header>
			
			
	<body>
		<form>
	
		<!-- Three -->
		
				<div align="center"><h3>Commisioners for Departmental Inquiry</h3></div>
								
			<section id="three" class="wrapper style2 special">
				<div class="inner">

					
					
				
		<div class="row">
		
		
		
		
		
		
		
		
		
		<table>
		<tr>
						<div class="form-control narrow">
							<td><label for="name" ><b>CDI Name </b></label>
							<input type="text" id="cdiName" placeholder=""></td>
							
						</div>
						
						<div class="form-control narrow">
							<td><label for="email"><b>CDI FILE NUMBER </b></label>
							<input type="text" id="cdiFileNo" placeholder=" "></td>
						</div>	
						
						<div class="form-control narrow">
							<td><label for="email"><b>DEPARTMENT </b></label>
							<input type="text" id="department" placeholder=" "></td>
						</div>
						
						
						<div class="form-control narrow" >
							<td><label for="name"><b>Case Type </b></label>
							<select id="myOptions" name="caseType" onchange="java_script_:show(this.options[this.selectedIndex].value)">
												<option value="NONE">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Select Cast Type -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
													<option value="I">I</option>
													<option value="I">Individual</option>
													<option value="S">Simultaneous</option>
													<option value="C">Common</option>
											</select></td>
						</div>
		</tr>	
		</table>
		
		<table>

	
		<tr>
						
						
						<div class="6u$ 12u$(small)" >
										<td><input type="checkbox" id="abnormallyHalted" name="abnormallyHalted" >
										<label for="abnormallyHalted"><b>Abnormally Halted  </b></label></td>
						</div>
						
						
						<div class="form-control narrow">
							<td><label for="email"><b>Reason  for Halt </b></label>
							<input type="text" id="reasonForHalt" placeholder=" "></td>
						</div>	
		</tr>
		
		<tr>				
						
						
						<div class="6u$ 12u$(small)" >
										<td><input type="checkbox" id="timeBound" name="timeBound">
										<label for="timeBound"><b>Time Bound </b></label></td>
						</div>
						
						
						<div class="form-control narrow" >
							<td><label for="name"><b>	Last Date for time bound </b></label>
							<input type="text" id="namecase" name="lastDateForTimeBound" placeholder=""></td>
						</div>
		</tr>	
	</table>
		
		<table>
	
		<tr>
						<div class="form-control narrow">
							<td><label for="name" ><b>Court(CO)/Cat(CA) STAY </b></label>
							<input type="text" name="stayType" id="sec" placeholder=""></td>
							
						</div>
						
						<div class="form-control narrow">
							<td><label for="email"><b>Stay from Date </b></label>
							<input type="text" id="stayFromDate" name="stayFromDate" placeholder=" "></td>
						</div>	
						
						<div class="form-control narrow">
							<td><label for="email"><b>Stay till Date </b></label>
							<input type="text" id="sNo" name="stayTillDate" placeholder=" "></td>
						</div>
						
						
						
						
						<div class="6u$ 12u$(small)" >
										<td><input type="checkbox" id="ioReportReceived" name="pendingDueToAdminstrativeReason" >
										<label for="ioReportReceived"><b>pending due to Administrative Reason </b></label></td>
						</div>
		</tr>	
	
	</table>
		
		<table>
		<tr>				
						<div class="form-control narrow">
							<td><label for="email"><b>Presenting Officer's Name </b></label>
							<input type="text" id="sNo" name= "presentingOfficerName" placeholder=" "></td>
						</div>
						
						<div class="form-control narrow">
							<td><label for="email"><b>Designation </b></label>
							<input type="text" id="sNo" name="presentingOfficerDesignation" placeholder=" "></td>
						</div>
						
						<div class="form-control narrow" >
							<td><label for="name"><b>Address1 </b></label>
							<input type="text" id="namecase" name="presentingOfficerAddress1" placeholder=""></td>
						</div>
						
						<div class="form-control narrow" >
							<td><label for="name"><b>Address2 </b></label>
							<input type="text" id="namecase" name="presentingOfficerAddress2" placeholder=""></td>
						</div>
		</tr>
	</table>
		
		<table>
	
		<tr>			

						<div class="form-control narrow">
							<td><label for="email"><b>Charged Officer's Name </b></label>
							<input type="text" id="sNo" name="chargedOfficerName" placeholder=" "></td>
						</div>
						
						
						<div class="form-control narrow">
							<td><label for="email"><b>Designation </b></label>
							<input type="text" id="sNo" name="chargedOfficerDesignation" placeholder=" "></td>
						</div>
						
						
						<div class="form-control narrow" >
							<td><label for="name"><b>Address1 </b></label>
							<input type="text" id="namecase" name="chargedOfficerAddress1" placeholder=""></td>
						</div>
						
						<div class="form-control narrow" >
							<td><label for="name"><b>Address2 </b></label>
							<input type="text" id="namecase" name="chargedOfficerAddress2" placeholder=""></td>
						</div>
		</tr>
	
	</table>
		
		<table>
		<tr>			

						<div class="form-control narrow">
							<td><label for="email"><b>First Nomination Date </b></label>
							<input type="text" id="sNo" name="firstNominationDate" placeholder=" "></td>
						</div>
			<tr>
			
			
			
			</table>
		
		<table>
		
			
			
			
			</tr>			
						<div class="form-control narrow">
							<td><label for="email"><b>IO's Nomination Reference No (Section File no) </b></label>
							<input type="text" id="sNo" name="ioNominationReferenceNo" placeholder=" "></td>
						</div>
						
						<div class="form-control narrow">
							<td><label for="email"><b>Nomination date </b></label>
							<input type="text" id="sNo" name="nominationDate" placeholder=" "></td>
						</div>
						
		</tr>

	</table>
		
		<table>
		<tr>			

						<div class="form-control narrow">
							<td><label for="email"><b>Last Reminder Date </b></label>
							<input type="text" id="sNo" name="lastReminderDate" placeholder=" "></td>
						</div>
						
						
						<div class="form-control narrow">
							<td><label for="email"><b>	Total Reminder </b></label>
							<input type="text" id="sNo" name="totalReminder" placeholder=" "></td>
						</div>
						
		</tr>
		</table>
		
		<table>
		<tr>			

						<div class="form-control narrow">
							<td><label for="email"><b>Io's appointment Order date   </b></label>
							<input type="text" id="sNo" name="ioAppointmentOrderDate" placeholder=" "></td><td><label for="email"><b>Active date (when all documents received)  </b></label>
							<input type="text" id="sNo" name="activeDate" placeholder=" "></td>
						</div>
												
		</tr>
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
	</table><br><br><br><br><br><br><br><br><br><br><br>				
						
						
						<div class="12u$">
										<ul class="actions">
											<li><input type="submit" value="Save" /></li>
											<li><input type="reset"  value="reset"></li>
										</ul>
						</div>
						
						
		
					</div>
					
 		</div>
			</section>
		</form>

		<!-- Footer -->
			<footer id="footer" style="background-color: rgb(63,70,78);">
				<div class="copyright">
					Content Provided & Maintained by Central Vigilance Commission | Website Designed & Developed by : <a href="http://www.nic.in/">National Informatics Centre</a>.
				</div>
			</footer>

	

	</body>
</html>