<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
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
<script  src="<c:url value="/resources/user/js/jquery.validate.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/jquery.validate.min.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/bCrypt.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/base64.js"/>" type="text/javascript"></script>
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
<style>
.error {
	color: #ff0000;
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
function validatePassword() {
    var newPassword = document.getElementById('txtNewPassword').value;
         if(newPassword.search((/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[#$%&()*+,-./:;<=>?@\^_`{|}~]).*$/))){
        document.getElementById("error").innerHTML="Should contain 1 digit,1 Sepical Character, 1 small, 1 capital letter and minimum 8 character";
        document.getElementById('submit').disabled=true;
  }else{
	  document.getElementById("error").innerHTML = "";
	  document.getElementById('submit').disabled=false;
  }
    
}
</script>
<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

</script>	
<script  src="<c:url value="/resources/user/js/jquery.validate.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/jquery.validate.min.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/bCrypt.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/base64.js"/>" type="text/javascript"></script>

<script type="text/javascript">

function result(hash){
 $("#oldPassword").val(Base64.encode($("#oldPassword").val())+'&&&'+hash);
}

function result1(hash){
	 $("#txtNewPassword").val(hash);
	 $("#txtConfirmPassword").val(hash);
	 $("#myform").submit();
	}

function crypt(){
	var salt;
	try{
    	salt = gensalt(5);
    	salt1 = gensalt(5);
    	hashpw($("#oldPassword").val(),salt,result);
    	hashpw($("#txtNewPassword").val(),salt1,result1);
		}catch(err){
    	alert(err);
    	return;
		}
	
  
}
</script>
<script>
function validatePassword() {
    var newPassword = document.getElementById('txtNewPassword').value;
         if(newPassword.search((/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[#$%&()*+,-./:;<=>?@\^_`{|}~]).*$/))){
        document.getElementById("error").innerHTML="Should contain 1 digit,1 Sepical Character, 1 small 1 capital letter and minimum * character";
        document.getElementById('submit').disabled=true;
  }else{
	  document.getElementById("error").innerHTML = "";
	  document.getElementById('submit').disabled=false;
  }
    
}
</script>

<script>
function formSubmit() {
	var url = '<c:url value="/user/j_spring_security_logout"/>';
	 $('#myform').attr('action', url); 
	 
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
        $("#divCheckPasswordMatch").html("Passwords match.");
        document.getElementById('submit').disabled=false;
    	}
}
</script>
</head>

<form name="myform" id="myform" >

		<header>
 <div class="">
    <div class="row-bot-bg">
      <div class="main">
	  <div class="wrapper">
      
		
		
		<div align="center" style="margin-top: 2.5cm;">
		<nav>
          <ul class="menu">
           
            <li><a href="<c:url value="/user/clr/addClearance"/>">Add New</a></li>
               <li><a href="<c:url value="/user/clr/pwdChanged"/>">Changed Password</a></li>
           
			 <!--<li><a href="#">File Tracking</a></li> -->
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
<section id="content">
  <div class="main">
    <div class="wrapper">
        <article class="col-1">
						<div class="inner-text"
							style="width: 300%; background-color: rgb(218,237,241); color: #0E0D01;">
							Welcome: ${loginId} <br /> <small></small>
						</div>

					</article>
          </div>
          
		
      <div class="wrapper">
    
		 
		 <div  align="center" >
		 <br>
       <div   style="width:515px; background-color: rgb(218, 237, 241); color: #0E0D01;" ><h3> Change your password	</h3></div>
		 <br>
		 <br>
				<img src="<c:url value="/resources/user/images/done.gif-c200"/>" align="middle" width="30" height="30"/><label>Password updated successfully.</label>
	<br></br>		
        
      </div>
		
		</div>
		
    </div>
</section>	
</form>	

</html>