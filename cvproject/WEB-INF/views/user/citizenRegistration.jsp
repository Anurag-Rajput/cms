<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<head>
<link rel="stylesheet" href="<c:url value="/resources/user/css/reset.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/style.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/js/calendar-win2k-cold-1.css"/>" type="text/css" media="screen"></link>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar-setup.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar-en.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/bCrypt.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/md5.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/jquery.validate.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/jquery.validate.min.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/bootstrap.min.js"/>"  type="text/javascript"></script>
 <link rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.min.css"/>"  type="text/css" ></link>
 
 <style type="text/css">
 
 body {
    background-color: #E0E0E0;
    }
     
     table{
   -moz-border-radius:5px 5px 5px 5px;
border-radius: 5px 5px 5px 5px;
-moz-box-shadow: 5px 5px 5px 5px black;
-webkit-box-shadow:5px 5px 5px 5px black;
box-shadow:5px 5px 5px 5px black;


     }
.field-error .control-label,
.field-error .help-block,
.field-error .form-control-feedback {
    color: #ff0039;
}

.field-success .control-label,
.field-success .help-block,
.field-success .form-control-feedback {
    color: #2780e3;
}
label {
color: #000000;
font-weight: bold;

}


input[type=text], select {
    color: black;    
}
input[type=number]{
    width: 100%;
} 


.left-inner-addon {
    position: relative;
}
.left-inner-addon input {
    padding-left: 30px;    
}
.left-inner-addon i {
    position: absolute;
    padding: 10px 12px;
    pointer-events: none;
}
</style>

<script>

function clear_dropdownlist()
{
	var dropdown = $('#dwn_State');
	$('>option', dropdown).remove(); //Clean old options first.
	dropdown.append($('<option/>').val("-1").text("SELECT"));
	
	
	var dropdown = $('#dwn_City');
	$('>option', dropdown).remove(); //Clean old options first.
	dropdown.append($('<option/>').val("-1").text("SELECT"));
	

	var dropdown = $('#dwn_pin');
	$('>option', dropdown).remove(); //Clean old options first.
	dropdown.append($('<option/>').val("-1").text("SELECT"));
	
	
	
	}
	
	function clearcity_pincode()
	{
		var dropdown = $('#dwn_City');
		$('>option', dropdown).remove(); //Clean old options first.


		dropdown.append($('<option/>').val("-1").text("SELECT"));
		

		var dropdown = $('#dwn_pin');
		$('>option', dropdown).remove(); //Clean old options first.


		dropdown.append($('<option/>').val("-1").text("SELECT"));
		
		
		
	}
	
	
$(document).ready(function() {
	
	
	clear_dropdownlist();
	
	
	//document.getElementById("dwn_State").options.length = 0;
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

			//$('#dwn_State').empty();
			
			$.each(data, function(key, value) {
				
	           /*  alert("roll type"+data[1].pincode);
	           alert("roll type"+data[1].statename);
	           alert("roll type"+data[1].districtname); 
	        */
	        		   //for(var i=0;i<data.length;i++){
	        			
	        			   
	        		   $('#dwn_State').append("<option value='" + value.statename + "'>" + value.statename+ "</option>");
	        		  // alert(value.statename );
	        		 //  }
	        		   
	        		   
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
		clearcity_pincode();
		$('#dwn_pin').get(0).selectedIndex = -1;
		var dropdown = $('#dwn_pin');
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
					$('#dwn_City').append("<option value='" + data[i].districtname + "'>"+ data[i].districtname+"</option>");
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
	
	
	
	$("#dwn_City").on('change', function() {
		var stateselected = $("#dwn_City option:selected").text();
		

		var dropdown = $('#dwn_pin');
		$('>option', dropdown).remove(); //Clean old options first.
		dropdown.append($('<option/>').val("-1").text("SELECT"));
		
		//alert(stateselected);
		$.ajax({
			url : "<c:url value='/pinbyDistrict'/>",
			type : "POST",
			data : {
				"stateselected" : stateselected
			},
			
			success : function(data) {
				
				//$('#dwn_pin').empty();
				$.each(data, function(key, value) {					
					
					
					//for(var i=0;i<data.length;i++)
						//{					
						
						//alert("data"+data[i].districtname);
					//$('#section_id').append("<option value=" + data[0].orgSection) + ">" + data[0].orgSection + "</option>");
						//$('#dwn_pin').empty();
					$('#dwn_pin').append("<option value='" + value.pincode + "'>"+ value.pincode+"</option>");
					//}
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
	 
	});
	
	document.getElementById("citizenId").focus();
	validatePassword();	
	document.getElementById("userIdError").innerHTML="";
	document.getElementById("userIdError1").innerHTML="";
	document.getElementById("error").innerHTML="";
	document.getElementById("error1").innerHTML="";
	document.getElementById("errorAdd").innerHTML="";
	document.getElementById("errorAdd2").innerHTML="";
	document.getElementById("errorAdd3").innerHTML="";
	/* document.getElementById("error2").innerHTML="";
	document.getElementById("error3").innerHTML=""; */
	document.getElementById("errorEmail").innerHTML="";
	document.getElementById("errorGovtId").innerHTML="";
	document.getElementById("errorQue").innerHTML="";
	document.getElementById("errorAns").innerHTML="";
	document.getElementById("errorPin").innerHTML="";
	document.getElementById("errorMob").innerHTML="";
	document.getElementById("errorLandLine").innerHTML=""; 
	document.getElementById("errorAge").innerHTML="";
});
	function findUserId() {
		
		var userId = document.getElementById("citizenId").value;
		var flag=userId.search(/^[0-9a-zA-Z]+$/);
		
		if(userId.charAt(5)=="")
		{
			$('#userIdError').show();
			document.getElementById("userIdError").innerHTML="User Name must contain more than 5 characters";
			document.getElementById("userIdError1").innerHTML="";
			document.getElementById('submit').disabled=true;
		}
		else if(userId.charAt(12)!="")
		{	
			$('#userIdError').show();
			document.getElementById("userIdError").innerHTML="User Name must contain less than 12 characters";
			document.getElementById("userIdError1").innerHTML="";
			document.getElementById('submit').disabled=true;
		}
		else if(userId.charAt(5)!="" || userId.charAt(11)!="")
		{
			$.ajax({
				url : "<c:url value='/user/getAuthorities'/>",
				type : "POST",
				data : {
					"userId" : userId
				},
				success : function(response) {
					if(response==true){
						$('#userIdError').show();
						$('#userIdError1').hide();
						document.getElementById("userIdError").innerHTML="user id already exist.";
						 document.getElementById('submit').disabled=true;
					}else if(flag==-1){
						$('#userIdError').show();
						$('#userIdError1').hide();
						document.getElementById("userIdError").innerHTML="Space & Special character are not allowed.";
						 document.getElementById('submit').disabled=true;
					}else{
						$('#userIdError').hide();
						$('#userIdError1').show();
						document.getElementById("userIdError1").innerHTML="Valid User Name";
						document.getElementById("userIdError").innerHTML="";
						 /* document.getElementById('submit').disabled=false; */
					}
					
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
				
	}
</script>

<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

     	  $('#userIdError').hide();
    	  $('#userIdError1').hide(); 
    		document.getElementById("submit").disabled=true;
        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

</script>
<script type="text/javascript">
function checkPasswordMatch() {
    var password = $("#txtNewPassword").val();
    var confirmPassword = $("#txtConfirmPassword").val();

    if (password != confirmPassword)
    	{
        $("#divCheckPasswordMatch").html("Passwords do not match!");
        document.getElementById('submit').disabled=true;
    	}
    else
    	{
    	validatePassword();
        
    	}
}
</script>

<title>Citizen Registration Form</title>
<style type="text/css">
h3{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; color:black;
text-align: center; text-decoration: underline }
h5{font-family: Calibri; font-size: 16pt; font-style: normal; font-weight: bold; color:black;
text-align: center;}
table{font-family: Calibri; color:blue; font-size: 11pt; font-style: normal;width: 50%;
 background-color: rgb(204,255,255); border-collapse: collapse; border: 2px solid navy}
table.inner{border: 0px}
</style>

 
     	<script type="text/javascript">
        function Validate() {
            var password = document.getElementById("txtPassword").value;
            var confirmPassword = document.getElementById("txtConfirmPassword").value;
            if (password != confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }
    </script>
     	
<script>
function  validatePassword() {
    var newPassword = document.getElementById('txtNewPassword').value;
    var confirmPassword = $("#txtConfirmPassword").val();

  if(newPassword.search((/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[#$%&()*+,-./:;<=>?@\^_`{|}~]).*$/))) {
        document.getElementById("error").innerHTML="Should contain 1 digit,1 Special Character,1 small, 1 capital letter and minimum 8 character";
        document.getElementById('submit').disabled=true;
  }else if(!newPassword.search((/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[#$%&()*+,-./:;<=>?@\^_`{|}~]).*$/))) {
      document.getElementById("error").innerHTML="";
      document.getElementById('submit').disabled=true;
	}
  var pass=newPassword.search((/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[#$%&()*+,-./:;<=>?@\^_`{|}~]).*$/));
  if((confirmPassword==newPassword)&&(confirmPassword!="")&&(newPassword!="")&&(pass==0)){
	  document.getElementById("error").innerHTML = "";
	  $("#divCheckPasswordMatch").html("Passwords matched!");
	  /* document.getElementById('submit').disabled=false; */
  }else if(confirmPassword!=newPassword){
	  $("#divCheckPasswordMatch").html("Passwords do not match!");
      document.getElementById('submit').disabled=true;
  }else{
	  document.getElementById("error").innerHTML = "";
  }
    
}

function GeneratePwd() { 
	  var saveTime= new Date();
 	 // var test=saveTime.getFullYear()+'-'+saveTime.getMonth()+'-'+saveTime.getDay();
 	 //var test=saveTime.getDate();
    if(document.getElementById("createdDate").value != "" || document.getElementById("createdDate").value != null){
    	document.getElementById("createdDate").value = saveTime;
    }
    if (document.getElementById("txtNewPassword").value != "") {  
        document.getElementById("txtNewPassword").value = calcMD5(document.getElementById("txtNewPassword").value); 
        document.getElementById("txtConfirmPassword").value = calcMD5(document.getElementById("txtConfirmPassword").value); 
    } 
    
    
}  

function validateAlpha() {
    var alpha = document.getElementById('name').value;
         if(alpha.search(/^[a-z|A-Z\s\b]+$/)){
        document.getElementById("error1").innerHTML="Alphabet Only";
        document.getElementById('submit').disabled=true;
  }else{
validatePassword();

	  document.getElementById("error1").innerHTML = "";
	 <!-- document.getElementById('submit').disabled=false; -->
  }
    
}
/* function validateIdCard(){
	var idCard=document.getElementById('idcardnumber').value;
	if(idCard.search(/^[0-9a-zA-Z]+$/))
	{
		document.getElementById("errorId").innerHTML="Special Characters not allowed.";
        document.getElementById('submit').disabled=true;
	}else{
		validatePassword();

		  document.getElementById("errorId").innerHTML = "";
		 <!-- document.getElementById('submit').disabled=false; -->
	  }
		} */
function validateAddress(){
			var add1 = document.getElementById('address1').value;
			var add2 = document.getElementById('address2').value;
			var add3 = document.getElementById('address3').value;
			
			if($("#address1").is(':focus')){
				if(add1.search(/^[0-9a-z|A-Z\s\b,-./]+$/)){
			        document.getElementById("errorAdd").innerHTML="Please use alphanumeric & defined special charaters only";
			        document.getElementById('submit').disabled=true;
				}else if(add1.charAt(0)==" "){
					document.getElementById("errorAdd").innerHTML="Please remove space from start";
			        document.getElementById('submit').disabled=true;
		        }else{
					validatePassword();
					document.getElementById("errorAdd").innerHTML = "";
					}	
			}
			if($("#address2").is(':focus')){
				if(add2.search(/^[0-9a-z|A-Z\s\b,-./]+$/)){
			        document.getElementById("errorAdd2").innerHTML="Please use alphanumeric & defined special charaters only";
			        document.getElementById('submit').disabled=true;
				}else if(add2.charAt(0)==" "){
					document.getElementById("errorAdd2").innerHTML="Please remove space from start";
			        document.getElementById('submit').disabled=true;
			    }else{
					validatePassword();
					document.getElementById("errorAdd2").innerHTML = "";
					}
			}
			if($("#address3").is(':focus')){
				if(add3.search(/^[0-9a-z|A-Z\s\b,-./]+$/)){
			        document.getElementById("errorAdd3").innerHTML="Please use alphanumeric & defined special charaters only";
			        document.getElementById('submit').disabled=true;
				}else if(add3.charAt(0)==" "){
					document.getElementById("errorAdd3").innerHTML="Please remove space from start";
			        document.getElementById('submit').disabled=true;
				}else{
					validatePassword();
					document.getElementById("errorAdd3").innerHTML = "";
					}
			}
	}


  function validateState() {
    var alpha = document.getElementById('state').value;
         if(alpha.search(/^[a-z|A-Z\s\b]+$/)){
        //document.getElementById("error2").innerHTML="Alphabet Only";
        document.getElementById('submit').disabled=true;
  }else{
validatePassword();

	  document.getElementById("error2").innerHTML = "";
	 <!-- document.getElementById('submit').disabled=false; -->
  }
    
}

function validateCity() {
    var alpha = document.getElementById('city').value;
         if(alpha.search(/^[a-z|A-Z\s\b]+$/)){
        //document.getElementById("error3").innerHTML="Alphabet Only";
        document.getElementById('submit').disabled=true;
  }else{
validatePassword();

	  //document.getElementById("error3").innerHTML = "";
	<!--  document.getElementById('submit').disabled=false; -->
  }
    
}
function validateEmail() {
    var email = document.getElementById('citizenEmail').value;
  
         if(email.search(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/)){
        document.getElementById("errorEmail").innerHTML="Must be in correct format(abc@xyz.com)";
        document.getElementById('submit').disabled=true;
  }else { 
		validatePassword();
		document.getElementById("errorEmail").innerHTML = "";	
  }
    if(email=="" || email==null){document.getElementById("errorEmail").innerHTML = "";} 
}
function ClearAll(){
	$('#userIdError').hide();
	$('#userIdError1').hide();
	$('#codeer').hide();
	$("#divCheckPasswordMatch").html("");
	$('#error').empty();
	$('#error1').empty();
	$('#errorId').empty();
	$('#errorAdd').empty();
	$('#errorAdd2').empty();
	$('#errorAdd3').empty();
	$('#error2').empty();
	$('#error3').empty();
	$('#errorEmail').empty();
	$('#errorGovtId').empty();
	$('#errorQue').empty();
	$('#errorAns').empty();
	$('#errorPin').empty();
	$('#errorMob').empty();
	$('#errorLandLine').empty();
	$('#errorAge').empty();
	document.getElementById("pantxt").disabled=true;
	document.getElementById("adhartxt").disabled=true;
	document.getElementById('submit').disabled=true;
	
}
function govtId(){
	if(document.getElementById("panId").checked){
		document.getElementById("pantxt").disabled=false;
		document.getElementById("adhartxt").value="";
		document.getElementById("adhartxt").disabled=true;
	}
	else{
		document.getElementById("pantxt").value="";
		document.getElementById("pantxt").disabled=true;
		document.getElementById("adhartxt").disabled=false;
	}
}
function validatePan(){
	var pan=document.getElementById("pantxt").value;
	
	if(!pan.search(/[a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}$/))
	{
		document.getElementById("errorGovtId").innerHTML="";
	}
	else
	{
		document.getElementById("errorGovtId").innerHTML="Pan Card Number is Not Correct.";
		document.getElementById('submit').disabled=true;
	}
	if(pan=="" || pan==null){document.getElementById("errorGovtId").innerHTML="";}
}
function validateAdhar(){
	var adhar=document.getElementById("adhartxt").value;
	
	if(!adhar.search(/[0-9]{4}[0-9]{4}[0-9]{4}$/))
	{
		document.getElementById("errorGovtId").innerHTML="";
	}
	else
	{
		document.getElementById("errorGovtId").innerHTML="Adhar Card Number is Not Correct.";
		document.getElementById('submit').disabled=true;
	}
	if(adhar=="" || adhar==null){document.getElementById("errorGovtId").innerHTML="";}
}
function validateAge(){
	
	var age=document.getElementById("age").value;
	if(18>age || age>105)
	{
		document.getElementById("errorAge").innerHTML="Enter Valid Age between 18 to 105.";
		document.getElementById('submit').disabled=true;
	}
	else
	{
		document.getElementById("errorAge").innerHTML="";
	}
}
function validateAnswer(){
	
	var answer=document.getElementById("securityAnswer").value;
	if(answer=="" || answer==null)
	{
		document.getElementById("errorAns").innerHTML="Answer cannot be blank.";
		document.getElementById('submit').disabled=true;
	}else if(answer.charAt(0)==" ")
	{
		document.getElementById("errorAns").innerHTML="Please remove space from start";
		document.getElementById('submit').disabled=true;
	}
	else
	{
		document.getElementById("errorAns").innerHTML="";
	}
}

function validatePin(){
	
	var pin=document.getElementById("pincode").value;
	
	if(pin.charAt(5)=="")
	{
		document.getElementById("errorPin").innerHTML="Please enter 6 digit pincode";
		document.getElementById('submit').disabled=true;
	}
	else
	{
		document.getElementById("errorPin").innerHTML="";
	}
}
function validateMob()
{
	var mob=document.getElementById("mob").value;
	
	if(mob.charAt(9)=="")
	{
		document.getElementById("errorMob").innerHTML="Please enter 10 digit mobile number.";
		document.getElementById('submit').disabled=true;
	}
	else
	{
		document.getElementById("errorMob").innerHTML="";
	}
	if(mob=="" || mob==null){document.getElementById("errorMob").innerHTML="";}
}
function validateLandLine()
{
	var landLine=document.getElementById("landline").value;
	var citycode=document.getElementById("citycode").value;
	if(citycode.charAt(2)=="")
	{
		document.getElementById("errorLandLine").innerHTML="Please enter 3 digit STD code";
		document.getElementById('submit').disabled=true;
	}
	else if(landLine.charAt(7)=="")
	{
		document.getElementById("errorLandLine").innerHTML="Please enter 8 digit landline number.";
		document.getElementById('submit').disabled=true;
	}
	else
	{
		document.getElementById("errorLandLine").innerHTML="";
	}
	 if((landLine=="" || landLine==null)&&(citycode=="" || citycode==null)){document.getElementById("errorLandLine").innerHTML="";} 
}
function validateQue()
{
	var que=document.getElementById("securityQuestion").value;
	if(que=="-1")
	{
		document.getElementById("errorQue").innerHTML="Please select a question.";
		document.getElementById('submit').disabled=true;
	}
	else
	{
		document.getElementById("errorQue").innerHTML="";
	}
}
function validateImg()
{
	var newPassword = document.getElementById('txtNewPassword').value;
    var confirmPassword = $("#txtConfirmPassword").val();
 	var img=document.getElementById("captcha").value;
	
 	var userId = document.getElementById("citizenId").value;
 	var que=document.getElementById("securityQuestion").value;
 	var answer=document.getElementById("securityAnswer").value;
 	var name= document.getElementById('name').value;
 	var age=document.getElementById("age").value;
 	var pan=document.getElementById("pantxt").value;
 	var adhar=document.getElementById("adhartxt").value;
 	var add1 = document.getElementById('address1').value;
 	var add2 = document.getElementById('address2').value;
 	var state= document.getElementById('dwn_State').value;
 	var city= document.getElementById('dwn_City').value;
 	var pin=document.getElementById("dwn_pin").value;
 	var email = document.getElementById('citizenEmail').value;
 	var mob=document.getElementById("mob").value;
 	
 	var errorEmptyBoolean = true;
 
 	if(userId=="" || userId==null){
 		$('#userIdError').show();
 		document.getElementById("userIdError").innerHTML="Field cannot be empty";
 		document.getElementById('submit').disabled=true;
 		errorEmptyBoolean = false;
 		}
 		else{
 			document.getElementById("userIdError").innerHTML="";
 			errorEmptyBoolean = true;
 		}
 	  if(que=="-1"){
 		document.getElementById("errorQue").innerHTML="Field cannot be empty";
 		document.getElementById('submit').disabled=true;
 		errorEmptyBoolean=false;
 		}
 	  else{
 		  document.getElementById("errorQue").innerHTML="";
 		  errorEmptyBoolean=true;
 	  }
 	 if(answer=="" || answer==null){
 		 document.getElementById("errorAns").innerHTML="Field cannot be empty";
 		document.getElementById('submit').disabled=true;
 		errorEmptyBoolean=false;
 		}
 	 else{
 		document.getElementById("errorAns").innerHTML="";
 		errorEmptyBoolean=true;
 	 }
 	 if(name=="" || name==null){
 		 document.getElementById("error1").innerHTML="Field cannot be empty";
 		document.getElementById('submit').disabled=true;
 		errorEmptyBoolean= false;
 		}
 	 else{
 		document.getElementById("error1").innerHTML="";
 		errorEmptyBoolean= true;
 	 }
 	 if(age=="" || age==null){
 		document.getElementById("errorAge").innerHTML="Field cannot be empty";
 		document.getElementById('submit').disabled=true;
 		errorEmptyBoolean=false;
 		}
 	 else{
 		document.getElementById("errorAge").innerHTML="";
 		errorEmptyBoolean=true;
 	 }
 	 if((add1=="" || add1==null)&&(add2=="" || add2==null)){
 		document.getElementById("errorAdd2").innerHTML="Field cannot be empty";
 		document.getElementById('submit').disabled=true;
 		errorEmptyBoolean = false;
 		}
 	 else{
 		document.getElementById("errorAdd2").innerHTML="";
 		errorEmptyBoolean = true;
 	 }
 	 if(state=="-1"){
 		document.getElementById("error2").innerHTML="Field cannot be empty";
 		document.getElementById('submit').disabled=true;
 		errorEmptyBoolean= false;
 		}
 	 else{
 		document.getElementById("error2").innerHTML="";
 		errorEmptyBoolean= true;
 	 }
 	if(city=="-1"){
 		document.getElementById("error3").innerHTML="Field cannot be empty";
 		document.getElementById('submit').disabled=true;
 		errorEmptyBoolean= false;
 		}
 	else{
 		document.getElementById("error3").innerHTML="";
 		errorEmptyBoolean= true;
 	}
 	if(pin=="-1"){
 		document.getElementById("errorPin").innerHTML="Field cannot be empty";
 		document.getElementById('submit').disabled=true;
 		errorEmptyBoolean=false;
 		}
 	else{
 		document.getElementById("errorPin").innerHTML="";
 		errorEmptyBoolean=true;
 	}




	var userIdError1=document.getElementById("userIdError1").innerHTML=="Valid User Name";
	var divCheckPasswordMatch=document.getElementById("divCheckPasswordMatch").innerHTML=="Passwords matched!";

	
	var userIdError=document.getElementById("userIdError").innerHTML
	var error=document.getElementById("error").innerHTML
	var error1=document.getElementById("error1").innerHTML
	var errorAdd=document.getElementById("errorAdd").innerHTML
	var errorAdd2=document.getElementById("errorAdd2").innerHTML
	var errorAdd3=document.getElementById("errorAdd3").innerHTML
	var error2=document.getElementById("error2").innerHTML
	var error3=document.getElementById("error3").innerHTML
	var errorEmail=document.getElementById("errorEmail").innerHTML
	var errorGovtId=document.getElementById("errorGovtId").innerHTML 
	var errorQue=document.getElementById("errorQue").innerHTML
	var errorAns=document.getElementById("errorAns").innerHTML
	var errorPin=document.getElementById("errorPin").innerHTML
	var errorMob=document.getElementById("errorMob").innerHTML
	var errorLandLine=document.getElementById("errorLandLine").innerHTML 
	var errorAge=document.getElementById("errorAge").innerHTML
	
/*  	alert("1"+userIdError);
	alert("2"+error);
	alert("3"+error1);
	alert("4"+errorAdd);
	alert("5"+errorAdd2);
	alert("6"+errorAdd3);
	alert("7"+error2);
	alert("8"+error3);
	alert("9"+errorEmail);
	alert("10"+errorGovtId);
	alert("11"+errorQue);
	alert("12"+errorAns);
	alert("13"+errorPin);
	alert("14"+errorMob);
	alert("15"+errorLandLine);
	alert("16"+errorAge); 
	 */
	 
	var errorBoolean=false;
if((userIdError==null || userIdError=="")&&
		(error==null || error=="")&&
		(error1==null || error1=="")&&
		(errorAdd==null || errorAdd=="")&&
		(errorAdd2==null || errorAdd2=="")&&
		(errorAdd3==null || errorAdd3=="")&&
		(error2==null || error2=="")&&
		(error3==null || error3=="")&&
		(errorEmail==null || errorEmail=="")&&
		(errorGovtId==null || errorGovtId=="")&& 
		(errorQue==null || errorQue=="")&&
		(errorAns==null || errorAns=="")&&
		(errorPin==null || errorPin=="")&&
		(errorMob==null || errorMob=="")&&
		(errorLandLine==null || errorLandLine=="")&&
		(errorAge==null || errorAge==""))
	{
		errorBoolean=true;
		$('#userIdError1').show();
	}
	else
	{
		errorBoolean=false;
	}
	
	if((!img.charAt(5)=="")&&(confirmPassword==newPassword)&&errorEmptyBoolean &&errorBoolean &&divCheckPasswordMatch)
	{
		document.getElementById('submit').disabled=false;
	}
	else if(!(!img.charAt(5)=="")&&(confirmPassword==newPassword)&&errorEmptyBoolean &&errorBoolean &&divCheckPasswordMatch)
	{
		document.getElementById('submit').disabled=true;	
	}
}
</script>
<script type="text/javascript">
       		 var specialKeys = new Array();
       	 	 specialKeys.push(7); //Backspace
        		 function IsNumericone(e) {
           		 var keyCode = e.which ? e.which : e.keyCode
          		 var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
           		 document.getElementById("codeer").style.display = ret ? "none" : "inline";
            	return ret;
        				}
     	</script>
     	
     	
     	<script type="text/javascript">
       		 var specialKeys = new Array();
       	 	 specialKeys.push(8); //Backspace
        		 function IsNumeric(e) {
           		 var keyCode = e.which ? e.which : e.keyCode
          		 var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
           		 /* document.getElementById("error").style.display = ret ? "none" : "inline"; */
            	return ret;
        				}
     	</script>


<script type="text/javascript">
       		 var specialKeys = new Array();
       	 	 specialKeys.push(8); //Backspace
        		 function IsNumeric1(e) {
           		 var keyCode = e.which ? e.which : e.keyCode
          		 var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
           		 document.getElementById("error").style.display = ret ? "none" : "inline";
            	return ret;
        				}
     	</script>
</head>
 
<body>

<h3><font color="#0E4F81"> Central Vigilance Commission</font></h3>

<center><h5><font color="#0E4F81">Format for Registration and Complaint Lodging by Citizen (Complainant)<br/>Registration Details (One-time)</font></h5></center>
<center>
<c:url var="myurl" value="/addCitizenDetails"/>
<form:form name="myform" id="myform" method="post" action="${myurl}" autocomplete="off"  commandName="citizen" >
 
   <table align="center" cellpadding = "10" style="height: 1200px; width: 900px; background-color:#C2E0F6 ">
          
          
          
           <tr><td align="center" colspan="2">&nbsp;<span style="color:red;  font-size:18px;">* Fields marked are mandatory</br>
          </span></td></tr> <tr style="background-color:#0E4F81;" >
                   <td style="text-align:center; font:bold; font-size:large;" ><font color="white">Login Details</font></td>
				   <td></td>
		  </tr><tr><td>&nbsp;</td></tr>
		  <!-- <tr>
		  <td width="50px">left</td>
		  <td width="50px">center<label>Right</label></td>
		  </tr> -->
		 
          <tr> 
                  <td class="col-sm-1" ><label >User Name:<span style="color:red;">*</span></label></td>
                  <td class="col-sm-2">
                  <div class="left-inner-addon ">
    <i class="glyphicon glyphicon-user"></i>
    <form:input class="form-control" type="text" id="citizenId" name="citizenId" autocomplete="off" path="citizenId" maxlength="50" onkeyup="findUserId();" placeholder="Enter Alphanumeric Only"/>
    </div>
                
                  <!-- <input type="button" value="Check" onclick="findUserId();"/> -->
			<label style="color: red;" > <c:out  value='${errorEntry}'/> </label>
		<div id="userIdError" style="color: red;">Special character are not allowed or user id already exist.</div>
		<div id="userIdError1" style="color: green;">Valid User Id.</div>
        <form:errors path="citizenId" cssClass="error"/> <span class="glyphicon glyphicon-warning-sign form-control-feedback"><span></span></td>
         </tr>
          <tr>
               <td class="col-sm-1"><label>Password:<span style="color:red;">**</span></label></td>
              <td class="col-sm-2">
               <div class="left-inner-addon ">
    <i class="glyphicon glyphicon-eye-close"></i>
     <form:input class="form-control" type="password"  name="password" onkeyup="validatePassword();" autocomplete="off" path="password" id="txtNewPassword" placeholder="Should contain 1 digit,1 Special Character,1 small, 1 capital letter and minimum 8 character"/>
    </div>
             
             <label id="error" style="color: red;"/>
              <span id="password_strength"></span>
              <form:errors path="password" cssClass="error"/></td>
         </tr>
         <tr>
              <td  class="col-sm-1"><label >Confirm Password:<span style="color:red;">*</span></label></td>
              <td class="col-sm-2">
              <div class="left-inner-addon ">
    <i class="glyphicon glyphicon-eye-close"></i>
     <input class="form-control" type="password" placeholder="Should contain 1 digit,1 Special Character,1 small, 1 capital letter and minimum 8 character" name="rePassword" autocomplete="off" id="txtConfirmPassword"  onkeyup="validatePassword();" />
    </div>
              
              <div style="color: red;" class="registrationFormAlert" id="divCheckPasswordMatch">
</div>
              </td>
		 </tr> 
		
         <tr>
             <td  class="col-sm-1"><label>Security Question:<span style="color:red;">*</span></label> </td>
             <td class="col-sm-2">
             <div class="left-inner-addon ">
    <i class="  glyphicon glyphicon-text-width"></i>
   
    
           
             <select   type = "select-one" class="form-control" name="securityQuestion" id="securityQuestion" onchange="validateQue();" >
                 <option value="-1">              ---- Please select ---- </option> 
                 <option value="  Which place do you like the most.">Which place do you like the most?</option>               
                 <option value="  What is your Lucky No.">What is your Lucky No.?</option>               
                 <option value="  Who is your favorite actor.">Who is your favorite actor? </option>               
                 <option value="  What was your primary school.">What was your primary school?</option>               
                 <option value="  What is your pet name.">What is your pet name?</option>    
                 </select> 
                 </div>
                 <label id="errorQue" style="color: red;"/>
                 <form:errors path="securityQuestion" cssClass="error"></form:errors>
                     
            </td>
          </tr>
          <tr>
              <td class="col-sm-1" > <label>Answer :<span style="color:red;">*</span></label></td>
              <td class="col-sm-2">
              <div class="left-inner-addon ">
    <i class="glyphicon glyphicon-eye-close"></i>
      <form:input class="form-control" type="password" placeholder="Please enter Answer" path="securityAnswer" autocomplete="off" id="securityAnswer" name="securityAnswer"  onblur="validateAnswer();" onfocus="validateQue();"/>
    </div>
             
              <label id="errorAns" style="color: red;"/>
              <form:errors path="securityAnswer" cssClass="error"></form:errors>
              </td>
          </tr>
          <tr  style="background-color:#0E4F81;">
             <td style="text-align:center; font:bold; font-size:large;"> <font color="white">Personal Details</font></td>
             <td></td>
         </tr>
         <tr><td>&nbsp;</td></tr>
         <tr>
            <td  class="col-sm-1"><label>Salutation:</label></td>
            <td class="col-sm-2"><select   type = "select-one" class="form-control" name="salutation"  >
                <option value="" > --           Select                 -- </option> 
                <option value="Mr.">Mr.</option>               
                <option value="Mrs.">Mrs.</option>
                <option value="Ms.">Ms.</option>               
                <option value="Dr.">Dr. </option>               
                <option value="Prof.">Prof.</option>
                <option value="">Others</option>               
                </select> 
                <form:errors path="salutation" cssClass="error"></form:errors>    
			</td>
          </tr>
          <tr>
              <td class="col-sm-1"><label>Name:<span style="color:red;">*</span></label></td>
              <td class="col-sm-2">
               <div class="left-inner-addon ">
    <i class="glyphicon glyphicon-user"></i>
    <form:input class="form-control" type="text"  placeholder="Please Enter Name" autocomplete="off" id="name" onkeyup="validateAlpha();" style='text-transform:uppercase' name="name" path="name" maxlength="50"/>
    </div>
              
              <label id="error1" style="color: red;"/>
              <form:errors path="name" cssClass="error"/></td>
          </tr>

          <tr>
              <td class="col-sm-1"><label>Age:<span style="color:red;">*</span></label></td>
             <td class="col-sm-2"><form:input type="number" placeholder="Please Select Age" min="18" max="105" name="age" maxlength="3" autocomplete="off" path="age" onchange="validateAge();" onblur="validateAge();" class="txt4" onkeyup="return IsNumeric(event);" ondrop="return false;"  onpaste="return false;"/>
             <label id="errorAge" style="color: red;"/>
             <form:errors path="age" cssClass="error"/></td>
         </tr>
         <%-- <tr>
             <td style="text-align:center;">Pan Card/Adhar card:</td>
            <td><form:input type="text" name="idcardnumber"   maxlength="16" autocomplete="off" path="idcardnumber" onkeyup="validateIdCard();" />
            <label id="errorId" style="color: red;"/>
            <form:errors path="idcardnumber" cssClass="error"/></td>
        </tr> --%>
   	    <tr>
             <td class="col-sm-1"><label >Government  Id:</label></td>
            <td class="col-sm-2"><form action="">
				<input  type="radio" id="panId" name="govtid" value="pan" onclick="govtId();"><font color="black">Pan Card</font><br>
				<form:input type="text" id="pantxt" class="form-control"  name="idcardnumber" maxlength="10" autocomplete="off" path="idcardnumber" onkeyup="validatePan();" disabled="true" style='text-transform:uppercase' placeholder="XXXXX1234X"/><br>
  				<input type="radio" ïd="adharId"  name="govtid" value="Adhar" onclick="govtId();"><font color="black">Aadhaar Card</font><br>
  				<form:input type="text" id="adhartxt" class="form-control"  name="idcardnumber" maxlength="12" autocomplete="off" path="idcardnumber" onkeypress="return IsNumeric(event);" onkeyup="validateAdhar();" disabled="true" placeholder="12 Digit Number"/>
  				<label id="errorGovtId" style="color: red;"/>
              	<form:errors path="name" cssClass="error"/>
				</form></td>
        </tr>
        <tr>
            <td class="col-sm-1"><label>Address:<span style="color:red;">**</span></label></td>
            <td class="col-sm-2">
            <div class="left-inner-addon ">
    <i class="glyphicon glyphicon-home"></i>
    <form:input type="text" class="form-control" name="address1" placeholder="Only these ('-','.','/' & ',')Special characters are allowed to use" maxlength="35"  autocomplete="off" path="address1" style='text-transform:uppercase' onkeyup="validateAddress();"/>
    </div>
             	
            
            <label id="errorAdd" style="color: red;"/>
            <form:errors path="address1" cssClass="error"/></td>
         </tr>
         <tr>
             <td class="col-sm-1"></td>
             <td class="col-sm-2">
              <div class="left-inner-addon ">
    <i class="glyphicon glyphicon-home"></i>
    <form:input type="text" class="form-control" name="address2" placeholder="Only these ('-','.','/' & ',')Special characters are allowed to use" maxlength="35" autocomplete="off" path="address2" style='text-transform:uppercase' onkeyup="validateAddress();"/>
    </div>
             
             <label id="errorAdd2" style="color: red;"/>
             <form:errors path="address2" cssClass="error"/></td>
         </tr>
         <tr>
         <td class="col-sm-1"></td>
         <td class="col-sm-2" >
          <div class="left-inner-addon ">
    <i class="glyphicon glyphicon-home"></i>
     <form:input type="text" class="form-control" name="address3"  placeholder="Only these ('-','.','/' & ',')Special characters are allowed to use" maxlength="35" autocomplete="off" path="address3" style='text-transform:uppercase' onkeyup="validateAddress();"/>
    </div>
        
             <label id="errorAdd3" style="color: red;"/>
             <form:errors path="address3" cssClass="error"/></td>
         </tr>
		<%-- <tr>        
             <td class="col-sm-1"> <label>State:<span style="color:red;">*</span></label></td>
             <td class="col-sm-2"><form:input type="text"  name="state" maxlength="15" id="state" onkeyup="validateState();" style='text-transform:uppercase' autocomplete="off" path="state" />
             <label id="error2" style="color: red;"/>
             <form:errors path="state" cssClass="error"/></td>
              </tr> --%>
             
             <tr>
			<td class="col-sm-1"> <label>State:<span style="color:red;">*</span></label></td>
            <td class="col-sm-2">
            	<select id="dwn_State" class="form-control" name="state">
            		<option value="-1">----Please Select State----</option>
         			<option value="${state.statename}"></option>
         		</select>
         		   <label id="error2" style="color: red;"/>
             <form:errors path="state" cssClass="error"/></td>
      		</td>
         </tr>
        
         
         <tr>
              <td class="col-sm-1"> <label>City :<span style="color:red;">*</span></label></td>
              <td class="col-sm-2">
              	<select id="dwn_City" class="form-control" name="city">
            		<option value="-1">----Please Select City----</option>
         			<option value="${state.districtname}"></option>
         		 </select>
         		    <label id="error3" style="color: red;"/>
             <form:errors path="city" cssClass="error"/></td>
              
              </td>
         </tr>
         
         
         
         
           <tr>
              <td class="col-sm-1"> <label>Pin :<span style="color:red;">*</span></label></td>
              <td class="col-sm-2">
              	<select id="dwn_pin" class="form-control" name="pincode">
            		<option value="-1">----Please Select Pincode----</option>
         			<option value="${state.pincode}"></option>
         		 </select>
                 <label id="errorPin" style="color: red;"/>
             <form:errors path="pincode" cssClass="error"/></td>
              </td>
         </tr>
        <%--  <tr>
             <td class="col-sm-1"><label>Pin Code:<span style="color:red;">*</span></label></td>
             <td class="col-sm-2"><form:input type="text"   id="pincode" name="pincode"  maxlength="6" autocomplete="off" class="txt4" onkeypress="return IsNumeric(event);" onkeyup="validatePin();" ondrop="return false;"  onpaste="return false;" path="pincode" placeholder="6 Digit Number"/>
             <label id="errorPin" style="color: red;"/>
             <form:errors path="pincode" cssClass="error"/>
			  <span id="codeer" style="color: Red; display: none">Number only</span></td>
         </tr> --%>
         <tr>
             <td class="col-sm-1"><label> E-mail:</label></td>
             <td class="col-sm-2">
             <div class="left-inner-addon ">
    <i class="	glyphicon glyphicon-envelope"></i>
     <form:input type="text"  class="form-control" placeholder="Please Enter E-Mail" name="citizenEmail" maxlength="50" autocomplete="off" path="citizenEmail" onkeyup="validateEmail();" />
    </div>
            
              
            
             <label id="errorEmail" style="color: red;"/>
             <form:errors path="citizenEmail" cssClass="error"/></td>
         </tr>
         <tr>
             <td class="col-sm-1"><label>Mobile Number:</label></td>
             <td class="col-sm-2">
             
              <div class="left-inner-addon ">
    <i class=" glyphicon glyphicon-phone"></i>
     <form:input type="text"  style="height:35px;" id="mob"   name="contactNumber"  maxlength="10" autocomplete="off" class="txt4" onkeypress="return IsNumeric(event);" onkeyup="validateMob();" ondrop="return false;"  onpaste="return false;" path="contactNumber" placeholder="10 Digit Number"/>
    </div>
            
            
              <label id="errorMob" style="color: red;"/>
              <form:errors path="contactNumber" cssClass="error"/>
              </td>
         </tr>
         <tr>
             <td class="col-sm-1"><label>Landline Number:</label></td>
             <td class="col-sm-2">
             <div class="left-inner-addon ">
             <i class="glyphicon glyphicon-phone-alt"></i>
             <form:input type="text" style="height:30px" id="std" size="2" value="+91" readonly="true" name="stdcode" maxlength="3" autocomplete="off" class="txt4" onkeypress="return IsNumeric(event);"  ondrop="return false;"  onpaste="return false;" path="" />
             <form:input type="text" style="height:30px width:100px" id="citycode" size="3" name="citycode" maxlength="3" autocomplete="off" class="txt4" onkeypress="return IsNumeric(event);" onkeyup="validateLandLine();" ondrop="return false;"  onpaste="return false;" path="STDcode" placeholder="3 Digit Number"/>             
             <form:input type="text"  style="height:30px; width:400px" id="landline" size="8"  name="landlineNumber" maxlength="8" autocomplete="off" class="txt4" onkeypress="return IsNumeric(event);" onkeyup="validateLandLine();" ondrop="return false;"  onpaste="return false;" path="landLine" placeholder="8 Digit Number"/>
            </div> 
             <label id="errorLandLine" style="color: red;"/>
             <form:errors path="contactNumber"  cssClass="error"/>
			 </td>
         </tr>
         
             <tr>
                    <td class="col-sm-1"><label>Image#</label></td>
                    <td class="col-sm-2">
                       
                            <img id="captcha_id" name="imgCaptcha" src="captcha.jpg"/>
                      <a id="imgRef" href="javascript:;"
                        title="change captcha text"
                        onclick="document.getElementById('captcha_id').src = 'captcha.jpg?' + Math.random();  return false">
                            
                            <img id="img" src= "<c:url value="/resources/user/images/refresh.png"/>"/>
                            
                    </a>
                    </td>
 
                    
 
                </tr>
                 <tr >
                    <td class="col-sm-1"><label>Enter above Image text#<span style="color:red;">*</span></label></td>
                    <td class="col-sm-2">
                    <div class="left-inner-addon ">
    <i class="  glyphicon glyphicon-qrcode"></i>
    <input type="text"  class="form-control" placeholder="Please Enter Captcha Code" id="captcha" name="captcha" maxlength="6" onkeyup="validateImg();"/>
    </div>
                   
                    </td>
                </tr>
                <tr >
                    <td ><form:input type="hidden"  id="createdDate" name="createdDate" autocomplete="off" path="createdDate" onsubmit="GeneratePwd();" /></td>
                </tr>   
    </table>
    
    <br/>
<div><label style="color: red;">${message}</label></div>
							
    <br></br>
    
     <div class="form-group" style="margin-left: -500px" >
     		
              <input type="submit"   class="btn btn-primary col-sm-offset-3"  id="submit" onclick="GeneratePwd();"  value="Submit"/>
              <input type="reset"  class="btn btn-default" value="Reset" onclick="ClearAll();"/>
              <a href="<c:url value="/"/>" style="margin-left:30px;">Back to login</a>
            
     </div>
    <br></br>
    </form:form>
   
 </center>
 


</body>
 
</html>