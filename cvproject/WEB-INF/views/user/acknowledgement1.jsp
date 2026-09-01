<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
<center><img src="<c:url value="/resources/user/images/imagesCAWLRE1P.jpg"/>"/></center> 

<!-- For Calender-->
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/admin/css/calendar.css"/>"  />
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/admin/js/select/select2.css"/>"  />
<script language="javascript" src="<c:url value="/resources/admin/js/calendar.js"/>"  type="text/javascript"></script>
<script language="javascript" src="<c:url value="/resources/admin/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script language="javascript" src="<c:url value="/resources/admin/js/select/select2.js"/>"  type="text/javascript"></script>

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
    
</style>

<script>
$(document).ready(function() {
	$("#s_org").select2({
		placeholder : "Select organization",
		allowClear : true,
	});
});
</script>	

<!-- For Validation-->
<script type="text/javascript"	src="<c:url value="/resources/admin/js/gen_validatorv31.js"/>" ></script>


<%@page import="java.sql.*"%>
<title>acknowledgement</title>
<style type="text/css">
h3{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; color:SlateBlue;
text-align: center; text-decoration: underline }
table{font-family: Calibri; color:white; font-size: 11pt; font-style: normal;width: 50%;
text-align:; background-color: SlateBlue; border-collapse: collapse; border: 2px solid navy}
table.inner{border: 0px}
</style>
</head>
 
<body>
<h3>Central Vigilance Commission</h3>
 <form action="<c:url value="/addAcknowledgement"/>" method="post" name="myform">

<div align="left">
Telegraphic Address:<br>
SATARKTA:New Delhi,<br>
E-mail :</b>cenvigil@nic.in,<br />
Website :</b>www.cvc.nic.in ,<br />
EPABX :</b>24651001-07,<br />
FAX :</b>24646286
</div>

<div align="right">
SATARKTA Bhavan, GPO</br>
Complex, Block A, INA,<br>
New Delhi-110023
</div>
<br><br>
<div align="right">
comNum<input type="text" name="comNum" maxlength="100"/><br>
Date :11/02/2016
</div>


<strong> To, </strong><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;Mr./Ms.&nbsp;Name<strong><input type="text" name="comName" maxlength="100"/></strong><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address1<strong><input type="text" name="addRess1" maxlength="100"/> </strong></br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address2<strong><input type="text" name="addRess2" maxlength="100"/><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address3<input type="text" name="addRess3" maxlength="100"/></strong><br><br>
	           <strong>   <p>Subject: Complaint</strong><input type="text" name="subJect" maxlength="100"/><br><br>
		    <strong>Dear Sir/Madam,</strong><br>


<p>Please refer to your letter dated <input type="text" name="letterDate" maxlength="100"/> on the aforementioned subject. Your Complaint has been duly examined by the Commission and having regards to the nature of the issues raised there in the same has been forwarded to CVO,<input type="text" name="depArtment" maxlength="100"/> for necessary action.As such while no further report is required to be sent to the Commission.The authorities concerned are required to look into the matter and 
take action as deemed fit. </p>
<br>


<div align="right">
   <strong>Your Faithfully</strong></br> 
SO<input type="text" name="offName" maxlength="100"/><br />
Section Officer
</div>
<br><br>
<div align="left">
*This is system generated, no signature required.<input type="submit" value="Submit">
</div>
 
 
<script language="JavaScript" type="text/javascript">
	var frmvalidator  = new Validator("myform");
    	frmvalidator.EnableFocusOnError(false); 
 	   frmvalidator.EnableMsgsTogether(); 


   frmvalidator.addValidation("userId","req","Please enter User Id");
   
   frmvalidator.addValidation("password","req","Please enter Password");
   
   frmvalidator.addValidation("email","req","Please enter  Email address");
   frmvalidator.addValidation("email","email","Enter a valid Email address");
   
   frmvalidator.addValidation("mobNo","req","Please enter Mobile No.");
   frmvalidator.addValidation("mobNo","num","Mobile No. must be digit");
   frmvalidator.addValidation("mobNo","maxlen","Mobile No. must be 10 digit");
   frmvalidator.addValidation("mobNo","minlen","Mobile No. must be 10 digit");
</script>

 
 
 
 
 
</form>
 
</body>
</html>