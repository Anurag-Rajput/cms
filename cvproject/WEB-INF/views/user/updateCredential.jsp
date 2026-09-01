<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<script  src="<c:url value="/resources/user/js/alertify.min.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/alertify.js"/>"  type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/alertify.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/alertify.css"/>"  type="text/css" ></link> 


<link rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.min.css"/>"  type="text/css" ></link>
<script  src="<c:url value="/resources/user/js/bootstrap.min.js"/>"  type="text/javascript"></script> 


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Credential Update</title>
</head>
<script type="text/javascript">
function userSelect()
{
	
	var citizen=document.getElementById('citizen').checked;
	var officer=document.getElementById('officer').checked;
if(citizen)
{
	<c:url var="url" value="/user/getAllCitizenCVO"/>
		 $('#sel_officer').empty();
		$.ajax({
			type : "GET" ,
			url  : "${url}" ,
			data : {
					
			},
			success : function(data) {
				$('#sel_officer').append("<option value='-1'>-------------------------------------------------Select---------------------------------------------------</option>");
				$.each(data, function(key, value) {
				
					$('#sel_officer').append("<option value='" + value.citizenId + "'>" + value.citizenId + ","+ value.name +"</option>");
				});
			
			console.log("SUCCESS: ", data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				
			},
			done : function(e) {
				console.log("DONE");
			}
		});	
}
if(officer)
{
	var complaint='citizen';
	 $('#sel_officer').empty();
	 <c:url value='/user/getAllOfficerCVO' var='url'/>
		$.ajax({
			type : "GET" ,
			url  : "${url}" ,
			data : {
				"complaint":complaint,	
			},
			success : function(data) {
				$('#sel_officer').append("<option value='-1'>------------------------------------------------Select---------------------------------------------------</option>");
				$.each(data, function(key, value) {
					$('#sel_officer').append("<option value='" + value.officerName + "'>" + value.officerName + ","+ value.officerDesiganation +"</option>");
				});
			
			console.log("SUCCESS: ", data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
			
			},
			done : function(e) {
				console.log("DONE");
			}
		});	
}
}

$(document).ready(function(){
	
	
	  $('#reset').click(function(){ 
	    var resetUser=$('#sel_officer :selected').val();
		var citizen=document.getElementById('citizen').checked;
		var officer=document.getElementById('officer').checked;
		var userType="";
		if(citizen==true){userType="citizen";}
		if(officer==true){userType="officer";}
		  
		alertify.confirm('Reset Password', 'Do you really want to reset password?', function(){ 
			$.ajax({
				type : "POST" ,
				url  : "<c:url value='/user/resetPasswordAdmin'/>" ,
				data : {
					"user":resetUser,
					"type":userType,
				},
				success : function(data) {
					
					if(data=="updateCredential")
					{
						alertify.success("Reset Successfully");
					}
					else
					{
						alertify.error("Reset Unsuccessful");
					}
					
				console.log("SUCCESS: ", data);
				},
				error : function(e) {
					console.log("ERROR: ", e);
				
				},
				done : function(e) {
					console.log("DONE");
				}
			});	
			
			}
        , function(){ alertify.error("Reset Unsuccessful");});

		
	  });
	  
	  $('#unlock').click(function(){
		  var unlockUser=$('#sel_officer :selected').val();
		  var citizen=document.getElementById('citizen').checked;
			var officer=document.getElementById('officer').checked;
			var userType="";
			if(citizen==true){userType="citizen";}
			if(officer==true){userType="officer";}
		   
			
		alertify.confirm('Reset Password', 'Do you really want to unlock user?', function(){
			$.ajax({
				type : "POST" ,
				url  : "<c:url value='/user/unlockUser'/>" ,
				data : {
					"user":unlockUser,
					"type":userType,
				},
				success : function(data) {
					if(data=="updateCredential")
					{
						alertify.success("Unlock Successfully.");
					}
					else
					{
						alertify.error("Unlock Unsuccessful");
					}
					console.log(data);
				},
				error : function(e) {
					console.log("ERROR: ", e);
				
				},
				done : function(e) {
					console.log("DONE");
				}
			});
		}
        , function(){ alertify.error("Unlock Unsuccessful");});

		  });
	  
	  $('#activate').click(function(){
		  var unlockUser=$('#sel_officer :selected').val();
		  var citizen=document.getElementById('citizen').checked;
			var officer=document.getElementById('officer').checked;
			var userType="";
			if(citizen==true){userType="citizen";}
			if(officer==true){userType="officer";}
		   
			
		alertify.confirm('Activate User', 'Do you really want to activate user?', function(){
			 $.ajax({
				type : "POST" ,
				url  : "<c:url value='/user/activate'/>" ,
				data : {
					"user":unlockUser,
					"type":userType,
				},
				success : function(data) {
					if(data=="updateCredential")
					{
						alertify.success("Activate Successfully.");
					}
					else
					{
						alertify.error("Activate Unsuccessful");
					}
					console.log(data);
				},
				error : function(e) {
					console.log("ERROR: ", e);
				
				},
				done : function(e) {
					console.log("DONE");
				}
			}); 
		}
        , function(){ alertify.error("Activate Unsuccessful");});

		  });
	  
	  $('#deactivate').click(function(){
		  var unlockUser=$('#sel_officer :selected').val();
		  var citizen=document.getElementById('citizen').checked;
			var officer=document.getElementById('officer').checked;
			var userType="";
			if(citizen==true){userType="citizen";}
			if(officer==true){userType="officer";}
		   
			
		alertify.confirm('Deactivate User', 'Do you really want to deactivate user?', function(){
			 $.ajax({
				type : "POST" ,
				url  : "<c:url value='/user/deactivate'/>" ,
				data : {
					"user":unlockUser,
					"type":userType,
				},
				success : function(data) {
					if(data=="updateCredential")
					{
						alertify.success("Deactivate Successfully.");
					}
					else
					{
						alertify.error("Deactivate Unsuccessful");
					}
					console.log(data);
				},
				error : function(e) {
					console.log("ERROR: ", e);
				
				},
				done : function(e) {
					console.log("DONE");
				}
			}); 
		}
        , function(){ alertify.error("Deactivate Unsuccessful");});

		  });
	});

</script>
<body>
<form style="display: inline-flex;align-items: center;padding-left:20%;padding-top: 10%;grid-gap: ;">
				<div id="user">
					<input class="form-control" type="radio" id="citizen" name="userType" value="citizen" onclick="userSelect();"><label>Citizen</label><br>
					<input class="form-control" type="radio" id="officer" name="userType" value="officer" onclick="userSelect();"><label>Officer</label><br>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div>
				<select  class="form-control select2-single" id="sel_officer" >
						<option value='-1' >------------------------------------------------Select--------------------------------------------------</option>
				</select>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div>
				<input class="form-control" type="button" value="Reset Password" id="reset" style="background:buttonface; ">
				<br>
				<input class="form-control" type="button" value="Unlock User" id="unlock" style="background:buttonface;">
				<br>
				<input class="form-control" type="button" value="Activate" id="activate" style="background:buttonface;">
				<br>
				<input class="form-control" type="button" value="Deactivate" id="deactivate" style="background:buttonface;">
				</div>
				
		   
</form> 
</body>
</html>