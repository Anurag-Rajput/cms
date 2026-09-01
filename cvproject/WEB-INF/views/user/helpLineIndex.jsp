<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.form-style-2 input.input-field,
input[type=text], select {
	height: 30px;
	width: 230px;
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
	-webkit-box-shadow: 11px 10px 4px #EBEBEB;
	border-radius: 5px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 3px;
	padding: 7px;
	outline: none;
}
</style>

<script>
	$(function() {
		$('#s_org').on(
				'change',
				function() {
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
								$('#section_id').append(
										"<option value='" + value.orgSection + "'>"
												+ value.orgSection
												+ "</option>");
								$('#orgCode_id').append(
										"<option value='" + value.organisationCode + "'>"
												+ value.organisationCode
												+ "</option>");
							});
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

				});

	});
</script>

<body id="page2">
	<c:url var="myurl" value="/user/help/complainAdded"/>
	<form:form name="myform" id="myform" method="post"
		commandName="helpform" action="${myurl }">





		<section id="content">
			<div class="main">
				<div class="wrapper">
					<article class="col-1">
						<div class="inner-text"
							style="width: 300%; background-color: white; color: #0E0D01;">
							Welcome: ${loginId} <br /> <small> </small>
						</div>
					</article>
					<article class="fcentre">

						<div class="fcenter">
							<div align="center">
								
								<div align=""
									style="width: 515px; height:50px; ">
									<h3 align="center">Help Line Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
								</div>
								
								<div align="center"
									style="background-color: rgb(255, 201, 167); color: #0E0D01;"></div>
									
									<c:set var="now" value="<%=new java.util.Date()%>" />
									<br>
								<div style="width: 500px; height: 600px;">
									
									
									
									
									<br>
									<div class="form-group">
										 <label>Sender's Name:</label>
										<div class="form-list">
											&nbsp;&nbsp;
											<form:input size="55" type="text" path="senderName"
												name="senderName" class="input-field"/>
											<form:errors path="senderName" cssClass="error" />
										</div>
									</div>
									<br>

									<div class="form-group">
										 <label> Address:</label>
										<div class="form-list">
											&nbsp;&nbsp;
											<form:input size="25" type="text" name="address"
												path="address" />
											<form:errors path="address" cssClass="error" />
										</div>
									</div>
									<br>

									<div class="form-group">
										<label> Address2:</label>
										<div class="form-list">
										&nbsp;&nbsp;
											<form:input size="25" type="text" name="address2"
												path="address2" />
											<form:errors path="address2" cssClass="error" />
										</div>
									</div>
									<br>

									<div class="form-group">
										<label> City:</label>
										<div class="form-list">
											&nbsp;&nbsp;
											<form:input size="25" type="text" name="city" path="city" />
											<form:errors path="city" cssClass="error" />
										</div>
									</div>
									<br>

									<div class="form-group">
										<label> State:</label>
										<div class="form-list">
											&nbsp;&nbsp;
											<form:input size="25" type="text" name="state" path="state" />
											<form:errors path="state" cssClass="error" />
										</div>
									</div>
									<br>
									<div class="form-group">
										<label>Pin code:</label>
										<div class="form-list">
											&nbsp;&nbsp;<input size="25" type="text" name="pinno"
												maxlength="6" class="txt4"
												onkeypress="return IsNumeric1(event);"
												ondrop="return false;" onpaste="return false;" /> <span
												id="error1" style="color: Red; display: none">(Number
												only)</span>

										</div>
									</div><br>

									<div class="form-group">
										<label> Mobile Number:</label>
										<div class="form-list">
											&nbsp;&nbsp;
											<form:input size="25" type="text" name="mobileNo"
												path="mobileNo" maxlength="10" class="txt4"
												onkeypress="return IsNumeric(event);" ondrop="return false;"
												onpaste="return false;" />
											<form:errors path="mobileNo" cssClass="error" />
											<span id="error" style="color: Red; display: none">(Number
												only)</span>
										</div>
									</div><br>
									<input type="hidden" name="csrf" value="${_csrf.token}" />

									<div class="form-group">
										 <label> E-mail:</label>
										<div class="form-list">
											&nbsp;&nbsp;
											<form:input size="25" type="text" name="email" path="email" />
											<form:errors path="email" cssClass="error" />

											<br>
										</div>
									</div>
									<br><br>
									

									<br><br>


									<!-- <tr>
	    <td  width="35%" align="left" valign="middle" bgcolor="#A8DAF3" class="headngblue">6.&nbsp;&nbsp;Upload Document:</td>
	    <td  align="left" bgcolor="#E8F6F9"  class="headngblue"><span class="txt">
	     &nbsp;&nbsp; <input type="file" name="uploadDocument" />
	   </td>
	</tr> -->

									<div align=""
									style="width: 515px; background-color: rgb(218, 237, 241); color: #0E0D01;">
									<h3 align="center">Complainee Details &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
								</div>
								
								<br><br>
								
									<div class="form-group">
										 <label> Date of Complaint :</label>
										<div class="form-list">
										&nbsp;&nbsp;
										<font color="red"><fmt:formatDate pattern="yyyy-MM-dd"  value="${now}" /></font>	
												
												<input type="text" name="complainDate" size="35" value="<fmt:formatDate pattern="yyyy-MM-dd"  value="${now}" />"
												style="display: none;"/>
											<form:errors path="complainDate" cssClass="error"></form:errors>
										</div>
									</div>
									<br>

									<div class="form-group">
										<label> Complaint Against Name:</label>
										<div class="form-list">
										&nbsp;&nbsp;
											<form:input size="25" type="text" path="complaintAgainstName"
												name="complaintAgainstName" />
											<form:errors path="complaintAgainstName" cssClass="error">
											</form:errors>
										</div>
									</div>
									<br>


									<div class="form-group">
										<label> Designation:</label>
										<div class="form-list">
											&nbsp;&nbsp;<input size="45" type="text" path="designation"
												name="designation" />
											<form:errors path="designation" cssClass="error">
											</form:errors>
										</div>
									</div>


									<div class="form-group"><br>
										 &nbsp;Select Organization: <font color="red">*</font>
										
											&nbsp;&nbsp;<select class="form-control select2" id="s_org"
												name="organization" style="width: 300px;">
												<option value="NONE" selected="selected">Select
													Organization</option>
												<c:forEach var="organisation" items="${mapOfOrganisation}">
													<option value='${organisation.organisationName}'>${organisation.organisationName}</option>
												</c:forEach>
											</select>
									</div>

									<div id='Section' style="display: none;">
										<select id="section_id" name="section"><option
												value='-1'></option>


										</select>
									</div>



									<div class="form-list" style="display: none;">
										<div id='orgCode'>
											<select id="orgCode_id" name="organisationCode"><option
													value='-1'></option>


											</select>
										</div>

									</div>
									<br>


									<div class="form-group">
										 <label>Details of Allegations:</label>
										<div class="form-list">
											&nbsp;&nbsp;
											<textarea name="detailsAlligations" path="detailsAlligations" maxlength="1500" rows="9" cols="35"></textarea><font color="red">Max 1500 words.</font>
											<form:errors path="detailsAlligations" cssClass="error">
											</form:errors>
										</div>
									</div>
									
									
									<br><br><br>
									<div class="form-group" align="right">
										
										<div class="form-list" align="left">
												<label><button type="submit" class="button-2"
												name="submit" value="save">Save</button></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="reset" class="button-2" name="submit"
												value="close">Reset</button>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</div>
									</div>


							</div>

							</div>

						</div>


					</article>
				</div>
			</div>
		</section>
		<!--==============================footer=================================-->

	</form:form>
</body>
