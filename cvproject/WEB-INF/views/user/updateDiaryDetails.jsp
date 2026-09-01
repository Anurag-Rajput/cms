<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<SCRIPT TYPE="text/javascript">
	var count = "1";

	function addRow(in_tbl_name) {
		if (count > 3) {
			alert("Not more than 2");
		} else {
			var tbody = document.getElementById(in_tbl_name)
					.getElementsByTagName("TBODY")[0];
			var row = document.createElement("TR");
			var td1 = document.createElement("TD");
			var strHtml1 = "<textarea  name='Noting'  cols='60' rows='3' STYLE='border: 1 solid;margin:0;' onblur='complianData1(this.value);'> </textarea><br/>&nbsp; ";
			td1.innerHTML = strHtml1.replace(/!count!/g, count);
			row.appendChild(td1);
			count = parseInt(count) + 1;
			tbody.appendChild(row);
			count++;

		}
		document.getElementById('field').value = count;
	}
	
	
	$(document).ready(function() {
		var email=document.getElementById('email').value;
		var mob=document.getElementById('mob').value;
		var comNo=document.getElementById('cno').value.split("/")[0];
		
		
		 if((email==null && mob==null) || (email=="" && mob=="") )
		{
			sessionUpdate('complainNumber_'+comNo,'4');
			window.open("<c:url value="/user/acknowledgementDairy"/>","nyWindow","fullscreen=yes","location=no");
		}
	});
</script>

<!--==============================content================================-->
<section id="content">
	<div class="main">
		<c:forEach items="${compaincell}" var="complain">
			<div class="wrapper">
				<form name="myform" id="myform"
					action="<c:url value="/user/dairy/addDairyComplain"/>">
					<article>
						<div class="inner-text" style="width: 300%; color: #0E0D01;">
							Welcome:${loginId} <br /> <small></small>

							<div class="fleft"
								style="width: 680px; height: 670px; background-color: #56595D">
								<c:if test="${complain.fileId!=''}">
									<%-- <embed                  
										src="<c:url value='/resources/admin/${complain.fileId}'/>"
										width="680px" height="670px"></embed> --%>
										
										<embed             
										src="<c:url value='/uploadDoc/${complain.fileId}'/>"
										width="680px" height="670px"></embed>
										
										
								</c:if>
							</div>
						</div>
					</article>
					<article class="fright">
						<div class="fright">
							<div class="fright">
								<div align="center"
									style="width: 515px; background-color: rgb(218, 237, 241); color: #0E0D01;">
									<h3>Complaint Cell</h3>
								</div>
								<div class="form-group">
									<label>&nbsp;Date of Complaint </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.complainDate}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Complaint Sent From:</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.complaintSentType}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Sender's Name:</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.senderName}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Address </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.address}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Address2 </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.address2}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;City</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.city}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;State</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.state}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Pin code</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.pinno}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;E-mail </label>
									<div class="form-list">
										<input id="email" type="text" disabled="disabled" size=20
											value="${complain.email}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Mobile Number </label>
									<div class="form-list">
										<input id="mob" type="text" disabled="disabled" size=20
											value="${complain.mobileNo}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Complainee Name </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.complaintAgainstName}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Designation </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.designation}">

									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Organization </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.organization}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Branch </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.section}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Whether Fast Track</label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.whetherFastTrack}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Complaint Type </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.complaintType}">
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Action Taken </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.actionTaken}">

									</div>
								</div>



								<div class="form-group">
									<label>Upload Document </label>
									<div class="form-list">
										<input type="text" disabled="disabled" size=20
											value="${complain.fileName}">

									</div>
								</div>
								<!-- ------------Section------------------ -->
								<div class="form-group">
									<label>&nbsp;Complaint No.</label>
									<div class="form-list" style="color: red; font-size: 110%;">
										<b> ${complainNumber}</b>
										 <input type="hidden"	id="cno"	value="${complainNumber}"/>
									</div>
								</div>
								   <input type="hidden"	name="${_csrf.parameterName}"	value="${_csrf.token}"/>
								<!--Other-->
								<br> <br>

								<div class="form-group">
									<label></label>
									<div class="form-list">
										<button type="submit" class="button-2" name="submit">Submit</button>
									</div>
								</div>
							</div>
						</div>
					</article>
				</form>
			</div>
		</c:forEach>
	</div>
</section>

