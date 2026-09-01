<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel='stylesheet' type='text/css' href='../resources/user/css/jQueryTable.css'/>
<script src="<c:url value="/resources/user/js/datePicker.js"/>" type="text/javascript"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" > 
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.dataTables.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 
<script src="<c:url value="/resources/user/js/jquery.dialogextend.js"/>" type="text/javascript"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>




<script type = "text/javascript" >

		$(document).ready(
		function() {
				
				$("#fromDate").datepicker();
			    $("#toDate").datepicker();
			    /* $('#table_id').DataTable(); */
			   
			    });
	 

</script>


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

function cvoNaList(org)
{
	
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;

	drawPopUpWindow("CVO Organisation NA Listing", "cvona", 1200,600);
	$.ajax({
		type : "POST",
		url : "<c:url value='/user/getCvoNaCount'/>",
		data : {
			"fromDate" : fromDate,
			"toDate" : toDate,
			"org" :org
		},
		success : function(data) {
			
			var table=$("#cvona").dataTable(
					{

						"sPaginationType" : "full_numbers",
						"bProcessing" : false,
						"bServerSide" : false,
						"destroy" : true,
							
						"bAutoWidth" : false,		
							
						"aaData" : data,
						
						"aoColumns" : [ {
							"sTitle" : "Complaint No.",
							"mData" : "complainNo",
							"className" : "dt-left",
							
						},{

							"sTitle" : "Sender Name",
							"mData" : "senderName",
							"className" : "dt-left",

						},{

							"sTitle" : "Organisation Name",
							"mData" : "organizationName",
							"className" : "dt-left",

						},  {
							"sTitle" : "Decision",
							"mData" : "decision",
							"className" : "dt-left",

						},
						{
							"sTitle" : "Decision Date",
							"mData" : "boDecisionDate",
							"className" : "dt-left",

						},
						{
							"sTitle" : "Complaint Date",
							"mData" : "complaindate",
							"className" : "dt-left",

						},
						{
							"sTitle" : "Complaint Created Date",
							"mData" : "createdDate",
							"className" : "dt-left",

						},
						{
							"sTitle" : "Inbox",
							"mData" : "dairyStatus",
							"className" : "dt-left",

						}
						],
						dom : 'lBfrtip',

						buttons : [
								{
									extend : 'print',
									text : 'Print',
									title : "CVO Report",

								}

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
function sessionUpdate(sessionObject,value){
	 var session = sessionObject;
	 var accessvalue= value;
	 var flag;
	 
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
				window.open(url,"_blank");
				}
				else if(response.accessId==1){
					var url='<c:url value="/user/viewPendingComplainDetails"/>';
					window.location = url
				}else if(response.accessId==2){
					/* alert(response.accessId==2);
					var url = '<c:url value="/user/compialnFiled/"/>';
					 $('#myform').attr('action', url); */
				}else if(response.accessId==3){
					
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
function cvoNaClosed(org,decision){
	
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;

	drawPopUpWindow("CVO Organisation NA Closed Complaint", "cvonaclosed", 800,600);
	$.ajax({
		type : "POST",
		url : "<c:url value='/user/getCvoNaClosedCount'/>",
		data : {
			"fromDate" : fromDate,
			"toDate" : toDate,
			"org" :org,
			"decision":decision
		},
		success : function(data) {
			
			var table=$("#cvonaclosed").dataTable(
					{

						"sPaginationType" : "full_numbers",
						"bProcessing" : false,
						"bServerSide" : false,
						"destroy" : true,
							
						"bAutoWidth" : false,		
							
						"aaData" : data,
						
						"aoColumns" : [ {
							"sTitle" : "Complaint No.",
							 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
								 var array= data[iRow];
								 var complainNo = "'"+"complainNumber_"+array.complainNo+"'"
								 $(nTd).html('<a style="color:red;"  onclick="sessionUpdate('+complainNo+','+0+');">'+oData.complainNo+'</a>');
						         },
							"mData" : "complainNo",
							"className" : "dt-left",
							
						},
						{
							"sTitle" : "Complaint Created Date",
							"mData" : "createdDate",
							"className" : "dt-left",

						},

						{
							"sTitle" : "Decision",
							"mData" : "boDecision",
							"className" : "dt-left",

						},
						{
							"sTitle" : "Decision Date",
							"mData" : "boDecisionDate",
							"className" : "dt-left",

						},
						{
							"sTitle" : "Closed Date",
							"mData" : "decisiondate",
							"className" : "dt-left",

						}
						
						],
						dom : 'lBfrtip',

						buttons : [
								{
									extend : 'print',
									text : 'Print',
									title : "CVO Report",

								}

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
function LoginList(userId){
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;

	drawPopUpWindow("CVO Login Detail", "logincount", 400,600);
	$.ajax({
		type : "POST",
		url : "<c:url value='/user/getCvoLoginCount'/>",
		data : {
			"fromDate" : fromDate,
			"toDate" : toDate,
			"userId" :userId
		},
		success : function(data) {
			
			var table=$("#logincount").dataTable(
					{

						"sPaginationType" : "full_numbers",
						"bProcessing" : false,
						"bServerSide" : false,
						"destroy" : true,
							
						"bAutoWidth" : false,		
							
						"aaData" : data,
						
						"aoColumns" : [ 
						{
							"sTitle" : "Login Date/Time",
							"mData" : "createdDate",
							"className" : "dt-left",

						},
						{
							"sTitle" : "IP Address",
							"mData" : "dairyStatus",
							"className" : "dt-left",

						}					
						
						],
						dom : 'lBfrtip',

						buttons : [
								{
									extend : 'print',
									text : 'Print',
									title : "CVO Report",

								}

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
	function cvoActReport()
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
				url : "<c:url value='/user/getCVOActReport'/>",
				data : {
					"fromDate" : fromDate,
					"toDate" : toDate
				},
				success : function(data) {
					//alert(data[0].organizationName);
					var table=$("#cvoActReport").dataTable(
							{

								"sPaginationType" : "full_numbers",
								"bProcessing" : false,
								"bServerSide" : false,
								"destroy" : true,
									
								"bAutoWidth" : false,		
									
								"aaData" : data,
								
								"aoColumns" : [ {

									"sTitle" : "Organisation",
									"mData" : "organizationName",
									"className" : "dt-left",
									
								},{

									"sTitle" : "Organisation Code",
									"mData" : "dairyStatus",
									"className" : "dt-left",

								},{

									"sTitle" : "User ID",
									"mData" : "complainNo",
									"className" : "dt-left",

								},{

									"sTitle" : "Count Of NA",
									 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
										 var array= data[iRow];
										 var org = "'"+array.dairyStatus+"'"
										 $(nTd).html('<a style="color:red;" href="#" onclick="cvoNaList('+org+')">'+oData.senderName+'</a>');
								         },
									"mData" : "senderName",
									"className" : "dt-left",

								},  {
									"sTitle" : "Filed Complaint",
									"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
										 var array= data[iRow];
										 var org = "'"+array.dairyStatus+"'";
										 var Filed="'"+'Filed'+"'";
										 oData.complaindate= oData.complaindate==''||oData.complaindate==null?0:oData.complaindate;
										 $(nTd).html('<a style="color:red;" href="#" onclick="cvoNaClosed('+org+','+Filed+')">'+oData.complaindate+'</a>');
								         },
									"mData" : "complaindate",
									"className" : "dt-left",

								},  {
									"sTitle" : "NA Complaint",
									"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
										 var array= data[iRow];
										 var org = "'"+array.dairyStatus+"'";
										 var NA="'"+'NA'+"'";
										 oData.boNaAckDate= oData.boNaAckDate==''||oData.boNaAckDate==null?0:oData.boNaAckDate;
										 $(nTd).html('<a style="color:red;" href="#" onclick="cvoNaClosed('+org+','+NA+')">'+oData.boNaAckDate+'</a>');
								         },
									"mData" : "boNaAckDate",
									"className" : "dt-left",

								},  {
									"sTitle" : "IR Complaint",
									"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
										 var array= data[iRow];
										 var org = "'"+array.dairyStatus+"'";
										 var IR="'"+'IR'+"'";
										 oData.ir= oData.ir==''||oData.ir==null?0:oData.ir;
										 $(nTd).html('<a style="color:red;" href="#" onclick="cvoNaClosed('+org+','+IR+')">'+oData.ir+'</a>');
								         },
									"mData" : "ir",
									"className" : "dt-left",

								},{
									"sTitle" : "Login Count",
									"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
										 var array= data[iRow];
										 var userId = "'"+array.complainNo+"'"
										 $(nTd).html('<a style="color:red;" href="#" onclick="LoginList('+userId+')">'+oData.boDecisionDate+'</a>');
								         },
									"mData" : "boDecisionDate",
									"className" : "dt-left",

								},  {
									"sTitle" : "Last Login",
									"mData" : "boDecision",
									"className" : "dt-left",

								}
								],
								dom : 'lBfrtip',

								buttons : [
										{
											extend : 'print',
											text : 'Print',
											title : "CVO Report",

										}

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

<body id="page2">
	 <div name="myform" id="myform" action=""> 

		<!--==============================content================================-->
		<section id="content">
			<div class="form-group">

		<center>			

						<hr style='background-color: red; border-width: 0; color: #000000; height: 2px; line-height: 0; text-align: left; width: 100%;' />
						<br/>
					



		<div id="result" style=" color: red; font: bold; ">
 				
 				</div>

				<h3 style="color:black; " align="center" >CVO: NA & Activity Status</h3>
				<br/>
						<div >
							From Date<input name="fDate" placeholder="yyyy-mm-dd" id="fromDate" size="20" >
							&nbsp;&nbsp;&nbsp;
							To Date<input name="tDate" placeholder="yyyy-mm-dd"  id="toDate" size="20" 
								> &nbsp;&nbsp;&nbsp;
							<label>
								<button type="button" class="button-2" id="com_srch"
									onclick="cvoActReport()">Search</button>
							</label>


						</div>
						<br>
						<br>

				</div>


<center>
<div style="width: 80%;"  >

	<table id="cvoActReport" class ="display" style="width: 100%"  >
	        <thead>
            <tr>
                <th rowspan="2">Organization</th>
                <th rowspan="2">Organization Code</th>
                <th rowspan="2">User-Id</th>
                <th rowspan="2">Count of NA from CVC</th>
                <th colspan="3">Complaint Closed By CVO</th>
                <th rowspan="2">Login Count</th>
                <th rowspan="2">Last Login</th>
                
            </tr>
            <tr>
                <th>Filed</th>
                <th>NA</th>
                <th>IR</th>
            </tr>
        </thead>
	</table>	
</div>
</center>
<div>
		<table id="cvona" class ="display" style="width: 100%"  >
	</table>
	<table id="cvonaclosed" class ="display" style="width: 100%"  >
	</table>
	<table id="logincount" class ="display" style="width: 100%"  >
	</table>	
</div>

		</section>

	
</body>


