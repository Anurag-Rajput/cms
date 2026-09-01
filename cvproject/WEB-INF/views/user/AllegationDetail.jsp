<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>

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
<c:forEach items="${getAckComplain}" var="getAck">
<center><img src="<c:url value="/resources/user/images/cvc_logo.PNG"/>"></center> 
<center><h2>CENTRAL VIGILANCE COMMISSION</h2></center>
<br>
<br>




<br><br>
<div align="right">
No. <b>${getAck.complaint}</b><br><br><br>
<c:set var="now" value="<%=new java.util.Date()%>" />

</div>

<br><br><br><br>
<h3><strong><center>DETAIL OF ALLEGATION BY ${getAck.senderName.toUpperCase()} ON  ${getAck.confirmCVO.toUpperCase()}</center></strong></h3>

<br><br><br>


<br>


<div align="left">
<h3>${getAck.detailsAlligations}</h3>  

</div>



<br></br><br></br>
<strong><center>  **Computer generated correspondence, No signature required** </center></strong>

</c:forEach>
</html>