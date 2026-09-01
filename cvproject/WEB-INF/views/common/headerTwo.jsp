<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
	
	
	function UpdateProfile()
	{
		document.getElementById("updateProfile").submit();
	}
</script>

<header>
	<div align="fleft">
		<div class="row-bot-bg">
			<div class="main">
				<div class="wrapper">
					<c:url var="logoutUrl" value="/user/j_spring_security_logout"></c:url>

					<form action="${logoutUrl}" method="post" id="logoutForm">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
					
					<c:url var="updateProfile" value="/user/public/updateCitizenProfile/view"></c:url>
					<form action="${updateProfile}" method="post" id="updateProfile">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>

					<div align="left" style="margin-top: 2.5cm;">
						<nav>
							<ul class="menu">
								<li><a href="<c:url value="/user/public/citizen"/>"
									style="margin-left: 30px;">Lodge Complaint</a></li>
								<li><a
									href="<c:url value="/user/public/citizenMyComplaint"/>"
									style="margin-left: 30px;">My Previous Complaint</a></li>
								
								<li><a href="#"
									style="margin-left: 30px;" onclick="UpdateProfile();">Edit Profile</a></li>
								<li><a
									href="<c:url value="/user/public/citizenResetPassword"/>"
									style="margin-left: 30px;">Change Password</a></li>
							</ul>

							<ul class="menu1">
								<li><a href="javascript:formSubmit();" class="btn "
									title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></a></li>

							</ul>
						</nav>

					</div>

				</div>
			</div>
		</div>
	</div>

</header>