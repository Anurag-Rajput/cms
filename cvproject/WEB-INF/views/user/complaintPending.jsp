
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First Stage Pending Implementation</title>
</head>
<c:forEach items="${cvo}" var="complain">
<script>
$( document ).ready(function() {
	complaintPending();
});
function complaintPending()
{
	var orgCode="${complain.section}";
	/* alert(orgCode); */
	
	var dataStr="orgCode="+orgCode;
	console.log("data",dataStr);
	<c:url var="formUrl" value="/user/getcomplaintPendingReport"></c:url>
    $.ajax({
	url:"${formUrl}",
	type: "POST",
	data: dataStr,
	async: false,
	cache: false,
	success: function(data){
		
		var table=$("#complaintPendingTable").dataTable(
				{

					"sPaginationType" : "full_numbers",
					"bProcessing" : false,
					"bServerSide" : false,
					"destroy" : true,
					/* "bRetrieve" : false,	 */			
					"bAutoWidth" : false,		
						
					"aaData" : data,
					
					"aoColumns" : [ 
						{

							"sTitle" : "S.No./Case No",
							"mData" : "complainNo",
							"className" : "dt-left",

						},{

						"sTitle" : "File No",
						"mData" : "complaint",
						"className" : "dt-left",

					},{

						"sTitle" : "Complaint type",
						"mData" : "complaindate",
						"className" : "dt-left",

					},{

						"sTitle" : "Investigation Type",
						"mData" : "createdDate",
						"className" : "dt-left",

					},{
						"sTitle" : "Inv Agency",
						"mData" : "boDecisionDate",
						"className" : "dt-left",
					}, {
						"sTitle" : "Investigation date",
						"mData" : "boirackdate",
						"className" : "dt-left",
					}, {
						"sTitle" : "Name",
						"mData" : "decision",
						"className" : "dt-left",

					}, {
						"sTitle" : "Designation",
						"mData" : "recipientName",
						"className" : "dt-left",

					}, {
						"sTitle" : "Department Reference",
						"mData" : "allegationDeatils",
						"className" : "dt-left",

					}
					],
					dom : 'lBfrtip',

					buttons : [
							{
								extend : 'print',
								text : 'Print',
								title : "Complaint Pending",

							}

					]

				});
		
	console.log("SUCCESS: ", data);
		
	},
	
});
}


</script>
</c:forEach>

<body>
<br>

<h3 align="center"><b>Complaint Pending</b></h3>
<c:forEach items="${cvo}" var="complain">
<h4 align="center" >${complain.organizationName}</h4>
</c:forEach>
<br>
<c:forEach items="${csvlastupdate}" var="lastupdate">
<h4 align="right" style="margin-right:6%; "><b>Last Updated On:</b> ${lastupdate.complainDate}</h4>
</c:forEach>
<br>
<center><div style="width: 80%">
	<table id="complaintPendingTable" class ="display" style="width: 100%"  >
	</table>	
</div>
</center>
</body>
</html>