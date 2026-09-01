<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<head>
<center><img src="<c:url value="/resources/user/images/imagesCAWLRE1P.jpg"/>"/></center> 
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
<title>Acknowledgement</title>
<style type="text/css">
h3{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; color:SlateBlue;
text-align: center; text-decoration: underline }
table{font-family: Calibri; color:white; font-size: 11pt; font-style: normal;width: 50%;
text-align:; background-color: SlateBlue; border-collapse: collapse; border: 2px solid navy}
table.inner{border: 0px}
</style>



</head>
 
<body>
<c:forEach items="${getAckComplain}" var="getAck">

<div style="text-align:center">
 	<img src="../resources/user/images/titlecvc.png"/>
</div>
<h3>Central Vigilance Commission</h3>
 <form action="" method="post" name="myform">
<div align="left">
         <input type="button" value="Print" id="print" onclick="window.print()" />
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


<div align="right">
<b>Complaint Number:${getAck.complaint}</b><br>
<c:set var="now" value="<%=new java.util.Date()%>" />
<%-- Date: <b> &nbsp;${getAck.boirfinaldecdate}</b> --%>

Date: <b> &nbsp;${getAck.boirfinaldecdate.split("-")[2]}-${getAck.boirfinaldecdate.split("-")[1]}-${getAck.boirfinaldecdate.split("-")[0]}</b>

 <%-- Date: <b> &nbsp;<%

 String temp=${getAck.complainDate};
 DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
 Date date = (Date)formatter.parse( "2011-01-30");
 SimpleDateFormat newFormat = new SimpleDateFormat("dd-MM-yyyy");
 String finalString = newFormat.format(date);

         out.print( finalString);
      %></b>  --%>
</div>
<strong> To, </strong><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;Mr./Ms.&nbsp;${getAck.senderName}</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.address} </strong></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.address2}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.city}&nbsp;${getAck.state}&nbsp;-${getAck.pinno} <br/>

           <strong>   <p>Subject: Complaint Against&nbsp;${getAck.organization}</strong><br>
	    <strong>Dear Sir/Madam,</strong><br>


<p>  Receipt of your letter dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b> is hereby acknowledged. Your Complaint is registered as complaint no. <b>${getAck.complaint}</b> and has been forwarded to <b>${getAck.confirmCVO}</b> for conduct of inquiry and submission of report to the Commission. 
<br><br>

2. For viewing the status of your complaint, you may log on to the Commission's website <a href="https://portal.cvc.gov.in">https://portal.cvc.gov.in</a> by entering the complaint no. given above in the field 'Know your complaint status'
</p>


<div align="right">
   <strong>Your faithfully,</strong></br> 
${desiganation}<br />
Vigilance-${getAck.section}
</div>
<br>
<div align="left">
*This is system generated, no signature required.
</div>

</form>
</c:forEach> 
</body>
</html>