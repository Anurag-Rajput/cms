<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<style type="text/css" media="print">
    @page 
    {
        size: auto;   /* auto is the initial value */
        margin: 0mm;  /* this affects the margin in the printer settings */
    }
    body 
    {
    	margin: 1.6cm; 
    }
     @media print {
  		#print {
    display: none;
  }
</style>
<center><img src="<c:url value="/resources/user/images/imagesCAWLRE1P.jpg"/>"/></center> 
<div align="right">
<h3>By Registered Post/By Speed Post</h3>
</div>
<script>
function myFunction() {
    window.print();
}
</script>

<div style="text-align:center">
<div style="text-align:center">
 	<img src="../resources/user/images/titlecvc.png"/>
 	</div>  
<div align="left">
<center><h2>CENTRAL VIGILANCE COMMISSION</h2></center>
<button id="print" onclick="myFunction()">Print</button>
</div>


 	<img  align ="right" src="../resources/user/images/hindi.png"/>
 	<br><br><br>
 	<span style="float: right;">Satarkta Bhavan,G.P.O Complex,</span><br/>
 	  <span style="float:right;">Block A, INA New Delhi 110023</span><br/>
 	
 	
	
    <!-- <span style="float:left">E-mail :&nbsp;cenvigil@nic.in,</span><br/>
    
    <span style="float:left">Website :&nbsp; www.cvc.nic.in</span><br/>
   <span style="float:left"> New Delhi-110023</span><br/>
    
    <span style="float:left"><b>EPABX :</b>24651001-07,</span><br />
	<span style="float:left"><b>FAX :</b>24646286</span>
    --> 
</div>

</head>
<body>
<c:forEach items="${getAckComplain}" var="getAck">

<br></br>
<div align="right">
<b>Complaint Number:${getAck.complaint}</b><br/>
<c:set var="now" value="<%=new java.util.Date()%>" />
Date:<b> &nbsp;${getAck.boDecisionDate.split("-")[2]}-${getAck.boDecisionDate.split("-")[1]}-${getAck.boDecisionDate.split("-")[0]}</b>
            
</div>

<strong> To, </strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Mr./Ms. ${getAck.senderName}</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${getAck.address},</strong><br/>
<c:if test="${getAck.address2.length()!=0}">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${getAck.address2},<br/></c:if>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.city}-${getAck.pinno}-${getAck.state}.</strong><br></br>
	           <strong>   <p>Subject: Confirmation on your complaint dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b>  </p></strong><br></br>
		    <strong>Sir/Madam,</strong><br/>


<p style="text-align: justify;">The Commission is in receipt of a complaint dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b>  made by you containing allegations against S/Shri&nbsp;<b>${getAck.complaintAgainstName}</b> relating to <b> ${getAck.organization}</b>.<br />
To enable the Commission to proceed further, kindly confirm through the enclosed letter whether the said complaint has been made by you or not within 15 days positively.</p>

<p style="text-align: justify;">2.You are also requested to furnish a self-attested copy of your proof of identity which could be any of the following, viz: Voter's ID Card (EPIC)/ Aadhar Card (UID)/Driving License/ Passport /PAN Card / Photo Ration Card or any other proof of ID issued by Government of India or its organizations.</p>

<div align="right">
<strong>Yours faithfully,</strong></br> 
${desiganation}<br />
Vigilance-${getAck.section}
</div>
<div align="left">
Enclosure:Confirmation Letter dated with enclosure.
</div>
</c:forEach>



<br></br><br>
</br>




<c:forEach items="${getAckComplain}" var="getAck">

<br></br>

<div align="centre" >
<center><h2>CONFIRMATION LETTER</h2></center>
</div>	
<strong> To, </strong><br/>
<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Mr/Ms. </strong><br /> -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${desiganation},Vigilance-${getAck.section}</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Central Vigilance Commission</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Satarkata Bhavan</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>GPO Complex ,INA New Delhi-110023</strong><br/>
			
			<br></br>									                                   
											                                   
        
		    <strong>Dear Sir/Madam,</strong><br/>


<p>Kindly refer to your letter NO. ${getAck.complaint} dated  <b> &nbsp;${getAck.boDecisionDate.split("-")[2]}-${getAck.boDecisionDate.split("-")[1]}-${getAck.boDecisionDate.split("-")[0]}</b> seeking confirmation on the complaint dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b>. I hereby confirm that the said complaint has been made by <b>me/not</b> made by me.<em><strong>(strikeout whichever is not applicable)</strong></em></p>

<p style="text-align: justify;">2.I hereby submit a self-attested copy of * Voter's ID Card (EPIC)/ Aadhar Card (UID)/Driving License/ Passport /PAN Card / Photo Ration Card or any other proof of ID issued by Government of India or its organizations as my identity proof.</p>

<br>
<div align="right">
   <strong>Yours faithfully,</strong></br> 

<br></br>
<strong>Signature</strong>
<br></br>
<strong>${getAck.senderName}</strong><br/>
<strong>${getAck.address},</strong><br/>
<strong>${getAck.address2},<br/>
${getAck.city}-${getAck.pinno}.</strong><br></br>


</div>

<p>Enclosure: Proof of Identity(* Tick&#10004; whichever is enclosed)</p>
</c:forEach>
</body>
</html>