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
<%-- <link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> --%>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.dataTables.min.css"/>"  type="text/css" ></link>
<link rel='stylesheet' type='text/css' href='../resources/user/css/datePicker.css'/>
<script src="../resources/user/js/datePicker.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 
<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>"  type="text/css" ></link> 
<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"/>"  type="text/css" ></link>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

/* Automatic Serial Number Row */
.css-serial {
 counter-reset: serial-number; /* Set the serial number counter to 0 */
}
.css-serial td:first-child:before {
 counter-increment: serial-number; /* Increment the serial number counter */
 content: counter(serial-number); /* Display the counter */
}
th {
    background-color: rgb(197, 224, 234);
    color: black;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

</style>
</head>

<script type = "text/javascript" >


$(document).ready(
		function() {
				
			$( "#fromDate") .datepicker({
		        changeMonth: true,
		        changeYear: true,
		        dateFormat:"yy-mm-dd",
		        maxDate: "now"
		      });
		    
		    $( "#toDate") .datepicker({
		        changeMonth: true,
		        changeYear: true,
		        dateFormat:"yy-mm-dd",
		        maxDate: "now"
		      });
			   
			    });
			    
			    
			    
function ComplainttypeReport()
{


var fromDate = document.getElementById("fromDate").value;
var toDate = document.getElementById("toDate").value;

if(fromDate == "" || toDate == "")
{alert("Dates cannot be empty");}
else if(toDate==fromDate)
{alert("Both dates cannot be same");}
else if(toDate<fromDate)
{alert("From date must be before to date");}
else if(toDate>fromDate)
{

	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/getComplaintTypeReport'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate
				
			},
			success : function(data) {				
				
					//alert(data[0]);
			$("#complaintypeReport").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,						
							"bAutoWidth" : false,								
							"aaData" : data,							
							"aoColumns" : [ {

								"sTitle" : "Complaint Type",
								"mData" : "boName",
								"className" : "dt-center",

							},{

								"sTitle" : "No. of Complaint",
								"mData" : "ir",
								"className" : "dt-center",

							}
							],
							dom : 'lBfrtip',

							buttons: [
					            'copy', 'csv', 'excel', 'pdf', 'print'
					        ]

						});
				
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
	
	
	

}
</script>
<body>

<div> 

		<!--==============================content================================-->
		
			<div class="form-group">

		<center>			

						<hr style='background-color: red; border-width: 0; color: #000000; height: 2px; line-height: 0; text-align: left; width: 100%;' />
						<h1 style="font-size:18px; padding-left:48%;  "><u>Type of Complaint Report</u></h1><br>
						<br/>
						<br/>
						
 				
		<div id="result" style=" color: red; font: bold; "> 				
 				</div>
 				<div >
 				
 				
							From Date<input name="fDate" placeholder="yyyy-mm-dd" id="fromDate" size="20" >
							&nbsp;&nbsp;&nbsp;
							To Date<input name="tDate" placeholder="yyyy-mm-dd"  id="toDate" size="20" 
								> &nbsp;&nbsp;&nbsp;
							<label>
								<button type="button" class="button-2" id="com_srch"
									onclick="ComplainttypeReport()">Search</button>
							</label>


						</div>
						<br>
						<br>

				</div>


<div>
					<table id="complaintypeReport" class ="display" style="width: 100%"  >
					
					</table>	
				</div>







</body>
</html>