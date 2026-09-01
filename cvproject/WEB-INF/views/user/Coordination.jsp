<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- <link rel='stylesheet' type='text/css' href='../resources/user/css/datePicker.css'/> -->
<link rel='stylesheet' type='text/css' href='../resources/user/css/jQueryTable.css'/>
<script src="<c:url value="/resources/user/js/datePicker.js"/>" type="text/javascript"></script> 
<!-- <script src="../resources/user/js/jQueryTable.js"></script> -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 --><script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" > 


<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.dataTables.min.css"/>"  type="text/css" ></link>

<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 


<script src="<c:url value="/resources/user/js/jquery.dialogextend.js"/>" type="text/javascript"></script>


<script type = "text/javascript" >

		$(document).ready(
		function() {
				
				$("#fromDate").datepicker();
			    $("#toDate").datepicker();
			    /* $('#table_id').DataTable(); */
			   
			    });
	 

</script>
<!-- <script type = "text/javascript" >



jQuery.noConflict();
(function( $)  {
$( function() {
    $( "#fromDate") .datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat:"yy-mm-dd"
      });
    
    $( "#toDate") .datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat:"yy-mm-dd"
      });
    
    });
  })(jQuery);;
		

</script> -->

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
    background-color: rgb(48,48,48);
    color: white;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>



<style>
table {
    width:60%;
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
   background-color:#fff;
}
table#t01 th	{
    background-color: #ef7858;
    color: white;
}
</style>

<script>
function drawPopUpWindow(title, idName, width, height) {

	var dialogOptions = {
		"title" : title,
		"width" : width,
		"height" : height,
		"modal" : false,
		"resizable" : false,
		"draggable" : true,

	};

	if ($("#button-cancel").is(":checked")) {
		dialogOptions.buttons = {
			"Cancel" : function() {
				$(this).dialog("close");
			}
		};
	}

	//dialog-extend options
	var dialogExtendOptions = {
		"closable" : true,
		"maximizable" : false,
		"minimizable" : true,
		"minimizeLocation" : "left",
		"collapsable" : true,
		"moveToTop" : true,
		"beforeRestore" : function(evt) {

			$("#" + idName).dialog("moveToTop");

		}

	};

	//open dialog
	try {

		switch ($("#" + idName).dialogExtend("state")) {
		case "maximized":
			$("#" + idName).dialogExtend("restore");
			$("#" + idName).dialog(dialogOptions).dialogExtend(
					dialogExtendOptions);
			break;
		case "minimized":
			$("#" + idName).dialogExtend("restore");
			$("#" + idName).dialog(dialogOptions).dialogExtend(
					dialogExtendOptions);
			break;
		case "collapsed":
			$("#" + idName).dialogExtend("restore");
			$("#" + idName).dialog(dialogOptions).dialogExtend(
					dialogExtendOptions);
			break;
		case "normal":
			$("#" + idName).dialog("moveToTop");
			$("#" + idName).dialog(dialogOptions).dialogExtend(
					dialogExtendOptions);
			break;
		default:
			$("#" + idName).dialog(dialogOptions).dialogExtend(
					dialogExtendOptions);
			break;
		}
	} catch (err) {
		$("#" + idName).dialog(dialogOptions).dialogExtend(
				dialogExtendOptions);

	}

}
function totalpendingdetails(section)
{
   var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	drawPopUpWindow("User-Id wise Pending", "totalpendingIdWise", 550, 550);
	DevReportAjaxIdWise(section,fromDate,toDate) ;
}
function totalcountIRbyOrganization()
{
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	
	drawPopUpWindow("Total IR Count Status Report", "totalpendingIRcountId", 800, 650);
	DevReportforIRCountAjax(fromDate,toDate) ;
	
}
function totalcountTotalPendingbyOrganization()
{
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	
	drawPopUpWindow("Total Total Pending Count Status Report", "totalpendingOrgId", 800, 650);
	DevReportforTotalPendingCountAjax(fromDate,toDate) ;
	
}
function totalpendingIRdetails(section)
{
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	
	drawPopUpWindow("Total IR Status Report", "totalpendingIRId", 900, 650);
	DevReportforIRAjax(section,fromDate,toDate) ;
}
	
function monthlyReport() {
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
			url : "<c:url value='/user/getmonthlyReportforCoord'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate
			},
			success : function(data) {
				$('#report_Detail').empty();
				
				var tab='<div id="printReport">'+

				'<h4 align="center">'+fromDate+' to '+toDate+'</h4><br>'+
				'<table style="width:100%" >'+
				  '<tr>'+
				  '  <th rowspan="2">Section</th>'+
				  '  <th rowspan="2">Brought forward</th>'+
				   ' <th rowspan="2">Receipts</th>'+
				   ' <th rowspan="2">Total Disposal</th>'+
				   ' <th colspan="3">Disposal</th>'+
				   ' <th colspan="3">Pending</th>'+
				   ' <th rowspan="2">Total pending</th>'+
				  '</tr>'+
				 ' <tr>'+
				   ' <td>Inves & Rep (IR)</td>'+
				   ' <td>Filed (FD)</td>'+
				   ' <td>Nec. Action (NA)</td>'+
				 /*   ' <td>Others</td>'+ */
				    '<td>Less than 1st month</td>'+
				    '<td>2nd & 3rd months</td>'+
				   ' <td>Greater than 3 months</td>'+
				    
				   
				    
				'  </tr>';
				
				$.each(data, function(index, value) {
					
                     if(index==0){
						var section=1;
						tab=   tab+	'<tr>'+
						   ' <td>Vig-1</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						 /*  '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+						  
						 '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
					if(index==1){
						var section=2;
						
						tab=   tab+	'<tr>'+
						   ' <td>Vig-2</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						  /* '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
					
                 if(index==2){
						var section=3;
						tab=   tab+	'<tr>'+
						   ' <td>Vig-3</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						 /*  '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 
                 if(index==3){
						var section=4;
						tab=   tab+	'<tr>'+
						   ' <td>Vig-4</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						 /*  '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 
                 if(index==4){
						var section=5;
						tab=   tab+	'<tr>'+
						   ' <td>Vig-5</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						  /* '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 
                 if(index==5){
						var section=6;
						tab=   tab+	'<tr>'+
						   ' <td>Vig-6</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						  /* '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 if(index==6){
						var section=7;
						tab=   tab+	'<tr>'+
						   ' <td>Vig-7</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						  /* '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 if(index==7){
						var section=8;
						tab=   tab+	'<tr>'+
						   ' <td>Vig-8</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						 /*  '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 if(index==8){
                	 var section=9;
						tab=   tab+	'<tr>'+
						   ' <td>Vig-9</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						  /* '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 if(index==9){
						var section="'"+"Cordn-2"+"'";
						tab=   tab+	'<tr>'+
						   ' <td>Coordination-2</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						 /*  '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+						  
						 '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 if(index==10){
						
						tab=   tab+	'<tr>'+
						   ' <td>Total</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalcountIRbyOrganization()">'+value.ir+'</a></td>'+
						  /* '  <td>'+value.ir+'</td>'+ */
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						  /* '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						 '   <td><a style="color:red;" href="#" onclick="totalcountTotalPendingbyOrganization()">'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 if(index==11){
                	 var section=11;
						tab=   tab+	'<tr>'+
						   ' <td>CC</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td><a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+value.ir+'</a></td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						 /*  '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')>'+value.totalPending+'</a></td>'+
						'  </tr>';
					}
                 if(index==12){
                	 var section=12;
						tab=   tab+	'<tr>'+
						   ' <td>Total</td>'+
						   ' <td>'+value.broughtForward+'</td>'+
						  '  <td>'+value.receipt+'</td>'+
						  '  <td>'+value.totalDisposal+'</td>'+
						  '  <td>'+value.ir+'</td>'+
						  '  <td>'+value.fd+'</td>'+
						  '  <td>'+value.na+'</td>'+
						/*   '  <td>'+value.other+'</td>'+ */
						   ' <td>'+value.pendingLastMonth+'</td>'+
						  '  <td>'+value.pendingLastThreeMonth+'</td>'+
						  '  <td>'+value.pendingMoreThanThreeMonth+'</td>'+
						  '  <td>'+value.value.totalPending+'</td>'+
						  /* '   <td><a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+value.totalPending+'</a></td>'+ */
						'  </tr>';
					}
                
					
				});
				
				tab=tab+'</table>'+'</div>'+'<button onclick="printPDF();">Print</button>'+'</center>'+'</div>'
				
				$('#report_Detail').append(tab);
				//display(data);
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

	 
	
	 
	 
	 
	 $.ajax({
		type : "POST",
		url : "<c:url value='/user/getmonthlyReportforCoord'/>",
		data : {
			"fromDate" : fromDate,
			"toDate" : toDate
		},
		success : function(data) {
			$('#report_Detail1').empty();
			
			var tab='<div id="printReport1">'+
			'<h4 align="center">'+fromDate+' to '+toDate+'</h4><br>'+
			'<table style="width:100%" >'+
			'<tr>'+
			  '  <th rowspan="2">Section</th>'+
			  '  <th rowspan="2">Signed</th>'+
			  '  <th rowspan="2">Pseudonymous</th>'+
			   ' <th rowspan="2">Anonymous</th>'/* +
			   ' <th rowspan="2">Pending</th>'+ */ 
			'  </tr>';
			
			$.each(data, function(index, value) {
				
				if(index==0){
					
					tab=   tab+	'<tr>'+
					   ' <td></td>'+
				
					'  </tr>';
				}
				
				 if(index==0){
						
						tab=   tab+	'<tr>'+
						   ' <td>Vig-1</td>'+
						   ' <td>'+value.signed+'</td>'+
						   '  <td>'+value.pseudonymous+'</td>'+
						   '  <td>'+value.anonymous+'</td>'/* +
						   '  <td>'+value.pending+'</td>'+ */
						'  </tr>';
					}
				if(index==1){
					
					tab=   tab+	'<tr>'+
					   ' <td>Vig-2</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'/* +
					   '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
				
          if(index==2){
					
					tab=   tab+	'<tr>'+
					   ' <td>Vig-3</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'/* +
					   '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
          
          if(index==3){
					
					tab=   tab+	'<tr>'+
					   ' <td>Vig-4</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'/* +
					   '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
          
          if(index==4){
					
					tab=   tab+	'<tr>'+
					   ' <td>Vig-5</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'/* +
					   '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
          
          if(index==5){
					
					tab=   tab+	'<tr>'+
					   ' <td>Vig-6</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'/* +
					   '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
          if(index==6){
					
					tab=   tab+	'<tr>'+
					   ' <td>Vig-7</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'/* +
					   '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
          if(index==7){
					
					tab=   tab+	'<tr>'+
					   ' <td>Vig-8</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'/* +
					   '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
          if(index==8){
					
					tab=   tab+	'<tr>'+
					   ' <td>Vig-9</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'
					   /* '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
          if(index==9){
				
				tab=   tab+	'<tr>'+
				   ' <td>Coordination-2</td>'+
				   ' <td>'+value.signed+'</td>'+
				   '  <td>'+value.pseudonymous+'</td>'+
				   '  <td>'+value.anonymous+'</td>'
				   /* '  <td>'+value.pending+'</td>'+ */
				'  </tr>';
			}
          if(index==10){
					
					tab=   tab+	'<tr>'+
					   ' <td>Total</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'
					   /* '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
          if(index==11){
					
					tab=   tab+	'<tr>'+
					   ' <td>CC</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'
					   /* '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
          if(index==12){
					
					tab=   tab+	'<tr>'+
					   ' <td>Total</td>'+
					   ' <td>'+value.signed+'</td>'+
					   '  <td>'+value.pseudonymous+'</td>'+
					   '  <td>'+value.anonymous+'</td>'
					   /* '  <td>'+value.pending+'</td>'+ */
					'  </tr>';
				}
         
				
			});
			
			tab=tab+'</table>'+'</div>'+'<button onclick="printPDF2();">Print</button>'+'</center>'+'</div>'
			
			$('#report_Detail1').append(tab);
			//display(data);
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


	/* function printPDF() {
		$("#printReport").print({
            globalStyles: true,
            mediaPrint: true,
            stylesheet: null,
            noPrintSelector: ".no-print",
            iframe: true,
            append: null,
            prepend: null,
            manuallyCopyFormValues: true,
            deferred: $.Deferred(),
            timeout: 750,
            title: null,
            doctype: '<div>'
    }); */
		
		/* $("#printReport1").print({
            globalStyles: true,
            mediaPrint: true,
            stylesheet: null,
            noPrintSelector: ".no-print",
            iframe: true,
            append: null,
            prepend: null,
            manuallyCopyFormValues: true,
            deferred: $.Deferred(),
            timeout: 750,
            title: null,
            doctype: '<div>'
    }); */
		
	//};
	function printPDF() {
		$("#printReport").print({
            globalStyles: true,
            mediaPrint: true,
            stylesheet: null,
            noPrintSelector: ".no-print",
            iframe: true,
            append: null,
            prepend: null,
            manuallyCopyFormValues: true,
            deferred: $.Deferred(),
            timeout: 750,
            title: null,
            doctype: '<div>'
    });
	}
	function printPDF2() {
		 $("#printReport1").print({
            globalStyles: true,
            mediaPrint: true,
            stylesheet: null,
            noPrintSelector: ".no-print",
            iframe: true,
            append: null,
            prepend: null,
            manuallyCopyFormValues: true,
            deferred: $.Deferred(),
            timeout: 750,
            title: null,
            doctype: '<div>'
    }); 
		
	}
	

</script>

<body id="page2">
	 <div name="myform" id="myform" action=""> 

		<!--==============================content================================-->
		<section id="content">
			<div class="form-group">

		<center>			

						<hr style='background-color: red; border-width: 0; color: #000000; height: 2px; line-height: 0; text-align: left; width: 100%;' />
						<br/>
						<br/>



		<div id="result" style=" color: red; font: bold; ">
 				
 				</div>
						
						<h3 style="color:black; " align="center" >Monthly Report</h3>
						<br/>
			
						<div >
							From Date<input name="fDate" placeholder="yyyy-mm-dd" id="fromDate" size="20" >
							&nbsp;&nbsp;&nbsp;
							To Date<input name="tDate" placeholder="yyyy-mm-dd"  id="toDate" size="20" 
								> &nbsp;&nbsp;&nbsp;
							<label>
								<button type="button" class="button-2" id="com_srch"
									onclick="monthlyReport()">Search</button>
							</label>


						</div>
						<br>
						<br>

				</div>









<div id="report_Detail">

</div>

<div id="report_Detail1">
<table id="reportforsigned" class="display"> </table>
</div>
<br>
<!-- <div>
<h3 style="color:black; " align="center" >CVO Detail</h3>
	<table id="cvoDetail" class ="display" style="width: 100%"  >
	</table>	
</div>

<div>
<h3 style="color:black; " align="center" >CVO Activity Report</h3>
	<table id="cvoActReport" class ="display" style="width: 100%"  >
	</table>	
</div> -->

<!-- <table id="table_id" 

class="table table-condensed table-striped table-hover">
    <thead>
        <tr>
            <th>
                @Html.DisplayNameFor(model => model.Title)
            </th>
            <th>
                @Html.DisplayNameFor(model => model.Descriptions)
            </th>
            <th>
                @Html.DisplayNameFor(model => model.Product)
            </th>
            <th>
                @Html.DisplayNameFor(model => model.Employee.Name)
            </th>
            <th>
                @Html.DisplayNameFor(model => model.EstEndDate)
            </th>
            <th>
                @Html.DisplayNameFor(model => model.EstHours)
            </th>
            <th>
                @Html.DisplayNameFor(model => model.Status)
            </th>
            <th></th>
        </tr>
    </thead>

    <tbody>
        @foreach (var item in Model)
        {
            <tr>
                <td>
                    @Html.DisplayFor(modelItem => item.Title)
                </td>
                <td>
                    @Html.DisplayFor(modelItem => item.Descriptions)
                </td>
                <td>
                    @Html.DisplayFor(modelItem => item.CategoryMaster.Title)
                </td>
                <td>
                    @Html.DisplayFor(modelItem => item.Employee.Name)
                </td>
                <td>
                    @Html.DisplayFor(modelItem => item.EstEndDate)
                </td>
                <td>
                    @Html.DisplayFor(modelItem => item.EstHours)
                </td>
                <td>
                    @Html.DisplayFor(modelItem => item.Status)
                </td>
                <td>
                   @Html.ActionLink(Resources.Edit, "Edit", 
            new { id = item.ID }, htmlAttributes: new {                     
                @class = "btn btn-default btn-sm" })
                </td>
            </tr>
        }
    </tbody>
</table>
 -->
		</section>

	
</body>


<div id="totalpending" style="display: none">
	<jsp:include page="detailPendingIdWise.jsp" />
</div>



<div id="totalpendingforIR" style="display: none">
	<jsp:include page="detailPendingReportIR.jsp" />
</div>


<div id="totalpendingforIRCount" style="display: none">
	<jsp:include page="detailPendingCountReportIR.jsp" />
</div>

<div id="totalpendingOrgId" style="display: none">
	<jsp:include page="detailTotalPendingReport.jsp" />
</div>