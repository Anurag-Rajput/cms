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
	
function DevReportAjaxIdWise(index,fromDate,toDate)  {

	$.ajax({
		url :"<c:url value='/user/getTotalPendingDetailsbyId'/>",
		type : "POST",
		data : {
			"fromDate" : fromDate,
			"toDate" : toDate,
			"index" : index
		},
		success : function(jsonData) {
			pendingdetails1(jsonData);
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

function totalpendingdetails1(dairyStatus,section)
{ alert(dairyStatus+"----------"+section);
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	
	drawPopUpWindow("Total Pending Status Report", "totalpendingId", 800, 650);
	DevReportAjax(dairyStatus,section,fromDate,toDate) ;
}

function pendingdetails1(jsonData)
	{
	$('#totalpendingIdWiseTable').empty();
		$('#totalpendingIdWiseTable').DataTable(
						{
							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							"bRetrieve" : false,
							/* "fnDrawCallback": function( oSettings ) {
							      alert( 'DataTables has redrawn the table' );
							    },
							  
							 */
							"bAutoWidth" : false,
							"aaData" : jsonData,
							"aoColumns" : [

									
									{
										"sTitle": "User-Id" ,
										"mData" : "dairyStatus",
										"className" : "center",

									},
									{
										"sTitle": "Name" ,
										"mData" : "recipientName",
										"className" : "center",

									},
									{
										"sTitle": "Designation" ,
										"mData" : "designation",
										"className" : "center",

									},{
										
										"sTitle" : "Complaint Count",
										"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
											var diarystatus="'"+oData.dairyStatus+"'";
											var section="'"+oData.section+"'";
								            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingdetails1('+diarystatus+','+section+')">'+oData.status+'</a>');
								            				        },
										"mData" : "status",
										"className" : "center",

									}
									
								 ],
								 dom : 'lBfrtip',
								 buttons : [ 
								 
								 {
							            extend: 'print',
							            text: 'Print',
							            title : "Total Pendind Detailed Report",
							            
							        }
								 ]
							/* dom : 'lBfrtip',

							

							buttons : [ {
								extend : 'pdfHtml5',

								title : "Total Pending Detailed Report",
								customize: function ( doc ) {
									var dato= new Date();
									var yoDate=dato.toString();
									 var cols = [];
									   cols[0] = {text: '', alignment: 'left', margin:[20] };
									   cols[1] = {text: yoDate, alignment: 'right', margin:[0,0,20] };
									   var objFooter = {};
									   objFooter['columns'] = cols;
									   doc['footer']=objFooter;
									   doc['header']=function(currentPage, pageCount) {
										   return {text: currentPage.toString() + ' of ' + pageCount, alignment: 'right', margin:[10,10,20] }; 
										   
										   }
				                }
							},
							{
					            extend: 'print',
					            text: 'Print',
					            title : "Total Pendind Detailed Report",
					            
					        },
					        {
					            extend: 'csvHtml5',
					            title : "Total Pendind Detailed Report",
					            
					        }

							] */
						});

		

	}	

		
	

	
</script>
</head>
<body>

<div id="totalpending" style="display: none">
	<jsp:include page="detailPendingReport.jsp" />
</div>

	<div id="totalpendingIdWise">
		<table id="totalpendingIdWiseTable" class="display"  style="width: 100%">
			
		</table>

	</div>
	
	

</body>
</html>