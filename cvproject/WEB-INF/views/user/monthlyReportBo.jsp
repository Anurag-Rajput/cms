<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel='stylesheet' type='text/css' href='../resources/user/css/datePicker.css'/>
<link rel='stylesheet' type='text/css' href='../resources/user/css/jQueryTable.css'/>
<script src="../resources/user/js/datePicker.js"></script>
<script src="../resources/user/js/jQueryTable.js"></script>

<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 

<script src="<c:url value="/resources/user/js/jquery.dialogextend.js"/>" type="text/javascript"></script>

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
			    /* $('#table_id').DataTable(); */
			   
			    });
			
      /*  function burstCache() {

    	  
    	  
        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      ); */ 

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


</head>








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
	
	drawPopUpWindow("Total Pending Status Report", "totalpendingId", 800, 650);
	DevReportAjax(section,fromDate,toDate) ;
}

function totalcountIRbyOrganization()
{
	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	
	drawPopUpWindow("Total IR Count Status Report", "totalpendingIRcountId", 800, 650);
	DevReportforIRCountAjax(fromDate,toDate) ;
	
}

function totalpendingIRdetails(section)
{

	var fromDate = document.getElementById("fromDate").value;
	var toDate = document.getElementById("toDate").value;
	
	drawPopUpWindow("Total IR Status Report", "totalpendingIRId", 800, 650);
	DevReportforIRAjax(section,fromDate,toDate) ;
}
	
	function monthlyReport() {
		var fromDate = document.getElementById("fromDate").value;
		var toDate = document.getElementById("toDate").value;
		var loginvalue=$("#logintypeforIR").val();
		//alert(loginvalue);
	
		$.ajax({
			url : "<c:url value='/loginTypeValue'/>",
			type : "POST",
			async: false,
			data : {
				"loginvalue" : loginvalue
			},
			
			success : function(data) {
				
				$.each(data, function(key, value) {
		          //  alert("roll type"+data[0].loginRoll);
		          //alert("section"+data[0].desiganation);
		           // $('#rollttype').append(data[0].loginRoll);  
		           discheck= data[0].loginRoll;
		           discheckso =data[0].desiganation;
		           //alert(discheck);
		            
		           $('#rollttype').val(data[0].loginRoll);
		           $('#sectiontype').val(data[0].desiganation);
		        });
			},
			
			error : function(e) {
			console.log(discheck);
			display(e);
			//data[0].loginRoll;
			//return discheck;
		},
		done : function(e) {
			console.log(discheck);
			//alert(discheck);
		}
			
		}); 
		
		var ro =discheck;
		section = discheckso;
		
		var result;
		if(section.indexOf("/")>=0)
		{
			var i=0;
			//alert(section);
			result=section.split("/");
			for(i=0;result[i] != null;i++){
				setSection(result[i],i,fromDate,toDate);
			}
		}
		else
		{
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
				url : "<c:url value='/user/getMonthlyDetails'/>",
				data : {
					"fromDate" : fromDate,
					"toDate" : toDate,
					"section":section
				},
				success : function(data) {
					
					var table=$("#reportdetailreport").dataTable(
							{

								"sPaginationType" : "full_numbers",
								"bProcessing" : false,
								"bServerSide" : false,
								"destroy" : true,
								/* "bRetrieve" : false,	 */			
								"bAutoWidth" : false,		
									
								"aaData" : data,
								
								"aoColumns" : [ {

									"sTitle" : "Brought forward",
									"mData" : "broughtForward",
									"className" : "dt",

								},{

									"sTitle" : "Receipts",
									"mData" : "receipt",
									"className" : "dt",

								},{
									"sTitle" : "Total Disposal",
									"mData" : "totalDisposal",
									"className" : "dt",
								}, {
									"sTitle" : "IR",
									 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
								            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+oData.ir+'</a>');
								            				        },
									 /* "render": function(data, type, row, meta){									
										var a='<a style="color:red;" href="#" onclick="totalpendingIRdetails()">'+data.ir+'</a>';
						               // return a;
						               }, */
						            "mData" : "ir",
									"className" : "dt",
								},
								{
									"sTitle" : "Filed",
									"mData" : "fd",
									"className" : "dt",
								},
								{
									"sTitle" : "NA",
									"mData" : "na",
									"className" : "dt",
								},{
									"sTitle" : "pendingLastMonth",
									"mData" : "pendingLastMonth",
									"className" : "dt",

								},
								{
									"sTitle" : "pendingLastThreeMonth",
									"mData" : "pendingLastThreeMonth",
									"className" : "dt",

								},
								{
									"sTitle" : "pendingMoreThanThreeMonth",
									"mData" : "pendingMoreThanThreeMonth",
									"className" : "dt",

								},{
									
									"sTitle" : "Total pending",
									"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
							            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+oData.totalPending+'</a>');
							            				        },
									"mData" : "totalPending",
									"className" : "dt",

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
}



		
    var section1,section2,section3,section4,section5,section6,section7;
    function setSection(sec,i,fromDate,toDate)
    {
    	if(i==0)
    	{
    		
    		section1=sec;
    		Section1(section1,fromDate,toDate);
    	}
    	else if(i==1)
    	{
    		section2=sec;
    		Section2(section2,fromDate,toDate);
    	}
    	else if(i==2)
    	{
    		section3=sec;
    		Section3(section3,fromDate,toDate);
    	}
    	else if(i==3)
    	{
    		section4=sec;
    		Section4(section4,fromDate,toDate);
    	}
    	else if(i==4)
    	{
    		section5=sec;
    		Section5(section5,fromDate,toDate);
    	}

    	else if(i==5)
    	{
    		section6=sec;
    		Section6(section6,fromDate,toDate);
    	}
    	else if(i==6)
    	{
    		section7=sec;
    		Section7(section7,fromDate,toDate);
    	}

    }
	
	function Section1(section,fromDate,toDate)
	{

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
			url : "<c:url value='/user/getMonthlyDetails'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(data) {
				
				var table=$("#reportdetailreport").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							/* "bRetrieve" : false,	 */			
							"bAutoWidth" : false,		
								
							"aaData" : data,
							
							"aoColumns" : [ {

								"sTitle" : "Brought forward",
								"mData" : "broughtForward",
								"className" : "dt",

							},{

								"sTitle" : "Receipts",
								"mData" : "receipt",
								"className" : "dt",

							},{
								"sTitle" : "Total Disposal",
								"mData" : "totalDisposal",
								"className" : "dt",
							}, {
								"sTitle" : "IR",
								 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
							            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+oData.ir+'</a>');
							            				        },
								 /* "render": function(data, type, row, meta){									
									var a='<a style="color:red;" href="#" onclick="totalpendingIRdetails()">'+data.ir+'</a>';
					               // return a;
					               }, */
					            "mData" : "ir",
								"className" : "dt",
							},
							{
								"sTitle" : "Filed",
								"mData" : "fd",
								"className" : "dt",
							},
							{
								"sTitle" : "NA",
								"mData" : "na",
								"className" : "dt",
							},{
								"sTitle" : "pendingLastMonth",
								"mData" : "pendingLastMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingLastThreeMonth",
								"mData" : "pendingLastThreeMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingMoreThanThreeMonth",
								"mData" : "pendingMoreThanThreeMonth",
								"className" : "dt",

							},{
								
								"sTitle" : "Total pending",
								"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+oData.totalPending+'</a>');
						            				        },
								"mData" : "totalPending",
								"className" : "dt",

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
	function Section2(section,fromDate,toDate)
	{

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
			url : "<c:url value='/user/getMonthlyDetails'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(data) {
				
				var table=$("#reportdetailreport2").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							/* "bRetrieve" : false,	 */			
							"bAutoWidth" : false,		
								
							"aaData" : data,
							
							"aoColumns" : [ {

								"sTitle" : "Brought forward",
								"mData" : "broughtForward",
								"className" : "dt",

							},{

								"sTitle" : "Receipts",
								"mData" : "receipt",
								"className" : "dt",

							},{
								"sTitle" : "Total Disposal",
								"mData" : "totalDisposal",
								"className" : "dt",
							}, {
								"sTitle" : "IR",
								 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
							            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+oData.ir+'</a>');
							            				        },
								 /* "render": function(data, type, row, meta){									
									var a='<a style="color:red;" href="#" onclick="totalpendingIRdetails()">'+data.ir+'</a>';
					               // return a;
					               }, */
					            "mData" : "ir",
								"className" : "dt",
							},
							{
								"sTitle" : "Filed",
								"mData" : "fd",
								"className" : "dt",
							},
							{
								"sTitle" : "NA",
								"mData" : "na",
								"className" : "dt",
							},{
								"sTitle" : "pendingLastMonth",
								"mData" : "pendingLastMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingLastThreeMonth",
								"mData" : "pendingLastThreeMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingMoreThanThreeMonth",
								"mData" : "pendingMoreThanThreeMonth",
								"className" : "dt",

							},{
								
								"sTitle" : "Total pending",
								"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+oData.totalPending+'</a>');
						            				        },
								"mData" : "totalPending",
								"className" : "dt",

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
	function Section3(section,fromDate,toDate)
	{

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
			url : "<c:url value='/user/getMonthlyDetails'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(data) {
				
				var table=$("#reportdetailreport3").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							/* "bRetrieve" : false,	 */			
							"bAutoWidth" : false,		
								
							"aaData" : data,
							
							"aoColumns" : [ {

								"sTitle" : "Brought forward",
								"mData" : "broughtForward",
								"className" : "dt",

							},{

								"sTitle" : "Receipts",
								"mData" : "receipt",
								"className" : "dt",

							},{
								"sTitle" : "Total Disposal",
								"mData" : "totalDisposal",
								"className" : "dt",
							}, {
								"sTitle" : "IR",
								 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
							            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+oData.ir+'</a>');
							            				        },
								 /* "render": function(data, type, row, meta){									
									var a='<a style="color:red;" href="#" onclick="totalpendingIRdetails()">'+data.ir+'</a>';
					               // return a;
					               }, */
					            "mData" : "ir",
								"className" : "dt",
							},
							{
								"sTitle" : "Filed",
								"mData" : "fd",
								"className" : "dt",
							},
							{
								"sTitle" : "NA",
								"mData" : "na",
								"className" : "dt",
							},{
								"sTitle" : "pendingLastMonth",
								"mData" : "pendingLastMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingLastThreeMonth",
								"mData" : "pendingLastThreeMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingMoreThanThreeMonth",
								"mData" : "pendingMoreThanThreeMonth",
								"className" : "dt",

							},{
								
								"sTitle" : "Total pending",
								"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+oData.totalPending+'</a>');
						            				        },
								"mData" : "totalPending",
								"className" : "dt",

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
	function Section4(section,fromDate,toDate)
	{

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
			url : "<c:url value='/user/getMonthlyDetails'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(data) {
				
				var table=$("#reportdetailreport4").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							/* "bRetrieve" : false,	 */			
							"bAutoWidth" : false,		
								
							"aaData" : data,
							
							"aoColumns" : [ {

								"sTitle" : "Brought forward",
								"mData" : "broughtForward",
								"className" : "dt",

							},{

								"sTitle" : "Receipts",
								"mData" : "receipt",
								"className" : "dt",

							},{
								"sTitle" : "Total Disposal",
								"mData" : "totalDisposal",
								"className" : "dt",
							}, {
								"sTitle" : "IR",
								 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
							            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+oData.ir+'</a>');
							            				        },
								 /* "render": function(data, type, row, meta){									
									var a='<a style="color:red;" href="#" onclick="totalpendingIRdetails()">'+data.ir+'</a>';
					               // return a;
					               }, */
					            "mData" : "ir",
								"className" : "dt",
							},
							{
								"sTitle" : "Filed",
								"mData" : "fd",
								"className" : "dt",
							},
							{
								"sTitle" : "NA",
								"mData" : "na",
								"className" : "dt",
							},{
								"sTitle" : "pendingLastMonth",
								"mData" : "pendingLastMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingLastThreeMonth",
								"mData" : "pendingLastThreeMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingMoreThanThreeMonth",
								"mData" : "pendingMoreThanThreeMonth",
								"className" : "dt",

							},{
								
								"sTitle" : "Total pending",
								"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+oData.totalPending+'</a>');
						            				        },
								"mData" : "totalPending",
								"className" : "dt",

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
	function Section5(section,fromDate,toDate)
	{

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
			url : "<c:url value='/user/getMonthlyDetails'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(data) {
				
				var table=$("#reportdetailreport5").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							/* "bRetrieve" : false,	 */			
							"bAutoWidth" : false,		
								
							"aaData" : data,
							
							"aoColumns" : [ {

								"sTitle" : "Brought forward",
								"mData" : "broughtForward",
								"className" : "dt",

							},{

								"sTitle" : "Receipts",
								"mData" : "receipt",
								"className" : "dt",

							},{
								"sTitle" : "Total Disposal",
								"mData" : "totalDisposal",
								"className" : "dt",
							}, {
								"sTitle" : "IR",
								 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
							            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+oData.ir+'</a>');
							            				        },
								 /* "render": function(data, type, row, meta){									
									var a='<a style="color:red;" href="#" onclick="totalpendingIRdetails()">'+data.ir+'</a>';
					               // return a;
					               }, */
					            "mData" : "ir",
								"className" : "dt",
							},
							{
								"sTitle" : "Filed",
								"mData" : "fd",
								"className" : "dt",
							},
							{
								"sTitle" : "NA",
								"mData" : "na",
								"className" : "dt",
							},{
								"sTitle" : "pendingLastMonth",
								"mData" : "pendingLastMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingLastThreeMonth",
								"mData" : "pendingLastThreeMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingMoreThanThreeMonth",
								"mData" : "pendingMoreThanThreeMonth",
								"className" : "dt",

							},{
								
								"sTitle" : "Total pending",
								"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+oData.totalPending+'</a>');
						            				        },
								"mData" : "totalPending",
								"className" : "dt",

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
	function Section6(section,fromDate,toDate)
	{

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
			url : "<c:url value='/user/getMonthlyDetails'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(data) {
				
				var table=$("#reportdetailreport6").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							/* "bRetrieve" : false,	 */			
							"bAutoWidth" : false,		
								
							"aaData" : data,
							
							"aoColumns" : [ {

								"sTitle" : "Brought forward",
								"mData" : "broughtForward",
								"className" : "dt",

							},{

								"sTitle" : "Receipts",
								"mData" : "receipt",
								"className" : "dt",

							},{
								"sTitle" : "Total Disposal",
								"mData" : "totalDisposal",
								"className" : "dt",
							}, {
								"sTitle" : "IR",
								 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
							            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+oData.ir+'</a>');
							            				        },
								 /* "render": function(data, type, row, meta){									
									var a='<a style="color:red;" href="#" onclick="totalpendingIRdetails()">'+data.ir+'</a>';
					               // return a;
					               }, */
					            "mData" : "ir",
								"className" : "dt",
							},
							{
								"sTitle" : "Filed",
								"mData" : "fd",
								"className" : "dt",
							},
							{
								"sTitle" : "NA",
								"mData" : "na",
								"className" : "dt",
							},{
								"sTitle" : "pendingLastMonth",
								"mData" : "pendingLastMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingLastThreeMonth",
								"mData" : "pendingLastThreeMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingMoreThanThreeMonth",
								"mData" : "pendingMoreThanThreeMonth",
								"className" : "dt",

							},{
								
								"sTitle" : "Total pending",
								"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+oData.totalPending+'</a>');
						            				        },
								"mData" : "totalPending",
								"className" : "dt",

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
	function Section7(section,fromDate,toDate)
	{

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
			url : "<c:url value='/user/getMonthlyDetails'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate,
				"section":section
			},
			success : function(data) {
				
				var table=$("#reportdetailreport7").dataTable(
						{

							"sPaginationType" : "full_numbers",
							"bProcessing" : false,
							"bServerSide" : false,
							"destroy" : true,
							/* "bRetrieve" : false,	 */			
							"bAutoWidth" : false,		
								
							"aaData" : data,
							
							"aoColumns" : [ {

								"sTitle" : "Brought forward",
								"mData" : "broughtForward",
								"className" : "dt",

							},{

								"sTitle" : "Receipts",
								"mData" : "receipt",
								"className" : "dt",

							},{
								"sTitle" : "Total Disposal",
								"mData" : "totalDisposal",
								"className" : "dt",
							}, {
								"sTitle" : "IR",
								 "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
							            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingIRdetails('+section+')">'+oData.ir+'</a>');
							            				        },
								 /* "render": function(data, type, row, meta){									
									var a='<a style="color:red;" href="#" onclick="totalpendingIRdetails()">'+data.ir+'</a>';
					               // return a;
					               }, */
					            "mData" : "ir",
								"className" : "dt",
							},
							{
								"sTitle" : "Filed",
								"mData" : "fd",
								"className" : "dt",
							},
							{
								"sTitle" : "NA",
								"mData" : "na",
								"className" : "dt",
							},{
								"sTitle" : "pendingLastMonth",
								"mData" : "pendingLastMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingLastThreeMonth",
								"mData" : "pendingLastThreeMonth",
								"className" : "dt",

							},
							{
								"sTitle" : "pendingMoreThanThreeMonth",
								"mData" : "pendingMoreThanThreeMonth",
								"className" : "dt",

							},{
								
								"sTitle" : "Total pending",
								"fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {
						            $(nTd).html('<a style="color:red;" href="#" onclick="totalpendingdetails('+section+')">'+oData.totalPending+'</a>');
						            				        },
								"mData" : "totalPending",
								"className" : "dt",

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
<table id="reportdetailreport" class="display"> </table>
<table id="reportdetailreport2" class="display"> </table>
<table id="reportdetailreport3" class="display"> </table>
<table id="reportdetailreport4" class="display"> </table>
<table id="reportdetailreport5" class="display"> </table>
<table id="reportdetailreport6" class="display"> </table>
<table id="reportdetailreport7" class="display"> </table>
</div>


		</section>

	<input type="text" disabled="disabled" id="logintypeforIR" name="logintype"
											path="logintype"value="${loginId}" hidden=true>
</body>


<div id="totalpending" style="display: none">
	<jsp:include page="detailPendingReport.jsp" />
</div>



<div id="totalpendingforIR" style="display: none">
	<jsp:include page="detailPendingReportIR.jsp" />
</div>



<div id="totalpendingforIRCount" style="display: none">
	<jsp:include page="detailPendingCountReportIR.jsp" />
</div>
