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
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.dataTables.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>"  type="text/css" ></link> 
<link rel="stylesheet" href="<c:url value="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"/>"  type="text/css" ></link>  
<script type = "text/javascript" >
$(document).ready(
		function() {
		
			var discheckroll=null;
			var discheckso=null;
			var loginvalue=$("#logintypeforIR").val();

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
			var sec = discheckso;
			

			InterimIR(sec);
			
	    });
</script>




<script>
var section1,section2,section3,section4,section5,section6,section7;
function setSection(sec,i)
{
	if(i==0)
	{
		
		section1=sec;
		Section1(section1);
	}
	else if(i==1)
	{
		section2=sec;
		Section2(section2);
	}
	else if(i==2)
	{
		section3=sec;
		Section3(section3);
	}
	else if(i==3)
	{
		section4=sec;
		Section4(section4);
	}
	else if(i==4)
	{
		section5=sec;
		Section5(section5);
	}

	else if(i==5)
	{
		section6=sec;
		Section6(section6);
	}
	else if(i==6)
	{
		section7=sec;
		Section7(section7);
	}

}	
function InterimIR(section) {
	
	var result;
	if(section.indexOf("/")>=0)
	{
		var i=0;
		//alert(section);
		result=section.split("/");
		for(i=0;result[i] != null;i++){
			setSection(result[i],i);
		}
	}	
	else
	{
		 $.ajax({
			type : "POST",
			url : "<c:url value='/user/getInterimIR'/>",
			data : {
				"section" : section,
				
			},
			success : function(data) {
				var table=$("#interimIrTable").dataTable(
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

								"sTitle" : "File Number",
								"mData" : "fileNo",
								"className" : "dt-left",

							},{
								"sTitle" : "Complain Date",
								"mData" : "complaindate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "BO Decision Date",
								"mData" : "boDecisionDate",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}, {
								"sTitle" : "Dairy Status",
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
				display(e);
			},
			done : function(e) {
				console.log("DONE");
			}
		});
		
	}
	
	}
function Section1(section) {
	
	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/getInterimIR'/>",
			data : {
				"section" : section1,
				
			},
			success : function(data) {
				var table=$("#interimIrTable1").dataTable(
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

								"sTitle" : "File Number",
								"mData" : "fileNo",
								"className" : "dt-left",

							},{
								"sTitle" : "Complain Date",
								"mData" : "complaindate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "BO Decision Date",
								"mData" : "boDecisionDate",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}, {
								"sTitle" : "Dairy Status",
								"mData" : "dairyStatus",
								"className" : "dt-left",

							}
							

							],
							dom : 'lBfrtip',

							buttons : [
									{
										extend : 'print',
										text : 'Print',
										title : "Search Report",

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

function Section2(section2) {
	
	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/getInterimIR'/>",
			data : {
				"section" : section2,
				
			},
			success : function(data) {
				var table=$("#interimIrTable2").dataTable(
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

								"sTitle" : "File Number",
								"mData" : "fileNo",
								"className" : "dt-left",

							},{
								"sTitle" : "Complain Date",
								"mData" : "complaindate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "BO Decision Date",
								"mData" : "boDecisionDate",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}, {
								"sTitle" : "Dairy Status",
								"mData" : "dairyStatus",
								"className" : "dt-left",

							}
							

							],
							dom : 'lBfrtip',

							buttons : [
									{
										extend : 'print',
										text : 'Print',
										title : "Search Report",

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
	
function Section3(section3) {
	
	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/getInterimIR'/>",
			data : {
				"section" : section3,
				
			},
			success : function(data) {
				var table=$("#interimIrTable3").dataTable(
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

								"sTitle" : "File Number",
								"mData" : "fileNo",
								"className" : "dt-left",

							},{
								"sTitle" : "Complain Date",
								"mData" : "complaindate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "BO Decision Date",
								"mData" : "boDecisionDate",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}, {
								"sTitle" : "Dairy Status",
								"mData" : "dairyStatus",
								"className" : "dt-left",

							}
							

							],
							dom : 'lBfrtip',

							buttons : [
									{
										extend : 'print',
										text : 'Print',
										title : "Search Report",

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
	
function Section4(section4) {
	
	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/getInterimIR'/>",
			data : {
				"section" : section4,
				
			},
			success : function(data) {
				var table=$("#interimIrTable4").dataTable(
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

								"sTitle" : "File Number",
								"mData" : "fileNo",
								"className" : "dt-left",

							},{
								"sTitle" : "Complain Date",
								"mData" : "complaindate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "BO Decision Date",
								"mData" : "boDecisionDate",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}, {
								"sTitle" : "Dairy Status",
								"mData" : "dairyStatus",
								"className" : "dt-left",

							}
							

							],
							dom : 'lBfrtip',

							buttons : [
									{
										extend : 'print',
										text : 'Print',
										title : "Search Report",

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
function Section5(section5) {
	
	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/getInterimIR'/>",
			data : {
				"section" : section5,
				
			},
			success : function(data) {
				var table=$("#interimIrTable5").dataTable(
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

								"sTitle" : "File Number",
								"mData" : "fileNo",
								"className" : "dt-left",

							},{
								"sTitle" : "Complain Date",
								"mData" : "complaindate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "BO Decision Date",
								"mData" : "boDecisionDate",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}, {
								"sTitle" : "Dairy Status",
								"mData" : "dairyStatus",
								"className" : "dt-left",

							}
							

							],
							dom : 'lBfrtip',

							buttons : [
									{
										extend : 'print',
										text : 'Print',
										title : "Search Report",

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
function Section6(section6) {
	
	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/getInterimIR'/>",
			data : {
				"section" : section6,
				
			},
			success : function(data) {
				var table=$("#interimIrTable6").dataTable(
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

								"sTitle" : "File Number",
								"mData" : "fileNo",
								"className" : "dt-left",

							},{
								"sTitle" : "Complain Date",
								"mData" : "complaindate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "BO Decision Date",
								"mData" : "boDecisionDate",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}, {
								"sTitle" : "Dairy Status",
								"mData" : "dairyStatus",
								"className" : "dt-left",

							}
							

							],
							dom : 'lBfrtip',

							buttons : [
									{
										extend : 'print',
										text : 'Print',
										title : "Search Report",

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
function Section7(section7) {
	
	 $.ajax({
			type : "POST",
			url : "<c:url value='/user/getInterimIR'/>",
			data : {
				"section" : section7,
				
			},
			success : function(data) {
				var table=$("#interimIrTable7").dataTable(
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

								"sTitle" : "File Number",
								"mData" : "fileNo",
								"className" : "dt-left",

							},{
								"sTitle" : "Complain Date",
								"mData" : "complaindate",
								"className" : "dt-left",
							}, {
								"sTitle" : "Created Date",
								"mData" : "createdDate",
								"className" : "dt-left",
							}, {
								"sTitle" : "BO Decision Date",
								"mData" : "boDecisionDate",
								"className" : "dt-left",

							},{

								"sTitle" : "BO Decision",
								"mData" : "decision",
								"className" : "dt-left",

							}, {
								"sTitle" : "Dairy Status",
								"mData" : "dairyStatus",
								"className" : "dt-left",

							}
							

							],
							dom : 'lBfrtip',

							buttons : [
									{
										extend : 'print',
										text : 'Print',
										title : "Search Report",

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
</script>

<body id="page2">
	



		<!--==============================content================================-->
					

						<hr style='background-color: red; border-width: 0; color: #000000; height: 2px; line-height: 0; text-align: left; width: 100%;' />
						<br/>
						<br/>



		<div align="center" id="result" style=" color: red; font: bold; width: 100%; height: 50%;">
 					
 				</div>
 				
 				<h1 style="font-size:26px; padding-left:48%;  "><u>Interim IR Report</u></h1>
 				<div>
					<table id="interimIrTable" class ="display" style="width: 100%"  >
					
					</table>	
				</div>
				<br>
				<div>
					<table id="interimIrTable1" class ="display" style="width: 100%"  >
						
					</table>	
				</div>
					<br>
				<div>
					<table id="interimIrTable2" class ="display" style="width: 100%"  >
						
					</table>	
				</div>
					<br>
				<div>
					<table id="interimIrTable3" class ="display" style="width: 100%"  >
					
					</table>	
				</div>
					<br>
				<div>
					<table id="interimIrTable4" class ="display" style="width: 100%"  >
						
					</table>	
				</div>
					<br>
				<div>
					<table id="interimIrTable5" class ="display" style="width: 100%"  >
						
					</table>	
				</div>
					<br>
				<div>
					<table id="interimIrTable6" class ="display" style="width: 100%"  >
					
					</table>	
				</div>
				<div>
					<table id="interimIrTable7" class ="display" style="width: 100%"  >
					
					</table>	
				</div>

	
										<input type="text" disabled="disabled" id="logintypeforIR" name="logintype"
											path="logintype"value="${loginId}" hidden=true>


		

	
</body>


