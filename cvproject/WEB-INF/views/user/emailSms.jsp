<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Email/SMS</title>
<script src="<c:url value="/resources/user/tinymce/tinymce.min.js"/>"  type="text/javascript"></script>

<script>
//var j = jQuery.noConflict();
$(function() {
	//Initialize Select2 Elements
	$('.select2').select2(			{
				placeholder : {
					text: 'Select Role'
				  },
				allowClear : true
			});
	
	$("#recepientListTbl").DataTable({
		"bLengthChange": false,
		"lengthMenu":[[20],[20]],
		"oLanguage": {
						"sEmptyTable": "No Data Found!"
					},
		"ordering": false,
		"bInfo": false,
		"scrollY":        "690px",
        "scrollCollapse": true,
	    "paging":         false,
	});
	
	
        
});

tinymce.init(
		{
			selector:'textarea.emailTextArea',
			branding: false,
			height : 400,
			resize:false,
			menubar:false,
			theme: 'modern',
			elementpath: false,
			plugins: "advlist lists charactercount  spellchecker searchreplace textcolor print preview link",
			toolbar:"cut copy paste undo redo subscript superscript spellchecker  forecolor backcolor quicktable searchreplace underline | strikethrough fontselect fontsizeselect  | bold italic | link image alignleft aligncenter alignright numlist bullist print preview",
			save_onsavecallback: function () { ajaxSave(); },
			target_list: [			              
			              {title: 'New page', value: '_blank'},
			              {title: 'LIghtbox', value: '_lightbox'}
			            ],
			link_title: false,
		}
);

function loadRecepientList() {
	var userRole = $("#userRole").val();
	
	//alert(varArray);
	var urlParam = "roleType="+userRole;
	<c:url var="url" value="/admin/getRecepientList"></c:url>
	 $.ajax({
		type : "POST",
		url : "${url}",
		data : urlParam,
		dataType : 'json',
		timeout : 100000,
		success : function(response) {
			console.log(response);
			$('#recepientListTbl tbody').remove();
			$.each(response, function(index, value) {
				//console.log(value["name"]);
				//myTable.rows.add(value["name"],value["org"],value["designation"],value["emailId"],value["mobileNumber"]).draw();
				$('#recepientListTbl').append('<tr><td><input type="checkbox" id="CheckBox['+index+']" class="chkbox" onchange="checkBoxCheckedAll()"/></td><td>'+value["name"]+'</td><td>'+value["org"]+'</td><td>'+value["designation"]+'</td><td>'+value["emailId"]+'</td><td>'+value["mobileNumber"]+'</td></tr>');
				});
			var table = $('#recepientListTbl').DataTable();
			table.destroy();
			drawTable();
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	}); 
	 
	
}

function drawTable()
{
	$("#recepientListTbl").DataTable({
		"bLengthChange": false,
		"lengthMenu":[[20],[20]],
		"oLanguage": {
						"sEmptyTable": "No Data Found!"
					},
		"ordering": false,
		"bInfo": false,
		"scrollY":        "690px",
        "scrollCollapse": true,
	    "paging":         false,
	    "stripeClasses": [ 'odd-row', 'even-row' ]
	});
}
function check_uncheck_checkbox(isChecked) {
	    if(isChecked) {
	    	$('input[class="chkbox"]').each(function() { 
	            this.checked = true; 
	        });
	    } else {
	    	$('input[class="chkbox"]').each(function() {
	            this.checked = false;
	        });
	    }
	    checkBoxCheckedAll();
	}
	
	function checkBoxCheckedAll()
	{
		//console.log(obj);
		var data = "";
		if($('#Email').is(':checked'))
			{
				//alert("Email");
				$("table tr:has(:checkbox:checked) td:nth-child(5)").each(function() {
				    if($(this).text().trim()!='E-mail' && $(this).text().trim()!='Mobile No.')
					data += $(this).text().trim()+",";
				});
			}
		if($('#SMS').is(':checked'))
		{
			//alert("SMS");
			$("table tr:has(:checkbox:checked) td:nth-child(6)").each(function() {
			    if($(this).text().trim()!='E-mail' && $(this).text().trim()!='Mobile No.')
				data += $(this).text().trim()+",";
			});
		}
		$("#contactData").val("");
		$("#contactData").val(data);
	}		
	
	function checkFileExtension(fileName)
	{		
		var ext = fileName.val().split('.').pop().toLowerCase();
		//Allowed file types
		if($.inArray(ext, ['gif','png','jpg','jpeg', 'pdf']) == -1) {
		alert('The file type is invalid for file'+fileName);
		return false;
		}
		return true;
	}
	
	
	function checkData()
	{
		 var fp = $("#emailFile");
         var lg = fp[0].files.length; // get length
         var items = fp[0].files;
         var fileSize = 0;
         if(!$('#Email').is(':checked'))
        	 {
        	 if(!$('#SMS').is(':checked'))
        		 {
        		 	alert("Please Select E-mail or SMS you want to send!! ");
        		 	return false;
        		 }
        	 }
         //alert($('#contactData').val().trim().length);
         if($('#contactData').val().trim().length==0)
        	 {
	        	 alert("Please select at least one contact!!");
	        	 return false;
        	 }
         if($('#Email').is(':checked'))
       	 {
	         if($('#subject').val().trim().length==0)
	        	 {
	        	 	alert("Please provide email Subject");
	        	 	return false;
	        	 }
		}
        if($('#SMS').is(':checked'))
       	 {
       	   var smsContentLength = $('#messageContent').val();
       	   if(smsContentLength.length()>500)
       		   {
       		   	alert("Message for SMS should be less than 500 character!!");
       		   	return false;
       		   }
       	 }
     if (lg > 0) {
         for (var i = 0; i < lg; i++) {
        	 if(!checkFileExtension(items[i].value))
        		 {
        		 return false;
        		 }
             fileSize = fileSize+items[i].size; // get file size
         }
         if(fileSize > 15728640) {
              alert('File size must not be more than 15 MB');
              $('#fUpload').val('');
         }
     }
	
	}
</script>

<style>
tr:nth-child(even) {
background-color: #e6fff7;
}
</style>

</head>
<body>
<c:url var="url" value="/admin/sendEmailSMS"></c:url>
<form action="${url}" method="post" enctype="multipart/form-data">
<center>
<div style="width:1200px;min-height:800px;">
	<c:if test="${msg!='' }">
		<div style="background-color: red;color:white">
			<c:out value="${msg}"></c:out>
		</div>
	</c:if>
	<div style="padding:10px;background-color: rgb(0,128,0 );margin:auto;" >
		<select name="userRole" id="userRole" class="select2" style="width:400px;float:left;margin:auto;" multiple="multiple" >
			<c:forEach items="${roleTypeList}" var="roleList">
				<option value="${roleList }"><c:out value="${roleList}"/></option>
			</c:forEach>
		</select>
			<lable style="color:white;font-weight:bold">Email</lable><input type="radio" value="Email" id="Email" name="communicationType"/>&nbsp;&nbsp;<lable style="color:white;font-weight:bold">SMS</lable><input type="radio" value="SMS" name="communicationType" id="SMS"/>			
			<input type="button" value="Go" style="width:50px;height:30px;" onclick="loadRecepientList()"/>
	</div>
	<hr>
	<div style="min-height:200px;width:100%;background-color: #f2f2f2">
		<table id="recepientListTbl" border="1" class="table table-striped table-bordered">
			<thead>
				<tr>
					<td align="left">
						<input type="checkbox" value="All" name="allCheckBox" id="allCheckBox" onClick="check_uncheck_checkbox(this.checked);"/>
					</td>	
					<td>
						Name
					</td>
					<td>
						Organization
					</td>
					<td>
						Designation
					</td>
					<td>
						E-mail
					</td>
					<td>
						Mobile No.
					</td>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
	</div>
	<hr>
	<div style="width:100%;text-align: center;">
		<label>Selected Email Id's/ Mobile Number</lable><label style="color:blue;">&nbsp;&nbsp;(Please add Email id or Mobile no. with <i style="color:red">","</i> if not in above list)</label>
	</div>		
		<textarea rows="10" cols="100" style="resize:none;width:100%;" name="contactData" id="contactData"></textarea>
	<div style="width:100%;text-align: center;height:50px;">
		<label>Subject</label><input name="subject" id="subject" style="width:100%;height:90%;">
	</div>	
	<div style="width:100%;text-align: center;margin-top:20px;">
		<label>Message</label>
	</div>		
		<textarea rows="10" cols="100" style="resize:none;width:100%;" class="emailTextArea" name="messageContent" id="messageContent"></textarea>
		<lable  style="color:blue;">Attachment for Email (if any)</lable><input type="file" name="emailFile" id="emailFile" multiple>
	<div style="width:100%;text-align: center;">
		<input type="submit"  value="send" onclick="return checkData()"/>
		<input type="hidden"	name="csrf"	value="${_csrf.token}"/>
	</div>	
</div>
<hr style="margin-bottom: 100px;">
</center>
</form>
</body>
</html>