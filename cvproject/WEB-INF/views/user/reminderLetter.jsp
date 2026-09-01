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
 	<img src="../resources/user/images/titlecvc.png"/>
 	</div>  
<div align="left">
<center><h2>CENTRAL VIGILANCE COMMISSION</h2></center>
<button id="print" onclick="myFunction()">Print</button>
</div>

<div style="text-align:center">

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

</br></head>
<body>
<c:forEach items="${getReminderComplain}" var="getAck">

<div align="right">
<b>${getAck.complaint}</b><br/>
<c:set var="now" value="<%=new java.util.Date()%>" />
Date: <b> &nbsp;${getAck.boDecisionDate.split("-")[2]}-${getAck.boDecisionDate.split("-")[1]}-${getAck.boDecisionDate.split("-")[0]}</b>  
            
</div>
<!-- <div align="center" style="font-size:40;"><b>By Registered Post/By Speed Post </b></div> -->

<strong> To, </strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Mr./Ms. ${getAck.senderName}</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${getAck.address},</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${getAck.address2},<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.city}-${getAck.pinno}.</strong><br></br>
	           <strong>   <p>Subject: Complaint on your complaint dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b>  </p></strong><br></br>
		    <strong>Dear Sir/Madam,</strong><br/>


<p>Kindly refer to Commission's letter dated <b>${getAck.boircondate.split("-")[2]}-${getAck.boircondate.split("-")[1]}-${getAck.boircondate.split("-")[0]}</b> wherein you were requested to kindly confirm through the enclosed letter whether the said complaint has been made by you or not within 15 days positively, by return post to the undersigned. However, no
reply has been received from you till date.
<br></br>
2.It is,therefore, again requested that you may kindly confirm whether the said complaint has been by you or not within 15 days of receipt of the letter positively failing which no cognizance/action on the said complaint would be taken by the  Commission, treating it as a pseudonymous complaint.

</p>
<br>
<div align="left">
Enclosure:Confirmation Letter dated with enclosure.
</div>
<div align="right">
<strong>Yours faithfully,</strong></br> 
${desiganation}<br />
Vigilance-${getAck.section}
</div>

</c:forEach>


<br></br><br></br>

<br></br><br>
</br>

<div align="center" style="font-size:40;"><b>By Registered Post/By Speed Post </b></div>
<c:forEach items="${getReminderComplain}" var="getAck">

<br></br>
<div align="right">
<b>${getAck.complaint}</b><br/>
<c:set var="now" value="<%=new java.util.Date()%>" />
Date: <b> <fmt:formatDate pattern="dd-MM-yyyy" 
            value="${now}" /></b>
     <%--    Date: <b> &nbsp;${getAck.boirfinaldecdate}</b>   --%>  
            
</div>


<strong> To, </strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Mr./Ms. ${getAck.senderName}</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${getAck.address},</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${getAck.address2},<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.city}-${getAck.pinno}.</strong><br></br>
	           <strong>   <p>Subject: Complaint on your complaint dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b>  </p></strong><br></br>
		    <strong>Dear Sir/Madam,</strong><br/>


<p>The Commission is in receipt of a complaint dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b>  made by you containing allegations against <b>${getAck.complaintAgainstName}</b> relating to <b> ${getAck.organization}</b>.<br />
To enable the Commission to proceed further, kindly confirm through the enclosed letter whether the said complaint has been made by you or not within 15 days positively, by return post to the undersigned.</p>
<br>
<div align="left">
Enclosure:Confirmation Letter.
</div>
<div align="right">
<strong>Yours faithfully,</strong></br> 
${desiganation}<br />
Vigilance-${getAck.section}
</div>

</c:forEach>
<br></br><br></br>

<br></br><br></br>
<br></br><br></br>
<br></br><br></br>



<c:forEach items="${getReminderComplain}" var="getAck">

<br></br><br></br><br></br>

<center><h2>CONFIRMATION LETTER</h2></center>
<strong> To, </strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Mr/Ms. </strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>${desiganation},Vigilance-${getAck.section}</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Central Vigilance Commission</strong><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>GPO Complex ,INA New Delhi-110023</strong><br/>
			
			<br></br>									                                   
<div align="centre" >

</div>												                                   
<strong>   <p>Subject: Complaint on your complaint dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b>  </p></strong><br></br>
<strong>Dear Sir/Madam,</strong><br/>

<p>Kindly refer to your letter dated  <b> &nbsp;${getAck.boDecisionDate.split("-")[2]}-${getAck.boDecisionDate.split("-")[1]}-${getAck.boDecisionDate.split("-")[0]}</b> seeking confirmation on the complaint dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b> made by me. I hereby confirm that the said complaint has been made by <b>me/not</b> made by me *. </p>
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

<p>* Strike out, whichever is not applicable.</p>
</c:forEach>
</body>
</html>