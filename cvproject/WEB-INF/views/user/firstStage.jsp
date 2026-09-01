
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


<script  src="<c:url value="/resources/user/js/bootstrap.min.js"/>"  type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/bootstrap.min.css"/>"  type="text/css" ></link>


 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First Stage Pending Implementation</title>
</head>
<c:forEach items="${cvo}" var="complain">
<script>

function firstStage()
{
	var advcode=document.getElementById("advCode").value;
	var orgCode="${complain.section}";
	/* alert(orgCode);
	alert(advcode); */
	var dataStr="advcode="+advcode+"&orgCode="+orgCode;
	console.log("data",dataStr);
	<c:url var="formUrl" value="/user/getfirstStageReport"></c:url>
    $.ajax({
	url:"${formUrl}",
	type: "POST",
	data: dataStr,
	async: false,
	cache: false,
	success: function(data){
		
		var table=$("#firstStageTable").dataTable(
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

							"sTitle" : "S.No",
							"mData" : "complainNo",
							"className" : "dt-left",

						},{

						"sTitle" : "File No",
						"mData" : "complaint",
						"className" : "dt-left",

					},{

						"sTitle" : "Advice Date",
						"mData" : "complaindate",
						"className" : "dt-left",

					},{
						"sTitle" : "Name",
						"mData" : "boDecisionDate",
						"className" : "dt-left",
					}, {
						"sTitle" : "Designation",
						"mData" : "dairyStatus",
						"className" : "dt-left",
					}, {
						"sTitle" : "Department Reference",
						"mData" : "decision",
						"className" : "dt-left",

					}
					],
					dom : 'lBfrtip',

					buttons : [
							{
								extend : 'print',
								text : 'Print',
								title : "First Stage Pending Implementation",

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
<h3 align="center"><b>First Stage Pending Implementation</b></h3>

<c:forEach items="${cvo}" var="complain">
<h4 align="center" ><b>${complain.organizationName}</b></h4>
</c:forEach>
<br>
<c:forEach items="${csvlastupdate}" var="lastupdate">
<h4 align="right" style="margin-right:6%; "><b>Last Updated On:</b> ${lastupdate.complainDate}</h4>
</c:forEach>
<center>
	<label><b>Advice Code:</b></label>
	
	<select class="form-control" id="advCode" onchange="firstStage();" style="width:150px">
		<option value="" >------Select------</option>
		<option value="CL" >CLOSURE</option>
		<option value="MA" >MAJOR PENALTY</option>
		<option value="MI" >MINOR PENALTY</option>
		<option value="AA" >ADMINISTRATIVE ACTION</option>
		<option value="EX" >EXONERATION</option>
		<option value="PR" >PROSECUTION</option>
		<option value="CU" >CUT IN PENSION</option>
		<option value="GD" >GOVT DISPL</option>
		<option value="WA" >WARNING</option>
	</select>
</center>
<br>

<center><div style="width: 80%">
	<table id="firstStageTable" class ="display" style="width: 100%"  >
	</table>	
</div>
</center>
</body>
</html>