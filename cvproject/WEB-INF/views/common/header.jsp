<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style type="text/css">
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


	 function formLogout() {
         document.getElementById("logoutForm").submit();
     }

</script>
<header>
	<div align="fleft">
		<div class="row-bot-bg">
			<div class="main">
				<div class="wrapper">
					<!-- <div class="fright"> 
  <a href="logout.jsp" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x">logout</i></a> </div>
	 <div class="fleft"> <img src="<c:url value="/resources/user/images/cvc_logo.PNG"/>" /> -->
	 
	 <c:url var="logoutUrl" value="/user/j_spring_security_logout"></c:url>     

<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"     value="${_csrf.token}" />
</form>
					<div align="left" style="margin-top: 2.5cm;">
						<nav>
							<ul class="menu">
								<li><a href="<c:url value="/user/dairy/addDairyComplain"/>">Home</a></li>
								<li><a href="<c:url value="/user/search"/>">Search</a></li>
								<li><a href="<c:url value="/user/dairy/outbox"/>">Outbox</a></li>
								 <li><a href="<c:url value="/user/dairy/resetPassword"/>">Change Password</a></li>
							</ul>

							<ul class="menu1">
								<li><a
									href="javascript:formLogout();" 
									class="btn btn-danger" title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></a></li>

							</ul>
						</nav>
					</div>

				</div>
			</div>
		</div>
	</div>
<br>
<div align="center">
<span class="blink_text"><font color="red">This site can be best viewed in Firefox 3.5 and above. To check your browser version <a href="http://www.whatbrowser.org/">click here</a></font> </span>
</div>
</header>