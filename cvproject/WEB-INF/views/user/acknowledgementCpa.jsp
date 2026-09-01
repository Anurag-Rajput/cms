<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<center><img src="<c:url value="/resources/user/images/imagesCAWLRE1P.jpg"/>"/></center> 

<title>Acknowledgement</title>
<style type="text/css">
h3{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; color:SlateBlue;
text-align: center; text-decoration: underline }
table{font-family: Calibri; color:white; font-size: 11pt; font-style: normal;width: 50%;
text-align:; background-color: SlateBlue; border-collapse: collapse; border: 2px solid navy}
table.inner{border: 0px}
</style>
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
</head>
 
<body>

<c:forEach items="${getrtiComplain}" var="getAck">
<h3>Central Vigilance Commission</h3>
 <form action="" method="post" name="myform">
<div align="right">
         <input type="button" value="Print" id="print" onclick="window.print()" />
   </div> 
<div style="text-align:center">
 	
 	<span style="float: left;">Telegraphic Address:&nbsp;Satarkta Bhavan,</span><br/>
 	  <span style="float:left;"> GPO Complex, Block A, INA.</span><br/>

	
    <span style="float:left">E-mail :&nbsp;cenvigil@nic.in,</span><br/>
    
    <span style="float:left">Website :&nbsp; www.cvc.nic.in</span><br/>
   <span style="float:left"> New Delhi-110023</span><br/>
    
    <span style="float:left"><b>EPABX :</b>24651001-07,</span><br />
	<span style="float:left"><b>FAX :</b>24646286</span>
    

</div>

<br><br>
<div align="right">
<b>${getAck.complaint}</b><br>
<c:set var="now" value="<%=new java.util.Date()%>" />
Date: <b> &nbsp;${getAck.boirfinaldecdate}</b>
</div>


<strong> To, </strong><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;Mr./Ms.&nbsp;${getAck.senderName}</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.address} </strong></br>





	           <strong>   <p>Subject: Complaint Against&nbsp;${getAck.organization}</strong><br><br>
		    <strong>Dear Sir/Madam,</strong><br>


<p>Please refer to your letter dated <b>${getAck.complainDate}</b> on the subject cited above. Your Complaint has been duly examined in the Commission and having 
regards to the nature of the issues raised therein, the same has been filed. </p>
<br>


<div align="right">
   <strong>Your Faithfully</strong></br> 
<%-- ${officerName}<br />
${desiganation} --%>

</div>
<br>
<div align="left">
*This is system generated, no signature required.
</div>

</form>
</c:forEach> 
</body>
</html>