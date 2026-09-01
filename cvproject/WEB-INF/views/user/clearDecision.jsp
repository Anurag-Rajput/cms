<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jQuery.print.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/dataTables.min.css"/>"  type="text/css" ></link> 
<script src="<c:url value="../resources/user/js/dataTables.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="../resources/user/js/dataTables.buttons.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.print.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/buttons.html5.min.js"/>" type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatableformonthly.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.jqueryui.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/datatable/buttons.dataTables.min.css"/>"  type="text/css" ></link>


<script  src="<c:url value="/resources/user/js/alertify.min.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/alertify.js"/>"  type="text/javascript"></script>
<link rel="stylesheet" href="<c:url value="/resources/user/css/alertify.min.css"/>"  type="text/css" ></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/alertify.css"/>"  type="text/css" ></link>
 
<script type="text/javascript">

function getComplain() {
	
	
	var complainNo = document.getElementById("c_no").value;
		
	if(complainNo!="NONE" && complainNo!=""){
		$.ajax({
			url : "<c:url value='/user/getDetailsByCno'/>",
			type : "POST",
			data : {
				"complainNo" : complainNo
			},
			success : function(data) 
			{
				
				if(data[0]!=null)
				{
					document .getElementById('complaint').innerHTML=data[0].complaint;
					
					
					if(data[0].boDecision!="Pending")
					{
						document .getElementById('bodecision').checked=true;

					}
					else
					{
						document .getElementById('bodecision').checked=false;

					}
					if(data[0].boDecisionDate!="Pending")
					{
						document .getElementById('bodecisiondate').checked=true;

					}
					else
					{
						document .getElementById('bodecisiondate').checked=false;

					}
					if(data[0].decision!="Pending")
					{
						document .getElementById('boirfinaldec').checked=true;

					}
					else
					{
						document .getElementById('boirfinaldec').checked=false;

					}
					if(data[0].decisiondate!="Pending")
					{
						document .getElementById('bofinaldecdate').checked=true;

					}
					else
					{
						document .getElementById('bofinaldecdate').checked=false;

					}
					if(data[0].cvoview==1)
					{
						document .getElementById('cvoview').checked=true;

					}
					else
					{
						document .getElementById('cvoview').checked=false;

					}
					if(data[0].status==1)
					{
						document .getElementById('status').checked=true;

					}
					else
					{
						document .getElementById('status').checked=false;

					}
					if(data[0].complaintStatus==1)
					{
						document .getElementById('complainstatus').checked=true;
					}
					else
					{
						document .getElementById('complainstatus').checked=false;
					}
				
					
					document .getElementById('bodecisionvalue').innerHTML=data[0].boDecision;
					document .getElementById('bodecisiondatevalue').innerHTML=data[0].boDecisionDate;
					document .getElementById('boirfinaldecvalue').innerHTML=data[0].decision;
					document .getElementById('bofinaldecdatevalue').innerHTML=data[0].decisiondate;
					document .getElementById('cvoviewvalue').innerHTML=data[0].cvoview;
					document .getElementById('statusvalue').innerHTML=data[0].status;
					document .getElementById('complainstatusvalue').innerHTML=data[0].complaintStatus;
				}
		
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

function clearComplaint()
{
	var complaint=document .getElementById('complaint').innerHTML;
	
	if(complaint!=""){
	 alertify.confirm("Do you really want to clear decisions for this Complaint No:"+complaint+"?",
			  function(e){ 
		if(e)
		{
			 	var bodecision =document .getElementById('bodecision').checked;
			 	var bodecisiondate =document .getElementById('bodecisiondate').checked;
			 	var boirfinaldec =document .getElementById('boirfinaldec').checked;
			 	var bofinaldecdate =document .getElementById('bofinaldecdate').checked;
			 	var cvoview =document .getElementById('cvoview').checked;
			 	var status=document .getElementById('status').checked;
			 	var complainstatus =document .getElementById('complainstatus').checked;
				
				 //alert(bodecision+"-"+bodecisiondate+"-"+boirfinaldec+"-"+bofinaldecdate+"-"+cvoview+"-"+status+"-"+complainstatus );
				 
				 $.ajax({
						url : "<c:url value='/user/clearComplaintDecision'/>",
						type : "POST",
						data : {
							"bodecision" : bodecision,
							"bodecisiondate" : bodecisiondate,
							"boirfinaldec" : boirfinaldec,
							"bofinaldecdate" : bofinaldecdate,
							"cvoview" : cvoview,
							"status" : status,
							"complainstatus" : complainstatus,
							"complaint":complaint
						},
						success : function(data) 
						{
							
							if(data)
							{
								alertify
								  .alert("Successfully cleared checked decisions.", function(){
									  location.reload();
								  }).setHeader('<em>Pull Back</em> ');
								
								
							}
					
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
		
	}).setHeader('<em>Pull Back</em> ');
	}
}
</script>
<title>clear Complaint Decision</title>
</head>
<body>
<center> <br/><br/><h2 style="font-size:32px; font-weight:bold; ">Clear Decision</h2><br/><br/>
            <label style="font-weight: bold;">Search:</label>&nbsp;
            <label>Provide bold number only.Ex <b style="color: red;">XXXX</b>/20XX/vigilance-X &nbsp;</label>
               <span>   <input  name="" id="c_no" size="20"  /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2"  onclick="getComplain()" >Search</button></span>
</center>            
<div align="center" ">
<br><br>
<table>
<thead>
<tr>
<td colspan="2" ><center><label style="font-size:24px; color:maroon;  " id="complaint"></label></center><br></td>
</tr>
</thead>
<tr>
<td><input type="checkbox" id="bodecision" value="bodecision">BoDecision</td>
<td><label  id="bodecisionvalue" style="font-size:18px; color:maroon;  " ></label></td>
</tr>
<tr>
<td><input type="checkbox" id="bodecisiondate" value="bodecisiondate">BoDecisionDate</td>
<td><label id="bodecisiondatevalue" style="font-size:18px; color:maroon;  "  ></label></td>
</tr>
<tr>
<td><input type="checkbox" id="boirfinaldec" value="boirfinaldec">BoFinalDec</td>
<td><label id="boirfinaldecvalue" style="font-size:18px; color:maroon;  "  ></label></td>
</tr>
<tr>
<td><input type="checkbox" id="bofinaldecdate" value="bofinaldecdate">BoFinalDecDate</td>
<td><label  id="bofinaldecdatevalue" style="font-size:18px; color:maroon;  " ></label></td>
</tr>
<tr>
<td><input type="checkbox" id="cvoview" value="cvoview">CvoView</td>
<td><label  id="cvoviewvalue" style="font-size:18px; color:maroon;  " ></label></td>
</tr>
<tr>
<td><input type="checkbox" id="status" value="status">Status</td>
<td><label  id="statusvalue" style="font-size:18px; color:maroon;  "></label></td>
</tr>
<tr>
<td><input type="checkbox" id="complainstatus" value="complainstatus">ComplaintStatus</td>
<td><label  id="complainstatusvalue" style="font-size:18px; color:maroon;  " ></label></td>
</tr>
<tr>
<td colspan="2" align="center" ><br><button type="button" class="button-2"  onclick="clearComplaint();" >Clear</button></td>
</tr>
</table>

</div>            


</body>
</html>