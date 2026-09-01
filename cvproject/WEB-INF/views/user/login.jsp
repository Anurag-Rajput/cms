<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Login Page</title>

<link href="<c:url value="/resources/user/css/style1.css"/>" rel="stylesheet" type="text/css" />
<script >
document.getElementById('exeMessege').style.display = 'none';
</script>
<script type="text/javascript">

var user= document.getElementById("j_username").value;
alert(user);

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
<style>
body{
	background-color : rgb(222,239,255);
	background-repeat: no-repeat;
	background-size: 2000px 1000px;
	background-position: center;
    background-attachment: fixed;
   
}

</style>


</head>
<br></br>

<header>

<div align="center">
<h3><span><font color="red">Kind Attention all users.</font> </span></h3><br><br>
<br>


<span><font color="red">This portal is best viewed in Mozila Firefox 3.5 and above or Chorme. To check your browser version <a href="http://www.whatbrowser.org/">click here</a></font> </span><br>
<span><font color="red">All registered user are advised to login and change their password/update profile.</font> </span>
</div>


</header>

<body>

<br>
<br>
<center>
			<c:url var="url" value="/user/j_spring_security_check"></c:url>
			<form class="form-style1" action="${url}" method="post" name="form"  autocomplete="off"
				id="loginForm">
				<div style="padding: 100px 0 0 150px;">
					<div id="login-box" style="margin-top: -90px;">
						<!-- style="margin-top: 0px; margin-left: 0px; margin-right: -1034px;"> -->
						<H2>Central Vigilance Commission</H2>
						 <input type="hidden"	name="csrf"	value="${_csrf.token}"/>
						 <table border="0" align="center">
						 <tr>
						 <td><div id="login-box-name" style="margin-top: 20px;">User Id:</div></td>
						 <td><div id="login-box-field" style="margin-top: 20px;">
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
                            <img width="90%;" id="captcha_id" name="imgCaptcha" src="captcha.jpg"/>
                        </div>
                    </td>
 
                    <td align="left"><a href="javascript:;"
                        title="change captcha text"
                        onclick="document.getElementById('captcha_id').src = 'captcha.jpg?' + Math.random();  return false">
                            <img  src= "<c:url value="/resources/user/images/refresh.png"/>"/>
                    </a></td>
 
                </tr>
                <tr>
                    <td colspan="2"><form:errors path="captcha" cssClass="error" /></td>
                </tr>
 
                <tr>
                    <td>Enter Captcha:</td>
                    <td><input type="text" name="captcha" class="form-login" /></td>
                </tr>
                </table>
                <br></br>
							<div><label style="color: red;">${message}</label></div>
							<br/><br/>
             
						<br /> <br /> 
						<input style=" width:80px; height:30px;"	onclick="crypt();" type="button" value="Submit" /> 
						<input style="margin-left: 100px;width:80px; height:30px;" type="reset" value="Reset" />
					</div>
				</div>
			</form>
		</center></body>
</html>
