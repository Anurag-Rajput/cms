<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title><tiles:insertAttribute name="title" /></title>
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
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.min.css"/>"  ></link>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/js/calendar-win2k-cold-1.css"/>" type="text/css" media="screen"></link>

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
<script src="<c:url value="/resources/user/js/select/select2.full.min.js"/>"  type="text/javascript"></script><%-- 
<script src="<c:url value="/resources/user/js/calendar-en.js"/>"  type="text/javascript"></script> --%>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.bootstrap.min.js"/>"  type="text/javascript"></script>


<script>
$(document).ready(function() {
	$(".select2").select2({
		placeholder : "Select organization",
		allowClear : true
	});
	
	$('#sel_officer').select2({
		placeholder : "Select officer to send",
		allowClear : true
	});
	
});
</script>

<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

</script>	

<script>
		function getClock(){
			var clock = new Date();
			var hours12;
			var ampm = "AM";
			var hours24 = clock.getHours();
			var minutes = clock.getMinutes();
			var seconds = clock.getSeconds();
			if (hours24>=13)
			{
			hours12 = hours24 - 12;
			ampm = "PM";
			}
				else if (hours24==12)
					{
					hours12 = 12;
					ampm = "PM";
					}
				else if (hours24==0)
					{
					hours12 = 12;
					}
				else
					{
					hours12 = hours24;
					}
			if(hours12<10)
				{
				hours12 ="0"+hours12;
				}
		if (minutes<10)
			{
			minutes = "0" + minutes;
			}
				if(seconds<10)
					{
					seconds ="0"+seconds;
						}
		var time = hours12 + " : " + minutes +" : "+ seconds + " " + ampm;
		document.title = time;
		document.getElementById("clock").innerHTML = time;
		timer = setTimeout("getClock()",1000);
			
		}


</script>

<script>
	function getComplain() {
		$('#table-body').empty();
		var complainNo = document.getElementById("c_no").value;
		var complainName = document.getElementById("c_name").value;
		var div = document.getElementById('result');
		
		if(complainNo!="NONE" && complainNo!=""){
			$.ajax({
				url : "<c:url value='/user/getDetailsByCno'/>",
				type : "POST",
				data : {
					"complainNo" : complainNo
				},
				success : function(data) {
					
						$('#table-body').empty();
						if (data.length > 0) {
							$('#result').hide();
							$('#table').show();
					$.each(data, function(key, value) {

						/* $('#table-body').append(
			                    $('<tr>')
			                        .append($('<td>').append(""+value.senderName+""))
			                        .append($('<td>').append(""+value.complaindate+""))
			                        .append($('<td>').append(""+value.organizationName+""))
			                        .append($('<td>').append(""+value.complaint+""))
			                        .append($('<td>').append(""+value.section+""))
			                       .append($('<td>').append(""+check+"")) 
			                ); */
						
						 $('#table-body').append('<tr>'+
								'<td>'+value.senderName+'</td>'+
								'<td>'+value.complaindate+'</td>'+
								'<td>'+value.organizationName+'</td>'+
								'<td>'+value.complaint+'</td>'+
								'<td>'+value.section+'</td>'+
								'<td>'+value.decision+'</td>'+
								'<td>'+value.decisiondate+'</td>'+
								'<td>'+value.dairyStatus+'</td>'+
								//'<td onclick="sessionUpdate(complainNumber_'+value.complaintNumber+',"0");"><a href="#" >click here</a></td>'+
								'</tr>'); 
					});}
						else{
							$('#result').empty();
							$('#table').hide();
							$('#result').show();
							div.innerHTML =  'Record Not Found.';
						}
					
				display(data);
				console.log("SUCCESS: ", data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
		}
		
		if(complainName!="NONE" && complainName!=""){
			$.ajax({
				url : "<c:url value='/user/getDetailsByCname'/>",
				type : "POST",
				data : {
					"complainName" : complainName
				},
				success : function(data) {
					
						$('#table-body').empty();
						if (data.length > 0) {
							$('#result').hide();
							$('#table').show();
					$.each(data, function(key, value) {
						
						 $('#table-body').append('<tr>'+
								'<td>'+value.senderName+'</td>'+
								'<td>'+value.complaindate+'</td>'+
								'<td>'+value.organizationName+'</td>'+
								'<td style="width:20%">'+value.complaint+'</td>'+
								'<td>'+value.section+'</td>'+
								'<td style="width:10%">'+value.decision+'</td>'+
								'<td style="width:10%">'+value.decisiondate+'</td>'+
								'<td>'+value.dairyStatus+'</td>'+
								//'<td onclick="sessionUpdate(complainNumber_'+value.complaintNumber+',"0");"><a href="#" >click here</a></td>'+
								'</tr>'); 
					});}
						else{
							$('#result').empty();
							$('#table').hide();
							$('#result').show();
							div.innerHTML =  'Record Not Found.';
						}
					
				display(data);
				console.log("SUCCESS: ", data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
		}
		document.getElementById("c_no").value = "";
		document.getElementById("c_name").value = "";
	}
</script>


<script type="text/javascript">

function sessionUpdate(sessionObject,value){
	 var session = sessionObject;
	 var accessvalue= value;
	 var flag;
	 var sel_officer = $('#sel_officer :selected').val();
	 if(accessvalue==3 && sel_officer !="None"){
		 var txt;
		    var r = confirm("Please confirm you action.After confirmation you will not able to change the action.");
	 }else{
		flag = true;
	 }
	 
	 
	$.ajax({
		type : "POST" ,
		url  : "<c:url value='/user/updateSession'/>" ,
		data : {
			"session" : session	,
			"accessvalue" : accessvalue	
		},
		success : function(response) {
			if(response.flag==true){
				if(response.accessId==0){
				var url='<c:url value="/user/updateComplainDetails"/>';
				window.location = url
				}
				else if(response.accessId==1){
					var url='<c:url value="/user/viewPendingComplainDetails"/>';
					window.location = url
				}else if(response.accessId==2){
					/* alert(response.accessId==2);
					var url = '<c:url value="/user/compialnFiled/"/>';
					 $('#myform').attr('action', url); */
				}else if(response.accessId==3){
					
				}
				
			}
			
		console.log("SUCCESS: ", response);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			display(e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
	if (r == true) {
	/* 	$('#myform').attr('type', 'submit');
		$('#myform').submit(); 
   	$('#btn-forward').trigger( "click" );*/
    $('#btn_tmpSubmit').trigger( "click" );
   } else {
	   if(flag==true && accessvalue==3){
		   document.getElementById("agree").innerHTML = "Please select officer to forward.";
	   }else if(accessvalue==3){
       txt = "Please verify above details then press forward.";
  		 document.getElementById("agree").innerHTML = txt;
	   }
	   
   }
	
	
}

</script>

<!-- For Calender-->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/user/css/calendar.css"/>" />
<script src="<c:url value="/resources/user/js/calendar.js"/>"
	type="text/javascript"></script>

<!-- For Validation-->
<script type="text/javascript"
	src="<c:url value="/resources/user/js/gen_validatorv31.js"/>"></script>
  

</head>
<tiles:insertAttribute name="headerThree" />
<body>
<tiles:insertAttribute name="body" />
</body>
<tiles:insertAttribute name="footer" />
</html>