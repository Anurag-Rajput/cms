<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="../resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="../resources/user/js/dataTables.buttons.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.print.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.html5.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.flash.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/pdfmake.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jszip.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/vfs_fonts.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.dataTables.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 
<link rel='stylesheet' type='text/css' href='../resources/user/css/datePicker.css'/>
<script src="../resources/user/js/datePicker.js"></script>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 

<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>"  type="text/css" ></link> 
<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"/>"  type="text/css" ></link>  

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

						<div align="center" >
						<br>
							On Date&nbsp;<input name="onDate" placeholder="dd-mm-yyyy" id="onDate" size="10" onchange="summarySheet();"  readonly="readonly">
						</div>

<script type="text/javascript">
$(document).ready(
		function() {
			$("#onDate").datepicker({
				dateFormat: "dd-mm-yy",
				 maxDate: "now"
			});
			});

function summarySheet()
{
	var onDate=document.getElementById('onDate').value;
	
	$.ajax({
		type : "POST",
		url : "<c:url value='/user/getForwardSummary'/>",
		data : {
			"onDate" : onDate
			
		},
		success : function(data) {
			
		
		console.log("SUCCESS: ", data);
		var table=$("#forward").dataTable(
				{

					"sPaginationType" : "full_numbers",
					"bProcessing" : false,
					"bServerSide" : false,
					"destroy" : true,
					/* "bRetrieve" : false,	 */			
					"bAutoWidth" : false,		
						
					"aaData" : data,
					
					"aoColumns" : [ {

						"sTitle" : "Complaint Number",
						"mData" : "compliant",
						"className" : "dt",

					},{

						"sTitle" : "Forward To User",
						"mData" : "sentTo",
						"className" : "dt",

					}
					],
					dom : 'lBfrtip',

					buttons: [
			            'copy'
			        ]

				});
		summaryRecieved(onDate);
		summaryClosed(onDate);
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
	
	function summaryRecieved(onDate)
	{
		
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/user/getReceivedSummary'/>",
			data : {
				"onDate" : onDate
				
			},
			success : function(data1) {
				
			
			console.log("SUCCESS: ", data1);
			var table=$("#received").dataTable(
					{

						"sPaginationType" : "full_numbers",
						"bProcessing" : false,
						"bServerSide" : false,
						"destroy" : true,
						/* "bRetrieve" : false,	 */			
						"bAutoWidth" : false,		
							
						"aaData" : data1,
						
						"aoColumns" : [ {

							"sTitle" : "Complaint Number",
							"mData" : "compliant",
							"className" : "dt",

						},{

							"sTitle" : "Received From User",
							"mData" : "sentTo",
							"className" : "dt",

						}
						],
						dom : 'lBfrtip',

						buttons: [
				            'copy'
				        ]

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
	}
	
	function summaryClosed(onDate)
	{
		
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/user/getClosedSummary'/>",
			data : {
				"onDate" : onDate
				
			},
			success : function(data1) {
				
			
			console.log("SUCCESS: ", data1);
			var table=$("#closed").dataTable(
					{

						"sPaginationType" : "full_numbers",
						"bProcessing" : false,
						"bServerSide" : false,
						"destroy" : true,
						/* "bRetrieve" : false,	 */			
						"bAutoWidth" : false,		
							
						"aaData" : data1,
						
						"aoColumns" : [ {

							"sTitle" : "Complaint Number",
							"mData" : "compliant",
							"className" : "dt",

						}
						],
						dom : 'lBfrtip',

						buttons: [
				            'copy'
				        ]

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
	}
</script>


<table>
<tr>
<th><div style="width: 450px; height: auto; left:50px; padding-left: 50px; padding-top: 50px; ">
<h3 align="center" ><strong>Forwarded Complaints</strong></h3>
<table id="forward" > </table>


</div></th>
<th><div style="width: 450px; height: auto; left:50px; padding-left: 50px; padding-top: 50px; ">
<h3 align="center" ><strong>Received Complaints</strong></h3>
<table id="received" > </table>


</div></th>
<th><div style="width: 450px; height: auto; left:50px; padding-left: 50px; padding-top: 50px; ">
<h3 align="center" ><strong>Complaints Sent To Record Room</strong></h3>
<table id="closed" > </table>
<%-- <table id="closed"  >
<thead>
<tr>
 <th ><strong>Complaint Number </strong></th>
 </thead>
 <tbody>
<c:forEach items="${summaryForward}" var="Forward">
<tr>
  <td>${Forward.compliant}</td>
</tr>   
</c:forEach>
 </tbody>
</table> --%>

</div></th>
</tr>
</table>


</body>
</html>