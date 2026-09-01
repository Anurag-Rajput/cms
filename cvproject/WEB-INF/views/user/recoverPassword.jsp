<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
 <title>CVC </title>
  <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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

<script src="<c:url value="/resources/user/js/md5.js"/>" type="text/javascript"></script>
<script type="text/javascript">  
        function GeneratePwd() { 
        	 
            if (document.getElementById("oldPassword").value != "") {  
                document.getElementById("oldPassword").value = calcMD5(document.getElementById("oldPassword").value);
            } 
            if (document.getElementById("txtNewPassword").value != "") {  
                document.getElementById("txtNewPassword").value = calcMD5(document.getElementById("txtNewPassword").value);
            }
            if (document.getElementById("txtConfirmPassword").value != "") {  
                document.getElementById("txtConfirmPassword").value = calcMD5(document.getElementById("txtConfirmPassword").value);
            }
            
        }  
</script>  
<script type="text/javascript">
function checkPasswordMatch() {
    var password = $("#txtNewPassword").val();
    var confirmPassword = $("#txtConfirmPassword").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("email do not match!");
    else
        $("#divCheckPasswordMatch").html("email match.");
}
</script>
</head>
<header>
 <div align="fleft" >
    <div class="row-bot-bg">
      <div class="main">
	  <div class="wrapper">
 
      </div></div>
    </div>
  </div>
  
</header>

<body>
<br />
<br />
<!--==============================content================================-->
<c:url var ="myurl" value="/updateRecoverPassword"/>
<form:form  method="post" id="myform" name="myform" action="${myurl}" commandName="user" >
<section id="content">
  <div class="main">
    
          
		
      <div class="wrapper">
    
		 
		 <div  align="center" >
		<div align="center"><label style="color: red; ">
												        <c:out  value='${errMessage}' />
												        </label></div>
		 <br>
       <div   style="width:515px; background-color: rgb(218, 237, 241); color: #0E0D01;" ><h3> Recover your password	</h3></div>
		 <br>
		 <br>
        <div style="width: 500px; height: 600px;">
        
        
			 <div class="form-group">
              <label>&nbsp;User Name </label>
			   <div class="form-list">
                 <form:input size="25" type="text" id="userName" path="userName"  autocomplete="off"  name="userName"/>
                 <form:errors path="userName" cssClass="error"></form:errors>
			  </div>
            </div>
             <br/>
            
             <div class="form-group">
              <label>&nbsp;Email </label>
			   <div class="form-list">
                 <form:input size="25" type="text"  path="email" name="email" autocomplete="off" id="txtNewPassword"/>
                 <form:errors path="email" cssClass="error"></form:errors>
			  </div>
            </div>
         <br/>
        
        	<div class="form-group">
              <label>&nbsp;Re-enter Email </label>
			   <div class="form-list">
                 <form:input size="25" type="text" path="reEmail" name="reEmail" autocomplete="off" id="txtConfirmPassword" onkeyup="checkPasswordMatch();"/>
                 <form:errors path="reEmail" cssClass="error"></form:errors>
                 <div class="registrationFormAlert" id="divCheckPasswordMatch">
			  </div>
            </div>
            
            <br/><br/> <br/>
            
            
            <br/>
            <br/>
             <br/>
            <div class="form-group" align="right">
              <label><button type="submit"  class="button-2" onclick="GeneratePwd();"  name="submit" value="save">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			  <div class="form-list" align="left">
               
	   		
											<button type="reset" class="button-2" name="close">Reset</button>
										
	   	</div>
            </div>
            
            
       
 </div>
        
      </div>
		
		</div>
		
    </div>
</section>	
</form:form>	
				
</html>
