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
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  ></link>
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
<script src="<c:url value="/resources/user/js/select/select2.js"/>"  type="text/javascript"></script><%-- 
<script src="<c:url value="/resources/user/js/calendar-en.js"/>"  type="text/javascript"></script> --%>
<script src="<c:url value="/resources/user/js/jQuery.print.js"/>"  type="text/javascript"></script>
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
<!-- <script>

// Get the <span> element that closes the modal

function getModal(complaintNumber) {
	document.getElementById('myModal').style.display = 'block';
}

function closeModal() {
	document.getElementById('myModal').style.display = 'none';
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script> -->

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
		var complainMobileNo = document.getElementById("c_mob").value;
		var complainEmail = document.getElementById("c_email").value;
		var complainPincode = document.getElementById("c_pin").value;
		
		
		var complainAgnname = document.getElementById("c_can").value;
		var complainGistofalligation = document.getElementById("c_goal").value;
		var complainDesiganation = document.getElementById("c_deg").value;
	
		
		
		
		var div = document.getElementById('result');
		
		if(complainNo!="NONE" && complainNo!=""){
			$.ajax({
				url : "<c:url value='/user/getDetailsByCPACno'/>",
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

						var complaint_arr=value.complaint.split("/");
						var newStr = complaint_arr[0]+"_"+complaint_arr[1]+"_"+complaint_arr[2];
						
						 $('#table-body').append('<tr>'+
								'<td>'+value.senderName+'</td>'+
								'<td>'+value.complaindate+'</td>'+
								'<td>'+value.organizationName+'</td>'+
								'<td>'+value.complaint+'</td>'+
								'<td>'+value.section+'</td>'+
								'<td>'+value.filed+'</td>'+
								'<td>'+value.boDecisionDate+'</td>'+
								'<td> <a style="color:red;" href="javascript:updateSessionCPA(\''+newStr+'\',8)">View</a></td>'+
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
		
		if(complainMobileNo!="NONE" && complainMobileNo!=""){
			
			$.ajax({
				
				url : "<c:url value='/user/getDetailsByCPACMno'/>",
				type : "POST",
				data : {
					"complainMobileNo" : complainMobileNo
				},
				success : function(data) {
					
						$('#table-body').empty();
						
						if (data.length > 0) {
							
							$('#result').hide();
							$('#table').show();
					$.each(data, function(key, value) {
						var complaint_arr=value.complaint.split("/");
						var newStr = complaint_arr[0]+"_"+complaint_arr[1]+"_"+complaint_arr[2];
					
						
						 $('#table-body').append('<tr>'+
								'<td>'+value.senderName+'</td>'+
								'<td>'+value.complainDate+'</td>'+
								'<td>'+value.organization+'</td>'+
								'<td>'+value.complaint+'</td>'+
								'<td>'+value.section+'</td>'+
								'<td>'+value.boDecision+'</td>'+
								'<td>'+value.boDecisionDate+'</td>'+
								'<td>'+value.section+'</td>'+
								'<td> <a style="color:red;" href="javascript:updateSessionCPA(\''+newStr+'\',8)">View</a></td>'+
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
				url : "<c:url value='/user/getDetailsByCPACname'/>",
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
					var complaint_arr=value.complaint.split("/");
					var newStr = complaint_arr[0]+"_"+complaint_arr[1]+"_"+complaint_arr[2];
				
					
					 $('#table-body').append('<tr>'+
							'<td>'+value.senderName+'</td>'+
							'<td>'+value.complainDate+'</td>'+
							'<td>'+value.organization+'</td>'+
							'<td>'+value.complaint+'</td>'+
							'<td>'+value.section+'</td>'+
							'<td>'+value.boDecision+'</td>'+
							'<td>'+value.boDecisionDate+'</td>'+
							'<td>'+value.section+'</td>'+
							'<td> <a style="color:red;" href="javascript:updateSessionCPA(\''+newStr+'\',8)">View</a></td>'+
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
		
		if(complainEmail!="NONE" && complainEmail!=""){
			
			$.ajax({
				url : "<c:url value='/user/getDetailsByCPAEmail'/>",
				type : "POST",
				data : {
					"complainEmail" : complainEmail
				},
				success : function(data) {
					
					$('#table-body').empty();
					
					if (data.length > 0) {
						
						$('#result').hide();
						$('#table').show();
				$.each(data, function(key, value) {
					var complaint_arr=value.complaint.split("/");
					var newStr = complaint_arr[0]+"_"+complaint_arr[1]+"_"+complaint_arr[2];
				
					
					 $('#table-body').append('<tr>'+
							'<td>'+value.senderName+'</td>'+
							'<td>'+value.complainDate+'</td>'+
							'<td>'+value.organization+'</td>'+
							'<td>'+value.complaint+'</td>'+
							'<td>'+value.section+'</td>'+
							'<td>'+value.boDecision+'</td>'+
							'<td>'+value.boDecisionDate+'</td>'+
							'<td>'+value.section+'</td>'+
							'<td> <a style="color:red;" href="javascript:updateSessionCPA(\''+newStr+'\',8)">View</a></td>'+
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
		
		if(complainPincode!="NONE" && complainPincode!=""){
		
			$.ajax({
				url : "<c:url value='/user/getDetailsByCPAPincode'/>",
				type : "POST",
				data : {
					"complainPincode" : complainPincode
				},
				success : function(data) {
					
					$('#table-body').empty();
					
					if (data.length > 0) {
						
						$('#result').hide();
						$('#table').show();
				$.each(data, function(key, value) {
					var complaint_arr=value.complaint.split("/");
					var newStr = complaint_arr[0]+"_"+complaint_arr[1]+"_"+complaint_arr[2];
				
					
					 $('#table-body').append('<tr>'+
							'<td>'+value.senderName+'</td>'+
							'<td>'+value.complainDate+'</td>'+
							'<td>'+value.organization+'</td>'+
							'<td>'+value.complaint+'</td>'+
							'<td>'+value.section+'</td>'+
							'<td>'+value.boDecision+'</td>'+
							'<td>'+value.boDecisionDate+'</td>'+
							'<td>'+value.section+'</td>'+
							'<td> <a style="color:red;" href="javascript:updateSessionCPA(\''+newStr+'\',8)">View</a></td>'+
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
		
		
		
		
if(complainAgnname!="NONE" && complainAgnname!=""){
			
			$.ajax({
				url : "<c:url value='/user/getDetailsByCPAagnstname'/>",
				type : "POST",
				data : {
					"complainAgnname" : complainAgnname
				},
				success : function(data) {
					
					$('#table-body').empty();
					
					if (data.length > 0) {
						
						$('#result').hide();
						$('#table').show();
				$.each(data, function(key, value) {
					var complaint_arr=value.complaint.split("/");
					var newStr = complaint_arr[0]+"_"+complaint_arr[1]+"_"+complaint_arr[2];
				
					
					 $('#table-body').append('<tr>'+
							'<td>'+value.senderName+'</td>'+
							'<td>'+value.complainDate+'</td>'+
							'<td>'+value.organization+'</td>'+
							'<td>'+value.complaint+'</td>'+
							'<td>'+value.section+'</td>'+
							'<td>'+value.boDecision+'</td>'+
							'<td>'+value.boDecisionDate+'</td>'+
							'<td>'+value.section+'</td>'+
							'<td> <a style="color:red;" href="javascript:updateSessionCPA(\''+newStr+'\',8)">View</a></td>'+
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
		
		
		
/* if(complainGistofalligation!="NONE" && complainGistofalligation!=""){
	
	$.ajax({
		url : "<c:url value='/user/getDetailsByGistofalli'/>",
		type : "POST",
		data : {
			"complainGistofalligation" : complainGistofalligation
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
				
				/* $('#table-body').append('<tr>'+
						'<td>'+value.senderName+'</td>'+
						'<td>'+value.complaindate+'</td>'+
						'<td>'+value.organizationName+'</td>'+
						'<td>'+value.complaint+'</td>'+
						'<td>'+value.section+'</td>'+
						'<td>'+value.decision+'</td>'+
						'<td>'+value.decisiondate+'</td>'+
						'<td>'+value.dairyStatus+'</td>'+
						'<td> <a style="color:red;" href="javascript:sessionUpdate('+value.complaint.split("/")[0]+',8)">View RTI</a></td>'+
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
} */




/* if(complainDesiganation!="NONE" && complainDesiganation!=""){
	
	$.ajax({
		url : "<c:url value='/user/getDetailsByDesiganation'/>",
		type : "POST",
		data : {
			"complainDesiganation" : complainDesiganation
		},
		success : function(data) {
			
				$('#table-body').empty();
				if (data.length > 0) {
					$('#result').hide();
					$('#table').show();
			$.each(data, function(key, value) { */

				/* $('#table-body').append(
	                    $('<tr>')
	                        .append($('<td>').append(""+value.senderName+""))
	                        .append($('<td>').append(""+value.complaindate+""))
	                        .append($('<td>').append(""+value.organizationName+""))
	                        .append($('<td>').append(""+value.complaint+""))
	                        .append($('<td>').append(""+value.section+""))
	                       .append($('<td>').append(""+check+"")) 
	                ); */
				
				/*  $('#table-body').append('<tr>'+
						'<td>'+value.senderName+'</td>'+
						'<td>'+value.complaindate+'</td>'+
						'<td>'+value.organizationName+'</td>'+
						'<td>'+value.complaint+'</td>'+
						'<td>'+value.section+'</td>'+
						'<td>'+value.decision+'</td>'+
						'<td>'+value.decisiondate+'</td>'+
						'<td>'+value.dairyStatus+'</td>'+
						'<td> <a style="color:red;" href="javascript:sessionUpdate('+value.complaint.split("/")[0]+',8)">View RTI</a></td>'+
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
} */





		
		document.getElementById("c_no").value = "";
		document.getElementById("c_name").value = "";
		document.getElementById("c_mob").value = "";
		document.getElementById("c_email").value = "";
		document.getElementById("c_pin").value = "";
		document.getElementById("c_can").value = "";
		document.getElementById("c_goal").value = "";
		document.getElementById("c_deg").value = "";
	}
</script>


<script type="text/javascript">

function updateSessionCPA(sessionObject,value){
	// alert("sessionObject"+sessionObject);
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
					
				}else if(response.accessId==5){
					var url='<c:url value="/user/closedComplain"/>';
					window.location = url
				}
				
				else if(response.accessId==4)
				
				{
					
				}
				
				/* else if(response.accessId==7){
					var url='<c:url value="/user/acknowledgement"/>';
					window.location = url
				} */
				
				else if(response.accessId==8){
					//var url='<c:url value="/user/updateSessionCPA"/>';
					var url='<c:url value="/user/rtiCpaComplain"/>';
					window.location = url
				}
				else if(response.accessId==9){
					var url='<c:url value="/user/openComplain"/>';
					window.location = url
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
<tiles:insertAttribute name="headerOneCpaComplain" />
<body>
<tiles:insertAttribute name="body" />
</body>
<tiles:insertAttribute name="footer" />
</html>