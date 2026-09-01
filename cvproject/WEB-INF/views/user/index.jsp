<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><head>
<meta charset="utf-8" />
<link rel="shortcut icon" href="<c:url value="/resources/user/images/indeximage/vigilance-icon.png"/>" type="image/vnd.microsoft.icon" />

<meta name="Generator" content="Drupal 7 (http://drupal.org)" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="MobileOptimized" content="width">
<meta name="HandheldFriendly" content="true">
<meta name="apple-mobile-web-app-capable" content="yes">
<!--[if IEMobile]>  <meta http-equiv="cleartype" content="on">  
<![endif]-->
<title>Home | Central Vigilance Commission</title>
<link href="<c:url value="/resources/user/css/system/system.base.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/system.menus.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/system.messages.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/system.theme.css"/>" rel="stylesheet" type="text/css" /> 
<link href="<c:url value="/resources/user/css/system/b51d98b03049363d38c6e8ef608716d2.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/at.layout.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/styleindex.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/search.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/style1.css"/>" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/user/js/modules/jquery.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/jquery.once.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/drupal.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/panels.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/jquery.cycle.all.2.74.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/jquery-ui.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/spotlight_carrousel.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/dropdown.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/nic.js"/>" type="text/javascript"></script>

<script src="<c:url value="/resources/user/js/md5.js"/>" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/css/calendar.css"/>"  />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/css/selecttext.css"/>"  />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  />
<script language="javascript" src="<c:url value="/resources/user/js/calendar.js"/>"  type="text/javascript"></script>
<script language="javascript" src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script language="javascript" src="<c:url value="/resources/user/js/select/select2.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/bCrypt.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/md5.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/base64.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script language="javascript" src="<c:url value="/resources/user/js/jquery.validate.js"/>"  type="text/javascript"></script>
<script language="javascript" src="<c:url value="/resources/user/js/jquery.validate.min.js"/>"  type="text/javascript"></script>

<!-- For Validation-->
<script type="text/javascript"	src="<c:url value="/resources/user/js/gen_validatorv31.js"/>"></script>
<script language="javascript" src="<c:url value="/resources/user/js/jquery.incremental-counter.js"/>"  type="text/javascript"></script>
<script language="javascript" src="<c:url value="/resources/user/js/bootstrap.min.js"/>"  type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.min.css"/>"  />

<style>

.incremental-counter .num {
  background: #f8f8f8 none repeat scroll 0 0;
  border: 0.2vh solid #fff;
  border-radius: 1vh;
  color: #00aae6;
  display: inline-block;
  height: 6vh;
  line-height: 6vh;
  margin: 0 1vh;
  position: relative;
  text-align: center;
  top: -1px;
  width: 6vh;
  font-size: 4vh;
  font-size: 4vh;
  font-weight: 700;
  box-shadow: 0 1vh 2vh rgba(0, 0, 0, 0.45);
  font-family: "Open Sans", Arial, Helvetica, sans-serif;
}

.incremental-counter .num::before {
  background: #00aae6;
  content: "";
  display: block;
  height: 1px;
  left: -1px;
  margin: -0.5px 0 0;
  position: absolute;
  right: -1px;
  top: 50%;
  width: auto;
}



/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 99999; /* Sit on top */
    padding-top: 10%; /* Location of the box */
    left: 70;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: rgb(77,109,244);
    color: white;
}

.modal-body {
padding: 2px 16px;
background-image:url('resources/user/images/indeximage/cvc_background.jpg');
background-repeat:repeat-x; 
}

.modal-footer {
    padding: 2px 16px;
    background-color: rgb(77,109,244);
    color: white;
}

span.tab{
    padding: 0 80px; /* Or desired space*/
}

</style>

<script type="text/javascript">
$(document).ready(function()
		{
	var count;
	$.ajax({
		url : "<c:url value='/user/getAllCitizen'/>",
		type : "POST",
		data : {
			
		},
		success : function(data) {
			console.log("SUCCESS: ", data);
			$.each(data, function(key, value) {
					count=value.size;
		        });
			
			$('.incremental-counter').attr('data-value',count) ;
			$(".incremental-counter").incrementalCounter();
	},
	error : function(e) {
		console.log("ERROR: ", e);
		display(e);
	},
	done : function(e) {
		console.log("DONE");
	}
});
});

</script>




<script >
document.getElementById('exeMessege').style.display = 'none';
 function indexSearch(e)
{
	 if (e.keyCode == 13) {
	        e.preventDefault();
	        return false;
	    }

} 
</script>
<script type="text/javascript">

var user= document.getElementById("j_username").value;


function crypt(){
	var salt = gensalt(5);
    var password  = calcMD5(document.getElementById("j_password").value);  
    var hash = calcMD5(salt);   
	var hexPassword = calcMD5(password+hash);
	$("#j_password").val(hexPassword+salt);
	 $("#loginForm").submit();
  
}
</script>

<script type="text/javascript">  
        function GeneratePwd() { 
            if (document.getElementById("j_password").value != "") {  
                document.getElementById("j_password").value = calcMD5(document.getElementById("j_password").value);  
                var d = document.getElementById("j_password").value
            }  
        }  
</script> 


<script type = "text/javascript" >

		$(document).ready(
				
			abc()
			);
				
				
      /* function burstCache() {
        if (!navigator.onLine) {
            document.body.innerHTML = 'Loading...';
            window.location = 'ErrorPage.html';}}
      ); */
  	function abc(){
			
			$(".search").stop().animate({width:'toggle'},200);
			$('.search_form .form-text').focus();
		}


	function searchComplain(){
		var complainNo = document.getElementById("edit-search-block-form--2").value;
		
		$.ajax({
			url : "<c:url value='/user/getDetailsByComplaintNumber'/>",
			type : "POST",
			data : {
				"complainNo" : complainNo
			},
			success : function(data) {
				
					if (data.length > 0) {
				$.each(data, function(key, value) {
					
					if(value.decision == 'Pending' || value.decision == ''){
						document.getElementById('modal-para1-body').innerHTML = "Complaint Against<span class='tab'>"+value.complaintAgainstName+"</span><br>Allegation<span class='tab'>"+value.allegationDeatils+"</span><br>Organisation<span class='tab'>"+value.organizationName+"</span><br>&nbsp;";
						document.getElementById('modal-para2-body').innerHTML = "Status<span class='tab' style='color : red;'>Under Process</span><br>";
						$('#myBtn').trigger( "click" );
						
					}else if (value.decision == 'NA') {
						document.getElementById('modal-para1-body').innerHTML = "Complaint Against:<span class='tab'>"+value.complaintAgainstName+"</span><br>Allegation:<span class='tab'>"+value.allegationDeatils+"</span><br>Organisation:<span class='tab'>"+value.organizationName+"</span><br><br><span class='tab'><b>ACTION DETAILS</b></span>";
						document.getElementById('modal-para2-body').innerHTML = "Action taken by CVC: <span class='tab'>Sent to CVO "+value.organizationName+" for necessary action(NA)</span><br>Action Date:<span class='tab'>"+value.decisiondate+"</span><br>Status:<span class='tab' style='color : green;'>As the commission has sent your complaint for necessary action, it does not expect any report from the CVO of the organisation concerned. The CVO is expected to scrutinise the complaint within a period of one month of receipt of the complaint from the Commission and decide if any action is required. You may ,therefore, if required, find out the status of your complaint from CVO,"+value.organizationName+"</span><br> &nbsp;";
						$('#myBtn').trigger( "click" );
						
					}else if (value.decision == 'Filed') {
						document.getElementById('modal-para1-body').innerHTML = "Complaint Against:<span class='tab'>"+value.complaintAgainstName+"</span><br>Allegation:<span class='tab'>"+value.allegationDeatils+"</span><br>Organisation:<span class='tab'>"+value.organizationName+"</span><br><br><span class='tab'><b>ACTION DETAILS</b></span>";
						document.getElementById('modal-para2-body').innerHTML = "Action taken by CVC: <span class='tab'>Filed</span><br>Action Date:<span class='tab'>"+value.decisiondate+"</span><br>Status:<span class='tab' style='color : green;'>Your complaint has been duly examined in the Commision in terms of its Complaint Handling Policy and having regard to the nature of the issue raised therein, the same has been filed.</span><br> &nbsp;";
						$('#myBtn').trigger( "click" );
						
					}else if (value.decision == 'IR') {
						document.getElementById('modal-para1-body').innerHTML = "Complaint Against:<span class='tab'>"+value.complaintAgainstName+"</span><br>Allegation:<span class='tab'>"+value.allegationDeatils+"</span><br>Organisation:<span class='tab'>"+value.organizationName+"</span><br><br><span class='tab'><b>ACTION DETAILS</b></span>";
						document.getElementById('modal-para2-body').innerHTML = "Investigation Agency: <span class='tab'>CVO</span><br>Action Taken:<span class='tab'>Investigation & Report(I&R)</span><br>Status:<span class='tab' style='color : red;'>Complaint Sent for enquiry and report.Commission expects the report in the matter within 3 months.</span><br> &nbsp;";
						
						$('#myBtn').trigger( "click" );
						
					}else if(value.decision == 'OldComplaint'){
						
						document.getElementById('modal-para1-body').innerHTML = "Complaint No.:<span class='tab'>"+value.complaint+"</span><br>File Number:<span class='tab'>"+value.fileNo+"</span><br>Complainant:<span class='tab'>"+value.senderName+"</span><br>Against:<span class='tab'>"+value.complaintAgainstName+"</span><br>Sent to CVO for Investigation and Report on date:<span class='tab'>"+value.decisiondate+"";
						
						document.getElementById('modal-para2-body').innerHTML = "CVO Report Received on date:<span class='tab'>"+value.factual_report+"</span><br>First Stage advice sent on:<span class='tab'>"+value.createdDate+"";
						
						$('#myBtn').trigger( "click" );
					}
				});}else{
					document.getElementById('modal-para1-body').innerHTML = "<span class='tab' style='color : red;'>Complaint Number is Not Valid.</span>";
					document.getElementById('modal-para2-body').innerHTML ="";
					$('#myBtn').trigger( "click" );
					
				}
					
				
			/* display(data); */
			console.log("SUCCESS: ", data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			//display(e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
		
	}




</script>


<script>

// Get the <span> element that closes the modal

function getModal() {
	var complainNo = document.getElementById("edit-search-block-form--2").value;
	if(complainNo==null)
	{}
	else
	{
		document.getElementById('myModal').style.display = 'block';
	}
}

function closeModal() {
	//alert("closeModal");
	document.getElementById('myModal').style.display = 'none';
	
}

// When the user clicks anywhere outside of the modal, close it
/* window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
} */

function contactUs()
{
	getModal();
	document.getElementById('modal-para2-body').innerHTML = "<h2><strong>CENTRAL VIGILANCE COMMISSION</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>SH. J. VINOD KUMAR&nbsp;</strong><br />"+
															"<strong>Satarkata Bhavan , A-Block&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>DIRECTOR</strong><br/>"+
															"GPO Complex , INA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tel.No-24651019<br />"+
															"New Delhi - 110 023&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email-j[dot]vinod[at]nic[dot]in<br/>"+
															"EPABX :- 011- 24600200 (30 Lines)<br />FAX : 011- 24651010/24651186&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>SHRI AJAY SINGH</strong><br />"+
															"Email : cenvigil[at]nic[dot]in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>TECHNICAL DIRECTOR</strong><br />"+
															"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tel.No-24651015<br/>"+
															"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email-singh[dot]ajay[at]nic[dot]in</h2>";
	document.getElementById('modal-para1-body').innerHTML = "<strong><center><h1>Contact Us</h1></center></strong>";
	
	/* alert("CENTRAL VIGILANCE COMMISSION\n"+
			"Satarkata Bhavan , A-Block\n"+
			"GPO Complex , INA\n"+
			"New Delhi - 110 023\n"+
			"EPABX :- 011- 24600200 (30 Lines)\n"+
			"FAX : 011- 24651010/24651186\n"+
			"Email : cenvigil[at]nic[dot]in"); */
	}
</script>

<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<!-- <body style="background-image:url('http://hdwallpapersbackgrounds.us/backgrounds-image/wallpapers-hd-3s-1920x1080/hd-wallpapers-6234rwidz-3s-1920x1080.jpg'); "> -->
<body style="background-image:url('resources/user/images/indeximage/cvc_background.jpg'); background-repeat:repeat; ">
<button id="myBtn" onClick="getModal();" style="display: none;"></button>
  <!--<div id="skip-link">
    <a href="#main-content" class="element-invisible element-focusable"></a>
  </div>-->
    <script type="text/javascript">
  var fontSize = 100;
  var theme_path = '<c:url value="/resources/user/js/modules/nic"/>';
  </script>
<!-- Header start -->
<div >
	<div class="container">
    	<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close"><img src="<c:url value='/resources/user/images/cross.png'/>"  onclick="closeModal();" style="height:30px;width:30px;vertical-align: middle"/> </span>
      <h2>Complaint Management System</h2>
    </div>
    <div class="modal-body">
    	<p id="modal-para1-body"></p> <br>
      <p id="modal-para2-body"></p>
      <p id="modal-para3-body"></p>
      <p></p>
    </div>
    <div class="modal-footer">
      <h3>Central Vigilance Commission</h3>
    </div>
  </div>

</div>
    	
       <div class="logo">
        	 <!--<a href="index.html" title="National Informatics Centre">National Informatics Centre</a>-->
			 <header >

						<!-- start: Branding -->
			<div>

								
				

				
				
								<!-- start: Site name and Slogan hgroup -->
				

					
					
				
				<!-- /end #name-and-slogan -->
								<!-- start: emble -->
				

			</div>
			<!-- /end #branding -->
						 
			<!-- region: Header -->
			
		</header>
        </div>
        
		<div class="navigation">
			<div class="access">
            	<div class="access">
                      </div>
            </div>
			<div  id="menu">
				<div class="nav">
						<div class="search" style="display: none;">
							<div class="search_close" title="Close"></div>
							<div class="search_form">
								<div class="region region-search">
									<div id="block-search-form"
										class="block block-search block-odd block-count-1 block-region-search"
										role="search">
										<div class="block-inner clearfix">
											<div class="block-content content">
												<form autocomplete="off" action="/" method="post"
													id="search-block-form" accept-charset="UTF-8">
													<div>
														<div class="container-inline">
															<h2 class="element-invisible">Search form</h2>
															<div
																class="form-item form-type-textfield form-item-search-block-form">
																<label class="element-invisible"
																	for="edit-search-block-form--2">Search </label> 
																	<input 
																	title="Enter the complaint number with any of these formats XXXX/20XX/vigilance-X or XXXX/XX/XX"
																	type="search" id="edit-search-block-form--2" placeholder="XXXX/20XX/vigilance-X or XXXX/XX/XX"
																	name="search_block_form" style=" width: 90%; height: 100%;"
																	maxlength="28" class="form-text" tabindex="146" onkeydown="indexSearch(event);">
															</div>
															<div class="form-actions form-wrapper" id="edit-actions">
																<input type="button" id="edit-submit" name="op" onClick="searchComplain();"
																	value="Search" class="form-submit" tabindex="147">
															</div>
														
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--<a id="mainmenu" role="link" name="Link" ></a>-->
					<!--stqc error 19-02-2015 <a id="mainmenu" role="link"> </a> -->
					<!-- Navigation elements -->
																				<!--<ul id="nav">
																				<li class=""><a href="<c:url value="/citizenRegister"/>">Citizen Registration to lodge a complain</a></li>
																			<li class=""><a href="<c:url value="/login"/>">Login to portal</a></li>
							<li>KNOW YOUR COMPLAINT STATUS &nbsp; &nbsp;<a class="srch_show" title="Search for complaint status" href="#" name="SiteSearch" tabindex="150">Search </a> </li>
							
																			
																			
																			
																			</ul>-->				</div>
				
			
						
			</div>
		</div>
    </div>
</div>

<div>
	<img src="<c:url value="/resources/user/images/indeximage/cvc.jpg"/>"     width="100%" height="120vh"/>
</div>

<div style="margin-left:3%" class="col-mid-6 col-sm-12">
     <a href=" citizenRegister" ><b style="font-size:2vh; color:#1103aa; "><img src="resources/user/images/bullet.gif" width="25vh" height="25vh">CITIZEN REGISTRATION TO LODGE A COMPLAINT<br><br></a>
     <a  class="srch_show" title="Search for complaint status" name="SiteSearch" tabindex="150"><b style="font-size:2vh;   color:#1103aa;  background:url(../images/search-icon.png) 0 0 no-repeat;"><img src="resources/user/images/bullet.gif"  width="25vh" height="25vh">KNOW YOUR COMPLAINT STATUS <br><br></a>
     <a href="http://cvc.gov.in/sites/default/files/comp_policy_1.pdf" target="_blank"><b style="font-size:2vh; color:#1103aa; "><img src="resources/user/images/bullet.gif" width="25vh" height="25vh">COMPLAINT HANDLING POLICY<img src="resources/user/images/newicon.gif" width="30vh" height="30vh"><br><br></a>
     <a href="http://portal.cvc.gov.in/QPR/" target="_blank"><b style="font-size:2vh; color:#1103aa; "><img src="resources/user/images/bullet.gif" width="25vh" height="25vh">QUARTERLY PERFORMANCE REPORT<img src="resources/user/images/newicon.gif" width="30vh" height="30vh"><br><br></a>
</div>
<div style="float:right;"  class="col-md-6 col-sm-12 col-xs-12">
<header>

<div align="center" >
<h3><span><font color="#1103aa">Citizen Registered</font> </span></h3>
<div class="incremental-counter" id="counter"></div>
<br>

</div>
</header>

<center>
			<c:url var="url" value="/user/j_spring_security_check"></c:url>
			<form class="form-style1" action="${url}" method="post" name="form"  autocomplete="off"
				id="loginForm">
				<div style="padding: 10vh 0 0 15vh;width:100%"  class="col-md-6 col-sm-12 col-xs-12">
					<div id="login-box" style="margin-top: -9vh;">
						<!-- style="margin-top: 0px; margin-left: 0px; margin-right: -1034px;"> -->
						<H2>Central Vigilance Commission</H2>
						 <input type="hidden"	name="csrf"	value="${_csrf.token}"/>
						 <table border="0" align="center">
						 <tr>
						 <td><div id="login-box-name" style="margin-top: 3vh;">User Id:</div></td>
						 <td><div id="login-box-field" style="margin-top: 3vh;">
							<input name="j_username" autofocus="autofocus" id="j_username" class="form-login"  autocomplete="off"
								type="text" size="30" maxlength="50" placeholder="User Name" />
						</div></td>
						 
						 </tr>
						 <tr>
						 <td><div id="login-box-name">Password:</div></td>
						 <td><div id="login-box-field">
							<input name="j_password" id="j_password" class="form-login"
								type="password" autocomplete="off" size="30" maxlength="48"
								placeholder="Password" />
						</div></td>
						 </tr>
 				<tr>
                    <td><div>Captcha:</div></td>
                    <td>
                        <div>
                            <img width="150vh" height="50vh" id="captcha_id" name="imgCaptcha" src="captcha.jpg"/>
                            <a href="javascript:;" title="change captcha text" onclick="document.getElementById('captcha_id').src = 'captcha.jpg?' + Math.random();  return false">
                            <img style="float:right;  margin-top:1vh; " width="30vh" height="30vh" src= "<c:url value="/resources/user/images/refresh.png"/>"/>
                    </a>
                        </div>
                    </td>                    
                </tr>
                <tr>
                    <td colspan="2"><form:errors path="captcha" cssClass="error" /></td>
                </tr>
 
                <tr>
                    <td>Enter Captcha:</td>
                    <td><input type="text" name="captcha" class="form-login" style="margin-top:1vh;"/></td>
                </tr>
                </table>
                <br></br>
							<div><label style="color: red;">${message}</label></div>
						
             
						
						<input style=" float:left; width:8vh; height:3vh; color: black;"	onclick="crypt();" type="button" value="Submit" /> 
						<input style="float:right;  width:8vh; height:3vh; color: black;" type="reset" value="Reset" />
					</div>
				</div>
			</form>
		</center>
		
</div>
<br><br>	
	<div style="float: left;width:50% margin-left: 3%" class="col-md-6 col-sm-12 col-xs-12">
		<center>
			<div
				style="border: medium; border-style: double; border-color: #2952a3; text-align: justify; text-justify: inter-ideograph; width: 95%; padding: 1vh;">

				<strong><p
						style="text-align: justify; text-justify: inter-ideograph;">
						<span style="font-size: 2vh; font-family: 'Arial', 'sans-serif';">The
							Commission is empowered to inquire or cause inquiries to be
							conducted into offences alleged to have been committed under the
							Prevention of Corruption Act, 1988 by certain categories of
							public servants of the Central Government, corporations
							established by or under any Central Act, Government Companies,
							societies and local authorities owned or controlled by Central
							Government. Categories of such public servants are as below:</span>
					</p> <br>
					<p
						style="margin-left: 1vh; text-align: justify; text-justify: inter-ideograph;">
						<span style="font-size: 2vh; font-family: 'Arial', 'sans-serif';">a)
							Members of All-India Services serving in connection with the
							affairs of the Union and Group A officers of the Central
							Government</span>
					</p>
					<p
						style="margin-left: 1vh; text-align: justify; text-justify: inter-ideograph;">
						<span style="font-size: 2vh; font-family: 'Arial', 'sans-serif';">b)
							Officers of the rank of Scale V and above in the Public Sector
							Banks</span>
					</p>
					<p
						style="margin-left: 1vh; text-align: justify; text-justify: inter-ideograph;">
						<span style="font-size: 2vh; font-family: 'Arial', 'sans-serif';">c)
							Chief Executives and Executives on the Board and other officers
							of E-8 and above in Schedule &lsquo;A&rsquo; and &lsquo;B&rsquo;
							Public Sector Undertakings</span>
					</p>
					<p
						style="margin-left: 1vh; text-align: justify; text-justify: inter-ideograph;">
						<span style="font-size: 2vh; font-family: 'Arial', 'sans-serif';">d)
							Chief Executives and Executives on the Board and other officers
							of E-7 and above in Schedule &lsquo;C&rsquo; and &lsquo;D&rsquo;
							Public Sector Undertakings</span>
					</p>
					<p
						style="margin-left: 1vh; text-align: justify; text-justify: inter-ideograph;">
						<span style="font-size: 2vh; font-family: 'Arial', 'sans-serif';">e)
							Officers in Grade D and above in Reserve Bank of India, NABARD
							and SIDBI</span>
					</p>
					<p
						style="margin-left: 1vh; text-align: justify; text-justify: inter-ideograph;">
						<span style="font-size: 2vh; font-family: 'Arial', 'sans-serif';">f)
							Managers and above in General Insurance Companies</span>
					</p>
					<p
						style="margin-left: 1vh; text-align: justify; text-justify: inter-ideograph;">
						<span style="font-size: 2vh; font-family: 'Arial', 'sans-serif';">g)
							Senior Divisional Managers and above in Life Insurance
							Corporations</span>
					</p> </span>
					</p>
					<p
						style="margin-left: 1vh; text-align: justify; text-justify: inter-ideograph;">
						<span style="font-size: 2vh; font-family: 'Arial', 'sans-serif';">h)
							Officers drawing salary of Rs.8700/- p.m. and above on Central
							Government D.A. pattern, as on the date of the notification
							(dt.12th September 2007) and as may be revised from time to time
							in Societies and other Local Authorities</span>
					</p>
					<p style="text-align: justify; text-justify: inter-ideograph;">
						<strong><span
							style="font-size: 3vh; line-height: 115%; font-family: 'Arial', 'sans-serif';">Note:</span></strong>
					</p>
					<ul>
						<li><span
							style="font-size: 2vh; line-height: 115%; font-family: 'Arial', 'sans-serif';">1.Please
								do not lodge complaints in respect of matters against officers
								of the Central Government and its organizations other than the
								categories/levels mentioned above.</span></li>
						<li><span
							style="font-size: 2vh; line-height: 115%; font-family: 'Arial', 'sans-serif';">2.Matters
								pertaining to State Governments are not within the powers of the
								Central Vigilance Commission. Kindly lodge complaints relating
								to State Governments and its officials to the designated
								authorities concerned.</span></li>
					</ul></strong>
			</div>
			<center>
	</div>
<br><br><br><br>
	
<footer >
	<div style="position:fixed; background: rgb(77,109,244); color:white; width:100%; height:4vh; float: none; bottom: 0">
			<h5 style="text-align: center; "><span style="font-size: 2vh;">Website Designed,Developed &amp; Maintained by National Informatics Centre <a href="http://cvc.nic.in/"  title="CENTRAL VIGILANCE COMMISSION">Central Vigilance Commission</a>| <a onclick="contactUs();">Contact Us</a></span></h5>
	</div>
</footer>

 </body>
</html>
