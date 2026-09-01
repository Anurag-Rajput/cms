<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
input[type=text], select {
	height: 30px;
	width: 230px;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
   
    border-radius: 4px;
    box-sizing: border-box;
}
</style>


<body id="page2">
	<c:url var="myurl" value=""/>
	<form:form name="myform" id="myform" method="post"
		commandName="helpform" action="${myurl }">


<c:forEach items="${compaincell}" var="complain">


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
									style="width: 515px; background-color: rgb(218, 237, 241); color: #0E0D01;">
									<h3 align="center">Complaint Added Successfully. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
								</div>
								<br>
									<br>
									<div style="width: 500px; height: 600px;">
									<div class="form-group">
										 <label> Complaint Number :</label>
										<div class="form-list">
										&nbsp;&nbsp;<font color="red">${complainNumber}</font>
										</div>
									</div>
									<br>
									
								<div style="width: 500px; height: 600px;">
									<div class="form-group">
										 <label> Date of Complaint :</label>
										<div class="form-list">
										&nbsp;&nbsp;<font color="black">${complain.complainDate}</font>
										</div>
									</div>
									<br>

									<div class="form-group">
										<label> Complaint Against Name:</label>
										<div class="form-list">
										&nbsp;&nbsp;<font color="black">${complain.complaintAgainstName}</font>
										</div>
									</div>
									<br>


									<div class="form-group">
										<label> Designation:</label>
										<div class="form-list">
											&nbsp;&nbsp;<font color="black">${complain.designation}</font>
										</div>
									</div>
									
									<div class="form-group">
										<label> Organization:</label>
										<div class="form-list">
											&nbsp;&nbsp;<font color="black">${complain.organization}</font>
										</div>
									</div>
									
									<br>
									
									<div class="form-group">
										 <label>Details of Allegations:</label>
										<div class="form-list">
											&nbsp;&nbsp;
											<textarea name="detailsAlligations" readonly="readonly" > ${complain.detailsAlligations}</textarea>
										</div>
									</div>
									
									<br>
									<div class="form-group">
										 <label>Sender's Name:</label>
										<div class="form-list">
											&nbsp;&nbsp;<font color="black">${complain.senderName}</font>
										</div>
									</div>
									<br>

									<div class="form-group">
										 <label> Address:</label>
										<div class="form-list">
											&nbsp;&nbsp;<font color="black">${complain.address}<br>${complain.address2}<br>${complain.city}<br>${complain.state}-&nbsp;${complain.pinno}</font>
										</div>
									</div>
									<br>

									
									<br><br><br><br>
									
									<div class="form-group" align="center">
										<a href="<c:url value="/user/helpLine"/>">
											<button type="button" class="button-2" name="close">Submit</button>
										</a>
										
									</div>
				</div>
				
									

								</div>




							</div>

						</div>


					</article>
				</div>
			</div>
		</section>
		</c:forEach>
		<!--==============================footer=================================-->

	</form:form>
</body>
