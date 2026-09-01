<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel='stylesheet' type='text/css' href="<c:url value="/resources/user/css/datePicker.css" />"/>
<script type="text/javascript" src="<c:url value="/resources/user/js/datePicker.js" />"></script>


<script type="text/javascript">

$(document).ready(function(){
				
				$("#complainDate").datepicker({ 
					changeMonth: true,
			        changeYear: true,
					dateFormat: 'dd-mm-yy',
					maxDate: "now"});
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
     width: 250px;
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
 <script type="text/javascript">
 
 
 function formSubmit(){
		var check=true;
		var org=document.getElementById("orgCode_id").value;
		var complaint=$('input[name=complaintType]:checked', '#myform').val();
		if((org==-1)|| complaint=="" || complaint==null)
		{
			alert("Please select Organization and Complaint Type.");
			check=false;
		}
		else{check=true;}
			if(check)
			{
				 $('#myform').submit();
			}
		}

 
 		
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
		});
	
	
	
	$('#s_org').on('change', function() {
		var orgId = $("#s_org option:selected").val();
		
		$.ajax({
			url : "<c:url value='/branchByOrgination'/>",
			type : "POST",
			data : {
				"orgId" : orgId
			},
			success : function(data) {
				$('#section_id').empty();
				$('#orgCode_id').empty();
				$.each(data, function(key, value) {
					$('#section_id').append("<option value='" + value.orgSection + "'>" + value.orgSection + "</option>");
					$('#orgCode_id').append("<option value='" + value.organisationCode + "'>" + value.organisationCode + "</option>");
				});
			
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

	});
	});
	
	
	function complaintFiled()
	{
		$("input[name=actionTaken][value='Filed']").prop("checked",true);	
		$("input[name=actionTaken][value='SentforScan']").prop("disabled",true);
		for (var i = 0; i < document.myform.ActionTaken.length; i++) {
			if (document.myform.ActionTaken[i].checked) {
				var radiomenu = document.myform.ActionTaken[i]

				if (radiomenu.value == "SentforScan") {

					document.getElementById('selectTemp118').style.display = 'block';

				} else {
					$(".fileuploader").empty();
					$('#viewer').attr('src',"");
					$("input[name=documentStatus][value='Fully']").prop("checked",false);
					$("input[name=documentStatus][value='Partially']").prop("checked",false);					
					document.getElementById('selectTemp118').style.display = 'none';
				}
			}
		}
	}
	function complaintSigned()
	{
			
		$("input[name=actionTaken][value='SentforScan']").prop("disabled",false);
	}
</script>
<SCRIPT TYPE="text/javascript">
	var count = "1";
	function addRow(in_tbl_name) {

		 if (count>2)
		  {
		  alert("Not more than 1");
		  }
	  else{
		var tbody = document.getElementById(in_tbl_name).getElementsByTagName(
				"TBODY")[0];

		var row = document.createElement("TR");

		var td1 = document.createElement("TD");
		var strHtml1 = "Complainee Name :<input type='text' name='moreOraganization' SIZE='30' MAXLENGTH='30'  STYLE='height:24;border: 1 solid;margin:0;' onblur='complianData(this.value);'> <br/>&nbsp; ";
		td1.innerHTML = strHtml1.replace(/!count!/g, count);

		var td2 = document.createElement("TD");
		var strHtml2 = "Designation :<input type='text' name='moreDesiganation' onblur='descriptionData(this.value)' SIZE='30' MAXLENGTH='30' STYLE='height:24;border: 1 solid;margin:0;'>";
		td2.innerHTML = strHtml2.replace(/!count!/g, count);

		row.appendChild(td1);
		row.appendChild(td2);

		count = parseInt(count) + 1;
		tbody.appendChild(row);
		count++;
	  }

	}
	function delRow() {
		var current = window.event.srcElement;
		//here we will delete the line
		while ((current = current.parentElement) && current.tagName != "TR")
			;
		current.parentElement.removeChild(current);
	}
</SCRIPT>

<!--==============================whether fast track hide show=================================-->
<script type="text/javascript">
	function hideShow12() {

		for (var i = 0; i < document.myform.Fast_Track.length; i++) {
			if (document.myform.Fast_Track[i].checked) {
				var radiomenu = document.myform.Fast_Track[i]

				if (radiomenu.value == "Yes") {

					document.getElementById('selectTemp18').style.display = 'block';

				} else {
					document.getElementById('selectTemp18').style.display = 'none';
				}
			}
		}
	}
</script>

<!--==============================Action Taken hide show=================================-->
<script type="text/javascript">
	function hideShow112() {

		for (var i = 0; i < document.myform.ActionTaken.length; i++) {
			if (document.myform.ActionTaken[i].checked) {
				var radiomenu = document.myform.ActionTaken[i]

				if (radiomenu.value == "SentforScan") {

					document.getElementById('selectTemp118').style.display = 'block';

				} else {
					document.getElementById('selectTemp118').style.display = 'none';
				}
			}
		}
	}
</script>
<!-- Phone Number validation -->
<script type="text/javascript">
	var specialKeys = new Array();
	specialKeys.push(8); //Backspace
	function IsNumeric(e) {
		var keyCode = e.which ? e.which : e.keyCode
		var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys
				.indexOf(keyCode) != -1);
		document.getElementById("error").style.display = ret ? "none"
				: "inline";
		return ret;
	}
</script>

<script type="text/javascript">
	var specialKeys = new Array();
	specialKeys.push(8); //Backspace
	function IsNumeric1(e) {
		var keyCode = e.which ? e.which : e.keyCode
		var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys
				.indexOf(keyCode) != -1);
		document.getElementById("error1").style.display = ret ? "none"
				: "inline";
		return ret;
	}
</script>
<!--==============================Drop Down=================================-->



<c:url var="myurl" value="/user/updateDiaryDetails"/>
	<form:form name="myform" id="myform" method="post" action="${myurl}" enctype="multipart/form-data" commandName="userForm">
		
		<!--==============================content================================-->

		<section id="content">
			<div class="main">
				<div class="wrapper">
					<div align="center"><label style="color: red; ">
												        <c:out  value='${errMessage}' />
												        </label></div>
					<article class="col-1">
						<div class="inner-text"
							style="width: 300%; background-color: rgb(231, 243, 255); color: #0E0D01;">
							Welcome: ${loginId} <br /> <small></small>
						</div>


						<div class="fleft"
							style="width: 680px; height: 670px; background-color: #56595D">
							<iframe id="viewer" width="680px"
								height="670px"> </iframe>
						</div>

					</article>
					<article class="fright">

						<div class="fright">
							<div class="fright">
								<div align=""
									style="width: 515px; background-color: rgb(218, 237, 241); color: #0E0D01;">
									<h3>
										Complaint Cell
										<div class="fright"></div>
									</h3>
								</div>

								<div align="center"
									style="background-color: rgb(255, 201, 167); color: #0E0D01;"></div>

								<div style="width: 500px; height: 600px;">
									

										<div class="form-group">
											<label>&nbsp;Date of Complaint </label>
											<div class="form-list">
												<input id="complainDate" name="complainDate" size="20"  placeholder="dd-mm-yyyy" readonly="readonly"/>
												&nbsp;&nbsp;&nbsp;<%-- <img
													src="<c:url value="/resources/user/images/cal/cal.gif"/>"
													border="0"
													onclick="displayCalendar(document.myform.complainDate,'dd-mm-yyyy',this);" />  --%>
													<form:errors path="complainDate" cssClass="error"></form:errors>
											</div>
										</div>
										<br>
										
										 <div class="form-group">
											<label>&nbsp;Complaint Sent from: </label>
											<div class="form-list">
												<select name="complaintSentType">
												<option value="">--Select--</option>
												<option value="Citizen">Citizen</option>
												<option value="Member Of Parliament">Member of Parliament</option>
												<option value="PMO">PMO</option>
												<option value="MPs">MPs</option>
												<option value="MLA">MLA</option>
												<option value="VIPs">VIPs</option>
												</select>
											</div>
										</div>
										<br> 

										<div class="form-group">
											<label>&nbsp;Sender's Name </label>
											<div class="form-list">
												<form:input size="25" type="text" path="senderName" name="senderName" class="input-field"/>
												<form:errors path="senderName" cssClass="error"/>
											</div>
										</div><br>
										<div class="form-group">
											<label>&nbsp;Address </label>
											<div class="form-list">
												<form:input size="25" type="text" name="address" path="address"/>
												<form:errors path="address" cssClass="error"/>
											</div>
										</div><br>

										<div class="form-group">
											<label></label>
											<div class="form-list">
												<form:input size="25" type="text" name="address2" path="address2"/>
												<form:errors path="address2" cssClass="error"/>
											</div>
										</div>
										<br><br>

										<div class="form-group">
											<label>&nbsp;City</label>
											<div class="form-list">
												<form:input size="25" type="text" name="city" path="city"/>
												<form:errors path="city" cssClass="error"/>
											</div>
										</div><br>

										<div class="form-group">
											<label>&nbsp;State</label>
											<div class="form-list">
												<form:input size="25" type="text" name="state" path="state"/>
												<form:errors path="state" cssClass="error"/>
											</div>
										</div><br>

										<div class="form-group">
											<label>&nbsp;Pin code</label>
											<div class="form-list">
												<input size="25" type="text" id="pinno" name="pinno"  maxlength="6"
													class="txt4"/>
													 <span
													id="error1" style="color: Red; ">(Number
													only)</span>
											</div>
										</div><br><br><br><br>


										<div class="form-group">
											<label>&nbsp;E-mail </label>
											<div class="form-list">
												<form:input size="25" type="text" name="email" path="email"/>
												<form:errors path="email" cssClass="error"/>
											</div>
										</div><br>
										<div class="form-group">
											<label>&nbsp;Mobile Number </label>
											<div class="form-list">
												<form:input size="25" type="text" id="mobileNo" name="mobileNo" path="mobileNo" maxlength="10"
													class="txt4"/>
													<form:errors path="mobileNo" cssClass="error"/>  <span
													id="error2" style="color: Red; ">(Number
													only)</span>
											</div>
										</div><br><br><br>
										<table border="0" id="tblPets">
											<tr>


												<div class="form-group">
													<label>&nbsp;Complainee Name </label>
													<div class="form-list">
														<form:input size="25" type="text" name="complaintAgainstName" path="complaintAgainstName"
															onblur="complianData(this.value)"/>
															<form:errors path="complaintAgainstName" cssClass="error"/>
													</div>
												</div><br>
											</tr>
											<tr>
												<div class="form-group">
													<label>&nbsp;Designation </label>
													<div class="form-list">
														<form:input size="25" type="text" name="designation" path="designation"
															onblur="descriptionData(this.value)"/>
															<form:errors path="designation" cssClass="error"/>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<button type="Button" onclick="addRow('tblPets')"
															value="Add More" class="button-2">Add more</button>
													</div>
												</div><br>
											</tr>

											<tr>
											
											</tr>




										</table>
										<br><br>

										<div class="form-group">
											<label>&nbsp;Organization </label>
											
											<div class="form-list">
											
											 <form:select class="form-control select2" id="s_org" path="organization" name="organization" style="width:300px;">
								<form:option value="NONE" selected="selected">Select Organization</form:option>
								<c:forEach var="organisation" items="${mapOfOrganisation}">
									<form:option value='${organisation.organisationName}'>${organisation.organisationName}</form:option>
								</c:forEach>
							</form:select>
							<form:errors path="organization" cssClass="error"/>
												

											</div>
										</div><br>
										<div class="form-group">
											<label>&nbsp;Branch </label>

											<div class="form-list">
												<div id='Section'>
													<select id="section_id" name="section"><option value='-1'></option>


													</select>
												</div>

											</div>

										</div><br>
										
										<div class="form-group">

											<div class="form-list">
												<div id='orgCode' style="display: none;">
													<select id="orgCode_id" name="organisationCode"><option value='-1'></option>


													</select>
												</div>

											</div>

										</div><br><br>




										<div class="form-group">
											<label>&nbsp;Whether Fast Track</label>

											<div class="form-list">
												&nbsp; <input type="radio" id="Fast_Track"
													name="whetherFastTrack" value="Yes" onclick="hideShow12()">Yes
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
													id="Fast_Track" name="whetherFastTrack" value="No"
													onclick="hideShow12()" checked>No&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

												<div style="display: none; border: 0;" id="selectTemp18">
													<select name="" style="width: 100px">
														<option>Select</option>
														<option>BSNL</option>
														<option>CENTERAL BOARD OF EXCISE AND CUSTOMS</option>
													</select>
												</div>
											</div>
											<br></br>
										</div><br>


										<div class="form-group">
											<label>&nbsp;Complaint Type </label>
											<div class="form-list">
												<form:radiobutton  name="complaintType" value="Anonymous" path="complaintType" onclick="complaintFiled();"
													/>Anonymous&nbsp; <form:radiobutton 
													name="complaintType" value="Pseudonymous" path="complaintType" onclick="complaintFiled();"/>Pseudonymous
												&nbsp; <form:radiobutton name="complaintType" path="complaintType" onclick="complaintSigned();"
													value="Signed"/>Signed
													<form:errors path="complaintType" cssClass="error"></form:errors>
											</div>
										</div><br>
										<div class="form-group">
											<label>&nbsp;Action Taken </label>
											<div class="form-list">
												<input type="radio" name="actionTaken" id="ActionTaken"
													value="Filed" checked onclick="hideShow112()">Filed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="actionTaken" id="ActionTaken"
													value="SentforScan" onclick="hideShow112()">Sent
												for Scan

											</div>
										</div><br>



										<div style="display: none; border: 0;" id="selectTemp118">

											<div class="form-group">
												<label>Upload Document </label>
												<div class="form-list">

													<input class="fileuploader" name="uploadScanDocument"
														type="file" id="i_docupload" />  <br />
														
														 <input type="button" value="Preview" onclick="PreviewImage();" /> 
													<!-- <div id="upload" style="display: none;">Uploading..</div>
													<div id="message"></div> -->
												</div>
											</div><br>


											<div class="form-group">
												<label> </label>
												<div class="form-list">
													<input type="radio" name="documentStatus" value="Fully">Fully
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
														name="documentStatus" value="Partially">Partially
												</div>
											</div><br>
														 <input type="hidden"	name="csrf"	value="${_csrf.token}"/>

										</div>
										 <br> <br>

										<div class="form-group" align="right">
											<label><button type="button" class="button-2" onclick="formSubmit();"
													name="save" >Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
											<div class="form-list" align="left">
											
												<a href="<c:url value="/user/dairy/addDairyComplain"/>">
												<button type="button" class="button-2"  data-toggle="modal"
													data-target="#myModal" >Close
													without Saving</button></a>
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
