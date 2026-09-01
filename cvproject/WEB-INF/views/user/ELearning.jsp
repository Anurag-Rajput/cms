<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<style>
.vl {
    border-left: 6px groove #6666ff;
    height: 30%;
    position: absolute;
    left: 50%;
    margin-left: -3px;
    top: 45%;
    padding-left:10%; 
    
}
.vll {
    border-right: 6px groove #6666ff;
    height: 30%;
    position: absolute;
    right: 50%;
    margin-right: -3px;
    top: 45%;
    padding-right:5%;
    padding-bottom:5%;  
    
}

.wordart {
  font-family: Arial, sans-serif;
  font-size: 4em;
  font-weight: bold;
  position: relative;
  z-index: 1;
  display: inline-block;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}


.wordart.slate {
    transform: scale(1, 1.5);
    -webkit-transform: scale(1, 1.5);
    -moz-transform: scale(1, 1.5);
    -o-transform: scale(1, 1.5);
    -ms-transform: scale(1, 1.5);
}

.wordart.slate .text {
    font-family: Times, 'Times New Roman', serif;
    font-weight: normal;
    color: #2F5485;
    text-shadow: 0.03em 0.03em 0px #B3B3B3;
}
</style>
<head>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	document.getElementById('gridcase').style.display="none";
});
function caseStudy()
{
	document.getElementById('case').style.display="none";
	document.getElementById('que').style.display="none";
	document.getElementById('gridcase').style.display="block";
}

function queBank()
{
	
}
function back()
{
	document.getElementById('case').style.display="block";
	document.getElementById('que').style.display="block";
	document.getElementById('gridcase').style.display="none";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-Learning</title>
</head>
<body>
<br><br><br>
<center>

<div class="wordart slate"><span class="text">E-Learning</span></div>

</center>
<center>
<div id="case" class="vll"><img style="cursor: pointer;" title="Case Study" height="325" width="350" src='<c:url value="/resources/user/images/Case-Study-Image.png"/>' onclick="caseStudy();"></div>
</center>
<center>
<div id="que"  class="vl"><img style="cursor: pointer;" title="Question Bank" height="300" width="275"  src='<c:url value="/resources/user/images/que.png"/>' onclick="queBank();"></div>
</center>
<div id="gridcase" style="padding-top:5%; padding-bottom: 10%; ">
<img style="padding-left:20%; cursor: pointer;" title="Back" height="40" width="80" src='<c:url value="/resources/user/images/back-button-png-hi.png"/>' onclick="back();" >
<center><table cellspacing="5" cellpadding="5" style="border:6px groove #2b33bc ;" >
<thead>
<tr>
<th>S No.</th>
<th>Case Study Name</th>
<th>Click To Play</th>
</tr>
</thead>
<tr>
<td align="center">1</td>
<td>Appointment of an ineligible person</td>
<td align="center" ><a target="_blank" href="<c:url value="/resources/E-Learning/Case Study 1-Appointment of an ineligible person/Beta_EL_CVC Case Study 1/Beta_EL_CVC Case Study 1/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">2</td>
<td>Contract for 3rd party production of SSP</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 2-Contract for 3rd party production of SSP/Beta_EL_CVC Case Study 2_240818/Beta_EL_CVC Case Study 2_240818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">3</td>
<td>On-site Levelling & Infrastructure Package</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 3-On-site Levelling & Infrastructure Package/Beta_EL_CVC Case Study 3_240818/Beta_EL_CVC Case Study 3_240818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">4</td>
<td>Impropriety in Purchase of VF Drives</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 4-Impropriety in Purchase of VF Drives/Beta_EL_CVC Case Study 4_310818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">5</td>
<td>Procurement of Ball Bearings</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 5-Procurement of Ball Bearings/Beta_EL_CVC Case Study 5_240818/Beta_EL_CVC Case Study 5_240818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">6</td>
<td>Reconciliation of project authority certificates</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 6-Reconciliation of project authority certificates/Beta_EL_CVC Case Study 6_240818/Beta_EL_CVC Case Study 6_240818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">7</td>
<td>Fraudulent award of contracts</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 7-Fraudulent award of contracts/Beta_EL_CVC Case Study 7_240818/Beta_EL_CVC Case Study 7_240818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">8</td>
<td>Mortgaging of Property to the Bank</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 8-Mortgaging of Property to the Bank/Beta_EL_CVC Case Study 8_240818/Beta_EL_CVC Case Study 8_240818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">9</td>
<td>XYZ Insurance company cheque misappropriation</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 9-XYZ Insurance company cheque misappropriation/Beta_EL_CVC Case Study 9_230818/Beta_EL_CVC Case Study 9_230818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">10</td>
<td>Fraud in personal loan accounts</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 10-Fraud in personal loan accounts/Beta_EL_CVC Case Study 10_240818/Beta_EL_CVC Case Study 10_240818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">11</td>
<td>Intentional Revision of a Closed Contract</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study 11-Intentional Revision of a Closed Contract/Beta_EL_CVC Case Study 11_240818/Beta_EL_CVC Case Study 11_240818/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">12</td>
<td>Securing Employment Using Forged Documents</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study Securing Employment Using Forged Documents/Case Study_Securing employment using forged documents/Beta_EL_Securing employment using forged documents_050918/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">13</td>
<td>Import of Betel Nuts in Place of Cashew Nuts</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Case Study-Import of Betel Nuts in Place of Cashew Nuts/Case Study-Import of Betel Nuts in Place of Cashew Nuts/Betel Nut cashew nut case study/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">14</td>
<td>Wrong classifications of foundations</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/01-CVC_Wrong classifications of foundations/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">15</td>
<td>Impropriety in supply of Calcined Bauxite</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/02-CVC-Impropriety in supply of Calcined Bauxite/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">16</td>
<td>Abnormally High Deviation in Construction Work</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/03-CVC-Abnormally High Deviation in Construction Work/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">17</td>
<td>Procurement of Insulating Mats</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/04-CVC-Procurement of Insulating Mats/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">18</td>
<td>Procurement of XLPE Cable under DGS&D's rate Contract</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/05-CVC-Procurement of XLPE Cable under DGS&D's rate Contract/05-CVC-Procurement of XLPE Cable under DGS&D's rate Contract/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">19</td>
<td>Produce Marketing Loans</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/07-CVC Produce Marketing Loans/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">20</td>
<td>Done_CVC-Case-Study-BVFCL</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/Done_CVC-Case-Study-BVFCL/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
<tr>
<td align="center">21</td>
<td>NHPC_False cement_200918</td>
<td align="center"><a  target="_blank" href="<c:url value="/resources/E-Learning/NHPC_False cement_200918/course/Index.html"/>"><img src='<c:url value="/resources/user/images/play_btn.png"/>'></a></td>
</tr>
</table>
</center> 
</div>


</body>
</html>