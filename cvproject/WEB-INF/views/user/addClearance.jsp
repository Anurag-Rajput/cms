<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="Expires" content="-1"/>
	<meta http-equiv="pragma" content="no-cache" />
	<title>CVC</title>
		<link rel="stylesheet" href="<c:url value="/resources/user/css/reset.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/style.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/layout.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/prettyPhoto.css"/>" type="text/css" media="screen"></link>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  ></link><%-- 
<link rel="stylesheet" href="<c:url value="/resources/user/js/calendar-win2k-cold-1.css"/>" type="text/css" media="screen"></link> --%>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-yui.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-replace.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/Dynalight_400.font.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/FF-cash.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.prettyPhoto.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/hover-image.js"/>"type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.easing.1.3.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.bxSlider.js"/>"type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/select/select2.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar-setup.js"/>"  type="text/javascript"></script><%-- 
<script src="<c:url value="/resources/user/js/calendar-en.js"/>"  type="text/javascript"></script> --%>


<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

</script>	

 <script type="text/javascript">
 
            function PreviewImage() {
                pdffile=document.getElementById("i_docupload").files[0];
                pdffile_url=URL.createObjectURL(pdffile);
                $('#viewer').attr('src',pdffile_url);
            }
        </script> 
<script>
	$(function() {
		$(".fileuploader").change(function() {

			if (typeof (FileReader) != "undefined") {
				var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.PDF|.pdf)$/;
				$($(this)[0].files).each(function() {
					var file = $(this);
					if (regex.test(file[0].name.toLowerCase())) {
						var reader = new FileReader();
						reader.onload = function(e) {
							var img = $("<file />");
							img.attr("style", "height:100px;width: 100px");
							img.attr("file", e.target.result);
							divPreview.append(img);
						}
						reader.readAsDataURL(file[0]);
					} else {
						alert(file[0].name + " is not a valid file.");
						divPreview.html("");
						return false;
					}
				});
			} else {
				alert("This browser does not support HTML5 FileReader.");
			}
			$(".fileuploader").empty();
		});
		
		</script>	
		
		
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<style>
.form-style-2 input.input-field,
input[type=text], select {
	height: 30px;
	width: 200px;
    padding: 6px 10px;
    margin: 8px 0;
    display: inline-block;
    border-radius: 1px;
    box-sizing: border-box;
     width: 140px;
     box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	border: 1px solid #C2C2C2;
	box-shadow: 1px 1px 4px #EBEBEB;
	-moz-box-shadow: 1px 1px 4px #EBEBEB;
	-webkit-box-shadow: 14px 12px 4px #EBEBEB;
	border-radius: 5px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 3px;
	padding: 7px;
	outline: none;
	padding-top: 3px;
	padding-bottom: 3px;
	padding-left: 14px;
	
}
</style>
<!-- For Calender-->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/user/css/calendar.css"/>" />
<script src="<c:url value="/resources/user/js/calendar.js"/>"
	type="text/javascript"></script>
</head>


	
	
	
	<script >
	var count = "1";
	function addRow(in_tbl_name) {

		
		var tbody = document.getElementById(in_tbl_name).getElementsByTagName(
				"TBODY")[0];

		var row = document.createElement("TR");

		var td1 = document.createElement("TD");
		var strHtml1 = "Name Of Officer:<input type='text' name='nameOfOfficer' SIZE='20' MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' onblur='descriptionData(this.value);'> <br/>&nbsp; ";
		td1.innerHTML = strHtml1.replace(/!count!/g, count);

		var td2 = document.createElement("TD");
		var strHtml2 = "Service:<input type='text' name='service' onblur='descriptionData(this.value)' SIZE='20' MAXLENGTH='SIZE='20'' STYLE='height:24;border: 1 solid;margin:0;'>";
		td2.innerHTML = strHtml2.replace(/!count!/g, count);
		
		var td3 = document.createElement("TD");
		var strHtml3 = "Batch:<input type='text' name='batch' onblur='descriptionData(this.value)' SIZE='20' MAXLENGTH='30' STYLE='height:24;border: 1 solid;margin:0;'>";
		td3.innerHTML = strHtml3.replace(/!count!/g, count);
		
		var td4 = document.createElement("TD");
		var strHtml4 = "Cadre:<input type='text' name='cadre' onblur='descriptionData(this.value)' SIZE='20' MAXLENGTH='30' STYLE='height:24;border: 1 solid;margin:0;'>";
		td4.innerHTML = strHtml4.replace(/!count!/g, count);
		
		var td5 = document.createElement("TD");
		var strHtml5 = "Emp Code:<input type='text' name='empCode' onblur='descriptionData(this.value)' SIZE='20' MAXLENGTH='30' STYLE='height:24;border: 1 solid;margin:0;'>";
		td5.innerHTML = strHtml5.replace(/!count!/g, count);
		
		var td6 = document.createElement("TD");
		var strHtml6 = 'Final Decision:<select name="finalDecisionDd"  style="height:24; border: 1 solid; margin:0; size: 20; width:100px;"  ><option value="none">--Select--</option><option value="Commission Decision">Commission Decision</option><option value="Clearance_given">Clearance given</option><option value="Clearance_denied">Clearance denied</option><option value="Logical_Conclusion">Logical Conclusion</option><option value="Competenet_authority">Competenet authority</option><option value="Further Clearification From Ministry">Further Clearification From Ministry</option></select>';
		td6.innerHTML = strHtml6.replace(/!count!/g, count); 
		
		var td7 = document.createElement("TD");
		var strHtml7 = "Final Decision Date:<input type='text' name='finalDecisionDate' onblur='descriptionData(this.value)' SIZE='18' MAXLENGTH='30' STYLE='height:24;border: 1 solid;margin:0;'>";
		td7.innerHTML = strHtml7.replace(/!count!/g, count);
		
		var td8 = document.createElement("TD");
		var strHtml8 = "Date Of Birth :<input type='text' name='dateOfBirth' onblur='descriptionData(this.value)' SIZE='18' MAXLENGTH='30' STYLE='height:24;border: 1 solid;margin:0;'>";
		td8.innerHTML = strHtml8.replace(/!count!/g, count);
		
		var td9 = document.createElement("TD");
		var strHtml9 = "Date Of Ret:<input type='text' name='dateOfRetirement' onblur='descriptionData(this.value)' SIZE='15' MAXLENGTH='30' STYLE='height:24;border: 1 solid;margin:0;'>";
		td9.innerHTML = strHtml9.replace(/!count!/g, count);

		row.appendChild(td1);
		row.appendChild(td2);
		row.appendChild(td3);
		row.appendChild(td4);
		row.appendChild(td5);
		row.appendChild(td6);
		row.appendChild(td7);
		row.appendChild(td8);
		
		row.appendChild(td9);
		

		count = parseInt(count) + 1;
		tbody.appendChild(row);
		count++;
	  }

	function delRow() {
		var current = window.event.srcElement;
		//here we will delete the line
		while ((current = current.parentElement) && current.tagName != "TR")
			;
		current.parentElement.removeChild(current);
	}
</script>



	<script>
$(document).ready(function() {
	$(".select2").select2({
		placeholder : "Select organization",
		allowClear : true,
	});
});
</script>
	
	<!-- Drop Down -->
<script >

var countries = [ ];
countries["EMPANELMENT"]   = ["Secretary","AS","JS","CVO"];
countries["APPOINTMENT"] = ["Chairman","MD","Director","Member","CVO", "Other"];
countries["PROMOTION"] = ["AS", "JS", "Director", "JD", "Other"];
countries["CONFIRMATION"]     = ["Chairman","MD","Director","Member", "Other"];
countries["EXTENSION"]   = ["Chairman","MD","Director","Member","CVO", "Other"];
countries["FOREIGN VISIT"]   = ["Chairman","MD","Director","Member", "CVO"];
countries["ADDITIONAL CHARGES"]   = ["Chairman","MD","Director","Member", "CVO"];
countries["OTHER"]   = ["Chairman","MD","Director","Member", "CVO"];

function switchCountry(selCountry) {
var citySel = selCountry.form.City;
for ( var s = citySel.options.length-1; s > 0; --s )  {
citySel.options[s] = null;
}

var chosen = selCountry.options[selCountry.selectedIndex].text;
var cList = countries[chosen];
if ( cList != null )   {
for ( var i = 0; i < cList.length; ++i )   {
citySel.options[i+1] = new Option(cList[i],cList[i]);
}
}

}

function showSelection() {
var country = document.forms[0].Country.value;
var city = document.forms[0].City.value;

}
</script>
<script>

function hideShow12(){

for(var i = 0; i<document.myform.completeProfile.length; i++){
 		if(document.myform.completeProfile[i].checked){
		 var radiomenu = document.myform.completeProfile[i]

if(radiomenu.value == "Yes"){

document.getElementById('selectTemp18').style.display = 'none';

			}
else {
document.getElementById('selectTemp18').style.display = 'block';
	}
}}}

function formSubmit() {
	var url = '<c:url value="/user/j_spring_security_logout"/>';
	 $('#myform').attr('action', url); 
	 
}

function getComplain1() {
	$('#table-body').empty();
	var fileNo = document.getElementById("fileNo").value;
	var div = document.getElementById('result');
	
	if(fileNo!="NONE" && fileNo!=""){
		$.ajax({
			url : "<c:url value='/user/getDetailsByFileNo'/>",
			type : "POST",
			data : {
				"fileNo" : fileNo
			},
			success : function(data) {
				
				$('#table-body').empty();
				if (data.length > 0) {
					$('#result').hide();
					$('#table').show();
			$.each(data, function(key, value)
			{
				
				
				alert("This "+value.fileNo+" File Number is  already exist.");
				 document.getElementById("fileNo").value=''; 
			});}
				
				
			}
	    });
   }
}

</script>





<!-- End Deop Down -->
<body id="page2">
<c:url var="myurl" value="/user/clr/insertClerance"/>
<form:form name="myform" id="myform" method="post" commandName="vigform" action="${myurl }" enctype="multipart/form-data">
		
		




<!--==============================header=================================-->
<header>
 <div class="">
    <div class="row-bot-bg">
      <div class="main">
	  <div class="wrapper">
  
		<div align="center" style="margin-top: 2.5cm;">
		<nav>
          <ul class="menu">
            	<li><a href="<c:url value="/user/clr/vigClearance"/>">Home</a></li>
            	<li><a href="<c:url value="/user/clr/pwdChanged"/>">Changed Password</a></li>
              	<li><a href="<c:url value="/user/clr/searchClearance"/>">Search</a></li>
           <!-- <li><a href="#">Vigilance Cases</a></li>
				<li><a href="#">File Tracking</a></li> -->
          </ul>
          <ul class="menu1">
								<li><button type="submit"
									onclick="javascript:formSubmit();"
									 title="Logout"> <img
										src="<c:url value="/resources/user/images/logout-button-png-th.png"/>"
										height="31" width="70" /></button></li>

							</ul>
        </nav>
      </div></div></div>
    </div>
  </div>
  
</header>
<!--==============================content================================-->

<section id="content">
  <div class="main">
    <div class="wrapper">
     <article class="col-1">
         <div class="inner-text" style="width:300%; background-color: white; color: #0E0D01;"> Login : &nbsp;${loginId}<br/>
            <small> </small> </div>
      </article>
      <center>
       <div style="align:center; width: 100%; height: 600px;">
			<form role="form">
			
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#A5CAF4" class="tab-txt" style="border-collapse:collapse;">




<td bgcolor="#FFFFFF">
			<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">
				<tr bgcolor="#417FB2">
					<td colspan="3" ><center>VGC<input type="radio" id="clear" name="clearanceType" value="VGC" />&nbsp;&nbsp;
											AIS<input type="radio"  id="clear" name="clearanceType"  value="AIS" />&nbsp;&nbsp;
											CVO<input type="radio" id="clear" name="clearanceType"  value="CVO" />
					</center></td>		
				</tr> 
		
		
				
	<tr>
	    <td  width="30%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;&nbsp;File Number:  </td>
	    <td  width="70%" align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">&nbsp;&nbsp;<form:input size="25" type="text" path="fileNo" name="fileNo" onblur="getComplain1()"/>
	    <form:errors path="fileNo" cssClass="error"/>
	   </td>
	</tr>

	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Name Of Department:</td>
	    <%-- <td  width="40%" align="left" bgcolor="#E8F6F9"  class="headngblue">
	      &nbsp;&nbsp;<form:input size="25" type="text" path="nameOfDepart" name="nameOfDepart" class="input-field"/>
	      <form:errors path="nameOfDepart" cssClass="error"/>
	   </td> --%>
	   
	   <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp; <select class="form-control select2" id="s_org"  name="nameOfDepart" style="width:300px;">
		<option value="NONE">NONE</option>
								<c:forEach var="organisation" items="${mapOfOrganisation}">
									<option value='${organisation.organisationName}'>${organisation.organisationName}</option>
								</c:forEach>
							</select>
							
	   </td>
	   
	</tr>
	
	<tr>
	    <td  width="35%" align="" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Department Reference NO.:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt"/>
	    &nbsp;&nbsp;<form:input size="25" path="departRefNo" type="text" name="departRefNo"/>
	    <form:errors path="departRefNo" cssClass="error"/>
	   </td>
	</tr>

	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Department Reference Date : </td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt"/>
	  &nbsp;&nbsp;<input name="departRefDate1" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>" border="0" onclick="displayCalendar(document.myform.departRefDate1,'yyyy-mm-dd',this);" />
	  <form:errors path="departRefDate1" cssClass="error"></form:errors>
	   </td>
	</tr>
        
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Department Reference Received Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt"/>
	     &nbsp;&nbsp;<input name="departRefRecvDate" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>" border="0" onclick="displayCalendar(document.myform.departRefRecvDate,'yyyy-mm-dd',this);" />
	  <form:errors path="departRefRecvDate" cssClass=""></form:errors>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Subject:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt"/>
	     &nbsp;&nbsp;<form:textarea name="subject" path="subject" rows="4px" cols="50"></form:textarea>
	     <form:errors path="subject" cssClass="error"/>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Purpose :</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt"/>
	&nbsp;&nbsp;<select name="country" onchange="switchCountry(this);">
				<option value = "">Select</option>
				<option value = "EMPANELMENT">EMPANELMENT</option>
				<option value = "APPOINTMENT">APPOINTMENT</option>
				<option value = "PROMOTION">PROMOTION</option>
				<option value = "CONFIRMATION">CONFIRMATION</option>
				<option value = "EXTENSION">EXTENSION</option>
				<option value = "FOREIGN VISIT">FOREIGN VISIT</option>
				<option value = "ADDITIONAL CHARGES">ADDITIONAL CHARGES</option>
				<option value = "OTHER">OTHER</option>
            </select>
             <form:errors path="country" cssClass="error"></form:errors>
&nbsp;&nbsp;&nbsp;&nbsp;
<!--<select name="city" onchange = "showSelection()">
<option>Select</option>
</select>-->




	   </td>
	</tr>
	
	
	
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Number Of Officer:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     &nbsp;&nbsp;<form:input size="25" type="text" path="numberOfOfficer" name="numberOfOfficer"/>
	     <form:errors path="numberOfOfficer" cssClass="error"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     
	   <button type="button" onclick="addRow('dataTable')" value="Add More" class="button-2">Add more</button> 
													

	<!-- <input type="button" value="Delete Row" onclick="deleteRow('dataTable')" /> -->
	   </td>
	</tr>
	
	
	
	
	
	
	
	
	</table>
	 
	
	
	<table  width="390px" border="1" align="center" cellpadding="10" cellspacing="1" class="tblbdr" id="dataTable">
		<tr >
			<td bgcolor="#E8F6F9"><form:input type="text" MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' size="20" path="nameOfOfficer" name="nameOfOfficer" placeholder="Name Of Officer" onblur="descriptionData(this.value)"/><form:errors path="nameOfOfficer" cssClass="error"/></td>
			<td bgcolor="#E8F6F9"><form:input type="text" MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' path="service" size="20" name="service" placeholder="Service" onblur="descriptionData(this.value)"/><form:errors path="service" cssClass="error"/></td>
			<td bgcolor="#E8F6F9"><form:input type="text" MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' path="batch" size="20" name="batch" placeholder="Batch" onblur="descriptionData(this.value)"/><form:errors path="batch" cssClass="error"/></td>
			<td bgcolor="#E8F6F9"><form:input type="text" MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' path="cadre" size="20" name="cadre" placeholder="Cadre" onblur="descriptionData(this.value)"/><form:errors path="cadre" cssClass="error"/></td>
			<td bgcolor="#E8F6F9"><form:input type="text" MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' size="20" path="empCode" name="empCode" placeholder="Employee Code/Number" onblur="descriptionData(this.value)"/><form:errors path="empCode" cssClass="error"/></td>
			<td  bgcolor="#E8F6F9"> <select name="finalDecisionDd"   style='height:24; border: 1 solid; margin:0; size: 20; width:100px;' path="finalDecisionDd" >
											<option value="none">--Select--</option>
											<option value="Commission Decision">Commission Decision</option>
											<option value="Clearance_given">Clearance given</option>
											<option value="Clearance_denied">Clearance denied</option>
											<option value="Logical_Conclusion">Logical Conclusion</option>
											<option value="Competenet_authority">Competenet authority</option>
											<option value="Further Clearification From Ministry">Further Clearification From Ministry</option>
											
										</select>
										 <form:errors path="finalDecisionDd" cssClass="error"></form:errors>
	       </td> 
	       <td bgcolor="#E8F6F9">
	       <input size="18" type="text" name="finalDecisionDate" MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' placeholder="yyyy-mm-dd" onblur="descriptionData(this.value)"/>
	        <form:errors path="finalDecisionDate" cssClass="error"></form:errors>
		 </td>
		 
		  <td bgcolor="#E8F6F9">
	       <input size="18" type="text" name="dateOfBirth" MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' onblur="descriptionData(this.value)" placeholder="(DOB)yyyy-mm-dd "/>
		 </td>
		 
	    <td bgcolor="#E8F6F9">
	       <input size="18" type="text" name="dateOfRetirement" MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' onblur="descriptionData(this.value)" placeholder="(DOR)yyyy-mm-dd"/>
	        <form:errors path="dateOfRetirement" cssClass="error"></form:errors>
		 </td>
			
		</tr>
	</table>
	
	
	
	<table width="100%"  border="0" align="center" cellpadding="10" cellspacing="1" class="tblbdr">
	
	
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Letter to CBI Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt"/>
		&nbsp;&nbsp;<input name="letterToCBIDate" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>"border="0" onclick="displayCalendar(document.myform.letterToCBIDate,'yyyy-mm-dd',this);" />	
	   <form:errors path="letterToCBIDate" cssClass="error"></form:errors>		
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Letter to Section Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="letterToSectionDate" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>"border="0" onclick="displayCalendar(document.myform.letterToSectionDate,'yyyy-mm-dd',this);" />
	   <form:errors path="letterToSectionDate" cssClass="error"></form:errors>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Letter to Concerned Organization:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp; <select class="form-control select2" id="s_org"  name="letterToConcerned" style="width:300px;">
		<option value="NONE">NONE</option>
								<c:forEach var="organisation" items="${mapOfOrganisation}">
									<option value='${organisation.organisationName}'>${organisation.organisationName}</option>
								</c:forEach>
							</select>
							
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Complete Profile:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;	  <input type="radio" id="completeProfile" name="completeProfile" value="Yes" onclick="hideShow12()"/>yes
		&nbsp;&nbsp;&nbsp;<input type="radio" id="completeProfile" name="completeProfile" value="No" onclick="hideShow12()"/>No&nbsp;&nbsp;&nbsp;<br>
		
<div style="display:none; border:0;" id="selectTemp18" >		
		&nbsp;&nbsp;<input name="returnToDepart" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>"border="0" onclick="displayCalendar(document.myform.returnToDepart,'yyyy-mm-dd',this);" />
	  
</div>		
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Feedback Received From CBI Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="feedbackReceivedFromCBIDate" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>"border="0" onclick="displayCalendar(document.myform.feedbackReceivedFromCBIDate,'yyyy-mm-dd',this);" />
	   <form:errors path="feedbackReceivedFromCBIDate" cssClass="error"></form:errors>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Feedback Received  From Section:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input size="25" type="text" name="feedbackReceivedFromSection"/>
		 
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Feedback Received From Concerned Organization:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="feedbackReceivedFromOrganization" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>"border="0" onclick="displayCalendar(document.myform.feedbackReceivedFromOrganization,'yyyy-mm-dd',this);" />
	   <form:errors path="feedbackReceivedFromOrganization" cssClass="error"></form:errors>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;File Submitted By DH Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="fileSubmittedByDHDate" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>"border="0" onclick="displayCalendar(document.myform.fileSubmittedByDHDate,'yyyy-mm-dd',this);" />
	   <form:errors path="fileSubmittedByDHDate" cssClass="error"></form:errors>
	   </td>
	</tr>
	
	
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Date On File:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="dateOnFile" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>"border="0" onclick="displayCalendar(document.myform.dateOnFile,'yyyy-mm-dd',this);" />
	   <form:errors path="dateOnFile" cssClass="error"></form:errors>
	   </td>
	</tr>
	
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Letter Issue Date:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
		&nbsp;&nbsp;<input name="letterIssueDate" size="20" readonly/>
	  &nbsp;&nbsp;&nbsp;<img src="<c:url value="/resources/user/images/cal/cal.gif"/>"border="0" onclick="displayCalendar(document.myform.letterIssueDate,'yyyy-mm-dd',this);" />
	   <form:errors path="letterIssueDate" cssClass="error"></form:errors>
	   </td>
	</tr>
	
	<tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">&nbsp;&nbsp;Upload Document:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue">
	   		 	&nbsp;&nbsp;&nbsp;<input class="fileuploader" name="uploadScanDocument" type="file" id="i_docupload" />  
				
	   </td>
	</tr>
	
	
	
	

	</table>
	</td>
	
		
</table>
<input type="hidden" name="csrf"  value="${_csrf.token}" />
  <br>   
			
 <div class="form-group" align="right">
              <label><button type="submit" class="button-2"  name="save" >Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			  <div class="form-list" align="left">
               <button type="reset" class="button-2">Reset</button>
               <a href="<c:url value="/user/clr/vigClearance"/>">
	   		<button type="button" class="button-2" data-toggle="modal" data-target="#myModal"  name="submit" value="close">Close </button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   	</div>
 </div>
  
  
  
  
	</article>
    </div>
  </div>
</section>
<!--==============================footer=================================-->

</form:form>
</body>
</html>