
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">

function sessionUpdate(sessionObject,value){
	
	 var session = sessionObject;
	 var accessvalue= value;
	$.ajax({
		type : "POST" ,
		url  : "<c:url value='/user/updateSession'/>" ,
		data : {
			"session" : session	,
			"accessvalue" : accessvalue	
		},
		success : function(response) {
			if(response.flag==true){
				if(response.accessId==5){
				var url='<c:url value="/user/viewPendingComplainDetails"/>';
				window.location = url
				}
			}
			
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
	
}

</script>
<style>

body {
 font-family: "Open Sans", helvetica, arial;
 }
table{
 width: 1200px; /* Set 100% for responsive design */
 border-collapse: collapse;
 margin: 30px 0px 30px;
 background-color: #fff;
 font-size: 13px;
 }
 
table tr {
 height: 7px;
 }
table th {
 background: #3055DC;
 color: white;
 font-weight: bold;
 font-size: 15px;
}
table td, th {
 padding: 4px 4px 4px 8px;
 border: 1px solid #ccc;
}
 
/* CSS3 Zebra Striping */
table tr:nth-of-type(odd) {
 background: #eee;
}
 
/* Automatic Serial Number Row */
.css-serial {
 counter-reset: serial-number; /* Set the serial number counter to 0 */
}
.css-serial td:first-child:before {
 counter-increment: serial-number; /* Increment the serial number counter */
 content: counter(serial-number); /* Display the counter */
}
tbody {
        /* Just for the demo          */
    overflow-y: auto;    /* Trigger vertical scroll    */
    overflow-x: hidden;  /* Hide the horizontal scroll */
}
	
</style>


</head>

<body id="page2">


<form name="myform" id="myform" method="POST" action="" >

<!--==============================content================================-->
<section id="content">
  <div class="main">
    <div class="wrapper">
     
     	<article class="col-1">
						<div class="inner-text"
							style="width: 300%; background-color: rgb(231, 243, 255); color: #0E0D01;">
							Welcome: ${loginId} <br /> <small></small>
						</div>


					</article>
      <div style="width: 450px; height: auto;">
	  
<table class="css-serial" >
<thead>
<tr>
 <th><strong>Sr.No</strong></th>
 <th><strong>Organization</strong></th>
 <th><strong>Reference Number</strong></th>
  <th><strong>Received From Employee</strong></th>
   <th><strong>Created Date</strong></th>
    <th><strong>Received Date</strong></th>
    <th><strong>Roll Type</strong></th>
</thead>


      <tbody>
<c:forEach items="${allDiary}" var="complain">
<tr>
 <td align="center">&nbsp;</td><!-- Intentionally left blank 1st td -->
 <td align="center"<%--  onclick="sessionUpdate('complainNumber_${complain.complainNo}','5');" --%>><a href="#" style="text-decoration:none; color:#10184E">${complain.organizationName}</a></td>
 <td align="center"><a href="#" style="text-decoration:none; color:#10184E">${complain.complaint}</a></td>
 <td align="center"><a href="#" style="text-decoration:none; color:#10184E">${complain.recipientName}</a></td>
<%--  <td align="center"><a href="<c:url value="/user/viewPendingComplainDetails/${complain	.complainNo}"/>" style="text-decoration:none; color:#10184E">${complain.complaindate}</a></td> --%>
  <td align="center"><a href="#" style="text-decoration:none; color:#10184E">${complain.complaindate}</a></td>
 <td align="center"><a href="#" style="text-decoration:none; color:#10184E">${complain.createdDate}</a></td>
 <td align="center"><a href="#" style="text-decoration:none; color:#10184E">${complain.rollType}</a></td> 
</tr>   
   
    </c:forEach>
    </tbody>
</table>
</div>
</div>
                   </div>
</section>

</form>
</body>


</html>