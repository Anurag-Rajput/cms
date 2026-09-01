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
}
</style>
<script type="text/javascript">
function PagePrint()
{
	window.print();
	window.close();
	}

window.print();
window.close();

 var test=new Date();
	
	var dd = test.getDate();
	 var mm = test.getMonth()+1;//January is 0!
	 var yyyy = test.getFullYear();
	 
	 if(dd<10)
		 {
		 dd="0"+dd;
		  }
	
	 var indate=dd+"-"+mm+"-"+yyyy;
 </script>
</head>
 
<body>



<c:forEach items="${getAckComplain}" var="getAck">
<div style="text-align:center">
 	<img src="../resources/user/images/titlecvc.png"/>
</div>
<h3>Central Vigilance Commission</h3>
 <form action="" method="post" name="myform">
<div align="left">
         <input type="button" value="Print" id="print" onclick="PagePrint();" />
   </div> 
	<div style="text-align:center">
 	<img  align ="right" src="../resources/user/images/hindi.png"/>
 	<br><br><br>
 	<span style="float: right;">Satarkta Bhavan,G.P.O Complex,</span><br/>
 	  <span style="float:right;">Block A, INA New Delhi 110023</span><br/>
 	
</div>
<p>Fold Here &#8594; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -</p>
<br>
<div align="right">
<b>Complaint Number:${getAck.complaint}</b><br>
<c:set var="now" value="<%=new java.util.Date()%>" />
 Date:<b> <fmt:formatDate pattern="dd-MM-yyyy" 
            value="${now}" /></b>
 <%-- Date: <b> &nbsp;${getAck.complainDate}</b> --%> 
</div>


<strong> To, </strong><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;Mr./Ms.&nbsp;${getAck.senderName}</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.address} </strong></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.address2}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.city}&nbsp;${getAck.state}&nbsp;-${getAck.pinno} <br></br>




	           <strong>   <p>Subject: Complaint Against&nbsp;${getAck.organization}</strong><br><br>
<p>Fold Here &#8594; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -</p>	           
		    <strong>Dear Sir/Madam,</strong><br>


<p>Your complaint dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]} </b> has been successfully received in CVC. For status/action taken on your complaint no. <b>${getAck.complaint}</b>  visit:http://portal.cvc.gov.in/cvproject/  
 </p>
<br>


<div align="right">
   <strong>Your faithfully,</strong></br> 
   ${desiganation}<br/>
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