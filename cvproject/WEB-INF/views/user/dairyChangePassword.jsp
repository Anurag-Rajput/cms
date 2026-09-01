<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script src="<c:url value="/resources/user/js/base64.js"/>" type="text/javascript"></script>
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
<script src="<c:url value="/resources/user/js/md5.js"/>" type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/jquery.validate.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/jquery.validate.min.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/bCrypt.js"/>" type="text/javascript"></script>
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

function clearAll()
{
	$('#error').empty();
	$('#divCheckPasswordMatch').empty();
	document.getElementById('oldPassword').value="";
	document.getElementById('txtNewPassword').value="";
	document.getElementById('txtConfirmPassword').value="";
}
</script>
<body>
<br />
<br />
<!--==============================content================================-->
<c:url var="myurl" value="/user/dairy/changedPassword"/>

<form:form commandName="pwdFrom"  name="myform" id="myform" method="post" 
		action="${myurl}"  >
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
		 
		 <div align="center"><label style="color: red; ">
        <c:out  value='${pwdError}' />
        </label></div>
        <div style="width: 500px; height: 300px;">
        
        
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
	
 
	</form:form>	
	
	<div class="form-group" align="right">
              <label><button type="reset" class="button-2" name="close" onclick="clearAll();">Reset</button></label>
			 &nbsp; &nbsp;<div class="form-list" align="left">
               
	   		<a href="<c:url value="/user/dairy/addDairyComplain"/>">
											<button type="button" class="button-2" name="close">Close
												without Save</button>
										</a>
									
	   	</div>
	   	
	   	<label><button type="button" id="submit" class="button-2" onclick="crypt();"  name="submit" value="save">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	   	
            </div>
<div class="form-group"align="center">
              

	</div>	
                   
 </body>
