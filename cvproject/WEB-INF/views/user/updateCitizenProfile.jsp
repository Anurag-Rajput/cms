<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<meta charset="utf-8" />
<script src="<c:url value="/resources/user/js/sweetalert2.all.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/bootstrap.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/alertify.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/bootbox.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/alertify.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.validate.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.validate.min.js"/>"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/user/css/bootstrap.min.css"/>"
	type="text/css"></link>
<link rel="stylesheet"
	href="<c:url value="/resources/user/css/sweetalert2.min.css"/>"
	type="text/css"></link>
<link rel="stylesheet"
	href="<c:url value="/resources/user/css/alertify.min.css"/>"
	type="text/css"></link>
<link rel="stylesheet"
	href="<c:url value="/resources/user/css/alertify.css"/>"
	type="text/css"></link>
<script>
 $(document).ready(function() {
	 $('#dwn_State').get(0).selectedIndex = -1;
		var dropdown = $('#dwn_State');
		$('>option', dropdown).remove(); //Clean old options first.
		dropdown.append($('<option/>').val("-1").text("SELECT"));
		
		$.ajax({
			url : "<c:url value='/getStateDetails'/>",
			type : "GET",
			
			 data : {
				//"loginvalue" : loginvalue
			}, 
			
			success : function(data) {	
				
				//$('#dwn_State').append("<option value= ${citizenData.state} selected='selected'> ${citizenData.state}</option>");
				$.each(data, function(key, value) {
		        	if('${citizenData.state}'==value.statename)	
		        		{
        		   			$('#dwn_State').append("<option value=" + value.statename + " selected='selected'>" + value.statename+ "</option>");
		        		}
		        	else
		        		{
		        			$('#dwn_State').append("<option value=" + value.statename + ">" + value.statename+ "</option>");
		        		}
		        		   
		        		   
				console.log("SUCCESS: ", data);
		        });
				
	
			},
			
			error : function(e) {
			console.log("ERROR: ", e);
			display(e);
		
		},
		done : function(e) {
			console.log("DONE");
		}
	
		});
		
		$("#dwn_State").on('change', function() {
			var stateselected = $("#dwn_State option:selected").text();	
			var dropdown = $('#dwn_City');
			$('>option', dropdown).remove(); //Clean old options first.
			dropdown.append($('<option/>').val("-1").text("SELECT"));
			//alert(stateselected);
			//alert(orgId);
			$.ajax({
				url : "<c:url value='/citybyState'/>",
				type : "POST",
				data : {
					"stateselected" : stateselected
				},
				
				success : function(data) {
					
				
					$.each(data, function(key, value) {
						
						
						for(var i=0;i<=data.length;i++)
							{
							//$('#dwn_City').empty();
							//	alert("data"+data[0].districtname);
						//$('#section_id').append("<option value=" + data[0].orgSection) + ">" + data[0].orgSection + "</option>");
						$('#dwn_City').append("<option value=" + data[i].districtname + ">"+ data[i].districtname+"</option>");
						}
					});
					$('#dwn_City').empty();
				
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
		 
		});
 
 
		$('#securityQuestion').val('${citizenData.securityQuestion }');
 });
 
 function clear_dropdownlist()
 {
 	var dropdown = $('#dwn_State');
 	$('>option', dropdown).remove(); //Clean old options first.
 	dropdown.append($('<option/>').val("-1").text("SELECT"));
 	
 	
 	var dropdown = $('#dwn_City');
 	$('>option', dropdown).remove(); //Clean old options first.
 	dropdown.append($('<option/>').val("-1").text("SELECT")); 	 	
 	}
 
 
 function validateData()
 {
 	
	if( validateAddress()&& validateEmailMob())
	{
		document.getElementById("updateCitizenProfile").submit();
	}
	 
 }
 
 function validateAddress(){
		var add1 = document.getElementById('address1').value;
		var add2 = document.getElementById('address2').value;
		var add3 = document.getElementById('address3').value;
		
		
			if(add1.search(/^[0-9a-z|A-Z\s\b,-./]+$/)== -1){
		        alert("Please use alphanumeric & defined special charaters only in address field 1");
		        return false;
			}else if(add1.charAt(0)==" "){
				alert("Please remove space from start");
		        return false;
	        }
		
			if(add2.search(/^[0-9a-z|A-Z\s\b,-./]*$/i)== -1){
		        alert("Please use alphanumeric & defined special charaters only in address field 2");
		        return false;
			}else if(add2.charAt(0)==" "){
				alert("Please remove space from start");
		        return false;
		    }
			
			if(add3.search(/^[0-9a-z|A-Z\s\b,-./]*$/i)== -1){
		       alert("Please use alphanumeric & defined special charaters only in address field 3");
		       return false
			}else if(add3.charAt(0)==" "){
				alert("Please remove space from start");
		        return false;
			}
		
		return true;
}
 
 function validateEmailMob() {
	    var email = document.getElementById('citizenEmail').value;
	    var mobNo = document.getElementById('contactNumber').value;
	  
        if(email!="" && email.search(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/)){
	        alert("Email Must be in correct format(abc@xyz.com)");
	        return false;
	  }	   	    
	    if(mobNo!="" && mobNo.charAt(9)=="")
		{
			alert("Please enter 10 digit mobile number.");
			return false;
		}
	   
		if(mobNo==""&& email=="")
		{
			alert("Please provide either mobile number or Email id");
			return false;
		}
		
		return true;
	}
 </script>


</head>
<body>

	<c:url var="myurl" value="/user/public/updateCitizenProfile/update" />
	<form:form name="updateCitizenProfile" id="updateCitizenProfile" method="post"
		commandName="citizenProfile" action="${myurl}"
		enctype="multipart/form-data">

		<!--==============================content================================-->

		<section id="content">
			<div class="main">
				<div class="wrapper">
					<article>
						<div class="inner-text"
							style="width: 100%; height: 100%; background-color: rgb(231, 243, 255); color: #0E0D01;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcome:&nbsp;${loginId}
							<br /> <small></small>
						</div>
					</article>
					<article class="fcentre">
						<div class="fcenter">
							<div align="center">
								<div align=""
									style="width: 585px; background-color: rgb(218, 237, 241); color: #0E0D01;">
									<h3>
										Update your profile
										<div class="fright"></div>
									</h3>
								</div>
								<div align="center"
									style="background-color: rgb(255, 201, 167); color: #0E0D01;">
									<h3>
										${msg}
										<div class="fright"></div>
									</h3>
								</div>
								<div class="form-group">
									<br> <br> &nbsp;Address: <font color="red">*</font>
									<div class="form-list">
										<form:input size="25" type="text"
											value="${citizenData.address1}" path="address1" id="address1" />
										<form:errors path="address1" cssClass="error" id="errorAdd1" />
									</div>
								</div>
								<div class="form-group">
									<br> &nbsp;Address 1: <font color="red">*</font>
									<div class="form-list">
										<form:input size="25" type="text" name="address2"
											value="${citizenData.address2}" path="address2" id="address2" />
										<form:errors path="address2" cssClass="error" id="errorAdd2" />
									</div>
								</div>
								<div class="form-group">
									<br> &nbsp;Address 2: <font color="red">*</font>
									<div class="form-list">
										<form:input size="25" type="text" name="address3"
											value="${citizenData.address3}" path="address3" id="address3" />
										<form:errors path="address3" cssClass="error" id="errorAdd3" />
									</div>
								</div>
								<div class="form-group">
									<br> &nbsp;State: <font color="red">*</font>
									<div class="form-list">
										<select id="dwn_State" class="form-control" name="state"
											style="width: 230px;">
											<option value="-1">----Please Select State----</option>
											<option value="${citizenData.state}" selected="selected">${citizenData.state}</option>
										</select> <label id="error2" style="color: red;" />
										<form:errors path="state" cssClass="error" />
										</td>

									</div>
								</div>
								<div class="form-group">
									<br> &nbsp;City: <font color="red">*</font>
									<div class="form-list">
										<select id="dwn_City" class="form-control" name="city"
											style="width: 230px;">
											<option value="-1">----Please Select City----</option>
											<option value="${citizenData.city}" selected="selected">${citizenData.city}</option>
										</select> <label id="error3" style="color: red;" />
										<form:errors path="city" cssClass="error" />
									</div>
								</div>
								<div class="form-group">
									<br> &nbsp;Pin code.: <font color="red">*</font>
									<div class="form-list">
										<form:input size="25" type="text" onkeypress="isNumeric();"
											maxlength="6" name="pincode" path="pincode"
											value="${citizenData.pincode}" />
										<label id="error1" style="color: red;" />
										<form:errors path="pincode" cssClass="error" />
									</div>
								</div>
								<div class="form-group">
									<br> &nbsp;Email: <font color="red">*</font>
									<div class="form-list">
										<form:input size="25" type="text" name="citizenEmail"
											id="citizenEmail" path="citizenEmail"
											value="${citizenData.citizenEmail}" />
										<form:errors path="citizenEmail" cssClass="error" />
									</div>
								</div>
								<div class="form-group">
									<br> &nbsp;Contact No.: <font color="red">*</font>
									<div class="form-list">
										<form:input size="25" type="text" onkeypress="isNumeric();"
											maxlength="10" name="contactNumber" path="contactNumber"
											value="${citizenData.contactNumber}" />
										<label id="error1" style="color: red;" />
										<form:errors path="contactNumber" cssClass="error" />
									</div>
								</div>
								<div>
									<input name="citizenId" value="${loginId}"
										style="display: none;" />
									<div class="form-group">
										<br> &nbsp;Security Question: <font color="red">*</font>
										<div class="form-list">
											<select type="select-one" class="form-control"
												name="securityQuestion" id="securityQuestion"
												style="width: 230px;">
												<option value="">-- Select --</option>
												<option value="Which place do you like the most.">Which
													place do you like the most?</option>
												<option value="What is your Lucky No.">What is your
													Lucky No.?</option>
												<option value="Who is your favorite actor.">Who is
													your favorite actor?</option>
												<option value="What was your primary school.">What
													was your primary school?</option>
												<option value="What is your pet name.">What is your
													pet name?</option>
											</select>
											<form:errors path="securityQuestion" cssClass="error"></form:errors>
										</div>
									</div>
									<div class="form-group">
										<br> &nbsp;Security Answer: <font color="red">*</font>
										<div class="form-list">
											<form:input size="25" type="text" name="securityAnswer"
												path="securityAnswer" value="${citizenData.securityAnswer }" />
											<form:errors path="securityAnswer" cssClass="error" />
										</div>
									</div>
									<br> <br> <input type="hidden" name="csrf"
										value="${_csrf.token}" />
									<div class="form-group">
										<br>
										<button type="button" id="btnSubmit" class="button-2"
											style="width: 70px;" name="save"
											onclick="return validateData();">Save</button>
										&nbsp;&nbsp;&nbsp;
										<button type="reset" class="button-2" style="width: 70px;"
											name="reset">Reset</button>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>
		</section>
	</form:form>
</body>
</html>
