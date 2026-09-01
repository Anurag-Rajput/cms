<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="<c:url value="/resources/user/js/sweetalert2.all.min.js"/>" type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/bootstrap.min.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/alertify.min.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/bootbox.min.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/alertify.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/jquery.validate.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/jquery.validate.min.js"/>"  type="text/javascript"></script>
 <link rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.min.css"/>"  type="text/css" ></link>
 <link rel="stylesheet" href="<c:url value="/resources/user/css/sweetalert2.min.css"/>"  type="text/css" ></link>
 <link rel="stylesheet" href="<c:url value="/resources/user/css/alertify.min.css"/>"  type="text/css" ></link>
 <link rel="stylesheet" href="<c:url value="/resources/user/css/alertify.css"/>"  type="text/css" ></link> 
 

 

<%
SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");

String complainDate = format.format(new Date());

%>
<head>
<style>
.row {
    margin: 15px;
}

.alert {
    display: none;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	var logId=$("#logintypeforciti").val();
	
	/* var email=null;
	var mob=null; */
	
	//alert(logId);
	$.ajax({
		url : "<c:url value='/getEmailPhone'/>",
		type : "POST",
		async:false,
		 data : {
			"loginvalue" : logId
		}, 
		
		success : function(data) {
			$.each(data, function(key, value) {
				//alert(data[0].citizenEmail);
			//	alert(data[0].contactNumber);
				//alert((data[0].citizenEmail=="" || data[0].citizenEmail==null) && (data[0].contactNumber=="" || data[0].contactNumber==null));
				//$('#section_id').append("<option value=" + data[0].orgSection) + ">" + data[0].orgSection + "</option>");
				if((data[0].citizenEmail=="" || data[0].citizenEmail==null) && (data[0].contactNumber=="" || data[0].contactNumber==null))
					{
				   var promptselection= bootbox.prompt({
				        title: "Please specify your Email or Mobile Number, if you require updates regarding your complaints!!",
				        inputType: 'checkbox',
				        inputOptions: [
				            {
				                text: 'Email',
				                value: '1',
				            },
				            {
				                text: 'Mobile Number',
				                value: '2',
				            }
				            
				        ],
				        callback: function (result) {
				            console.log(result);
				            if(result==null){return;}
				            setEmailMob(result);
				        }
				    });
				   
					}
				
			});
			
		},
		error : function(e) {
		console.log("ERROR: ", e);
		
		
	},
	done : function(e) {
		console.log("DONE");
	}

	});
	
	
	});
	
	
function setEmailandPhoneforCitizen(value)
{
		//alert(value);
		
		var logId=$("#logintypeforciti").val();
		$.ajax({
			url : "<c:url value='/setEmailPhone'/>",
			type : "POST",
			 data : {
				"loginvalue" : logId,
				"Email": value
			}, 
			
			success : function(data) {
				  alertify.alert("Successfully Updated").setHeader('<em> Confirmation Message</em> ');
				
			},
			error : function(e) {
			console.log("ERROR: ", e);
			
			
		},
		done : function(e) {
			console.log("DONE");
		}

		});
		
		
		
}
function setEmailMob(result)
{
	var email,mob;
	if(result[0] == '1')
	{
		var regx1=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		bootbox.prompt("Please enter your e-mail!", function(result)
		{ 
			console.log(result);
			email=result;
			if(result==null){return;}
			if(!result.match(regx1))
			{	
				bootbox.alert("Please enter correct e-mail address!");
				return false;
			}
			setEmailandPhoneforCitizen(email);
		});
	}
	
	if(result[1] == '2')
	{
		 var regx=/^([0-9]{10})+$/; 
		bootbox.prompt("Please enter your mobile number!", function(result)
				{
					console.log(result); 
					mob=result;
					if(result==null){return;}
					if(!result.match(regx))
					{	
						bootbox.alert("Please enter correct mobile number!");
						return false;
					}	
					
					setEmailandPhoneforCitizen(mob);
				});	
		
	}
	
}
	
var fileUpload=false;

$(function() {
	$(".fileuploader").change(function() {

		if (typeof (FileReader) != "undefined") {
			var regex = /^([a-zA-Z0-9()\s_\\.\-:])+(.PDF|.pdf)$/;
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
	});});
function PreviewImage() {
	 	pdffile=document.getElementById("file_field").files[0];
	    pdffile_url=URL.createObjectURL(pdffile);
	    $('#viewer').attr('src',pdffile_url); 
	}
function buttonSubmitClicked(event) {
	
	
	 if (!document.getElementById("file_field").value) {
	        event.preventDefault();
	        alertify.alert("Please choose a file!").setHeader('<em> Confirmation Message</em> ');
	        
	    } else {	
	    	 
	 var test= document.getElementById('file_field').value;
	var $progress = $('.progress');
	var $progressBar = $('.progress-bar');
	var $alert = $('.alert');
	
	var fup = document.getElementById('file_field');
	 var fileName = fup.value;
	 var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
	 pdffile=document.getElementById("file_field").files[0];
	 
	setTimeout(function() {
		
	if(!(ext=='pdf'||ext=='jpg'||ext=='jpeg'||ext=='png'))
		{
		 	alertify.alert("Please Select Valid File.", function(){
	  	  	});
		 	return false;
		}
	else if(pdffile.size>'20000000')
		{
			alertify.alert("Please Select File With Size Less Than 20mb.", function(){
  	  		});
	 		return false;
		}
		$progressBar.css('width', '10%');
	    setTimeout(function() {
	        $progressBar.css('width', '30%');
	        setTimeout(function() {
	            $progressBar.css('width', '100%');
	            setTimeout(function() {
	           if(ext=='pdf'||ext=='jpg'||ext=='jpeg'||ext=='png')
	           {
	       		 {$progressBar.css('width', '0%');}
	            	fileUpload=true;
	            	$progress.css('display', 'none');	               
	                $alert.css('display', 'block');
	                pdffile_url=URL.createObjectURL(pdffile);
	           	 	$('#viewer').attr('src',pdffile_url);
	           }	 	
	           	    
	            }, 500); // WAIT 5 milliseconds
	        }, 2000); // WAIT 2 seconds
	    }, 1000); // WAIT 1 seconds
	}, 1000); // WAIT 1 second
	
	  
}
}

/* 
function buttonSubmitClicked(event) {
    
   
} */


/* 
$(function(){
	$("#myform").submit(function(e){
		//alert("sdfsdf"); */
		
function checkblank()
{
		var test= document.getElementById("s_org").value;
		var detailedallegation=document.getElementById("txt_detailedallegation").value;
		var uploadfile= document.getElementById("file_field").value;

			if(test==-1 )
			  {		    	 
		    	 alertify.alert("Please select the organization!!", function(){
		    	  	  });
		    	 return false;
			  }
		    			
			else if (txt_detailedallegation.value.length == 0 && $('#file_field').val()=="")  
		    {   
				
				 alertify.alert("Please select either Upload or Details of allegation Option", function(){
		    		});
				
			  return false;
		   
		    }			
			 else if($('#file_field').val()!="")
			{
				 if(!fileUpload)
				 {
					 alertify.alert("Please Upload file first!!", function(){
					    });
					 return false;
				 }
				 
				 
			}
			 if((!/^([a-zA-Z0-9()\s_\\.\-:])+(.jpeg|.jpg|.png|.pdf|.PDF)$/.test($('#file_field').val())) && $('#file_field').val().length>0)
			{
				
				alertify.alert("Please remove special character from file name like[!,@,#,$,%,^,&,(,),_,+,},{,[,],-,+]", function(){
			    });
			 return false;
			} 
				 alertify.confirm("Do you really want to Submit the Complaint?!",
						  function(e){ 
							if(e)
					 		{
					 			document.forms["myform"].submit();	
					 		}
					 		
						})
				 
				 
}


function clearFields()
{
	var $progress = $('.progress');
	var $progressBar = $('.progress-bar');
	var $alert = $('.alert');
	
		setTimeout(function() {
			fileUpload=false;
			$('#viewer').attr('src',"");
			$progressBar.css('width', '0%');
			$progress.css('display', '');	               
            $alert.css('display', '');
	}, 11); 
	
}
function wordCount()
{
	$('#textarea_feedback').show();
	if(txt_detailedallegation.value.length > 0)
	 {

	 var text_max = 3000;
	    $('#textarea_feedback').html(text_max + ' characters remaining');

	    $('#txt_detailedallegation').keyup(function() {
	        var text_length = $('#txt_detailedallegation').val().length;
	        var text_remaining = text_max - text_length;

	        $('#textarea_feedback').html(text_remaining + ' characters remaining');
	    });
	 }
	}
</script>


</head>
<body>
<c:url var="myurl" value="/user/updateDiaryDetails"/>
<form:form name="myform" id="myform" method="post" 
		action="${myurl}"  commandName="userForm" enctype="multipart/form-data" >

<!--==============================content================================-->

<section id="content">
  <div class="main">
    <div class="wrapper">
    
     <div align="left"><label style="color: red; ">
      <%--   <c:out  value='${pwdError}' /> --%>
      
      
     <%--  <input type="text" id="errorfor" name="errorfor" value="${pwdError}"  /> --%>
        </div>
        <article class="col-1">
						<div class="inner-text" 
							style= width: 515%; background-color: rgb(218,237,241); color: #0E0D01; " >
							Welcome: ${loginId} <br /> <small></small>
						</div>

					</article>
          </div>
          
		<div id="main">
			<div id="left" style="float:left;">
			      <div class="wrapper" style="line-height: 1.2vh;">
    
       <div   style="width:515%; background-color: rgb(218, 237, 241); color: #0E0D01;" ><h3> Complaint Details	</h3></div>
		 
		 <div  align="center" style=" background-color: rgb(255, 201, 167); color: #0E0D01;" ></div>
		 
        <div style="width: 500px; height: 600px;">
       
        <div align="center" class="form-group">
			<label>&nbsp;Date of Complaint </label>
				<div class="form-list">
			<input name="complainDate" size="20" value="<%= complainDate %>" readonly="readonly"/>
			<form:errors path="complainDate" cssClass="error"></form:errors>
   			</div>
		</div>
		
            <div class="form-group">
              <label>&nbsp;Complaint Against Name </label>
			   <div class="form-list">
                 <form:input type="text" path="complaintAgainstName" name="complaintAgainstName" maxlength="50" placeholder="Maximum 50 Characters"/>
                 <form:errors path="complaintAgainstName" cssClass="error" > </form:errors>
			  </div>
            </div>
            
			
            <div class="form-group">
              <label>&nbsp;Designation </label>
              <div class="form-list">
              <input type="text"  name="designation" maxlength="50" placeholder="Maximum 50 Characters"/>
              <form:errors path="designation" cssClass="error"> </form:errors>
			   </div>
            </div>
									<div class="form-group">
											<label>&nbsp;Organization<font color="red">*</font> </label>
											
											<div class="form-list">
											
											 <select class="form-control"  required id="s_org"   name="organization" style="width:300px">
								<option value="-1" selected="selected">Select Organization</option>
								<c:forEach var="organisation" items="${mapOfOrganisation}">
									<option value='${organisation.organisationName}'>${organisation.organisationName}</option>
								</c:forEach>
							</select>
												

											</div>
										</div>
										
										<div class="form-group">

											<div class="form-list">
												<div id='Section'>
													<select id="section_id" name="section" style="display: none;"><option value='-1'></option>


													</select>
												</div>

											</div>

										</div>
      
    
      <br></br>
      
      		   
			<div class="form-group">
              <label>&nbsp;Details of Allegations </label>
              <label><font color="red">Max 3000 characters.</font></label>
               <div class="form-list">
             <textarea style="width: 100%;"  id= "txt_detailedallegation" name="DetailsAlligations"   rows="6" cols="150" maxlength="3000" onkeyup="wordCount();"></textarea>
             <form:errors path="DetailsAlligations" cssClass="error"> </form:errors>
			   </div>
            </div>
            <div id="textarea_feedback"></div>
           
           
           <div class="form-group">
              <label>&nbsp; </label>
               <div class="form-list">
            
			   </div>
            </div>
           
			<div class="form-group">
              <label>&nbsp; </label>
               <div class="form-list">
            
			   </div>
            </div>
			
			<div class="form-group">
              <label>&nbsp; </label>
               <div class="form-list">
            
			   </div>
            </div>
			
			<div class="form-group">
              <label>&nbsp; </label>
               <div class="form-list">
            
			   </div>
            </div>
			
			
			 <div class="form-group">
              <label>Upload Document<font color="red">*</font> </label> 
              <div class="form-list">
           
             <input type="file" id="file_field" name="uploadScanDocument"  accept="application/pdf, image/jpg, image/jpeg, image/png" /> <br />
  			
	      	
            </div> <input type="hidden"	name="csrf"	value="${_csrf.token}"/>
            <input style="height: 24px;"  class="fileuploader" type="button" id="btn_upload"	name="btn_upload"	value="Upload File" onclick="buttonSubmitClicked(event)" />
            
   
</div>
		
		<div class="row">
  <div class="progress">
  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
  </div>

  <div class="alert alert-success" role="alert" >Successfully Uploaded</div>
</div>
  	
		
        
            
            
            
            <div class="form-group" align="right">
            
             <label><button type="button" class="btn btn-info" id="save&submit" name="save&submit" value="save&submit" onclick="checkblank();">Save & Submit</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
              
			<!--  <label><button type="button" class="button-2" id="submit" name="submit" value="save" onclick="sendSubmitValue();">Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> -->
		
			  <div class="form-list" align="left">
               
	   		<button type="reset" class="btn btn-info"  name="resetSubmit" value="close" onclick="clearFields();">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   	</div>
            </div>
          
            
            
       
 </div>
        
      </div>
			
			</div>
			<div id="right" style="float:right;">
			 <article class="col-1">
						<div class="fleft"
							style="width: 70vh; height:62vh; background-color: #56595D">
							<iframe id="viewer"> </iframe>
						</div>
	</article>
			</div>
		</div>


		
		
    </div>
</section>
   
<input type="text"  id="logintypeforciti" name="logintype"
											path="logintype"  hidden="true"
											value="${loginId}">
								
</form:form>

<footer id="footer" style="position: bottom;">
	<div class="main">
		<div class="aligncenter">
			<span>Copyright &copy; <b style="color: black;">Central vigilance
					commission</b> All Rights Reserved
			</span>
		</div>
	</div>
</footer>


</body>
</html>
    