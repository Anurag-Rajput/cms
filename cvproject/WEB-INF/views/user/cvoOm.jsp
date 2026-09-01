<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
Date: <b>&nbsp;${getAck.boirfinaldecdate.split("-")[2]}-${getAck.boirfinaldecdate.split("-")[1]}-${getAck.boirfinaldecdate.split("-")[0]} </b>

</div>
<br><br><br><br>
<strong><center>OFFICE MEMORANDUM </center></strong>

<br><br><br>


<br>


<div align="left">
   <strong>Sub:</strong> Complaint received in the Commission from  Mr./Mrs&nbsp;${getAck.senderName}

</div>
<strong><center>*********** </center></strong>
<br><br>
<div align="left">
  A copy of the complaint dated: <b>${getAck.complainDate.split("-")[2]}-${getAck.complainDate.split("-")[1]}-${getAck.complainDate.split("-")[0]}</b>,as received in the Commission, is sent herewith for necessary action. 
</div>

<div align="right">
  ${officerName} <br/> 
  ${desiganation}
</div>
<br/></br/>

<div align="left">
   <b> ${getAck.organization} </b><br/></br/> Encl: As above.  
</div>
<br/></br/>
<strong><center>**Computer generated correspondence, No signature required** </center></strong>

</c:forEach>
</html>