
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.buttons.min.js"/>" type="text/javascript"></script>
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


<%-- <script  src="<c:url value="/resources/user/js/bootstrap.min.js"/>"  type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.min.css"/>"  type="text/css" ></link>  --%>


 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Wise Complaint Report</title>
</head>

<script>

$(document).ready(function(){
	complaintReport();
	});


function complaintReport()
{
	var section=0;
	
	$.ajax({
    	type : "POST",
		url : "<c:url value='/user/getUserWisecomplaintReport'/>",
		data : {
			"section" : section
			
		},
	success: function(data){
		
		var table=$("#complainTable").dataTable(
				{

					"sPaginationType" : "full_numbers",
					"bProcessing" : false,
					"bServerSide" : false,
					"destroy" : true,
					"bAutoWidth" : false,		
						
					"aaData" : data,
					
					"aoColumns" : [ 
						{

							"sTitle" : "Section",
							"mData" : "section",
							"className" : "dt-center",

						},{

						"sTitle" : "Less than 1 Week(0-6 Days)",
						"mData" : "compliant",
						"className" : "dt-center",

					},{

						"sTitle" : "More than 1 week and Less than 2 Week (7-13 Days)",
						"mData" : "dairyStatus",
						"className" : "dt-center",

					},{

						"sTitle" : "More than 2 week and Less than 3 Week(14-20 Days)",
						"mData" : "decisiondate",
						"className" : "dt-center",

					},{

						"sTitle" : "More than 3 week and Less than 4 Week (21-27 Days)",
						"mData" : "boDecisionDate",
						"className" : "dt-center",

					},{

						"sTitle" : "More than 4 week",
						"mData" : "complaintAgainstName",
						"className" : "dt-center",

					}
					,{

						"sTitle" : "Total",
						"mData" : "senderName",
						"className" : "dt-center",

					}
					],
					dom : 'lBfrtip',

					buttons : [
							{
								extend : 'print',
								text : 'Print',
								title : "Complaint Delay Report",

							}

					]

				});
 	
	console.log("SUCCESS: ", data);
		
	},
	
});
}


</script>


<body>
<h3 align="center"><b>Complaint Delay Report</b></h3>



<br>

<center><div style="width: 80%;">
	<table id="complainTable" class ="display" style="width: 100%"  >
	</table>
	<br><br><br><br><br><br>	
</div>
</center>
</body>
</html>