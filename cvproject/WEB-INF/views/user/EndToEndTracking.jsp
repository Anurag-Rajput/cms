<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>End to End</title>


<style>
.error {
	color: #ff0000;
	font-weight: bold;
}
</style>


</head>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>"
	type="text/javascript"></script>

<script src="<c:url value="../resources/user/js/dataTables.min.js"/>"
	type="text/javascript"></script>
<script
	src="<c:url value="../resources/user/js/dataTables.buttons.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.print.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.html5.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.flash.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/pdfmake.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jszip.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/vfs_fonts.js"/>"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.css"/>"
	type="text/css"></link>
<link rel="stylesheet"
	href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.min.css"/>"
	type="text/css"></link>
<link rel="stylesheet"
	href="<c:url value="/resources/user/css/datatable/buttons.dataTables.min.css"/>"
	type="text/css"></link>
<link rel="stylesheet"
	href="<c:url value="/resources/user/css/dataTables.min.css"/>"
	type="text/css"></link>
<link rel="stylesheet"
	href="<c:url value="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>"
	type="text/css"></link>
<link rel="stylesheet"
	href="<c:url value="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"/>"
	type="text/css"></link>



<script>
	function getComplain() {
		$('#table-body').empty();
		var complainNo = document.getElementById("complaintId").value;

		
		
		
		  if (complainNo == "") {
			alert("Complaint number must be filled out");
			return false;
		}

         if (!complainNo.match(/^[0-9]+$/)) {
			alert('Only numeric value is allowed');
			return false;
		}  
 
		if (complainNo != "NONE" && complainNo != "") {
			$.ajax({
				url : "<c:url value='/user/getDetailsEndToEnd'/>",
				type : "POST",
				async : false,
				data : {
					"complaintnumber" : complainNo
				},

				success : function(data) {

					var table = $("#EndToEndTrackingTable").dataTable({

						"sPaginationType" : "full_numbers",
						"bProcessing" : false,
						"bServerSide" : false,
						"destroy" : true,
						"bAutoWidth" : false,

						"aaData" : data,

						"aoColumns" : [ {

							"sTitle" : "From User",
							"mData" : "fromUser",
							"className" : "dt-left",

						}, {

							"sTitle" : "To User",
							"mData" : "toUser",
							"className" : "dt-left",

						}, {

							"sTitle" : "Forward Date",
							"mData" : "forwardDate",
							"className" : "dt-left",

						}, {
							"sTitle" : "Forward Serial No",
							"mData" : "forwardSerialNo",
							"className" : "dt-left",
						}, {
							"sTitle" : "Current Section",
							"mData" : "currentSection",
							"className" : "dt-left",
						}

						],

						dom : 'lBfrtip',

						buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]

					});
					table.fnSort([ [ 3, 'asc' ] ]);
					console.log("SUCCESS: ", data);

				},

				error : function(e) {
					console.log(discheck);

				},
				done : function(e) {
					console.log(discheck);

				}

			});
		}

	}
</script>

<style>
table {
	width: 60%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
	text-align: center;
}

table#t01 tr:nth-child(even) {
	background-color: #eee;
}

table#t01 tr:nth-child(odd) {
	background-color: #fff;
}

table#t01 th {
	background-color: #ef7858;
	color: white;
}
</style>

<body>


	<form name="myForm">
		<section id="content">
			<div class="main">
				<div class="wrapper" align="center">

				<label>Search:</label>&nbsp; <br/>
            	<label>Provide bold number only.Ex <b style="color: red;">XXXX</b>/20XX/vigilance-X</label>
               
					<span> <input name="serach_complain" id="complaintId"
						size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
						<button type="button" class="button-2" onclick="getComplain()">Search</button></span>
				</div>

				<table id="EndToEndTrackingTable" class="table"></table>

			</div>
		</section>



	</form>
</body>

</html>