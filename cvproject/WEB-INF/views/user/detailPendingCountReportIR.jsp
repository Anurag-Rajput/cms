<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>

	
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 
 
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.buttons.min.js"/>" type="text/javascript"></script>


<script src="<c:url value="/resources/user/js/buttons.print.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.html5.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.flash.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/pdfmake.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jszip.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/vfs_fonts.js"/>" type="text/javascript"></script>

<link rel="stylesheet" href="<c:url value="/resources/user/css/datatableformonthly.css"/>"  type="text/css" ></link>
<%-- <link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> --%>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.dataTables.min.css"/>"  type="text/css" ></link>
 
<script type="text/javascript">


function DevReportforIRCountAjax(fromDate,toDate)
{
	$.ajax({
		url :"<c:url value='/user/getTotalPendingCountIR'/>",
		type : "POST",
		data : {
			"fromDate" : fromDate,
			"toDate" : toDate
		
		},
		success : function(jsonData) {
			//alert(jsonData);
			pendingdetailsCountIR(jsonData);
			console.log("pending: ", jsonData);
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
function pendingdetailsCountIR(jsonData)
{

	$('#totalpendingcountdetailedreportforIR').DataTable(
			{
				"sPaginationType" : "full_numbers",
				"bProcessing" : false,
				"bServerSide" : false,
				"destroy" : true,
				"bRetrieve" : false,
				
				"bAutoWidth" : false,
				"aaData" : jsonData,
				"aoColumns" : [

						
						{
							"sTitle": "Organization" ,
							"mData" : "organization",
							"className" : "center",

						},
						{
							"sTitle": "Count Number" ,
							"mData" : "other",
							"className" : "center",

						}
						
						
						
					 ],

				dom : 'lBfrtip',

				

				buttons : [ 
				{
		            extend: 'print',
		            text: 'Print',
		            title : "Total IR Detailed Report",
		            
		        }
				]
			});

	
}
	

	
</script>
</head>
<body>
		
	<div id="totalpendingIRcountId">
		<table id="totalpendingcountdetailedreportforIR" class="display"  style="width: 100%">
			
		</table>

	</div>

</body>
</html>