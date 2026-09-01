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
<script src="<c:url value="/resources/user/js/md5.js"/>" type="text/javascript"></script>
<script type="text/javascript">

function crypt(){
	var salt = gensalt(5);
    var password  = calcMD5(document.getElementById("oldPassword").value);  
	var hash = calcMD5(salt);   
	var hexPassword = calcMD5(password+hash);
	$("#oldPassword").val(hexPassword+salt);
	if ((document.getElementById("txtNewPassword").value != "")  && (document.getElementById("txtConfirmPassword").value != "")  && (document.getElementById("txtNewPassword").value.length >= 8) && (document.getElementById("txtConfirmPassword").value.length >= 8)){  
        document.getElementById("txtNewPassword").value = calcMD5(document.getElementById("txtNewPassword").value); 
        document.getElementById("txtConfirmPassword").value = calcMD5(document.getElementById("txtConfirmPassword").value); 
	 $("#myform").submit();
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
	 $("#divCheckPasswordMatch").html("Passwords match!");
        validatePassword();
    	}
}
</script>
</head>

<body>
<br />
<br />
<!--==============================content================================-->
<c:url var="myurl" value="/user/clr/changedPassword"/>

<form:form commandName="pwdFrom"  name="myform" id="myform" method="post" 
		action="${myurl}"  >
		
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
               <li><a href="<c:url value="/user/clr/searchClearance"/>">Search</a></li>
			 <!--<li><a href="#">File Tracking</a></li> -->
          </ul>
           <ul class="menu1">
								<li><button type="submit"
									onclick="javascript:formSubmit();"
									 title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></button></li>

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
							style="width: 300%;  color: #0E0D01;">
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
		 
		  <div align="center"><label style="color: red; ">
        <c:out  value='${pwdError}' />
        </label></div>
        <div style="width: 500px; height: 200px;">
        
        
			 <div class="form-group">
              <label>&nbsp;Old Password <span style="color:red;">*</span></label>
			   <div class="form-list">
                 <form:input size="25" type="password" id="oldPassword" autocomplete="off" path="oldPassword" name="oldPassword"/>
                 <form:errors path="oldPassword" cssClass="error"> </form:errors>
			  </div>
            </div>
            <br>
            
             <div class="form-group">
              <label>&nbsp;New Password <span style="color:red;">*</span></label>
			   <div class="form-list">
                 <form:input size="25" type="password" path="newPassword" autocomplete="off" onkeypress="validatePassword();" name="newPassword" id="txtNewPassword"/>
                  <label id="error" style="color: red;"/>
                 <form:errors path="newPassword" cssClass="error"> </form:errors>
			  </div>
            </div>
         <br>
        
        	<div class="form-group">
              <label>&nbsp;Re-enter New Password <span style="color:red;">*</span></label>
			   <div class="form-list">
                 <form:input size="25" type="password" path="reNewPassword" name="reNewPassword" autocomplete="off" id="txtConfirmPassword" onkeyup="checkPasswordMatch();"/>
                 <div class="registrationFormAlert" id="divCheckPasswordMatch">
                 <form:errors path="reNewPassword" cssClass="error"> </form:errors>
			  </div>
            </div>
 </div>
        
      </div>
		
		</div>
		
    </div>
</section>	
	
			
            <div class="form-group" align="right">
 
              <label><button type="reset" class="button-2" name="close">Reset</button></label> &nbsp; &nbsp;
			<div class="form-list" align="left">
               
	   		<a href="<c:url value="/user/goBack"/>"><button type="button" class="button-2" name="close">Closewithout Save</button></a>&nbsp; &nbsp;
				<label><button type="button" id="submit" class="button-2" onclick="crypt();"  name="submit" value="save">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>					
	   	</div>
	   	<!--  <div class="form-group" align="center">
             <label><button type="button" id="submit" class="button-2" onclick="crypt();"  name="submit" value="save">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>        	
             	</div>    -->
            </div>
  </form:form>  
     
 </body>

</html>