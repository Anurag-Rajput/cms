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
</style>
<script type="text/javascript">

 var test=new Date();
	
	var dd = test.getDate();
	 var mm = test.getMonth()+1;//January is 0!
	 var yyyy = test.getFullYear();
	 
	 if(dd<10)
		 {
		 dd="0"+dd;
		  }
	
	 var indate=dd+"-"+mm+"-"+yyyy;
	// alert(test);
	/*  
	 document.getElementById('ackdateforfiled').value=indate;
	 
	 var x=document.getElementById('ackdateforfiled').value;
	 /* request.setParameter("myvar", indate); */
	 //alert(x); 
	/* var temp = document.getElementById('dateforfiled').value;
	alert(temp); */
	
	/* 
	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
	Date date = (Date)formatter.parse(temp);
	SimpleDateFormat newFormat = new SimpleDateFormat("dd-MM-yyyy");
	var finalString = newFormat.format(date);
	alert(finalString); */
	
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
         <input type="button" value="Print" id="print" onclick="window.print()" />
   </div> 
	<div style="text-align:center">
 	<img  align ="right" src="../resources/user/images/hindi.png"/>
 	<br><br><br>
 	<span style="float: right;">Satarkta Bhavan,G.P.O Complex,</span><br/>
 	  <span style="float:right;">Block A, INA New Delhi 110023</span><br/>
 	
 	<!-- span style="float: left;">Telegraphic Address:&nbsp;Satarkta Bhavan,</span><br/>
 	  <span style="float:left;"> GPO Complex, Block A, INA.</span><br/>

	
    <span style="float:left">E-mail :&nbsp;cenvigil@nic.in,</span><br/>
    
    <span style="float:left">Website :&nbsp; www.cvc.nic.in</span><br/>
   <span style="float:left"> New Delhi-110023</span><br/>
    
    <span style="float:left"><b>EPABX :</b>24651001-07,</span><br />
	<span style="float:left"><b>FAX :</b>24646286</span>
     -->

</div>

<br><br>
<div align="right">
<b>Complaint Number:${getAck.complaint}</b><br>
<c:set var="now" value="<%=new java.util.Date()%>" />
 <%-- Date: <b> &nbsp;${getAck.boirfinaldecdate}</b>  --%>
 Date: <b> &nbsp;${getAck.boirfinaldecdate.split("-")[2]}-${getAck.boirfinaldecdate.split("-")[1]}-${getAck.boirfinaldecdate.split("-")[0]}</b> 
<%--  <%

 
 DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
 Date date = (Date)formatter.parse( "2018-01-30");
 SimpleDateFormat newFormat = new SimpleDateFormat("dd-MM-yyyy");
 String finalString = newFormat.format(date);

         out.print( finalString);
      %> --%>
<%--  
Date: <b> &nbsp;<%
         Date dNow = new Date( );
         SimpleDateFormat ft = 
         new SimpleDateFormat ("dd-MM-yyyy");
         out.print( ft.format(dNow));
      %></b> --%>
</div>


<strong> To, </strong><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;Mr./Ms.&nbsp;${getAck.senderName}</strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.address} </strong></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.address2}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getAck.city}&nbsp;${getAck.state}&nbsp;-${getAck.pinno} <br></br>




	           <strong>   <p>Subject: Complaint Against&nbsp;${getAck.organization}</strong><br><br>
		    <strong>Dear Sir/Madam,</strong><br>


<p>Please refer to your letter dated <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]} </b> on the subject cited above. Your Complaint <b>${getAck.complaint}</b> has been duly examined in the Commission in terms of its Complaint Handling Policy and having 
regards to the nature of the issues raised therein, the same has been filed. </p>
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