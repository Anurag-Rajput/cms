<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet"
href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="../resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="../resources/user/js/dataTables.buttons.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.print.min.js"/>" type="text/javascript"></script> 

<link rel='stylesheet' type='text/css' href='../resources/user/css/datePicker.css'/>
<script src="../resources/user/js/datePicker.js"></script>

<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>"  type="text/css" ></link> 
<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"/>"  type="text/css" ></link>  
<script type = "text/javascript" >
var q=jQuery.noConflict();

$( function() {
    q( "#fromDate") .datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat:"yy-mm-dd",
        maxDate: "now"
      });
    
    q( "#toDate") .datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat:"yy-mm-dd",
        maxDate: "now"
      });
    
    });
  

	/* 	$(document).ready(
      function burstCache() {
 
    	  $('#t_report').hide();
    	  $('#t_pending').hide(); 
    	  
        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      ); */

		
function getSection() {
			
			var discheckroll=null;
			var discheckso=null;
			var loginvalue=$("#logintypeforIR").val();

			q.ajax({
				url : "<c:url value='/loginTypeValue'/>",
				type : "POST",
				async: false,
				data : {
					"loginvalue" : loginvalue
				},
				
				success : function(data) {
					
					q.each(data, function(key, value) {
			          //  alert("roll type"+data[0].loginRoll);
			          //alert("section"+data[0].desiganation);
			           // $('#rollttype').append(data[0].loginRoll);  
			           discheck= data[0].loginRoll;
			           discheckso =data[0].desiganation;
			           //alert(discheck);
			            
			           q('#rollttype').val(data[0].loginRoll);
			           q('#sectiontype').val(data[0].desiganation);
			        });
				},
				
				error : function(e) {
				console.log(discheck);
				
				//data[0].loginRoll;
				//return discheck;
			},
			done : function(e) {
				console.log(discheck);
				//alert(discheck);
			}
				
			}); 
			
			var ro =discheck;
			var sec = discheckso;
			var result;
			var tenp;
			if(sec.indexOf("/")>=0)
			{
				var i=0;
				//alert(section);
				result=sec.split("/");
				for(i=0;result[i] != null;i++){
					temp=i+1;
					genReport(result[i],temp);
				}
			}
			else
				{
				genReport(sec,1);
				}
			
			
	    };
</script>

<style>
.flexy {
            display: block;
            width: 100%;
            border: 1px solid #eee;
            max-height: 1320px;
            max-width : 1320px;
            overflow: auto;
        }

        .flexy thead {
         width: 100%;
            display: -webkit-flex;
            -webkit-flex-flow: row;
        }

        .flexy thead tr {
            padding-right: 15px;
            display: -webkit-flex;
            width: 800%;
            -webkit-align-items: stretch;
        }

        .flexy tbody {
            display: -webkit-flex;
            height: 500px;
            overflow: auto;
            -webkit-flex-flow: row wrap;
        }
        .flexy tbody tr{
            display: -webkit-flex;
            width: 100%;
        }

        .flexy tr td {
            width: 15%;
        }

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


</head>


<script>

q(function(){
	q("#t_report").dataTable();
})
function genReport(section,number) {	
	
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	
	if(number==1)
	{
		q.ajax({
			type : "POST",
			url : "<c:url value='/user/findReport'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(response) {
				q('#t_report').show();
					q('#tbody_report').html('<tr>'+
							'<td align="center">'+response.section+' </td>'+
							'<td align="center">'+response.recipt+'</td>'+
							'<td align="center" onclick="disposedReport('+section+');" ><a href="#"  style="color:red">'+response.totalDispose+' </a></td>'+
							'<td align="center" onclick="pendingReport('+section+');" ><a href="#"  style="color:red"> '+response.totalPending+'</a></td>'+
							'</tr>');
				
				
				console.log("SUCCESS: ", data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}
	if(number==2)
	{
		q.ajax({
			type : "POST",
			url : "<c:url value='/user/findReport'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(response) {
				q('#t_report').show();
					q('#tbody_report2').html('<tr>'+
							'<td align="center">'+response.section+' </td>'+
							'<td align="center">'+response.recipt+'</td>'+
							'<td align="center" onclick="disposedReport('+section+');" ><a href="#"  style="color:red">'+response.totalDispose+' </a></td>'+
							'<td align="center" onclick="pendingReport('+section+');" ><a href="#"  style="color:red"> '+response.totalPending+'</a></td>'+
							'</tr>');
				
				
				console.log("SUCCESS: ", data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}
	if(number==3)
	{
		q.ajax({
			type : "POST",
			url : "<c:url value='/user/findReport'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(response) {
				q('#t_report').show();
					q('#tbody_report3').html('<tr>'+
							'<td align="center">'+response.section+' </td>'+
							'<td align="center">'+response.recipt+'</td>'+
							'<td align="center" onclick="disposedReport('+section+');" ><a href="#"  style="color:red">'+response.totalDispose+' </a></td>'+
							'<td align="center" onclick="pendingReport('+section+');" ><a href="#"  style="color:red"> '+response.totalPending+'</a></td>'+
							'</tr>');
				
				
				console.log("SUCCESS: ", data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				
			},
			done : function(e) {
				console.log("DONE");
			}
		});
	}
	
	

}
</script>

<script>
function pendingReport(section) {
	/*  $('#t_report').hide();
	$('#tbody_pending').empty(); */
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	q.ajax({
		type : "POST",
		url : "<c:url value='/user/complainPending'/>",
		data : {
			"fromDate" : fromDate,
			"toDate" : toDate,
			"section":section
		},
		success : function(data) {
			q('#t_pending').show();
/* 				$.each(data, function(key, value) {

			$('#tbody_pending').append('<tr>'+
					'<td align="center">&nbsp;</td>'+
					 '<td align="center" style="width:20%" >'+value.complaint+'</td>'+
					' <td align="center" >'+value.senderName+'</td>'+
					' <td align="center" >'+value.complaintAgainstName+'</td>'+
					' <td align="center" >'+value.designation+'</td>'+
					' <td align="center" style="width:20%" >'+value.organizationName+'</td>'+
					' <td align="center" >'+value.createdDate+'</td>'+
			'</tr>');
			});
			display(data); */
			
			var table=q("#t_pending").dataTable(
					{

						"sPaginationType" : "full_numbers",
						"bProcessing" : false,
						"bServerSide" : false,
						"destroy" : true,
						/* "bRetrieve" : false,	 */			
						"bAutoWidth" : false,		
							
						"aaData" : data,
						
						"aoColumns" : [ {

							"sTitle" : "Complaint",
							"mData" : "complaint",
							"className" : "dt-left",

						},{

							"sTitle" : "Sender Name",
							"mData" : "senderName",
							"className" : "dt-left",

						},{

							"sTitle" : "complaintAgainstName",
							"mData" : "complaintAgainstName",
							"className" : "dt-left",

						},{
							"sTitle" : "designation",
							"mData" : "designation",
							"className" : "dt-left",
						}, {
							"sTitle" : "organizationName",
							"mData" : "organizationName",
							"className" : "dt-left",
						}, {
							"sTitle" : "createdDate",
							"mData" : "createdDate",
							"className" : "dt-left",

						}, {
							"sTitle" : "Pending With",
							"mData" : "dairyStatus",
							"className" : "dt-left",

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
			
		},
		done : function(e) {
			console.log("DONE");
		}
	});

}
</script>

<script>
function disposedReport(section) {
	/*  $('#t_report').hide();
	$('#tbody_pending').empty(); */
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	q.ajax({
		type : "POST",
		url : "<c:url value='/user/complainDisposed'/>",
		data : {
			"fromDate" : fromDate,
			"toDate" : toDate,
			"section":section
		},
		success : function(data) {
			q('#t_pending').show();
			/* $.each(data, function(key, value) {

			$('#tbody_pending').append('<tr>'+
					'<td align="center">&nbsp;</td>'+
					 '<td align="center" style="width:20%" >'+value.complaint+'</td>'+
					' <td align="center" >'+value.senderName+'</td>'+
					' <td align="center" >'+value.complaintAgainstName+'</td>'+
					' <td align="center" >'+value.designation+'</td>'+
					' <td align="center"  style="width:20%" >'+value.organizationName+'</td>'+
					' <td align="center" >'+value.createdDate+'</td>'+
			'</tr>');
			});
			display(data); */
			
			
			var table=q("#t_pending").dataTable(
					{

						"sPaginationType" : "full_numbers",
						"bProcessing" : false,
						"bServerSide" : false,
						"destroy" : true,
						/* "bRetrieve" : false,	 */			
						"bAutoWidth" : false,		
							
						"aaData" : data,
						
						"aoColumns" : [ {

							"sTitle" : "Complaint",
							"mData" : "complaint",
							"className" : "dt-left",

						},{

							"sTitle" : "Sender Name",
							"mData" : "senderName",
							"className" : "dt-left",

						},{

							"sTitle" : "complaintAgainstName",
							"mData" : "complaintAgainstName",
							"className" : "dt-left",

						},{
							"sTitle" : "designation",
							"mData" : "designation",
							"className" : "dt-left",
						}, {
							"sTitle" : "organizationName",
							"mData" : "organizationName",
							"className" : "dt-left",
						}, {
							"sTitle" : "createdDate",
							"mData" : "createdDate",
							"className" : "dt-left",

						},{
							"sTitle" : "Disposed By",
							"mData" : "dairyStatus",
							"className" : "dt-left",

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
			
		},
		done : function(e) {
			console.log("DONE");
		}
	});

}
</script>

<style>
table {
    width:100%;
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



<body id="page2">
	<form name="myform" id="myform" action="">

		<!--==============================content================================-->
		<section id="content">
			<div class="form-group">

		<center>			

						<hr style='background-color: red; border-width: 0; color: #000000; height: 2px; line-height: 0; text-align: left; width: 100%;' />
						<br/>
						<br/>



		<div id="result" style=" color: red; font: bold; ">
 				
 				</div>

			
						<div >
							<h1 style="font-style:normal; font-size:20px; text-align: center; padding-left:42%;  ">Pending & Disposal Report</h1><br></br><br></br>
						
							From Date<input name="fDate" id="fromDate" size="20" placeholder="yyyy-mm-dd" readonly>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							To Date<input name="tDate" id="toDate" size="20" placeholder="yyyy-mm-dd" readonly>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<label>
								<button type="button" class="button-2" id="com_srch"
									onclick="getSection()">Search</button>
							</label>
					</div>
						<br>
						<br>






				











					<table id="t_report" align="center">
						<thead>
							<tr>
							<th><strong>Section</strong></th>
								<th><strong>Receipts</strong></th>
								<th><strong>Total Disposal</strong></th>

								<th><strong>Total Pending</strong></th>
								</tr>
						</thead>
					<tbody id="tbody_report">
						

						</tbody>
						<tbody id="tbody_report2">
						

						</tbody>
						<tbody id="tbody_report3">
						

						</tbody>

					</table>

						<table id="t_pending"  >
						<!-- <thead>
						<tr>
						 <th align="left" style="width:8%"><strong>Sr.No</strong></th>
						 <th align="left" style="width:16%"><strong>Complain No.</strong></th>
						 <th align="left" style="width:16%"><strong>Complaint Name</strong></th>
						  <th align="left" style="width:15%"><strong>Complainee Name</strong></th>
						   <th align="left" style="width:15%"><strong>Designation</strong></th>
						    <th align="left" style="width:28%"><strong>Organization</strong></th>
						    <th align="left" style="width:5%"><strong>Complain Date</strong></th>
						</thead>
						
						
						      <tbody id="tbody_pending">
						
						    </tbody> -->
						</table>


				</center>
	</div>



		</section>
<input type="text" disabled="disabled" id="logintypeforIR" name="logintype"
											path="logintype"value="${loginId}" hidden=true>
	</form>
</body>
