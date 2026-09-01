<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
 
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
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
}
</script>
</head>


<body>
<br />
<br />
<!--==============================content================================-->
<form name="myform" id="myform" >
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
				
</body>