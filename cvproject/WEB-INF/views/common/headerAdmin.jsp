<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.flexy {
            display: block;
            border: 1px solid #eee;
            max-height: 1320px;
            max-width : 1320px;
            overflow: auto;
        }

        .flexy thead {
         width: 100%;
            display: -webkit-flex;
            -webkit-flex-flow: row;
        }

        .flexy thead tr {
            padding-right: 15px;
            display: -webkit-flex;
            width: 800%;
            -webkit-align-items: stretch;
        }

        .flexy tbody {
            display: -webkit-flex;
            height: 1000px;
            overflow: auto;
            -webkit-flex-flow: row wrap;
        }
        .flexy tbody tr{
            display: -webkit-flex;
            width: 100%;
        }

        .flexy tr td {
            width: 15%;
        }


.blink_text {

animation:1s blinker linear infinite;
-webkit-animation:1s blinker linear infinite;
-moz-animation:1s blinker linear infinite;

 color: red;
}

@-moz-keyframes blinker {  
 0% { opacity: 1.0; }
 50% { opacity: 0.0; }
 100% { opacity: 1.0; }
 }

@-webkit-keyframes blinker {  
 0% { opacity: 1.0; }
 50% { opacity: 0.0; }
 100% { opacity: 1.0; }
 }

@keyframes blinker {  
 0% { opacity: 1.0; }
 50% { opacity: 0.0; }
 100% { opacity: 1.0; }
 }
 </style>
<script >

function deleteAllCookies() {
	
    var cookies = document.cookie.split(";");
    for (var i = 0; i < cookies.length; i++) {
    	var cookie = cookies[i];
    	var eqPos = cookie.indexOf("=");
    	var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
    	document.cookie = name + "=;expires="+new Date();
    }
    window.location.href = "#";
    
}

function formSubmit() {
    document.getElementById("logoutForm").submit();
}

function submitURLForm(id)
{
	document.getElementById(id).submit();
}
</script>

<header>


 <div class="">
    <div class="row-bot-bg">
      <div class="main">
	  <div class="wrapper">

	<div align="center" style="margin-top: 2.5cm;">	
		<nav>
		
          <ul class="menu">
            <li>Complaint Related
            <ul>
            <li><a href="<c:url value="/user/admin/transfer"/>">Complaint Transfer</a></li>
            <li><a href="<c:url value="/admin/clearDecision"/>">Clear Complaint Decision</a></li>
            </ul></li>  
           
           <li><a href="javascript:void(0);" onclick="submitURLForm('register')">Register</a></li>
           <li><a href="<c:url value="/user/firstProfile"/>">Officer Updation</a></li>
           <li><a href="<c:url value="/admin/credential"/>">Password Reset/Unlock</a></li>
           
           <li><a href="javascript:void(0);" onclick="submitURLForm('emailSmsForm')">Send Email/SMS Utility</a></li>
           
          </ul>
           <ul class="menu1">
            <li><a
									href="javascript:formSubmit();" 
									class="" title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></a></li>
           
          </ul>
        </nav>
      </div></div>
      <c:url var="logoutUrl" value="/user/j_spring_security_logout"></c:url>     
	<form action="${logoutUrl}" method="post" id="logoutForm">
    	<input type="hidden" name="${_csrf.parameterName}"     value="${_csrf.token}" />
	</form>

	<c:url var="emailSmsUrl" value="/admin/viewEmailSMS"></c:url> 
	<form action="${emailSmsUrl}" method="post" id="emailSmsForm">
    	<input type="hidden" name="${_csrf.parameterName}"     value="${_csrf.token}" />
	</form>

	<c:url var="registerUser" value="/register"></c:url>
	<form action="${registerUser}" method="post" id="register">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
      </div>
    </div>
  </div>
  
  <div id="myModal" class="modal">

  

</div>
  
  <div align="center">
<span class="blink_text"><font color="red">This site can be best viewed in Firefox 3.5 and above. To check your browser version <a href="http://www.whatbrowser.org/">click here</a></font> </span>
</div>
</header>