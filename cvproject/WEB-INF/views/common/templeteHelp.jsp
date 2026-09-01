<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title><tiles:insertAttribute name="title" /></title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
       <meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="Expires" content="-1"/>
	<meta http-equiv="pragma" content="no-cache" />
	<title>CVC</title>
	<link rel="stylesheet" href="<c:url value="/resources/user/css/reset.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/style.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/layout.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/prettyPhoto.css"/>" type="text/css" media="screen"></link>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/js/calendar-win2k-cold-1.css"/>" type="text/css" media="screen"></link>

<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-yui.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-replace.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/Dynalight_400.font.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/FF-cash.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.prettyPhoto.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/hover-image.js"/>"type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.easing.1.3.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.bxSlider.js"/>"type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/select/select2.js"/>"  type="text/javascript"></script><%-- 
<script src="<c:url value="/resources/user/js/calendar-en.js"/>"  type="text/javascript"></script> --%>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 
 
<script src="<c:url value="../resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="../resources/user/js/dataTables.buttons.min.js"/>" type="text/javascript"></script>


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
<style>
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<script>


function drawtablefordairy(data)
{
	
	if(data==""){
		var table=$("#SearchTablefordairy").dataTable(
				{

					"sPaginationType" : "full_numbers",
					"bProcessing" : false,
					"bServerSide" : false,
					"bDestroy" : true,
					"bRetrieve" : false,				
					"bAutoWidth" : false,		
						
					"aaData" : data,
					
					"aoColumns" : [ {

						"sTitle" : "Sender Name",
						"mData" : "",
						"className" : "dt-left",

					}, {
						"sTitle" : "Complain Date",
						"mData" : "",
						"className" : "dt-left",
					}, {
						"sTitle" : "Organization Name",
						"mData" : "",
						"className" : "dt-left",
					}, {
						"sTitle" : "Complaint",
						"mData" : "",
						"className" : "dt-left",

					}, {
						"sTitle" : "Section",
						"mData" : "",
						"className" : "dt-left",

					}, {
						"sTitle" : "Decision",
						"mData" : "",
						"className" : "dt-left",
					}, {
						"sTitle" : "Decision Date",
						"mData" : "",
						"className" : "dt-left",
					}, {
						"sTitle" : "Dairy Status",
						"mData" : "",
						"className" : "dt-left",

					},{
						"sTitle" : "Created Date",
						"mData" : "",
						"className" : "dt-left",

						},
					       
					{
						"sTitle" : "View",
						"render": "",
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
	}
	else
	{
	//alert(data.length);
	//alert(data[0].complaint);
	var cno=data[0].complaint.split("/")[0];

	//alert(cno);
	var table=$("#SearchTablefordairy").dataTable(
			{

				"sPaginationType" : "full_numbers",
				"bProcessing" : false,
				"bServerSide" : false,
				"bDestroy" : true,
				"bRetrieve" : false,				
				"bAutoWidth" : false,		
					
				"aaData" : data,
				
				"aoColumns" : [ {

					"sTitle" : "Sender Name",
					"mData" : "senderName",
					"className" : "dt-left",

				}, {
					"sTitle" : "Complain Date",
					"mData" : "complaindate",
					"className" : "dt-left",
				}, {
					"sTitle" : "Organization Name",
					"mData" : "organizationName",
					"className" : "dt-left",
				}, {
					"sTitle" : "Complaint",
					"mData" : "complaint",
					"className" : "dt-left",

				}, {
					"sTitle" : "Section",
					"mData" : "section",
					"className" : "dt-left",

				}, {
					"sTitle" : "Decision",
					"mData" : "decision",
					"className" : "dt-left",
				}, {
					"sTitle" : "Decision Date",
					"mData" : "decisiondate",
					"className" : "dt-left",
				}, {
					"sTitle" : "Dairy Status",
					"mData" : "dairyStatus",
					"className" : "dt-left",

				},{
					"sTitle" : "Created Date",
					"mData" : "createdDate",
					"className" : "dt-left",

					},
				       
				{
					"sTitle" : "View",
					"render": function(data, type, row, meta){
						
						
			                var a='<a style="color:red;" href="javascript:sessionUpdate('+row.complaint.split("/")[0]+',8)">View</a>';
			              
			                return a; 
					},
					
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
	}
}
	function getComplain() {
		
		/* $('#table-body').empty(); */
		var complainNo = document.getElementById("c_no").value;
		var complainName = document.getElementById("c_name").value;
		var div = document.getElementById('result');
		
		if(complainNo!="NONE" && complainNo!=""){
			$.ajax({
				url : "<c:url value='/user/getDetailsByCno'/>",
				type : "POST",
				data : {
					"complainNo" : complainNo
				},
				success : function(data) {
					drawtablefordairy(data);
						/* $('#table-body').empty();
						if (data.length > 0) {
							$('#result').hide();
							$('#table').show();
					$.each(data, function(key, value) {
 */
						/* $('#table-body').append(
			                    $('<tr>')
			                        .append($('<td>').append(""+value.senderName+""))
			                        .append($('<td>').append(""+value.complaindate+""))
			                        .append($('<td>').append(""+value.organizationName+""))
			                        .append($('<td>').append(""+value.complaint+""))
			                        .append($('<td>').append(""+value.section+""))
			                       .append($('<td>').append(""+check+"")) 
			                ); */
						
						/*  $('#table-body').append('<tr>'+
								'<td>'+value.senderName+'</td>'+
								'<td>'+value.complaindate+'</td>'+
								'<td>'+value.organizationName+'</td>'+
								'<td>'+value.complaint+'</td>'+
								'<td>'+value.section+'</td>'+
								'<td>'+value.decision+'</td>'+
								'<td>'+value.decisiondate+'</td>'+
								'<td>'+value.dairyStatus+'</td>'+
								//'<td onclick="sessionUpdate(complainNumber_'+value.complaintNumber+',"0");"><a href="#" >click here</a></td>'+
								'</tr>'); 
					});}
						else{
							$('#result').empty();
							$('#table').hide();
							$('#result').show();
							div.innerHTML =  'Record Not Found.';
						}
					
				display(data); */
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
		
		if(complainName!="NONE" && complainName!=""){
			$.ajax({
				url : "<c:url value='/user/getDetailsByCname'/>",
				type : "POST",
				data : {
					"complainName" : complainName
				},
				success : function(data) {
					drawtablefordairy(data);
						/* $('#table-body').empty();
						if (data.length > 0) {
							$('#result').hide();
							$('#table').show();
					$.each(data, function(key, value) {
						
						 $('#table-body').append('<tr>'+
								'<td>'+value.senderName+'</td>'+
								'<td>'+value.complaindate+'</td>'+
								'<td>'+value.organizationName+'</td>'+
								'<td style="width:20%">'+value.complaint+'</td>'+
								'<td>'+value.section+'</td>'+
								'<td style="width:10%">'+value.decision+'</td>'+
								'<td style="width:10%">'+value.decisiondate+'</td>'+
								'<td>'+value.dairyStatus+'</td>'+
								//'<td onclick="sessionUpdate(complainNumber_'+value.complaintNumber+',"0");"><a href="#" >click here</a></td>'+
								'</tr>'); 
					});}
						else{
							$('#result').empty();
							$('#table').hide();
							$('#result').show();
							div.innerHTML =  'Record Not Found.';
						}
					
				display(data); */
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
		document.getElementById("c_no").value = "";
		document.getElementById("c_name").value = "";
	}
</script>
<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

</script>	
<script>
	$(function() {
		$(".fileuploader").change(function() {

			if (typeof (FileReader) != "undefined") {
				var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.doc|.docx|.pdf)$/;
				$($(this)[0].files).each(function() {
					var file = $(this);
					if (regex.test(file[0].name.toLowerCase())) {
						var reader = new FileReader();
						reader.onload = function(e) {
							var img = $("<file />");
							img.attr("style", "height:100px;width: 100px");
							img.attr("file", e.target.result);
							divPreview.append(img);
						}
						reader.readAsDataURL(file[0]);
					} else {
						alert(file[0].name + " is not a valid file.");
						divPreview.html("");
						return false;
					}
				});
			} else {
				alert("This browser does not support HTML5 FileReader.");
			}
			$(".fileuploader").empty();
		});
	
	
	
	$('#s_org').on('change', function() {
		var orgId = $("#s_org option:selected").val();
		$.ajax({
			url : "<c:url value='/branchByOrgination'/>",
			type : "POST",
			data : {
				"orgId" : orgId
			},
			success : function(data) {
				$('#section_id').empty();
				$.each(data, function(key, value) {
					$('#section_id').append("<option value='" + value.orgSection + "'>" + value.orgSection + "</option>");
				});
			display(data);
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

	});
	});
	
</script>
<script>
$(document).ready(function() {
	$(".select2").select2({
		placeholder : "Select organization",
		allowClear : true,
	});
});
</script>


<!-- For Calender-->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/user/css/calendar.css"/>" />
<script src="<c:url value="/resources/user/js/calendar.js"/>"
	type="text/javascript"></script>

<!-- For Validation-->
<script type="text/javascript"
	src="<c:url value="/resources/user/js/gen_validatorv31.js"/>"></script>
  

</head>
<tiles:insertAttribute name="headerHelp" />
<body>
<tiles:insertAttribute name="body" />
<div id="searchtableIdfordairy" style="width: 2100px; height: 500px;">
	<table id="SearchTablefordairy" class ="display" style="width: 100%" border="solid;" >
		<thead>
		</thead>

	</table>

</div>

</body>
<tiles:insertAttribute name="footer" />
</html>