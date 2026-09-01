
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

function sessionUpdate(sessionObject,value){
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
				}
				else if(response.accessId==2){
					var anchorValue='window.open("<c:url value="/user/allDetails"/>","nyWindow","width=600,Height=400,top=100,left=400");';
				 	$('#allDetails').attr('onclick', anchorValue);
				 	$('#allDetails').trigger( "click" );
				}
				else if(response.accessId==3){
					
				}else if(response.accessId==5){
					var url='<c:url value="/user/closedComplain"/>';
					window.location = url
				}
				else if(response.accessId==8){
					var url='<c:url value="/user/rti"/>';
					window.location = url
				}
				
				else if(response.accessId==9){
					var anchorValue='window.open("<c:url value="/user/allNotingDetails/rtidh"/>","nyWindow","width=600,Height=400,top=100,left=400");';
				 	$('#allNoting').attr('onclick', anchorValue);
				 	$('#allNoting').trigger( "click" );
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

 <script>

 function myFunction4(comNo)
 {
 	sessionUpdate('complainNumber_'+comNo,'4');
 	var anchorValue='window.open("<c:url value="/user/acknowledgement"/>","nyWindow","width=600,Height=400,top=100,left=400");';
 	$('#naAck').attr('onclick', anchorValue);
 	$('#naAck').trigger( "click" );

 }
 
 function myFunction412(comNo)
 {
 	sessionUpdate('complainNumber_'+comNo,'4');
 	var anchorValue='window.open("<c:url value="/user/acknowledgementFiled"/>","nyWindow","width=600,Height=400,top=100,left=400");';
 	$('#filedAck').attr('onclick', anchorValue);
 	$('#filedAck').trigger( "click" );

 }
 function myFunction41(comNo)
 {
 	sessionUpdate('complainNumber_'+comNo,'4');
 	var anchorValue='window.open("<c:url value="/user/cvcOm"/>","nyWindow","width=600,Height=400,top=100,left=400");';
 	$('#naOm').attr('onclick', anchorValue);
 	$('#naOm').trigger( "click" );

 }

</script>

 
<script>

function formSubmit() {
    document.getElementById("logoutForm").submit();
}

</script>









<body id="page2">
<%-- <c:url var="logoutUrl" value="/user/j_spring_security_logout"></c:url>     

<form action="${logoutUrl}" method="post" id="logoutForm"> --%>
    <input type="hidden" name="${_csrf.parameterName}"     value="${_csrf.token}" />


<!--==============================header=================================-->

<!--==============================content================================-->

<form name="myform" id="myform" method="post" action="" >
<section id="content">
  <div class="main">
    <div class="wrapper">
      <article class="col-1">
         <div class="inner-text" style="width:250%;  color: #0E0D01;"> Login : &nbsp;${loginId}<br/>
         <div class="inner-text" style="width:250%;  color: #0E0D01;">  &nbsp; <a href="<c:url value="/user/search"/>">Go Back</a><br/>
            <small> </small> </div>
      </article>
      <article class="center">
      <br></br>  
       <div style="width: 900px; color: navy; background-color: #f3f3f3; border: 2px solid #3a8aff; border-radius: 25px; height: 2090px; 
       padding-left: 14cm; padding: 5px;margin-left: 231px;  border-left-width: 2px; border-top-width: 2px;  ">
       <br></br>
 
 
    
	<div align="right">
         <input type="button" value="Print" onclick="window.print()" />
   </div> 
   <c:forEach items="${getrtiComplain}" var="complain">
   <table>
   								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Date of Complaint </label></td>
										<td><div class="form-list" style="padding-left: 4cm;">
											${complain.complainDate}
										</div></td>
								</div> </tr>
  
   								
   								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Complaint Sent from: </label></td>
										<td><div class="form-list" >
											${complain.complaintSentType}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Sender's Name </label></td>
										<td><div class="form-list" >
											${complain.senderName}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Address :</label></td>
										<td><div class="form-list">
											${complain.address},${complain.address2},${complain.city}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;City</label></td>
									<td><div class="form-list" >
											${complain.city}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;State</label></td>
									<td><div class="form-list">
											${complain.state}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Pin No.</label></td>
									<td><div class="form-list">
											${complain.pinno}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;E-mail :</label></td>
									<td><div class="form-list">
											${complain.email}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Mobile Number : </label></td>
									<td><div class="form-list">
											${complain.mobileNo}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Complainee Name: </label></td>
									<td><div class="form-list">
											${complain.complaintAgainstName}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Designation :</label></td>
									<td><div class="form-list">
											${complain.designation}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Organization :</label></td>
									<td><div class="form-list">
											${complain.organization}

										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Branch :</label></td>
									<td><div class="form-list">
											${complain.section}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Whether Fast Track:</label></td>
										<td><div class="form-list">
											${complain.whetherFastTrack}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Complaint Type :</label></td>
										<td><div class="form-list">
											${complain.complaintType}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Action Taken: </label></td>
										<td><div class="form-list">
											${complain.actionTaken},
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Uploaded Document :</label></td>
										<td><div class="form-list">
										<c:if test="${complain.fileId!=''}">
								            <a style="color:blue;"  onclick="window.open('<c:url value='/uploadDoc/${complain.fileId}'/>','nyWindow','width=600,Height=400,top=100,left=400');">Click Here</a>
	                                     </c:if>
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Detail of Allegation :</label></td>
										<td><%-- <div class="form-list">
											${complain.detailsAlligations}
										</div> --%>
										    <c:choose>
         										<c:when test="${complain.detailsAlligations == null}">
           										<p>No Allegation Provided.</p>
         										</c:when>
         
         										<c:otherwise>
         										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      												<a style="color:blue;"  onclick="window.open('<c:url value='/user/AllegationDetail'/>','nyWindow','width=600,Height=400,top=100,left=400');">
             										Click Here</a>
         										</c:otherwise>
      									</c:choose>
										
										
										
										</td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Complaint No.: </label></td>
										<td><div class="form-list" >
											<font style="color: red;"><b>${complain.complaint}</b></font>
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp; BO name:</label></td>
										<td><div class="form-list">
											${complain.boName}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Gist of allegation :</label></td>
										<td><div class="form-list">
											${complain.gistOfAllegation}
										</div></td>
								</div></tr>
								
							
								
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Bo's Decision : &nbsp;</label></td>
										<td><div class="form-list">
											${complain.boirfinaldec}
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Currently Lying in commission : &nbsp;</label></td>
										<td><div class="form-list">
											${complain.dairyStatus}
										</div></td>
								</div></tr>
								
								
								
								
		</table>						
	
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>

	<p align="center">All Basic Information:&nbsp;&nbsp;<a  id="allDetails"></a>  <a style="color:red;" href="javascript:sessionUpdate('complainNumber_${complaintnumber}','2')"> Click Here </a></p>
	
    <%-- <p align="center">Download Office Memorandum:&nbsp;&nbsp;<a id="naOm"></a><a style="color:red;" href="javascript:myFunction41(${complaintnumber});"> Click Here </a></p>  
   --%>
   
   <c:if test="${complain.boirfinaldec == 'Filed'}">
  	
  	 </c:if>
  	 <c:if test="${complain.boirfinaldec == 'NA'}">
  	<p align="center">Download Office Memorandum:&nbsp;&nbsp;<a id="naOm"></a><a style="color:red;" href="javascript:myFunction41(${complaintnumber});"> Click Here </a></p>
  	 </c:if>
  	 
  	 
  	 <p align="center">Download Acknowledgement:&nbsp;&nbsp;
  	 
  	 <c:if test="${complain.boirfinaldec == 'Filed'}">
  	 <a  id="filedAck"></a> <a style="color:red;" href="javascript:myFunction412(${complaintnumber});"> Click Here </a>
  	 </c:if>
  	 <c:if test="${complain.boirfinaldec == 'NA'}">
  	 <a  id="naAck"></a> <a style="color:red;" href="javascript:myFunction4(${complaintnumber});"> Click Here </a>
  	 </c:if>
  	 
  	 </p>

	 <p align="center">Download Document Details:&nbsp;&nbsp;
	 
			<c:if test="${complain.fileId!=''}">
								            <a style="color:blue;"  onclick="window.open('<c:url value='/uploadDoc/${complain.fileId}'/>','nyWindow','width=600,Height=400,top=100,left=400');">Click Here</a>
	                                     </c:if>
</p>
	 
	 
	<p align="center">Download All Noting Details:&nbsp;&nbsp;&nbsp;&nbsp; <a id="allNoting"></a><a style="color:red;" href="javascript:sessionUpdate('${complain.complaint}','9')"> Click Here </a></p>
 </c:forEach>
</div> 



	</article>
    </div>
  </div>
</section>

<!--==============================footer=================================-->

</form>
</body>
