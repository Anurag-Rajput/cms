<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script >

function formSubmit() {
    document.getElementById("logoutForm").submit();
}


</script>

<header>
 <div align="fleft" >
    <div class="row-bot-bg">
      <div class="main">
	  <div class="wrapper">
    <c:url var="logoutUrl" value="/user/j_spring_security_logout"></c:url>     

<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"     value="${_csrf.token}" />
</form>
         
      	
<div align="left" style="margin-top: 2.5cm;">
<nav>
          <ul class="menu">
          	<li><a href="<c:url value="/user/helpLine"/>" style="margin-left:30px;">Add Complaint</a></li>
          	<li><a href="<c:url value="/user/search"/>" style="margin-left:30px;">Search</a></li>
          </ul>
          
           <ul class="menu1">
            <li><a
									href="javascript:formSubmit();" 
									class="btn btn-danger" title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></a></li>
           
          </ul>
        </nav>
     
 </div>       
        
      </div></div>
    </div>
  </div>
  
</header>