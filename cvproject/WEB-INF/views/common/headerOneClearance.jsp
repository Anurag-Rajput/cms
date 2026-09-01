<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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


</script>

<header>
 <div class="">
    <div class="row-bot-bg">
      <div class="main">
	  <div class="wrapper">
         <%-- <center>  <h2>&nbsp;central &nbsp;vigilance commission </h2>  </center> 
		<div class="fright"> 
  <a href="logout.jsp" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x">logout</i></a> </div>
		 <div class="fleft"> <img src="images/cvc_logo.PNG" />
          <div class="inner-text"> Login :${sessionScope.user} <br/>
            <small><%=new Date(session.getLastAccessedTime())%> </small> </div>
        </div> --%>
        <c:url var="logoutUrl" value="/user/j_spring_security_logout"></c:url>     

<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}"     value="${_csrf.token}" />
</form>
	<div align="center" style="margin-top: 2.5cm;">	
		<nav>
		
          <ul class="menu">
            
     <li><a href="<c:url value="/user/clr/vigClearance"/>">Home</a></li>
            <li><a href="<c:url value="/user/clr/pwdChanged"/>">Changed Password</a></li>
              <li><a href="<c:url value="/user/clr/searchClearance"/>">Search</a></li> 
              
            
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
  <br>
  <div id="myModal" class="modal">

  <!-- Modal content -->
  <!-- <div class="modal-content">
    <div class="modal-header">
      <span class="close" onclick="closeModal();">&times;</span>
      <h3>Reason to change</h3>
    </div>
    <div class="modal-body">
    	<p id="modal-para1-body"> <input type="text" autofocus="autofocus" style=" width: 100%;  height:200px;  font-size:24pt;" /></p> <br>
      <p id="modal-para2-body" align="center"><input type="button" onclick="uploaded();" value="Ok" style="  width: 20em;  height: 2em;"/></p>
      <p></p>
    </div>
    <div class="modal-footer">
      <h3>Central Vigilance Commission</h3>
    </div>
  </div> -->

</div>
  
  <div align="center">
<span class="blink_text"><font color="red">This site can be best viewed in Firefox 3.5 and above. To check your browser version <a href="http://www.whatbrowser.org/">click here</a></font> </span>
</div>
</header>