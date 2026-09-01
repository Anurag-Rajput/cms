<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel='stylesheet' type='text/css' href='../resources/user/css/datePicker.css'/>
<script src="../resources/user/js/datePicker.js"></script>

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
<!-- End Deop Down -->
<body id="page2">
 
 <c:url var="myurl" value="/user/cvofficer/insertDetailsByCvo"/>
<form:form name="myform" id="myform" method="post" action="${myurl}" commandName="cvoForm" >

<script>
$(document).ready(
		function() {
				$("#dueDateReport").datepicker();
			    $("#investigationOpenDate").datepicker();
			    $("#investigationCloseDate").datepicker();
			    $("#recommendationActionDate").datepicker();
			    $("#referFirstStageDate").datepicker();
			    $("#assuranceMemoDate").datepicker();
			    });

$(document).ready(function(){
	$("#sourceOfComplaint").val($("#txtSourceOfComplaint").val());
	$("#observation").val($("#txtObservation").val());
	$("#gistOfAllegations").val($("#txtGistOfAllegations").val());
	$("#responseOfficialConcerned").val($("#txtResponseOfficialConcerned").val());
	$("#counterResponse").val($("#txtCounterResponse").val());
	$("#conclusion").val($("#txtConclusion").val());
	$("#responsibilityOfficials").val($("#txtResponsibilityOfficials").val());
	$("#recommendationAction").val($("#txtRecommendationAction").val());
	$("#systematicImprovement").val($("#txtSystematicImprovement").val());
	$("#assuranceMemo").val($("#txtAssuranceMemo").val());
	$("#biodataOfOfficials").val($("#txtBiodataOfOfficials").val());
	$("#remark").val($("#txtremark").val());
	$("#cvcJuri").val($("#txtCvcJuri").val());
	$("#referFirstStage").val($("#txtReferFirstStage").val());
	
	if(document.getElementById('decision3').checked)
		$("#irTable").show();
	else
		$("#irTable").hide();
	
	if(document.getElementById('cvcJuri1').checked)
		$("#divFirstStage").show();
	else
		$("#divFirstStage").hide();
});

function setDecision(decision)
{

	if(decision=="decision3")
	{
		$("#irTable").show();		
		$("#investigationOpenDate").val(new Date().toISOString().slice(0,10));
	}
	else
	{
		$("#irTable").hide();
		$("#investigationOpenDate").val("");
	}
		
	
	$("#decisionDate").val(new Date().toISOString().slice(0,10));
	

}

function setFirstStage()
{
	if(document.getElementById('cvcJuri1').checked)
		$("#divFirstStage").show();
	else
		$("#divFirstStage").hide();
	
	}
	
function checkValidation()
{		
	if(document.getElementById('cvcJuri1').checked && ($("#referFirstStageDate").val()=='' || $("#referFirstStage").val().trim().length < 1))
	{
		alert("Please fill the 'Reference to CVC for 1st stage advice'");
	}
	else
		$('#myform').submit();
	
}
</script>

<!--==============================content================================-->

<section id="content">
  <div class="main">
    <div class="wrapper">
     <article class="col-1">
         <div class="inner-text" style="width:300%; background-color: white; color: #0E0D01;"> Login : ${loginId} ${Role} <br/>
            <small> </small> </div>
      </article>
      <center>
       <div style="align:center; width: 1100px; height: 600px;">
			<form role="form">
			
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A5CAF4" class="tab-txt" style="border-collapse:collapse;">




<td bgcolor="#FFFFFF">
<c:forEach items="${complainDetails}" var="complain">
<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">	
	<tr>
	<div  align="center" style="width:100%; background-color: #0C495A; color: white" >
						  Complaint details</div>
	</tr>
	</table>
			<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">
				<tr bgcolor="#417FB2">
					<td colspan="3"></td>		
				</tr> 
				
	
<!-- here -->	
<tr>
	    <td  width="35%" align="r" valign="middle" bgcolor="#E8F6F9" class="headngblue">&nbsp;&nbsp;Complaint Number :</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt"></span>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style="color:red; " >${complain.complaint}</label><input size="25" style="color:red; font-size: 110%;" type="hidden" value="${complain.complaint}" name="complaintnumber" readonly>
	   </td>
	</tr>
	
	<!-- <tr>
	    <td  width="35%" align="r" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;CVC File Number :</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    &nbsp;&nbsp;<input size="25" type="text" name="">
	   </td>
	</tr> -->
	</table>
		
	<table style="background-color:#E8F6F9;  border:thick; " width="100%"  border="1" align="center" cellpadding="5" cellspacing="1"  >	
	<tr bgcolor="#E8F6F9" >
	<!-- <td>Sr.No.<input size="10" type="text" name="" value="1" ></td> -->
	<td>&nbsp;&nbsp;Complainants Name: <label style="color:blue; ">${complain.senderName}</label> <%-- <input size="20" type="text" name="" value="${complain.senderName}" readonly="readonly"> --%></td>
	<td>
	
	<c:choose>
         <c:when test="${complain.pinno != 0}">
    &nbsp;&nbsp;Address: <label style="color:blue; ">${complain.address},${complain.address2},${complain.city},${complain.state},${complain.pinno}</label><%-- <input size="20" type="text" name="" value="${complain.address},${complain.address2}" readonly="readonly"> --%></td>       
         </c:when>
         
         <c:otherwise>
    &nbsp;&nbsp;Address: <label style="color:blue; ">${complain.address},${complain.address2},${complain.city},${complain.state}</label><%-- <input size="20" type="text" name="" value="${complain.address},${complain.address2}" readonly="readonly"> --%></td>   
         </c:otherwise>
      </c:choose>
	
	
	
	
	
	</tr>
	<tr>
	<td>&nbsp;&nbsp;Mobile No: <label style="color:blue; ">${complain.mobileNo}</label><%-- <input size="20" type="text" name="" value="${complain.mobileNo}" readonly="readonly"> --%></td>
	<td>&nbsp;&nbsp;Email Id:<label style="color:blue; ">${complain.email}</label> <%-- <input size="20" type="text" name="" value="${complain.email}" readonly="readonly"> --%></td>
	</tr>
	<tr>
	<!-- <td>Sr.No<input size="10" type="text" name=""  value="1"></td> -->
	<td>&nbsp;&nbsp;Suspected Official's Name: <label style="color:blue; ">${complain.complaintAgainstName}</label><%-- <input size="25" type="text" name="" value="${complain.complaintAgainstName}" readonly="readonly"> --%></td>
	<td>&nbsp;&nbsp;Allegation Details: <label style="color:blue; ">${complain.gistOfAllegation}</label><%-- <input size="20" type="text" name="" value="${complain.gistOfAllegation}" readonly="readonly"> --%></td>
	</tr>
	<tr>
	<td colspan="2" >&nbsp;&nbsp;Organization: <label style="color:blue; ">${complain.organization}</label><%-- <input size="20" type="text" name="" value="${complain.organization}" readonly="readonly"> --%></td>
	</tr>
	</table>
	
	<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">	
	<tr>
	<div  align="center" style="width:100%; background-color: #0C495A; color: white" >
						  &nbsp;</div>
	</tr>
	</table> 
	<!-- <table width="60%"  border="0" align="center" cellpadding="5" cellspacing="1" class="tblbdr">	
	<tr>
	<td>Sr.No.<input size="10" type="text" ></td>
	<td>Reason For Action<input size="20" type="text" name="" ></td>
	<td>Attachments(If any)<input size="20" type="text" name="" ></td>
	
	</tr>
	</table> -->
	


<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Download All Attachments:</td>
	     <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     &nbsp;&nbsp;
	      <%-- <c:if test="${complain.fileId == null}">
  	 <p>No Document Found</p>
  	 </c:if>
  	  <c:if test="${complain.fileId != ''}">
  	 <a style="color:blue;"  onclick="window.open('<c:url value='/uploadDoc/${complain.fileId}'/>','nyWindow','width=600,Height=400,top=100,left=400');">
             Click Here  </a>
  	 </c:if> --%>
	    
	    
	    <c:choose>
         <c:when test="${complain.fileId == null}">
           <p>No Document Uploaded</p>
         </c:when>
         
         <c:otherwise>
       <a style="color:blue;"  onclick="window.open('<c:url value='/uploadDoc/${complain.fileId}'/>','nyWindow','width=600,Height=400,top=100,left=400');">
             Click Here  </a>
         </c:otherwise>
      </c:choose>
	    
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Download Office Memorandum:</td>
	     <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     &nbsp;&nbsp;
	     <a style="color:blue;"  onclick="window.open('<c:url value='/user/cvoOm'/>','nyWindow','width=600,Height=400,top=100,left=400');">
             Click Here  </a>
	   </td>
	</tr>
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Download Details of Allegations:</td>
	     <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     &nbsp;&nbsp;
	     
	         <c:choose>
         <c:when test="${complain.detailsAlligations == null}">
           <p>No Allegation Provided.</p>
         </c:when>
         
         <c:otherwise>
      <a style="color:blue;"  onclick="window.open('<c:url value='/user/AllegationDetail'/>','nyWindow','width=600,Height=400,top=100,left=400');">
             Click Here  </a>
         </c:otherwise>
      </c:choose>
	     
	     
	     
	   </td>
	</tr>
	</table>
	
	
	</c:forEach>
	
<!-- 	<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">	
	<tr>
	<div  align="center" style="width:100%; background-color: #0C495A; color: white" >
						  &nbsp;</div>
	</tr>
	</table> -->
	

<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">	
	<tr>
	<div  align="center" style="width:100%; background-color: #0C495A; color: white" >Complaint Decision</div>
	</tr>
	</table>
	<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">
		<tr bgcolor="#417FB2">
				<td colspan="3"></td>		
		</tr> 
		<tr>
	    <td  width="35%" align="r" valign="middle" bgcolor="#E8F6F9" class="headngblue">Decision Taken:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt"></span>
	    
	    <c:choose>
	    <c:when test="${cvocomplainDetails.decision =='Filed'}">
	    <form:radiobutton path="decision" checked="checked" value="Filed" onclick="setDecision('decision1');" />Filed<br>
	    <form:radiobutton path="decision" value="NA" onclick="setDecision('decision2');"/>Sent for Necessary Action<br>
	    <form:radiobutton path="decision" value="IR" onclick="setDecision('decision3');"/>Taken up for Investigation
	    </c:when>
	     <c:when test="${cvocomplainDetails.decision =='NA'}">
	     <form:radiobutton path="decision" value="Filed" onclick="setDecision('decision1');" />Filed<br>
	     <form:radiobutton path="decision" checked="checked" value="NA" onclick="setDecision('decision2');"/>Sent for Necessary Action<br>
	     <form:radiobutton path="decision" value="IR" onclick="setDecision('decision3');"/>Taken up for Investigation
	    </c:when>
	     <c:when test="${cvocomplainDetails.decision =='IR'}">
	     <form:radiobutton path="decision" value="Filed" onclick="setDecision('decision1');" />Filed<br>
	    <form:radiobutton path="decision" value="NA" onclick="setDecision('decision2');"/>Sent for Necessary Action<br>
	    <form:radiobutton path="decision" checked="checked" value="IR" onclick="setDecision('decision3');"/>Taken up for Investigation
	    </c:when>
	    <c:otherwise>
	    <form:radiobutton path="decision" value="Filed" onclick="setDecision('decision1');" />Filed<br>
	    <form:radiobutton path="decision" value="NA" onclick="setDecision('decision2');"/>Sent for Necessary Action<br>
	    <form:radiobutton path="decision" value="IR" onclick="setDecision('decision3');"/>Taken up for Investigation
	    </c:otherwise>
	    
	    </c:choose>
	    	
			<form:hidden path="decisionDate" value="${cvocomplainDetails.decisionDate }"/>
	   </td>
	   <td width="35%" align="r" valign="middle" bgcolor="#E8F6F9" class="headngblue">
	   <form:textarea path="remark" />
	   <input type="hidden" id="txtremark" value="${cvocomplainDetails.remark }">
	   </td>
	</tr>
	</table>
	
	<table id="irTable" width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">
	<tr>
	<div  align="center" style="width:100%; background-color: #0C495A; color: white" >&nbsp;</div>
	</tr>	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Source Of Complaint :</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br> &nbsp;&nbsp;<form:textarea name="sourceOfComplaint" path="sourceOfComplaint" rows="6px" cols="80"></form:textarea>
	     <form:errors path="sourceOfComplaint" cssClass="error"/>
	     <input type="hidden" id="txtSourceOfComplaint" value='<c:out value="${cvocomplainDetails.sourceOfComplaint }" />'/>
	   </td>
	</tr>
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Gist Of Allegations:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br> &nbsp;&nbsp;<form:textarea name="gistOfAllegations" path="gistOfAllegations" rows="6px" cols="80"></form:textarea>
	     <form:errors path="gistOfAllegations" cssClass="error"/>
	     <input type="hidden" id="txtGistOfAllegations" value="${cvocomplainDetails.gistOfAllegations}"/>
	   </td>
	</tr>
	
	<%-- <tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Gist Of Allegations:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     &nbsp;&nbsp;
	    <c:forEach var="allegation" items="${gistOfAllegation}">
	     <form:textarea name="gistOfAllegations" path="gistOfAllegations" rows="4px" cols="50" ></form:textarea>
	     <form:errors path="gistOfAllegations" cssClass="error"/>
	     
	     	</c:forEach>
	   					
		<input type="hidden" id="txtGistOfAllegations" value="${cvocomplainDetails.gistOfAllegations}"/>											
	   </td>
	</tr> --%>
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Taken up for investigation:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br> &nbsp;&nbsp;<form:input  size="35" cssStyle="height:30px;" id="investigationOpenDate" name="investigationOpenDate" path="investigationOpenDate" rows="6px" cols="80" value="${cvocomplainDetails.investigationOpenDate}"></form:input><br><br>
	     <form:errors path="investigationOpenDate" cssClass="error"/>
	   </td>
	</tr>
	
		<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Investigating Officer Name & Designation:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br> &nbsp;&nbsp;<form:input  size="35" cssStyle="height:30px;" name="officerName" path="officerName" rows="6px" cols="80" value="${cvocomplainDetails.officerName}"></form:input><br><br>
	     <form:errors path="officerName" cssClass="error"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="r" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Date Of Report:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br>&nbsp;&nbsp;<form:input size="35" cssStyle="height:30px;" type="text" id="dueDateReport" path="dueDateReport" name="dueDateReport" value="${cvocomplainDetails.dueDateReport}"/>
	    <form:errors path="dueDateReport" cssClass="error"/>
	   </td>
	</tr>
	
	<!-- <tr>
	    <td  width="35%" align="r" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Facts/Annexures/Reports/Evidences :</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    &nbsp;&nbsp;<input size="25" type="file" name="file">
	   </td>
	</tr> -->
	
	<tr>
	    <td  width="35%" align="r" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;CVO File Number::</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br>&nbsp;&nbsp;<form:input  size="35" cssStyle="height:30px;" type="text" path="cvoFileNumber" name="cvoFileNumber" value="${cvocomplainDetails.cvoFileNumber}"/>
	    <form:errors path="cvoFileNumber" cssClass="error"/>
	   </td>
	</tr>
	
	
	
	
	
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Observation:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     <br>&nbsp;&nbsp;<form:textarea name="observation" path="observation" rows="6px" cols="80"></form:textarea>
	     <form:errors path="observation" cssClass="error"/>
	     <input type="hidden" id="txtObservation" value="${cvocomplainDetails.observation}"/>	
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Response Of the Official Concerned:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     <br>&nbsp;&nbsp;<form:textarea name="responseOfficialConcerned" path="responseOfficialConcerned" rows="6px" cols="80"></form:textarea>
	     <form:errors path="responseOfficialConcerned" cssClass="error"/>
	     <input type="hidden" id="txtResponseOfficialConcerned" value="${cvocomplainDetails.responseOfficialConcerned}"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Counter to the Response:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br> &nbsp;&nbsp;<form:textarea name="counterResponse" path="counterResponse" rows="6px" cols="80"></form:textarea>
	     <form:errors path="counterResponse" cssClass="error"/>
	       <input type="hidden" id="txtCounterResponse" value="${cvocomplainDetails.counterResponse}"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Conclusion:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     <br>&nbsp;&nbsp;<form:textarea name="conclusion" path="conclusion" rows="6px" cols="80"></form:textarea>
	     <form:errors path="conclusion" cssClass="error"/>
	     <input type="hidden" id="txtConclusion" value="${cvocomplainDetails.conclusion}"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Responsibility of the Officials::</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     <br>&nbsp;&nbsp;<form:textarea name="responsibilityOfficials" path="responsibilityOfficials" rows="6px" cols="80"></form:textarea>
	     <form:errors path="responsibilityOfficials" cssClass="error"/>
	     <input type="hidden" id="txtResponsibilityOfficials" value="${cvocomplainDetails.responsibilityOfficials}"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Recommendation For Action by CVO:<br>&nbsp;&nbsp;(with name & designation of officials)</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     <br>&nbsp;&nbsp;<form:input size="35" cssStyle="height:30px;" type="text" id="recommendationActionDate" path="recommendationActionDate" name="recommendationActionDate" value="${cvocomplainDetails.recommendationActionDate}"/><br>
	     &nbsp;&nbsp;<form:textarea name="recommendationAction" path="recommendationAction" rows="6px" cols="80"></form:textarea>
	     <form:errors path="recommendationAction" cssClass="error"/>
	     <input type="hidden" id="txtRecommendationAction" value="${cvocomplainDetails.recommendationAction}"/>
	   </td>
	</tr>
	
	
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Any officer under CVC Jurisdiction:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	<c:choose>
	    <c:when test="${cvocomplainDetails.cvcJuri =='yes'}">
	     <br>&nbsp;&nbsp;<form:radiobutton checked="checked" path="cvcJuri" value="yes" onclick="setFirstStage();"/>Yes
	     &nbsp;&nbsp;<form:radiobutton path="cvcJuri" value="no" onclick="setFirstStage();"/>No
	    </c:when>
	     <c:when test="${cvocomplainDetails.cvcJuri =='no'}">
	     <br>&nbsp;&nbsp;<form:radiobutton path="cvcJuri" value="yes" onclick="setFirstStage();"/>Yes
	     &nbsp;&nbsp;<form:radiobutton checked="checked" path="cvcJuri" value="no" onclick="setFirstStage();"/>No
	    </c:when>
	    <c:otherwise>
	     <br>&nbsp;&nbsp;<form:radiobutton path="cvcJuri" value="yes" onclick="setFirstStage();"/>Yes
	     &nbsp;&nbsp;<form:radiobutton path="cvcJuri" value="no" onclick="setFirstStage();"/>No
	    </c:otherwise>
	 </c:choose>
	     <input type="hidden" id="txtCvcJuri" value="${cvocomplainDetails.cvcJuri}"/>
	   </td>
	
	</tr>
		<tr id="divFirstStage">
	    <td  width="35%" align="left" valign="middle" bgcolor="#94c5e3" class="headngblue"><br>&nbsp;&nbsp;Reference to CVC for 1st stage advice:</td>
	    <td  align="left" bgcolor="#cae4e8"  class="headngblue"><span class="txt">
	     <br>&nbsp;&nbsp;<form:input size="35" cssStyle="height:30px;" type="text" id="referFirstStageDate" path="referFirstStageDate" name="referFirstStageDate" value="${cvocomplainDetails.referFirstStageDate}"/><br>
	     &nbsp;&nbsp;<form:textarea name="referFirstStage" path="referFirstStage" rows="6px" cols="80" ></form:textarea>
	     <form:errors path="referFirstStage" cssClass="error"/>
	     <input type="hidden" id="txtReferFirstStage" value="${cvocomplainDetails.referFirstStage}"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Systematic Improvement,if any:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     <br>&nbsp;&nbsp;<form:textarea name="systematicImprovement" path="systematicImprovement" rows="6px" cols="80"></form:textarea>
	     <form:errors path="systematicImprovement" cssClass="error"/>
	     <input type="hidden" id="txtSystematicImprovement" value="${cvocomplainDetails.systematicImprovement}"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Action Taken by DA:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br> &nbsp;&nbsp;<form:input size="35" cssStyle="height:30px;" type="text" id="assuranceMemoDate" path="assuranceMemoDate" name="assuranceMemoDate" value="${cvocomplainDetails.assuranceMemoDate}"/><br>
	    &nbsp;&nbsp;<form:textarea name="assuranceMemo"  path="assuranceMemo" rows="6px" cols="80"></form:textarea>
	     <form:errors path="assuranceMemo" cssClass="error"/>
	     <input type="hidden" id="txtAssuranceMemo" value="${cvocomplainDetails.assuranceMemo}"/>
	   </td>
	</tr>
	
	<%-- <tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Biodata Of Officials:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br> &nbsp;&nbsp;<form:textarea name="biodataOfOfficials" path="biodataOfOfficials" rows="6px" cols="80"></form:textarea><br><br>
	     <form:errors path="biodataOfOfficials" cssClass="error"/>
	     <input type="hidden" id="txtBiodataOfOfficials" value="${cvocomplainDetails.biodataOfOfficials}"/>
	   </td>
	</tr>


	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Investigating Officer Designation:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br> &nbsp;&nbsp;<form:input  size="35" cssStyle="height:30px;" name="officerDesignation" path="officerDesignation" rows="6px" cols="80" value="${cvocomplainDetails.officerDesignation}"></form:input><br><br>
	     <form:errors path="officerDesignation" cssClass="error"/>
	   </td>
	</tr>
	
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue"><br>&nbsp;&nbsp;Investigation Close Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	    <br> &nbsp;&nbsp;<form:input  size="35" cssStyle="height:30px;" id="investigationCloseDate" name="investigationCloseDate" path="investigationCloseDate" rows="6px" cols="80" value="${cvocomplainDetails.investigationCloseDate}"></form:input><br><br>
	     <form:errors path="investigationCloseDate" cssClass="error"/>
	   </td>
	</tr> --%>
	
 	<c:choose>
         <c:when test="${Role == 'Cordn-1'}">
													
		</c:when>
         
         <c:otherwise>
      <table width="100%" border="0" align="center"
														cellpadding="10" cellspacing="1" class="tblbdr">
														<tr>
															<td colspan="2" align="center"><br>
															<button
																	style="width: 18%; height: 50px; font-size: 18px;"
																	type="button" class="button-2" name="submitButton"
																	value="save" onclick="checkValidation();">Save</button></td>
															<div align="center"
																style="width: 100%; background-color: #0C495A; color: white">
																&nbsp;</div>
														</tr>
													</table>
         </c:otherwise>
      </c:choose>
	
	
	</table>
	
	</td>
	
		
</table>
  <br>   
			
 <div class="form-group" align="right">
              
			  <div class="form-list" align="left">
               
	   		<%-- <a href="<c:url value="/user/goBack"/>">Close </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --%>
	   	</div>
 </div>
  
  
  
  
	</article>
    </div>
  </div>
</section>
<!--==============================footer=================================-->

</form:form>

</body>

