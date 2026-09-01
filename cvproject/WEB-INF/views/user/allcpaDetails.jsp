
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
				else if(response.accessId==22){
					var anchorValue='window.open("<c:url value="/user/allCPADetails"/>","nyWindow","width=600,Height=400,top=100,left=400");';
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
					var anchorValue='window.open("<c:url value="/user/allNotingDetails"/>","nyWindow","width=600,Height=400,top=100,left=400");';
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
        
            <small> </small> </div>
      </article>
      <article class="center">
      <br></br>  
       <div style="width: 750px; color: navy; background-color: #f3f3f3; border: 2px solid #fff; border-radius: 25px; height: 1540px; 
       padding-left: 10cm; padding: 5px; margin-left: 135px;  border-left-width: 2px; border-top-width: 2px; align:center; ">
       <br></br>
 
 
    
	<div align="right">
         <input type="button" value="Print" onclick="window.print()" />
   </div> 
   <c:forEach items="${getrtiComplain}" var="complain">
   <table>
   
   
   								<tr><td style="width:30%;"><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp; Complaint Number </label></td>
										<td ><div class="form-list" >
											${complain.complaint}<hr style="color:#00ffe4;">
										</div></td>
								</div> </tr>
   									
   									
   								<tr><td style="width:30%;"><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp; Complain Created </label></td>
										<td ><div class="form-list" >
											${complain.createdDate}<hr style="color:#00ffe4;">
										</div></td>
								</div> </tr>
   
   
   
   
   										
   
   
   
   								<tr><td style="width:30%;"><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Date of Complaint </label></td>
										<td ><div class="form-list" >
											${complain.complainDate}<hr style="color:#00ffe4;">
										</div></td>
								</div> </tr>
  
   								
   								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Sender's Name </label></td>
										<td><div class="form-list" >
											${complain.senderName}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Address :</label></td>
										<td><div class="form-list">
											${complain.address}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Bo Decision Date :</label></td>
										<td><div class="form-list">
											${complain.boDecisionDate}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<%-- <tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;City</label></td>
									<td><div class="form-list" >
											${complain.city}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;State</label></td>
									<td><div class="form-list">
											${complain.state}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Pin No.</label></td>
									<td><div class="form-list">
											${complain.pinno}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr> --%>
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;E-mail :</label></td>
									<td><div class="form-list">
											${complain.email}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Mobile Number : </label></td>
									<td><div class="form-list">
											${complain.mobileNo}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Complainee Name: </label></td>
									<td><div class="form-list">
											${complain.complaintAgainstName}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<%-- <tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Designation :</label></td>
									<td><div class="form-list">
											${complain.designation}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr> --%>
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Organization :</label></td>
									<td><div class="form-list">
											${complain.organization}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Ministry Name :</label></td>
									<td><div class="form-list">
											${complain.ministry_name}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Complaint Summary :</label></td>
									<td><div class="form-list">
											${complain.complaint_summary}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Complaint Description :</label></td>
									<td><div class="form-list">
											${complain.complaint_description}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								
								
								
								
								
								
								
								
								<tr><td><div class="form-group"  style="padding-left: 1cm;">
										<label>&nbsp;Branch :</label></td>
									<td><div class="form-list">
											${complain.section}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<%-- <tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Whether Fast Track:</label></td>
										<td><div class="form-list">
											${complain.whetherFastTrack}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr> --%>
								
								<%-- <tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Complaint Type :</label></td>
										<td><div class="form-list">
											${complain.complaintType}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr> --%>
								
								<%-- <tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Action Taken: </label></td>
										<td><div class="form-list">
											${complain.actionTaken}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Uploaded Document :</label></td>
										<td><div class="form-list">
										<c:if test="${complain.fileId!=''}">
								            <a style="color:blue;"  onclick="window.open('<c:url value='/resources/admin/${complain.fileId}'/>','nyWindow','width=600,Height=400,top=100,left=400');">Click Here</a>
	                                     </c:if>
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Detail of Allegation :</label></td>
										<td><div class="form-list">
											${complain.detailsAlligations}<hr style="color:#00ffe4;">
										</div></td>
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
											${complain.boName}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Gist of allegation :</label></td>
										<td><div class="form-list">
											${complain.gistOfAllegation}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr>
								
							
								
								
								<tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Bo's Decision : &nbsp;</label></td>
										<td><div class="form-list">
											${complain.boDecision}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr> --%>
								
								<%-- <tr><td><div class="form-group"  style="padding-left: 3cm;">
										<label>&nbsp;Currently Lying in commission : &nbsp;</label></td>
										<td><div class="form-list">
											${complain.dairyStatus}<hr style="color:#00ffe4;">
										</div></td>
								</div></tr> --%>
								
								
								
								
		</table>						
								
<%-- <br></br>
<br></br>
<br></br>
<br></br>
<br></br>
<br></br>								
								
								
  
<p align="center">All Basic Information:&nbsp;&nbsp;<a  id="allDetails"></a>  <a style="color:red;" href="javascript:sessionUpdate('complainNumber_${complaintnumber}','22')"> Click Here </a></p>
	
    <p align="center">Download Office Memorandum:&nbsp;&nbsp;<a id="naOm"></a><a style="color:red;" href="javascript:myFunction41(${complaintnumber});"> Click Here </a></p>  
  
  	 <p align="center">Download Acknowledgement:&nbsp;&nbsp;
  	 
  	 <c:if test="${complain.boDecision == 'Filed'}">
  	 <a  id="filedAck"></a> <a style="color:red;" href="javascript:myFunction412(${complaintnumber});"> Click Here </a>
  	 </c:if>
  	 <c:if test="${complain.boDecision == 'NA'}">
  	 <a  id="naAck"></a> <a style="color:red;" href="javascript:myFunction4(${complaintnumber});"> Click Here </a>
  	 </c:if>
  	 
  	 </p>

	 <p align="center">Download Document Details:&nbsp;&nbsp;
	 
			<c:if test="${complain.fileId!=''}">
								            <a style="color:blue;"  onclick="window.open('<c:url value='/resources/admin/${complain.fileId}'/>','nyWindow','width=600,Height=400,top=100,left=400');">Click Here</a>
	                                     </c:if>
</p>
	 
	 
	<p align="center">Download All Noting Details:&nbsp;&nbsp;&nbsp;&nbsp; <a id="allNoting"></a><a style="color:red;" href="javascript:sessionUpdate('complainNumber_${complaintnumber}','9')"> Click Here </a></p> --%>
 </c:forEach>
</div> 



	</article>
    </div>
  </div>
</section>

<!--==============================footer=================================-->

</form>
</body>
