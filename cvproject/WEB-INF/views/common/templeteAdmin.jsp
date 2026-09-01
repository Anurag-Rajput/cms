<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
<title>Central Vigilance Commission</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title><tiles:insertAttribute name="title" /></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
       <meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="Expires" content="-1"/>
	<meta http-equiv="pragma" content="no-cache" />
	<link rel="shortcut icon" href="<c:url value="/resources/user/images/indeximage/vigilance-icon.png"/>" type="image/vnd.microsoft.icon" />
	<meta name="Generator" content="Drupal 7 (http://drupal.org)" />
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<meta name="MobileOptimized" content="width"/>
	<meta name="HandheldFriendly" content="true"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<!--[if IEMobile]>  <meta http-equiv="cleartype" content="on"/>  
	<![endif]-->
	
	<link rel="stylesheet" href="<c:url value="/resources/user/css/reset.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/style.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/layout.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/prettyPhoto.css"/>" type="text/css" media="screen"></link>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.min.css"/>"  ></link>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  ></link>
<%-- <link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  ></link> --%>
<%-- <link rel="stylesheet" href="<c:url value="/resources/user/js/calendar-win2k-cold-1.css"/>" type="text/css" media="screen"></link> --%>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>

<script src="<c:url value="/resources/user/js/jQuery.print.js"/>"  type="text/javascript"></script>
<%-- 
<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-yui.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-replace.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/Dynalight_400.font.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/FF-cash.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.prettyPhoto.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/hover-image.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.easing.1.3.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.bxSlider.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/select/select2.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar-en.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jQuery.print.js"/>"  type="text/javascript"></script> --%>



<script src="<c:url value="/resources/user/js/select/select2.full.min.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.bootstrap.min.js"/>"  type="text/javascript"></script>

<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: rgb(207,81,64);
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: rgb(207,81,64);
    color: white;
}

span.tab{
    padding: 0 80px; /* Or desired space*/
}
</style>


  

</head>
<tiles:insertAttribute name="headerCoordination" />
<body>
<tiles:insertAttribute name="body" />


</body>
<tiles:insertAttribute name="footer" />
</html>