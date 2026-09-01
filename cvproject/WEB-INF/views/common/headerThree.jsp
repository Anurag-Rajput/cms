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
            <li><a href="<c:url value="/user/goBack"/>">Home</a></li>
            
            <li><a target="_blank" href="https://pmis.negd.gov.in/cvc"><font color="yellow">CTE QPR Submission</font></a></li> 
            
            <li ><a href="http://portal.cvc.gov.in/QPR/"><span class="blink_text">CVO QPR</span></a></li>
            
            <li><a href="<c:url value=""/>"><span class="blink_text"><font color="yellow">CVO Corner</font> </span></a><ul>
            <li><a href="<c:url value="/user/cvofficer/firstStage"/>">First Stage Pending Implementation</a></li>
            <li><a href="<c:url value="/user/cvofficer/secondStage"/>">Second Stage Pending Implementation</a></li>
            <li><a href="<c:url value="/user/cvofficer/complaintPending"/>">Complaints Pending</a></li>
            <li><a href="<c:url value="/user/cvofficer/furtherClarification"/>">Cases Pending For Further Clarification</a></li>
            <li><a href="<c:url value="/user/cvofficer/departmentalInquiry"/>">Cases Pending For Departmental Inquiry</a></li>
            </ul></li>
            
            <li><a href="<c:url value="/user/cvofficer/na"/>">Complaint Sent for NA</a><ul>
            <li><a href="<c:url value="/user/cvofficerread/na"/>">Read</a></li>
            <li><a href="<c:url value="/user/cvofficerunread/na"/>">Unread</a></li>
            <li><a href="<c:url value="/user/cvofficerclosed/na"/>">Closed</a></li>
            </ul></li>
            
            <li><a><font color="yellow">E-Learning</font></a><ul>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 1-Appointment of an ineligible person/Beta_EL_CVC Case Study 1/Beta_EL_CVC Case Study 1/course/Index.html"/>">Appointment of an ineligible person</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 2-Contract for 3rd party production of SSP/Beta_EL_CVC Case Study 2_240818/Beta_EL_CVC Case Study 2_240818/course/Index.html"/>">Contract for 3rd party production of SSP</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 3-On-site Levelling & Infrastructure Package/Beta_EL_CVC Case Study 3_240818/Beta_EL_CVC Case Study 3_240818/course/Index.html"/>">On-site Levelling & Infrastructure Package</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 4-Impropriety in Purchase of VF Drives/Beta_EL_CVC Case Study 4_310818/course/Index.html"/>">Impropriety in Purchase of VF Drives</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 5-Procurement of Ball Bearings/Beta_EL_CVC Case Study 5_240818/Beta_EL_CVC Case Study 5_240818/course/Index.html"/>">Procurement of Ball Bearings</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 6-Reconciliation of project authority certificates/Beta_EL_CVC Case Study 6_240818/Beta_EL_CVC Case Study 6_240818/course/Index.html"/>">Reconciliation of project authority certificates</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 7-Fraudulent award of contracts/Beta_EL_CVC Case Study 7_240818/Beta_EL_CVC Case Study 7_240818/course/Index.html"/>">Fraudulent award of contracts</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 8-Mortgaging of Property to the Bank/Beta_EL_CVC Case Study 8_240818/Beta_EL_CVC Case Study 8_240818/course/Index.html"/>">Mortgaging of Property to the Bank</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 9-XYZ Insurance company cheque misappropriation/Beta_EL_CVC Case Study 9_230818/Beta_EL_CVC Case Study 9_230818/course/Index.html"/>">XYZ Insurance company cheque misappropriation</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 10-Fraud in personal loan accounts/Beta_EL_CVC Case Study 10_240818/Beta_EL_CVC Case Study 10_240818/course/Index.html"/>">Fraud in personal loan accounts</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study 11-Intentional Revision of a Closed Contract/Beta_EL_CVC Case Study 11_240818/Beta_EL_CVC Case Study 11_240818/course/Index.html"/>">Intentional Revision of a Closed Contract</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study Securing Employment Using Forged Documents/Case Study_Securing employment using forged documents/Beta_EL_Securing employment using forged documents_050918/course/Index.html"/>">Securing Employment Using Forged Documents</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Case Study-Import of Betel Nuts in Place of Cashew Nuts/Case Study-Import of Betel Nuts in Place of Cashew Nuts/Betel Nut cashew nut case study/course/Index.html"/>">Import of Betel Nuts in Place of Cashew Nuts</a></li>
            
            <li><a  target="_blank" href="<c:url value="/study/01-CVC_Wrong classifications of foundations/course/Index.html"/>">Wrong classifications of foundations</a></li>
            <li><a  target="_blank" href="<c:url value="/study/02-CVC-Impropriety in supply of Calcined Bauxite/course/Index.html"/>">Impropriety in supply of Calcined Bauxite</a></li>
            <li><a  target="_blank" href="<c:url value="/study/03-CVC-Abnormally High Deviation in Construction Work/course/Index.html"/>">Abnormally High Deviation in Construction Work</a></li>
            <li><a  target="_blank" href="<c:url value="/study/04-CVC-Procurement of Insulating Mats/course/Index.html"/>">Procurement of Insulating Mats</a></li>
            <li><a  target="_blank" href="<c:url value="/study/05-CVC-Procurement of XLPE Cable under DGS&D's rate Contract/05-CVC-Procurement of XLPE Cable under DGS&D's rate Contract/course/Index.html"/>">Procurement of XLPE Cable under DGS&D's rate Contract</a></li>
            <li><a  target="_blank" href="<c:url value="/study/07-CVC Produce Marketing Loans/course/Index.html"/>">Produce Marketing Loans</a></li>
            <li><a  target="_blank" href="<c:url value="/study/Done_CVC-Case-Study-BVFCL/course/Index.html"/>">Case Study Tendering Process and Statutory Government Levies</a></li>
            <li><a  target="_blank" href="<c:url value="/study/NHPC_False cement_200918/course/Index.html"/>">Case of False Cement Supply Based on the False Lorry Recipt Challan</a></li>
            </ul></li>
            
            
             <%-- <li><a target="_blank" href="<c:url value="/user/cvofficer/ELearning"/>"><span class="blink_text"><font color="yellow">E-Learning</font> </span></a></li> --%>
             
            <%-- <li ><a href="<c:url value="/user/cvofficer/monthlyReport"/>">Monthly Report</a></li>   --%>
          <%--  <li><a href="<c:url value="/user/officerOutbox"/>">Outbox</a></li> --%>
            <li><a href="<c:url value="/user/sentMail"/>">Sent</a></li>   
            <li><a href="<c:url value="/user/firstProfile"/>">Edit Profile</a></li>
             <li><a href="<c:url value="/user/resetPassword"/>">Change Password</a></li>
            
          </ul>
           <ul class="menu1">
            <li><a
									href="javascript:formSubmit();" 
									class="" title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></a></li>
           
          </ul>
        </nav>
      </div></div></div>
    </div>
  </div>
  <br>
  <div align="center">
<span class="blink_text"><font color="red">For any query regarding QPR Submission contact Shri SK Jain (ATE Contact No. 9810750281)<br><br>
<!-- This site can be best viewed in Firefox 3.5 and above. To check your browser version <a href="http://www.whatbrowser.org/">click here</a> --></font> </span>
</div>
</header>