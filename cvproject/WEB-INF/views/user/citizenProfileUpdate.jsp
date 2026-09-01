<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="utf-8" />
<link href="<c:url value="/resources/user/css/style1.css"/>" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="<c:url value="/resources/user/images/indeximage/vigilance-icon.png"/>" type="image/vnd.microsoft.icon" />
<meta name="Generator" content="Drupal 7 (http://drupal.org)" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="MobileOptimized" content="width">
<meta name="HandheldFriendly" content="true">
<meta name="apple-mobile-web-app-capable" content="yes">
<!--[if IEMobile]>  <meta http-equiv="cleartype" content="on">  
<![endif]-->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
       <meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="Expires" content="-1"/>
	<meta http-equiv="pragma" content="no-cache" />
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
<script src="<c:url value="/resources/user/js/select/select2.js"/>"  type="text/javascript"></script><%-- 
<script src="<c:url value="/resources/user/js/calendar-en.js"/>"  type="text/javascript"></script> --%>
<script src="<c:url value="/resources/user/js/md5.js"/>" type="text/javascript"></script>
<!-- index -->
<link href="<c:url value="/resources/user/css/system/system.base.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/system.menus.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/system.messages.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/system.theme.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/b51d98b03049363d38c6e8ef608716d2.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/at.layout.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/styleindex.css"/>" rel="stylesheet" type="text/css" />

<script src="<c:url value="/resources/user/js/modules/jquery.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/jquery.once.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/drupal.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/panels.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/jquery.cycle.all.2.74.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/jquery-ui.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/spotlight_carrousel.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/dropdown.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/nic.js"/>" type="text/javascript"></script>
<style>
.error {
	color: #FFFFFF;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>

<script>
function  validatePassword() {
    var newPassword = document.getElementById('txtNewPassword').value;
    var confirmPassword = $("#txtConfirmPassword").val();

         if(newPassword.search((/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[#$%&()*+,-./:;<=>?@\^_`{|}~]).*$/))){
        document.getElementById("error").innerHTML="Should contain 1 digit,1 Sepical Character, 1 small, 1 capital letter and minimum 8 character";
        document.getElementById('submit').disabled=true;
  }else if(confirmPassword==newPassword){
	  document.getElementById("error").innerHTML = "";
	  $("#divCheckPasswordMatch").html("Passwords matched!");
	  document.getElementById('submit').disabled=false;
  }else if(confirmPassword!=newPassword){
	  document.getElementById("error").innerHTML="Password do not matched.";
	  $("#divCheckPasswordMatch").html("Passwords do not match!");
      document.getElementById('submit').disabled=true;
  }else{
	  document.getElementById("error").innerHTML = "";
  }
    
}

function GeneratePwd() { 
    if (document.getElementById("txtNewPassword").value != "") {  
        document.getElementById("txtNewPassword").value = calcMD5(document.getElementById("txtNewPassword").value); 
        document.getElementById("txtConfirmPassword").value = calcMD5(document.getElementById("txtConfirmPassword").value); 
    }  
}  

function isNumeric() { 
	 var mobileNumber = document.getElementById('mobileNumber').value;
    if(mobileNumber.search(/^[0-9\b]+$/) ){
   document.getElementById("error1").innerHTML="Digit Only";
   document.getElementById("submit").disabled=true;
}else{
 validatePassword();      }
} 

</script>


<script type="text/javascript">
function checkPasswordMatch() {
    var password = $("#txtNewPassword").val();
    var confirmPassword = $("#txtConfirmPassword").val();

    if (password != confirmPassword)
    	{
        $("#divCheckPasswordMatch").html("Passwords do not match!");
        document.getElementById('submit').disabled=true;
    	}
    else
    	{
    	validatePassword();
        
    	}
}
</script>

<script>
$(document).ready(function() {
	$(".select2").select2({
		placeholder : "Select organization",
		allowClear : true,
	});
});
$(function() {
$('#s_org').on('change', function() {
	var orgId = $("#s_org option:selected").val();
	$.ajax({
		url : "/cvproject/branchByOrgination",
		type : "POST",
		data : {
			"orgId" : orgId
		},
		success : function(data) {
			$('#section_id').empty();
			$.each(data, function(key, value) {
				$('#section_id').append("<option value='" + value.orgSection + "'>" + value.orgSection + "</option>");
			});
		display(data);
		console.log("SUCCESS: ", data);
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

});
</script>	

<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

</script>	

<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #66D1FF;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #01589C;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>


<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body class="html front not-logged-in one-sidebar sidebar-second page-home i18n-en lang-en site-name-national-informatics-centre page-panels">

    <script type="text/javascript">
  var fontSize = 100;
  var theme_path = '<c:url value="/resources/user/js/modules/nic"/>';
  </script>
<!-- Header start -->
<div id="header">
	<div class="container">
    	
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
         <img src="<c:url value="/resources/user/images/indeximage/vigilance-icon.png"/>"  width="117" height="80" style="border-left-width: 0px; border-top-width: 0px; margin-left: -180px;" /> 
        <div class="emblame">
			<img src="<c:url value="/resources/user/images/indeximage/emblame.jpg"/>" width="47" height="64" alt="Emblem" />
		</div>
		<div class="navigation">
			<div class="access">
            	<div class="access">
                      </div>
            </div>
			<div class="nav_search"  id="menu">
				<div class="nav">
					<!--<a id="mainmenu" role="link" name="Link" ></a>-->
					<!--stqc error 19-02-2015 <a id="mainmenu" role="link"> </a> -->
					<!-- Navigation elements -->
																				<ul id="nav">
																				<li class=""><a href="#">Complaint Status</a></li>
																			<li class=""><a href="<c:url value="/"/>">Login to portal</a></li>
																			</ul>				</div>
				
			
						
			</div>
		</div>
    </div>
</div>
<!-- Header end -->


<c:url var="myurl" value="/user/citizenProfileUpdate"/>
	<form:form name="myform" id="myform" method="post" action="${myurl}" enctype="multipart/form-data" commandName="citizenProfile">
		
		<!--==============================content================================-->

		<section id="content">
			<div class="main">
				<div class="wrapper">
					<div align="center"><label style="color: red; ">
												        <c:out  value='${errMessage}' />
												        </label></div>
					<article class="col-header">
						<div class="inner-text"
							style="width: 100%; height:100%; background-color: rgb(231, 243, 255); color: #0E0D01;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome:&nbsp;${loginId} <br /> <small></small>
						</div>


						
					</article>
					<article class="fcentre">

						<div class="fcenter">
							<div align="center">
								<div align=""
									style="width: 585px; background-color: rgb(218, 237, 241); color: #0E0D01;">
									<h3>
										Please update your profile first..
										<div class="fright"></div>
									</h3>
								</div>

								<div align="center"
									style="background-color: rgb(255, 201, 167); color: #0E0D01;"></div>

								<div style="width: 500px; height: 1300px;">
								<input name="citizenId" value="${loginId}" style="display: none;" />
										<div class="form-group">
											&nbsp;Password:<font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="password" path="password" onkeypress="validatePassword();" id="txtNewPassword" name="password" />
												<form:errors path="password" cssClass="error"/>
											</div><label id="error" style="color: red;"/>
       										       <span id="password_strength"></span>
										</div>
										<div class="form-group">
										<br><br>
											&nbsp;Confirm Password:<font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="password" path="rePassword" id="txtConfirmPassword" onkeyup="validatePassword();" name="rePassword"/>
												<form:errors path="rePassword" cssClass="error"/>
											</div>
											
										</div> <div style="color: red;" class="registrationFormAlert" id="divCheckPasswordMatch">
										</div>
										<br>
										<div class="form-group"><br><br>
											&nbsp;Security Question: <font color="red">*</font>
											<div class="form-list">
												<select   type = "select-one" class="form-control" name="securityQuestion" >
                 <option value=""> --           Select                 -- </option> 
                 <option value="Which place do you like the most.">Which place do you like the most?</option>               
                 <option value="What is your Lucky No.">What is your Lucky No.?</option>               
                 <option value="Who is your favorite actor.">Who is your favorite actor? </option>               
                 <option value="What was your primary school.">What was your primary school?</option>               
                 <option value="What is your pet name.">What is your pet name?</option>    
                 </select> 
                 <form:errors path="securityQuestion" cssClass="error"></form:errors>  
											</div>
										</div><br>
										<div class="form-group"><br>
											&nbsp;Security Answer: <font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="password" name="securityAnswer" path="securityAnswer"/>
												<form:errors path="securityAnswer" cssClass="error"/>
											</div>
										</div><br>
										<div class="form-group"><br><br>
											&nbsp;Address: <font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="text" name="address1" path="address1"/>
												<form:errors path="address1" cssClass="error"/>
											</div>
										</div><br>
										<div class="form-group"><br>
											&nbsp;Address 1:  <font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="text" name="address2" path="address2"/>
												<form:errors path="address2" cssClass="error"/>
											</div>
										</div>
										<br><br>
										<div class="form-group"><br>
											&nbsp;State: <font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="text" name="state" path="state"/>
												<form:errors path="state" cssClass="error"/>
											</div>
										</div><br>
										<div class="form-group"><br>
											&nbsp;City: <font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="text" name="city" path="city"/>
												<form:errors path="city" cssClass="error"/>
											</div>
										</div><br>
										<div class="form-group"><br>
											&nbsp;Email: <font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="text" name="citizenEmail" path="citizenEmail"/>
												<form:errors path="citizenEmail" cssClass="error"/>
											</div>
										</div><br>
										<div class="form-group"><br>
											&nbsp;Pin code.: <font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="text" onkeypress="isNumeric();" maxlength="10" name="pincode" path="pincode"/>
												<label id="error1" style="color: red;"/>
												<form:errors path="pincode" cssClass="error"/>
											</div>
										</div>
										<br>
										<div class="form-group"><br>
											&nbsp;Contact No.: <font color="red">*</font>
											<div class="form-list">
												<form:input size="25" type="text" onkeypress="isNumeric();" maxlength="10" name="contactNumber" path="contactNumber"/>
												<label id="error1" style="color: red;"/>
												<form:errors path="contactNumber" cssClass="error"/>
											</div>
										</div>
									
													<br>	 <input type="hidden"	name="csrf"	value="${_csrf.token}"/>
								<div class="form-group"><br>
										<button type="submit" id="submit" onclick="GeneratePwd();" class="button-2"  style="width: 70px;"
													name="save" >Save</button>
													&nbsp;&nbsp;&nbsp;
													<button type="reset" class="button-2"  style="width: 70px;"
													name="reset" >Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
											
											

									
								</div>

										</div>


										
										
													
							</div>
							
							


					</article>
				</div>
				
			</div>
		</section>
		
	 </form:form>
	 				<!-- Footer start -->
<div class="footer">
	
	<div class="top_panel">
		<div class="container">
			<div class="left">   <div class="region region-footer">
    <div id="block-panels-mini-footer" class="block block-panels-mini block-odd block-count-3 block-region-footer">
  <div class="block-inner clearfix">
                <div class="block-content content">
      <div class="panel-flexible panels-flexible-18 clearfix" id="mini-panel-footer">
<div class="panel-flexible-inside panels-flexible-18-inside">
<div class="panels-flexible-region panels-flexible-region-18-left panels-flexible-region-first ">
  <div class="inside panels-flexible-region-inside panels-flexible-region-18-left-inside panels-flexible-region-inside-first">
<div class="panel-pane pane-custom pane-4" >
  
      
  
  <div class="pane-content">
    <ul class="footer_nav"><li ><a href="http://cvc.gov.in/useful_links.htm" >Useful Links</a></li><li ><a href="http://cvc.gov.in/tofuse.htm" target="_BLANK" title="External site that opens in a new window ">Terms of Use</a></li><li ><a href="http://cvc.nic.in/contact.htm">Contact Us</a></li></ul>  </div>

  
  </div>
  </div>
</div>
<div class="panels-flexible-region panels-flexible-region-18-center ">
  <div class="inside panels-flexible-region-inside panels-flexible-region-18-center-inside">
<div class="panel-pane pane-custom pane-3" >
  
      
  
  <div class="pane-content">
    <div class="project_logos project_logos2">
   <h3 class="hide">Related Links</h3>
	<ul>
<li></li>
		
	</ul>
</div>

  </div>

  
  </div>
  </div>
</div>
<div class="panels-flexible-region panels-flexible-region-18-regoin4 panels-flexible-region-last ">
  <div class="inside panels-flexible-region-inside panels-flexible-region-18-regoin4-inside panels-flexible-region-inside-last">
<div class="panel-pane pane-custom pane-5 footer_add" >
  
      
  
  <div class="pane-content">
    <span>Contact Details:</span>
                    <div ><a href="http://cvc.nic.in/"  title="CENTRAL VIGILANCE COMMISSION">CENTRAL VIGILANCE COMMISSION</a></div>
                    Satarkata Bhavan , A-Block<br>
					GPO Complex , INA <br>                    
                    New Delhi - 110 003 India<br>
                    EPABX :- 011- 24600200  (30 Lines)   <br>
					FAX : 011- 24651010/24651186		
	  </div>

  
  </div>
  </div>
</div>
</div>
</div>
    </div>
  </div>
</div>
  </div>
			</div>
		   		</div>
	</div>
	
	<div class="bottom_panel">
			Content Provided & Maintained by Central Vigilance Commission | Website Designed & Developed by National Informatics Centre
	</div>
</div>
<!-- Footer end -->
	 
	 
  </body>
</html>
