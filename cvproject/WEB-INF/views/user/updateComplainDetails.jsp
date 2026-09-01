<%@page import="com.cvc.dto.NotingDto"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link rel="stylesheet" href="<c:url value="/resources/user/css/alertify.min.css"/>"  type="text/css" ></link>
 <link rel="stylesheet" href="<c:url value="/resources/user/css/alertify.css"/>"  type="text/css" ></link> 
 <script  src="<c:url value="/resources/user/js/alertify.min.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/alertify.js"/>"  type="text/javascript"></script>

  
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <link rel='stylesheet' type='text/css' href='../resources/user/css/datePicker.css'/>
<link rel='stylesheet' type='text/css' href='../resources/user/css/jQueryTable.css'/>
<script src="../resources/user/js/datePicker.js"></script>
<script src="../resources/user/js/jQueryTable.js"></script>



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
  var j = jQuery.noConflict();
  j(document).ready(
			function() {
					
					j("#d_o_comp").datepicker({
						changeMonth: true,
				        changeYear: true,
						dateFormat: 'yy-mm-dd',
						maxDate: "now"
					});
				 
					if(document.getElementById("section_id").value=='Cordn-2')
						document.getElementById("coord_sec").value=document.getElementById("section_id").value;
					else
						document.getElementById("coord_sec").value=0;
					
					if(document.getElementById('IRboirfinaldec').checked==true)
					{
					
					
						var test= document.getElementById('boirfinaldecdate').value;
						
						document.getElementById('stageIR').value ="IRF";
					
						var test1= document.getElementById('stageIR').value;
						//alert(test1);
					}
				else
					{
						document.getElementById('stageIR').value="";
					}
				    });
  
  
  function recordRoom(complaintNo) {
	  
	j( "#dialog-confirm" ).text("Do yoy realy want to send this complaint to record room.");
    j( "#dialog-confirm" ).dialog({
      resizable: false,
      height: "auto",
      width: "auto",
      modal: true,
      buttons: {
        "Yes": function() {
           sessionUpdate('complainNumber_'+complaintNo,'5');
          j( this ).dialog( "close" );
        },
        Cancel: function() {
          j( this ).dialog( "close" );
        }
      }
    });
  } 
  </script>

<script type="text/javascript" >
// When the user clicks on div, open the popup
function myFunction() {
    var popup = document.getElementById('myPopup');
    popup.classList.toggle('show');
}
</script>

<script type="text/javascript">

$(document).ready(function() {
	 $('#divviewer').hide(); 	
});


</script>
<script type="text/javascript">

$(document).ready(function() {
	var result=$("#complaint").val();
	result=result.split("/");
	var complainNo=result[0];
	  
	  $.ajax({
			url : "<c:url value='/user/getDetailsByCno'/>",
			type : "POST",
			data : {
				"complainNo" : complainNo,
				
			},
			success : function(data) {
				document.getElementById('display12').value=data[0].boircondate;
				document.getElementById('display122').value=data[0].boirremidate;
				document.getElementById('display2').value=data[0].boirconrecdate;
				document.getElementById('display3').value=data[0].boirackdate;
				document.getElementById('demo1').value=data[0].bofiledackdate;
				document.getElementById('display4').value=data[0].boNaAckDate;
				document.getElementById('display41').value=data[0].boNaOmDate;
				document.getElementById('fileno').value=data[0].fileNo.toUpperCase();
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
 

	var test=$("#Organization1").val();
	
	//var name=$("#s_name").val();
	
	//if(name.search( /^[a-zA-Z0-9]+$/));
	
	
 	$("#Organization1").on('change', function() {
	var orgId = $("#Organization1 option:selected").val();
	
	//alert(orgId);
	$.ajax({
		url : "<c:url value='/branchByOrgination'/>",
		type : "POST",
		data : {
			"orgId" : orgId
		},
		
		success : function(data) {
			//$('#section_id').empty();
			$('#orgCode_id2').empty();
			$.each(data, function(key, value) {
				//$('#section_id').append("<option value=" + data[0].orgSection) + ">" + data[0].orgSection + "</option>");
				$('#orgCode_id2').append("<option value='" + data[0].organisationCode + "'>" + data[0].organisationCode+ "</option>");
			});
		
		//alert(data[0].orgSection);
		alert(data[0].organisationCode);
		//console.log("SUCCESS: ", data);
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
function getvalforsection(){

	
	var forwardcross = $('#sel_officer option:selected').text();
	//alert(forwardcross);
	document.getElementById("forwradvalue").value = forwardcross;
	
	 var dateofcomplaint = document.getElementById('d_o_comp').value;
		var sendername = document.getElementById('s_name').value;
		var add = document.getElementById('add').value;
		var add2= document.getElementById('add2').value;
		var city= document.getElementById('city').value;
		var state= document.getElementById('state').value;
		var pin= document.getElementById('p_no').value;
		var email= document.getElementById('email').value;
		var mobno= document.getElementById('mb_no').value;
		var Complainee= document.getElementById('comp_name').value;
		var desig= document.getElementById('desiganation').value;
	
		if(dateofcomplaint==""||dateofcomplaint==null||dateofcomplaint>j.datepicker.formatDate('yy-mm-dd', new Date()))
		{
			document.getElementById('d_o_comp').focus();
			alertify.alert("Please select correct date of complaint!!", function(){
		  	  });
			document.getElementById("sel_officer").selectedIndex=0;
		 return false
		 
		}
		if(sendername==""||sendername==null)
		{
			document.getElementById('s_name').focus();
			alertify.alert("Please enter correct sender's name!!", function(){
		  	  });
			document.getElementById("sel_officer").selectedIndex=0;
		 return false	
		}
		
		if(!(add==""||add==null))
		{
			if(add.search(/^[0-9a-z|A-Z\s\b,-./]+$/))
			{
				document.getElementById('add').focus();
				alertify.alert("Please enter correct address!!", function(){
			  	  });
				document.getElementById("sel_officer").selectedIndex=0;
			 return false
			}
		}
		if(!(add2==""||add2==null))
		{ 
			if(add2.search(/^[0-9a-z|A-Z\s\b,-./]+$/))
			{
				document.getElementById('add2').focus();
				alertify.alert("Please enter correct address!!", function(){
			  	  });
				document.getElementById("sel_officer").selectedIndex=0;
			 return false
			}
		}
		if(!(city==""||city==null))
		{
			if(city.search(/^[a-z|A-Z\s\b]+$/))
			{
				document.getElementById('city').focus();
				alertify.alert("Please enter correct city!!", function(){
			  	  });
				document.getElementById("sel_officer").selectedIndex=0;
			 return false
			}
		}
		if(!(state==""||state==null))
		{
			if(state.search(/^[a-z|A-Z\s\b]+$/))
			{
				document.getElementById('state').focus();
				alertify.alert("Please enter correct state!!", function(){
			  	  });
				document.getElementById("sel_officer").selectedIndex=0;
			 return false
			}
		}
		if(!(pin==""||pin==null || pin==0))
		{	
			if(pin.search(/^[0-9]{6}$/))
			{
				document.getElementById('p_no').focus();
				alertify.alert("Please enter correct pincode!!", function(){
			  	  });
				document.getElementById("sel_officer").selectedIndex=0;
			 return false
			}
		}
		if(!(email==""||email==null))
		{
			if(email.search(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
			{
				document.getElementById('email').focus();
				alertify.alert("Please enter correct email!!", function(){
			  	  });
				document.getElementById("sel_officer").selectedIndex=0;
			 return false
			}
		}
		if(!(mobno==""||mobno==null))
		{
			if(mobno.search(/^[0-9]{10}$/))
			{
				document.getElementById('mb_no').focus();
				alertify.alert("Please enter correct mobile no!!", function(){
			  	  });
				document.getElementById("sel_officer").selectedIndex=0;
			 return false
			}
		}
		if(!(Complainee==""||Complainee==null))
		{
			if(Complainee.search(/^[a-z|A-Z\s\b.]+$/))
			{
				document.getElementById('comp_name').focus();
				alertify.alert("Please enter correct complainee name!!", function(){
			  	  });
				document.getElementById("sel_officer").selectedIndex=0;
			 return false
			}
		}
		if(!(desig==""||desig==null))
		{
			if(desig.search(/^[0-9a-z|A-Z\s]+$/))
			{
				document.getElementById('desiganation').focus();
				alertify.alert("Please enter correct designation!!", function(){
			  	  });
				document.getElementById("sel_officer").selectedIndex=0;
			 return false
			}
		}
		
		  if($("input[name='boirfinaldec'][value='IR']").prop("checked") && (document.getElementById('fileno').value.trim()==null || document.getElementById('fileno').value.trim()==""||document.getElementById('fileno').value.length <3 ))
			{
			  document.getElementById('fileno').focus();
			//alert( $("input[name='boirfinaldec']:checked").val());
			 alertify.alert("Please provide correct File Number!!", function(){
			
		  	  });
			 document.getElementById("sel_officer").selectedIndex=0;
			 return false
			
			} 
}

function forwardValidate(complaint)
{
	var org= document.getElementById('Organization').value;
	var section= document.getElementById('section_id').value;
	var confirmcvo= document.getElementById('sel_officer').value;
	var dec= $('input[name=boDecision]:checked').val();;
	var decDate= document.getElementById('displayboDecisionDate').value;
	
	
	if(org==""||org==null)
	{
		document.getElementById('Organization').focus;
		alertify.alert("Please select organisation!!", function(){
			
	  	  });
	}
	else if(section==""||section==null|| section >9)
	{
		document.getElementById('section_id').focus;
		alertify.alert("Please enter correct section!!", function(){
			
	  	  });
	}
	else if(confirmcvo==""||confirmcvo==null||confirmcvo=="None"||confirmcvo=="0")
	{
		
		document.getElementById('sel_officer').focus;
		alertify.alert("Please select officer to forward complaint!!", function(){
			
	  	  });
	}
	else if((dec!=null && decDate=="")||(dec==null && decDate!=""))
	{
		
		document.getElementById('sel_officer').focus;
		alertify.alert("Please select correct decision or decision date.", function(){
			
	  	  });
	}
	else 
	{
		sessionUpdate('complainNumber_'+complaint,'3');
	}
	
	
	//sessionUpdate('complainNumber_${complain.complaintNumber}','3');
}
</script>

<!-- <script type="text/javascript">


</script> -->

<script type="text/javascript">

$(document).ready(function() {	

	
	var discheckroll=null;
	var discheckso=null;
	var loginvalue=$("#logintype").val();

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
	//var sec =discheck[1].split("-");

	
	var test=new Date();
	
	var dd = test.getDate();
	 var mm = test.getMonth()+1;//January is 0!
	 var yyyy = test.getFullYear();
	 
	 if(dd<10)
		 {
		 dd="0"+dd;
		  }
	 var indate=yyyy+"-"+mm+"-"+dd;
	
	 //alert(ro);
	if(ro=="ROLE_DH"||ro=="ROLE_HELP"||ro=="ROLE_Diary"|| ro=="ROLE_SO")
	 {
			//alert("in condiiton");	
			$('input[name="boDecision"]').attr('disabled', true);			
			$('input[name="boirfinaldec"]').attr('disabled', true);

			  if(document.getElementById('txtbodecfinal').value=="NA" || ro=="ROLE_BO")
				{
					$('input:radio[name="boirfinaldec"]').filter('[value="NA"]').prop('checked', true);
					document.getElementById('boirfinaldecdate').value=document.getElementById('txtbodecfinaldate').value;
					document.getElementById('txtbodecfinal').value=$("input[name='boirfinaldec']:checked").val();
					//alert(document.getElementById('txtbodecfinal').value);
					 
				}
			  
			 else if(document.getElementById('txtbodecfinal').value=="Filed")
				{
					$('input:radio[name="boirfinaldec"]').filter('[value="Filed"]').prop('checked', true);
					document.getElementById('boirfinaldecdate').value=document.getElementById('txtbodecfinaldate').value;
					document.getElementById('txtbodecfinal').value=$("input[name='boirfinaldec']:checked").val();
				}
			 
			 else if(document.getElementById('txtbodecfinal').value=="IR")
				{
					$('input:radio[name="boirfinaldec"]').filter('[value="IR"]').prop('checked', true);
					document.getElementById('boirfinaldecdate').value=document.getElementById('txtbodecfinaldate').value;
					document.getElementById('txtbodecfinal').value=$("input[name='boirfinaldec']:checked").val();
					
				} 
			document.getElementById('txtbodec').value=$('input[name=boDecision]:checked').val();			
	 }	
	
	if ($("input[name='boDecision'][value='IR']").prop("checked"))
			{
				
					
				 if(document.getElementById('txtbodecfinal').value=="NA" )
					{
						$('input:radio[name="boirfinaldec"]').filter('[value="NA"]').prop('checked', true);
						document.getElementById('boirfinaldecdate').value=document.getElementById('txtbodecfinaldate').value;
							 
					}
				 else if(document.getElementById('txtbodecfinal').value=="Filed")
					{
						$('input:radio[name="boirfinaldec"]').filter('[value="Filed"]').prop('checked', true);
						document.getElementById('boirfinaldecdate').value=document.getElementById('txtbodecfinaldate').value;
						document.getElementById('txtbodecfinal').value=$("input[name='boirfinaldec']:checked").val();
					}
				 
				 else if(document.getElementById('txtbodecfinal').value=="IR")
					{
						$('input:radio[name="boirfinaldec"]').filter('[value="IR"]').prop('checked', true);
						document.getElementById('boirfinaldecdate').value=document.getElementById('txtbodecfinaldate').value;
						document.getElementById('txtbodecfinal').value=$("input[name='boirfinaldec']:checked").val();
						
					} 
				
			}
	
	if ($("input[name='boirfinaldec'][value='NA']").prop("checked")||$("input[name='boirfinaldec'][value='Filed']").prop("checked")|| $("input[name='boirfinaldec'][value='IR']").prop("checked"))
		{
		
		
		$('input[name="boirfinaldec"]').attr('disabled', true);
		if($("input[name='boirfinaldec'][value='Filed']").prop("checked")==true)
		{
			document.getElementById('sendAckforIRdiv').style.display='none';
		}
		else 
		{ 
			document.getElementById('sendAckforIRdiv').style.display='block';
		}
		}
	
	
	
	
/* 	if($("input[name='boirfinaldec']:checked").val()!=null);
	{
		$('input[name="boirfinaldec"]').attr('disabled', true);
	} */
	for(var i = 0; i<document.myform.cessPay.length; i++){
			if(document.myform.cessPay[i].checked==true){
	 	
				document.getElementById('txtbodec').value=$('input[name=boDecision]:checked').val();
	 			$('input[name="boDecision"]').attr('disabled', true);
	 			//alert($('input[name=boirfinaldec]:checked').val());		
	 			///alert(document.myform.cessPay[i].value);
	 			
	 			
		 var radiomenu = document.myform.cessPay[i];
		 //document.getElementByName('boDecision').value=radiomenu;	 
		 //alert(document.getElementByName('boDecision').value);
		if(radiomenu.value == "IR"){
			
			//$(':radio:not(:checked)').attr('disabled', false);
		document.getElementById("demo").innerHTML = indate;
		document.getElementById('selectTemp8').style.display = 'block';
		document.getElementById('btn-closed').style.display = 'block';
		document.getElementById('selectTemp9').style.display = 'none';
		document.getElementById('selectTemp10').style.display = 'none';	
		document.getElementById('selectTemp11').style.display = 'none';
		document.getElementById("sel_officer").disabled=false;
		document.getElementById("btn-forward").disabled=false;
		document.getElementById("btn-save").disabled=true;
		
		
					}
		else if(radiomenu.value == "NA"){
			document.getElementById("demo").innerHTML = indate;
		   document.getElementById('selectTemp9').style.display = 'block';
		   document.getElementById('btn-closed').style.display = 'block';
		   document.getElementById('selectTemp8').style.display = 'none';
		   document.getElementById('selectTemp10').style.display = 'none';
		   document.getElementById('selectTemp11').style.display = 'none';
		   document.getElementById("sel_officer").disabled=false;
		   document.getElementById("btn-forward").disabled=false;
		   document.getElementById("btn-save").disabled=true;
		   }			
		else if(radiomenu.value == "Filed"){
			document.getElementById("demo").innerHTML = indate;
		   document.getElementById('selectTemp10').style.display = 'block';
		   document.getElementById('btn-closed').style.display = 'block';
		   document.getElementById('selectTemp8').style.display = 'none';
		   document.getElementById('selectTemp9').style.display = 'none';
		   document.getElementById('selectTemp11').style.display = 'none';
		   document.getElementById("sel_officer").disabled=false;
		   document.getElementById("btn-forward").disabled=false;
		   document.getElementById("btn-save").style.display = 'none';
		   }		
		else {
			document.getElementById("demo").innerHTML = indate;
		document.getElementById('selectTemp8').style.display = 'none';
		document.getElementById('selectTemp9').style.display = 'none';
		document.getElementById('selectTemp10').style.display = 'none';
		document.getElementById('btn-closed').style.display = 'none';
		document.getElementById('selectTemp11').style.display = 'block';
		document.getElementById("sel_officer").disabled=false;
		document.getElementById("btn-forward").disabled=false;
		document.getElementById("btn-save").disabled=true;
		   
			}
		 }
		}
	
	
});
</script>



<script type="text/javascript">

/* function PreviewImage() {
   
    var r = confirm("Please confrim your action.");
    if (r == true) {
    	 pdffile=document.getElementById("i_docupload").files[0];
    	    pdffile_url=URL.createObjectURL(pdffile);
    	    $('#viewer').attr('src',pdffile_url);
    	    $('#divembed').hide();
    	    $('#divviewer').show();
    } else {
    	  $('#divembed').show();
  	    $('#divviewer').hide();
    }
   
} */

function orgChange() {
	
	var orgId = $("#Organization option:selected").val();
	
	if(orgId=="OTHERS")
	{
		document.getElementById('section_id').readOnly=false;
	}
	else 
	{
		document.getElementById('section_id').readOnly=true;
		$.ajax({
			url : "<c:url value='/branchByOrgination'/>",
			type : "POST",
			data : {
				"orgId" : orgId
			},
			success : function(data) {
				$('#section_id').empty();
				$.each(data, function(key, value) {
					document.getElementById("section_id").value=value.orgSection;
					getSection();
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
	function getSection() {
		
		 var sectionId = document.getElementById("section_id").value;
		 //alert(sectionId);
		 $('#sel_officer').empty();
		$.ajax({
			type : "POST" ,
			url  : "<c:url value='/user/getAllOfficerBySection'/>" ,
			data : {
				"section" : sectionId	
			},
			success : function(data) {
				$("#sel_officer").html("");
				$('#sel_officer').append("<option value='0'>----------------Select----------------------</option>");
				$.each(data, function(key, value) {
					$('#sel_officer').append("<option value='" + value.officerName + "'>" + value.officerName + ","+ value.officerDesiganation +"</option>");
					$('#orgCode_id2').append("<option value='" + value.organisationCode + "'>" + value.organisationCode + "</option>");
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
	}
	
	function setSectionToCoord()
	{
		if(document.getElementById("coord_sec").value!=0)
		{
			document.getElementById("section_id").value=document.getElementById("coord_sec").value;
			getSection();
		}
		else
		{
			orgChange();
			getSection();
		}
		
	}
	
	function fieldComplain(comNo){
		var complainNo = comNo;
		sessionUpdate('complainNumber_'+complainNo,'2');
		 var url = '<c:url value="/user/compialnFiled"/>';
		 $('#myform').attr('action', url); 
	}
	
</script>


<!--FOR HIDE SHOW-->
<script type="text/javascript">
function fechData(e){
	var textValue=jQuery('#'+e.target.id).val();
	jQuery.post('section.jsp',{'textValue':textValue},htmlResponce,'HTML');
	console.clear();
}
function htmlResponce(d,s){
	
	jQuery('#Forward').html(d);
}

function hideShow1(){
	
var test=new Date();
	
	var dd = test.getDate();
	 var mm = test.getMonth()+1;//January is 0!
	 var yyyy = test.getFullYear();
	 //alert(mm);
	 if(dd<10)
		 {
		 dd="0"+dd;
		  }
	 var indate=yyyy+"-"+mm+"-"+dd;
	//alert(indate+"testsfkhsdkglhsdlkhglkh");
	
	
	 
	
	 
for(var i = 0; i<document.myform.cessPay.length; i++){
	

	
	if(document.myform.cessPay[i].checked){
		
		//alert(document.myform.cessPay[i].checked);
		 	var radiomenu = document.myform.cessPay[i]
		 //	alert(radiomenu);
		 	
			if(radiomenu.value == "IR"){
				document.getElementById('txtbodec').value="IR";
			 //$(':radio:not(:checked)').attr('disabled', false);
			document.getElementById('displayboDecisionDate').value= indate;
			document.getElementById('stageIR').value = "IRI"
			document.getElementById("demo").innerHTML = Date();
			document.getElementById('selectTemp8').style.display = 'block';
			document.getElementById('selectTemp9').style.display = 'none';
			document.getElementById('selectTemp10').style.display = 'none';
			document.getElementById('selectTemp11').style.display = 'none';
			document.getElementById("sel_officer").disabled=false;
			document.getElementById("btn-forward").disabled=false;
			document.getElementById("btn-save").disabled=true;
			document.getElementById('selectTemp111').style.display = 'block';
			}
			else if(radiomenu.value == "NA"){
				document.getElementById('txtbodec').value="NA";
				document.getElementById('displayboDecisionDate').value= indate;
				document.getElementById("demo").innerHTML = Date();
			   document.getElementById('selectTemp9').style.display = 'block';
			   document.getElementById('selectTemp8').style.display = 'none';
			   document.getElementById('selectTemp10').style.display = 'none';
			   document.getElementById('selectTemp11').style.display = 'none';
			   document.getElementById("sel_officer").disabled=false;
			   document.getElementById("btn-forward").disabled=false;
			   document.getElementById("btn-save").disabled=true;
			   document.getElementById('selectTemp111').style.display = 'block';
			   }			
			else if(radiomenu.value == "Filed"){
				document.getElementById('txtbodec').value="Filed";
				document.getElementById('displayboDecisionDate').value= indate;
				document.getElementById("demo").innerHTML = Date();
			   document.getElementById('selectTemp10').style.display = 'block';
			   document.getElementById('selectTemp8').style.display = 'none';
			   document.getElementById('selectTemp9').style.display = 'none';
			   document.getElementById('selectTemp11').style.display = 'none';
			   document.getElementById("sel_officer").disabled=false;
			   document.getElementById("btn-forward").disabled=false;
			  document.getElementById("btn-save").style.display = 'none';
			   document.getElementById('selectTemp111').style.display = 'block';
			   }		
			else {
				document.getElementById('displayboDecisionDate').value= indate;
				document.getElementById("demo").innerHTML = Date();
				document.getElementById('selectTemp8').style.display = 'none';
				document.getElementById('selectTemp9').style.display = 'none';
				document.getElementById('selectTemp10').style.display = 'none';
				document.getElementById('selectTemp11').style.display = 'block';
				document.getElementById("sel_officer").disabled=false;
				document.getElementById("btn-forward").disabled=false;
			document.getElementById("btn-save").disabled=true;
				document.getElementById('selectTemp111').style.display = 'block';  
				}
			}
   		}
	}
</script>

<!--==============================whether fast track hide show=================================-->
<script type="text/javascript">
	function hideShow12() {

		for (var i = 0; i < document.myform.Fast_Track.length; i++) {
			if (document.myform.Fast_Track[i].checked) {
				var radiomenu = document.myform.Fast_Track[i]

				if (radiomenu.value == "Yes") {

					document.getElementById('selectTemp18').style.display = 'block';

				} else {
					document.getElementById('selectTemp18').style.display = 'none';
				}
			}
		}
	}
</script>

<SCRIPT TYPE="text/javascript">
  var count = "1";
  
  function addRow(in_tbl_name)
  {
	  if (count>3)
	  {
	  alert("Not more than 2");
	  }
  else
	  {
    var tbody = document.getElementById(in_tbl_name).getElementsByTagName("TBODY")[0];

    var row = document.createElement("TR");

    var td1 = document.createElement("TD");
    var strHtml1 = "<textarea  name='notingMessage2'  cols='60' rows='3' STYLE='border: 1 solid;margin:0;' onblur='complianData1(this.value);'> </textarea><br/>&nbsp; ";
    td1.innerHTML = strHtml1.replace(/!count!/g,count);

    /* var td2 = document.createElement("TD");
    var strHtml2 = "Designation :<input type='text' name='Deg' onblur='descriptionData(this.value)' SIZE='30' MAXLENGTH='30' STYLE='height:24;border: 1 solid;margin:0;'>";
    td2.innerHTML = strHtml2.replace(/!count!/g,count); */
   
    row.appendChild(td1);
   // row.appendChild(td2);
   
    count = parseInt(count) + 1;
    tbody.appendChild(row);
    count++; 
   
  }
	  document.getElementById('field').value= count;
	  }
  
 
</SCRIPT>

<script>
 var today = new Date();
 var dd = today.getDate();
 var mm = today.getMonth()+1//January is 0!
 var yyyy = today.getFullYear();
 var hour = today.getHours();
 var minute = today.getMinutes();
 var seconds = today.getSeconds();
 
 if(dd<10) {
     dd='0'+dd
 } 

 if(mm<10) {
     mm='0'+mm
 } 
 today = yyyy+'-'+mm+'-'+dd;
 
 function myFunction111(comNo) 
 {
	 
	 sessionUpdate('complainNumber_'+comNo,'4');
	 
		var anchorValue='window.open("<c:url value="/user/acknowledgementFiled"/>","nyWindow","width=600,Height=400,top=100,left=400");';
		$('#filedAck').attr('onclick', anchorValue);
		$('#filedAck').trigger( "click" );
	 document.getElementById('demo1').value= today;
	 
	// alert(today);
	 //var test=document.getElementById('demo1').value;
	// alert(test);
	 } 
function myFunction1()
{
	
	document.getElementById('display1').value= today;

}
function myFunction12(comNo)
{
	sessionUpdate('complainNumber_'+comNo,'4');

	var anchorValue='window.open("<c:url value="/user/conformationLetter"/>","nyWindow","width=600,Height=400,top=100,left=400");';
	$('#filedAck').attr('onclick', anchorValue);
	$('#filedAck').trigger( "click" );
	
	document.getElementById('display12').value= today;
	/* document.getElementById("btn_Confirmsent").disabled =true; */

}

function myFunction122(comNo)
{
	sessionUpdate('complainNumber_'+comNo,'4');

	var anchorValue='window.open("<c:url value="/user/reminderLetter"/>","nyWindow","width=600,Height=400,top=100,left=400");';
	$('#filedAck').attr('onclick', anchorValue);
	$('#filedAck').trigger( "click" );
	
	document.getElementById('display122').value= today;

}


function myFunction2()
{
	
	document.getElementById('display2').value= today;

}
function myFunction3(comNo)
{	
	//alert(document.getElementById('stageIR').value);
	sessionUpdate('complainNumber_'+comNo,'4');
	
	if(document.getElementById('stageIR').value=='IRF')
	{
		var anchorValue='window.open("<c:url value="/user/acknowledgementIRF"/>","nyWindow","width=600,Height=400,top=100,left=400");';
	}
	else
	{
		var anchorValue='window.open("<c:url value="/user/acknowledgement"/>","nyWindow","width=600,Height=400,top=100,left=400");';
	}
		
	$('#naAck').attr('onclick', anchorValue);
	$('#naAck').trigger( "click" );
	
	document.getElementById('display3').value= today;
	
	
}
function myFunction4(comNo)
{
	sessionUpdate('complainNumber_'+comNo,'4');
	var anchorValue='window.open("<c:url value="/user/acknowledgement"/>","nyWindow","width=600,Height=400,top=100,left=400");';
	$('#naAck').attr('onclick', anchorValue);
	$('#naAck').trigger( "click" );
	document.getElementById('display4').value= today;

}
function myFunction41(comNo)
{
	sessionUpdate('complainNumber_'+comNo,'4');
	var anchorValue='window.open("<c:url value="/user/cvcOm"/>","nyWindow","width=600,Height=400,top=100,left=400");';
	$('#naAck').attr('onclick', anchorValue);
	$('#naAck').trigger( "click" );
	document.getElementById('display41').value= today;

}
function myFunction5()
{
	
	document.getElementById('display5').value= today;

}
function myFunction6()
{
	
	document.getElementById('display6').value= today;

}
function myFunction7()
{
	
	document.getElementById('display7').value= today;

}
function myFunction8()
{
	
	document.getElementById('display8').value= today;

}
function myFunction9()
{
	
	document.getElementById('display9').value= today;

}

function setIRFinalStage()
{
	//alert("shgdrhi");
var test=new Date();
	
	var dd = test.getDate();
	 var mm = test.getMonth()+1;//January is 0!
	 var yyyy = test.getFullYear();
	 
	 if(dd<10)
		 {
		 dd="0"+dd;
		  }
	 var indate=yyyy+"-"+mm+"-"+dd;
	 document.getElementById('boirfinaldecdate').value= indate;
	 
	// alert(indate);
	//alert(document.getElementByName('boirfinaldec').value);
	if($('input[name=boirfinaldec]:checked').val()=='Filed') 
		{		

		document.getElementById('sendAckforIRdiv').style.display='none';
				document.getElementById('div_filenumber').style.display='none';
		
		}
	else if($('input[name=boirfinaldec]:checked').val()=='NA' )
		{
		document.getElementById('sendAckforIRdiv').style.display='block';
		document.getElementById('div_filenumber').style.display='none';
		
		}
	else
		{

		document.getElementById('sendAckforIRdiv').style.display='block';
				document.getElementById('div_filenumber').style.display='block';
		
		}
	
	
	if(document.getElementById('IRboirfinaldec').checked==true)
		{
		
		//alert("znfdkjdhgjkfdhjkhtesting");
		
			//document.getElementById('bofinalDecisionDate').value=Date();
			
			//document.getElementById('boirfinaldecdate').value= indate;
			var test= document.getElementById('boirfinaldecdate').value;
			
			document.getElementById('stageIR').value ="IRF";
		
			var test1= document.getElementById('stageIR').value;
			//alert(test1);
		}
	else
		{
			document.getElementById('stageIR').value="";
		}
	}

function preventEnter(e)
{
	if(e.keyCode === 13){
        e.preventDefault(); // Ensure it is only this code that rusn
    }
	}
</script>

</head>

 
<body id="page2" onload="getClock()">
	<c:url var="myurl" value="/user/insertUpdatedComplain" />

	<!--==============================content================================-->
	<c:forEach items="${complainDetails}" var="complain">
		<form:form name="myform" id="myform" method="post" action="${myurl}"
			commandName="userForm">
			<section id="content">
				<div class="main">

					<div class="wrapper">


						<article class="col-1">
							<div class="inner-text" style="width: 300%; color: #0E0D01;">
								Welcome: &nbsp;&nbsp;${loginId} <br />
								<div id="clock" style="color: red;"></div>
							</div>
						</article>
						<div align="center">
							<label style="color: red;"> <c:out value='${errMessage}' />
							</label>
						</div>
						<br /> <br> <br>
						<div class="fleft" id="divembed"
							style="width: 680px; height: 670px; background-color: #56595D">
							<c:choose>
         
							<c:when test="${complain.fileId!=null}">
								<embed id="embed"
									src="<c:url value='/uploadDoc/${complain.fileId}'/>"
									width="680px" height="670px">
							</c:when>

 							<c:otherwise>
								<embed id="embed"
									src="<c:url value='/uploadDoc/noFile.pdf'/>"
									width="680px" height="670px">							
							</c:otherwise>
         
      						</c:choose>

							

						</div>

						<div class="fleft" id="divviewer"
							style="width: 680px; height: 670px; background-color: #56595D">
							<iframe id="viewer" width="680px" height="670px"> </iframe>
						</div>

						<article class="fright">


							<div align="center"
								style="width: 515px; background-color: rgb(218, 237, 241); color: #0E0D01; border-radius: 7px;">
								<h3>Complaint Cell</h3>
							</div>

							<div style="width: 500px; height: 600px;">


								<div class="form-group">
									<label>&nbsp;Date of Complaint </label>
									<div class="form-list">
										<input name="complainDate" id="d_o_comp" size="20"
											value="${complain.complainDate}" placeholder="dd-mm-yyyy" readonly="readonly" onkeypress="preventEnter(event)">
										&nbsp;&nbsp;&nbsp;<%-- <img
											src="<c:url value="/resources/user/images/cal/cal.gif"/>"
											border="0"
											onclick="displayCalendar(document.myform.complainDate,'dd-mm-yyyy',this);" /> --%>
										<form:errors path="complainDate" cssClass="error"></form:errors>
									</div>
								</div>

								<div class="form-group">
									<label>&nbsp;Complaint Sent from: </label>
									<div class="form-list">
										<select name="complaintSentType">
											<option value='${complain.complaintSentType}'>${complain.complaintSentType}</option>
											<option value="Citizen">Citizen</option>
											<option value="Member Of Parliament">Member of
												Parliament</option>
											<option value="PMO">PMO</option>
											<option value="MPs">MPs</option>
											<option value="MLA">MLA</option>
											<option value="VIPs">VIPs</option>
										</select>
									</div>
								</div>

				<c:choose>
					<c:when test="${complain.roletype == 'CITIZEN'}">
								<div class="form-group">
									<label>&nbsp;Sender's ID </label>
									<div class="form-list">
										<form:input size="25" id="s_name" type="text"
											name="senderName" path="senderName"
											value="${complain.senderName}"  readonly="true" onkeypress="preventEnter(event)"/>
										<form:errors path="senderName" cssClass="error"></form:errors>
									</div>
								</div>
					</c:when>

					<c:otherwise>
								<div class="form-group">
									<label>&nbsp;Sender's Name </label>
									<div class="form-list">
										<form:input size="25" id="s_name" type="text"
											name="senderName" path="senderName"
											value="${complain.senderName}"  onkeypress="preventEnter(event)"/>
										<form:errors path="senderName" cssClass="error"></form:errors>
									</div>
								</div>
					</c:otherwise>
				</c:choose>

								
								<div class="form-group">
									<label>&nbsp;Address :</label>
									<div class="form-list">
										<form:input size="25" type="text" id="add" name="address"
											path="address" value="${complain.address.trim()}" onkeypress="preventEnter(event)"/>
										<form:errors path="address" cssClass="error"></form:errors>
									</div>
								</div>

								<div class="form-group">
									<label>&nbsp;</label>
									<div class="form-list">
										<form:input size="25" type="text" id="add2" name="address2"
											path="address2" value="${complain.address2.trim()}" onkeypress="preventEnter(event)"/>
										<form:errors path="address2" cssClass="error"></form:errors>
									</div>
								</div>


								<div class="form-group">
									<label>&nbsp;City</label>
									<div class="form-list">
										<form:input size="25" type="text" id="city" name="city"
											path="city" value="${complain.city}" onkeypress="preventEnter(event)"/>
										<form:errors path="city" cssClass="error"></form:errors>
									</div>
								</div>

								<div class="form-group">
									<label>&nbsp;State</label>
									<div class="form-list">
										<form:input size="25" type="text" id="state" name="state"
											path="state" value="${complain.state}" onkeypress="preventEnter(event)"/>
										<form:errors path="state" cssClass="error"></form:errors>
									</div>
								</div>

								<div class="form-group">
									<label>&nbsp;Pin No.</label>
									<div class="form-list">
										<form:input size="25" type="text" id="p_no" name="pinno"
											path="pinno" value="${complain.pinno}" onkeypress="preventEnter(event)"/>
										<form:errors path="pinno" cssClass="error"></form:errors>
									</div>
								</div>


								<div class="form-group">
									<label>&nbsp;E-mail :</label>
									<div class="form-list">
										<form:input size="25" type="text" id="email" name="email"
											path="email" value="${complain.email}" onkeypress="preventEnter(event)"/>
										<form:errors path="email" cssClass="error"></form:errors>
									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Mobile Number : </label>
									<div class="form-list">
										<form:input size="25" type="text" id="mb_no" name="mobileNo"
											path="mobileNo" value="${complain.mobileNo}" onkeypress="preventEnter(event)"/>
										<form:errors path="mobileNo" cssClass="error"></form:errors>
									</div>
								</div>



								<div class="form-group">
									<label>&nbsp;Complainee Name: </label>
									<div class="form-list">
										<form:input size="25" type="text" name="complaintAgainstName"
											path="complaintAgainstName" id="comp_name"
											onblur="complianData(this.value)"
											value="${complain.complaintAgainstName}" onkeypress="preventEnter(event)"/>
										<form:errors path="complaintAgainstName" cssClass="error"></form:errors>
									</div>
								</div>


								<div class="form-group">
									<label>&nbsp;Designation :</label>
									<div class="form-list">
										<form:input size="25" type="text" name="designation"
											id="desiganation" onblur="descriptionData(this.value)"
											path="designation" value="${complain.designation}" onkeypress="preventEnter(event)"/>
										<form:errors path="designation" cssClass="error"></form:errors>
									</div>
								</div>




								<div class="form-group">
									<label>&nbsp;Organization :</label>
									<div class="form-list">
										<form:select class="form-control select2" id="Organization"
											path="organization" name="organization" style="width: 300px;" onchange="orgChange();">
											<form:option value='${complain.organization}'>${complain.organization}</form:option>
											<c:forEach var="organisation" items="${mapOfOrganisation}">
												<form:option value='${organisation.organisationName}'>${organisation.organisationName}</form:option>
											</c:forEach>

										</form:select>
										<form:errors path="organization" cssClass="error"></form:errors>
									</div>
								</div>
								<br>

								<div class="form-group">
									<label>&nbsp;Branch :</label>
									<div class="form-list">
										<input size="10" type="text" name="section" id="section_id"
											onkeyup="getSection()" value="${complain.section}" readonly="readonly" onkeypress="preventEnter(event)">
											 <select id="coord_sec" onchange="setSectionToCoord();" >
											 	<option value="0">-----Select-----</option>
											 	<option value="Cordn-2">Coordination 2</option>
											 </select> 
									</div>
									<form:errors path="section" cssClass="error"></form:errors>
								</div>

								<%-- <div class="form-list">
									<div id='orgCode'>
										<select id="orgCode_id" name="organisationCode">

											<option value="${complain.organisationCode}"></option>


										</select>
									</div>

								</div> --%>





								<div class="form-group">
									<label>&nbsp;Whether Fast Track:</label>
									<div class="form-list">


										<c:choose>
											<c:when test="${complain.whetherFastTrack == 'No'}">
												<input type="radio" id="Fast_Track" name="whetherFastTrack"
													value="No" onclick="hideShow12()" checked="checked" onkeypress="preventEnter(event)">No
	         
			   <input type="radio" id="Fast_Track" name="whetherFastTrack"
													value="Yes" onclick="hideShow12()" onkeypress="preventEnter(event)">Yes
			</c:when>
											<c:when test="${complain.whetherFastTrack == 'Yes'}">
												<input type="radio" id="Fast_Track" name="whetherFastTrack"
													value="No" onclick="hideShow12()" onkeypress="preventEnter(event)">No
	         
			   <input type="radio" id="Fast_Track" name="whetherFastTrack"
													value="Yes" onclick="hideShow12()" checked="checked" onkeypress="preventEnter(event)">Yes
			</c:when>

											<c:otherwise>
												<input type="radio" id="Fast_Track" name="whetherFastTrack"
													value="No" onclick="hideShow12()" onkeypress="preventEnter(event)">No
	         
			   <input type="radio" id="Fast_Track" name="whetherFastTrack"
													value="Yes" onclick="hideShow12()" onkeypress="preventEnter(event)">Yes
			   </c:otherwise>
										</c:choose>

										<form:errors path="whetherFastTrack" cssClass="error"></form:errors>

										<div style="display: none; border: 0;" id="selectTemp18">
											<select name="" style="width: 100px">
												<option>Select</option>
												<option>BSNL</option>
												<option>CENTERAL BOARD OF EXCISE AND CUSTOMS</option>
											</select>
										</div>
									</div>
								</div>

								<br>

								<div class="form-group">
									<label>&nbsp;Complaint Type :</label>
									<div class="form-list">
										<c:choose>
											<c:when test="${complain.complaintType == 'Anonymous'}">
												<input type="radio" name="complaintType" value="Anonymous"
													checked="checked" onkeypress="preventEnter(event)"/>Anonymous
				 <input type="radio" name="complaintType" value="Pseudonymous" onkeypress="preventEnter(event)">Pseudonymous
				<input type="radio" name=complaintType value="Signed" onkeypress="preventEnter(event)">Signed
				</c:when>
											<c:when test="${complain.complaintType == 'Pseudonymous'}">
												<input type="radio" name="complaintType" value="Anonymous" onkeypress="preventEnter(event)"/>Anonymous
				 <input type="radio" name="complaintType" value="Pseudonymous"
													checked="checked" onkeypress="preventEnter(event)">Pseudonymous
				<input type="radio" name=complaintType value="Signed" onkeypress="preventEnter(event)">Signed
				</c:when>
											<c:when test="${complain.complaintType == 'Signed'}">
												<input type="radio" name="complaintType" value="Anonymous" onkeypress="preventEnter(event)"/>Anonymous
				 <input type="radio" name="complaintType" value="Pseudonymous" onkeypress="preventEnter(event)"/>Pseudonymous
				<input type="radio" name=complaintType value="Signed"
													checked="checked" onkeypress="preventEnter(event)">Signed
				</c:when>
											<c:otherwise>
												<input type="radio" name="complaintType" value="Anonymous" onkeypress="preventEnter(event)"/>Anonymous
				 <input type="radio" name="complaintType" value="Pseudonymous" onkeypress="preventEnter(event)"/>Pseudonymous
				<input type="radio" name=complaintType value="Signed" onkeypress="preventEnter(event)">Signed
				</c:otherwise>

										</c:choose>





									</div>
								</div>
								<div class="form-group">
									<label>&nbsp;Action Taken: </label>
									<div class="form-list">
										<c:choose>
											<c:when test="${complain.actionTaken == 'Filed'}">
												<input type="radio" name="actionTaken" value="Filed"
													checked="checked" onkeypress="preventEnter(event)">Filed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="radio" name="actionTaken" value="SentforScan" onkeypress="preventEnter(event)">Sent for Scan
              </c:when>
											<c:when test="${complain.actionTaken == 'SentforScan'}">
												<input type="radio" name="actionTaken" value="Filed" onkeypress="preventEnter(event)">Filed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="radio" name="actionTaken" value="SentforScan"
													checked="checked" onkeypress="preventEnter(event)">Sent for Scan
              </c:when>
											<c:otherwise>
												<input type="radio" name="actionTaken" value="Filed" onkeypress="preventEnter(event)">Filed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="radio" name="actionTaken" value="SentforScan" onkeypress="preventEnter(event)">Sent for Scan
              </c:otherwise>
										</c:choose>

									</div>
								</div>

								<div class="form-group">
									<label>Uploaded Document</label>
									<div class="form-list">
										<input type="text" disabled="disabled"
											value="${complain.fileName}">

									</div>

								</div>


								<%-- <div class="form-group">
									<label>Change Uploaded Document</label>
									<div class="form-list">
										<input class="fileuploader" name="uploadScanDocument"
														type="file" id="i_docupload" />  <br />
														
														 <input type="button" value="Preview" onclick="PreviewImage();" /> <button id="myBtn" type="button" onclick="getModal(${complain.complaint});" style="background-color: rgb(234,67,53);" >Click to change</button>
									
									</div>
									</div> --%>
									

								<br> <br>


								<div class="form-group">
									<label>Detail of Allegation</label>
									<div class="form-list">
										<textarea name="detailsAlligations" readonly="readonly"
											rows="5" cols="33"> ${complain.detailsAlligations}</textarea>
									</div>

								</div>

								<div class="form-group">
									<label> </label>
									<!--               <label>&nbsp;<button class="button-2 update_dairy" type="Button"  value=""  >Update </button></label>
 -->
									<!--  <label>&nbsp;<button class="button-2 " type="Button"  value=""  >Update </button></label> -->
								</div>
								<div class="form-list">
									<%-- <%
			       if(compDetails.getDocument()!=null)
					 {
			    	   
					
             if(compDetails.getDocument().equals("Fully")) { %>
              
            		<input type="radio" name="Document" value="Fully" checked="checked">Fully &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="Document" value="Partially">Partially  
			<%}if(compDetails.getDocument().equals("Partially")) { %>
			
					<input type="radio" name="Document" value="Fully" >Fully &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="Document" value="Partially" checked="checked">Partially  
					<%}} else{%>
					
					<input type="radio" name="Document" value="Fully" >Fully &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="Document" value="Partially" >Partially  
				<%} %> --%>
								</div>




								<br> <br> <br> <br>
								<div align="center"
									style="width: 515px; background-color: rgb(218, 237, 241); color: #0E0D01; border-radius: 7px;">
									<h3>Section</h3>
								</div>


								<!-- ------------Section------------------ -->

								<!-- <div class="form-group">
              <label>&nbsp;Search:</label>
			 <div class="form-list">
                &nbsp;<input type="radio" name="Search" value="autoSearch">Auto Search  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="Search" value="manual">Manual   
						<select name="" style="width:100px">
							<option value="0">select </option>
							<option value="1">By Complaint Against Name</option>                      
							<option >By Sender's Name</option>         
						</select><button type="submit" class="button-2">Submit</button>
			</div> </div>
			<br><br> -->
								<div class="form-group">
									<br>
									<div class="form-group">
										<label>&nbsp;Complaint No.: </label>
										<div class="form-list">
											<input type="hidden" name="complaint" id="complaint"
												value="${complain.complaint}"> <b> <span
												class="txt" style="color: red; font-size: 110%;">${complain.complaint}</span>
											</b>
										</div>

									</div>
									<br>
									<div class="form-group">
										<label>&nbsp;Select BO :</label>
										<div class="form-list">
											<c:choose>
												<c:when test="${complain.boName != null}">
													<select class="form-control select2" id="bo" name=boName
														style="width: 300px;">
														<option value='${complain.boName}'>${complain.boName}</option>
														<c:forEach var="bo" items="${mapAllBo}">
															<option value='${bo.officerCode}'>${bo.officerName}</option>
														</c:forEach>

													</select>
												</c:when>
												<c:otherwise>
													<select class="form-control select2" id="bo" name=boName
														style="width: 300px;">
														<option value="None">--Select Branch Officer--</option>
														<c:forEach var="bo" items="${mapAllBo}">
															<option value='${bo.officerCode}'>${bo.officerName}</option>
														</c:forEach>
													</select>
												</c:otherwise>

											</c:choose>


										</div>
									</div>
									<!--  <div class="form-group">
              <label>&nbsp;BO Name: </label>
              <div class="form-list">
				<input size="25" type="text" name="boname" value="Nitish Kumar">
			   </div>
            </div>
			 -->


									<br>

									<div class="form-group">
										<label>&nbsp;Gist of allegation :</label>
										<div class="form-list">

											<c:choose>
												<c:when test="${complain.gistOfAllegation != null}">
													<select class="form-control select2"
														name="gistOfAllegation" style="width: 300px">
														<option value='${complain.gistOfAllegation}'>${complain.gistOfAllegation}</option>
														<c:forEach var="allegation" items="${gistOfAllegation}">
															<option value='${allegation.allegation}'>${allegation.allegation}</option>
														</c:forEach>
													</select>
												</c:when>
												<c:otherwise>
													<select class="form-control select2"
														name="gistOfAllegation" style="width: 300px">
														<option value="None">--Select Allegation--</option>
														<c:forEach var="allegation" items="${gistOfAllegation}">
															<option value='${allegation.allegation}'>${allegation.allegation}</option>
														</c:forEach>
													</select>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<br>


									<div class="form-group">
										<label>&nbsp;Previous Noting :</label>
										<div class="form-list">
											<div style="overflow: scroll; height: 220px;">
												<c:forEach var="noting" items="${mapOfNoting}">
													<label> ${noting.notingMessage1}<br>
														${noting.noterName},&nbsp;${noting.name},&nbsp;${noting.desiganation}<br>
														${noting.notingdate} <br>
														<hr style="color: lightblue;">
													</label>
												</c:forEach>
											</div>
										</div>
									</div>
									<br> <br> <br> <br> <br> <br>



									<div class="form-group">
										<br> <br> <label>&nbsp;Noting:</label>
										<div class="form-list">
											<textarea class="form-control" name="notingMessage1"
												onblur="complianData1(this.value)" rows="5" cols="39"></textarea>
										</div>
									</div>

									<!-- <div class="form-group">
											<label>&nbsp;
												<button class="button-2" type="Button"
													onclick="addRow('tblPets')" value="Add More">Add
													more</button>
											</label>

										</div>
 -->


									<br> <br>




									<div class="form-group">
										<label></label>
										<div class="form-list"></div>
									</div>

								</div>
								<br>
								<div align="center"
									style="width: 515px; background-color: rgb(218, 237, 241); color: #0E0D01; border-radius: 7px;">
									<h3>BO</h3>
								</div>
								<div class="form-group">
									<label>&nbsp;Bo's Decision &nbsp;</label>
									<div class="form-list">
										<c:choose>
											<c:when test="${complain.boDecision == 'Filed'}">
												<input type="radio" id="cessPay" name="boDecision"
													value="Filed" checked="checked" onclick="hideShow1()" onkeypress="preventEnter(event)">Filed
												<input type="radio" id="cessPay" name="boDecision"
													value="NA" onclick="hideShow1()" onkeypress="preventEnter(event)">NA
												<input type="radio" id="cessPay" name="boDecision"
													value="IR" onclick="hideShow1()" onkeypress="preventEnter(event)">IR & Others
											<!-- 	<input type="radio" id="cessPay" name="boDecision"
													value="OTHER" onclick="hideShow1()">Others/Sr.Officers&nbsp;<br> -->
											</c:when>
											<c:when test="${complain.boDecision == 'NA'}">
												<input type="radio" id="cessPay" name="boDecision"
													value="Filed" onclick="hideShow1()" onkeypress="preventEnter(event)">Filed
												<input type="radio" id="cessPay" name="boDecision" value="NA"
													checked="checked" onclick="hideShow1()" onkeypress="preventEnter(event)">NA
												<input type="radio" id="cessPay" name="boDecision" value="IR"
													onclick="hideShow1()" onkeypress="preventEnter(event)">IR & Others
												<!-- <input type="radio" id="cessPay" name="boDecision" value="OTHER"
													onclick="hideShow1()">Others/Sr.Officers&nbsp;<br> -->
											</c:when>
											<c:when test="${complain.boDecision =='IR'}">
												<input type="radio" id="cessPay" name="boDecision"
													value="Filed" onclick="hideShow1()" onkeypress="preventEnter(event)">Filed
												<input type="radio" id="cessPay" name="boDecision" value="NA"
													onclick="hideShow1()" onkeypress="preventEnter(event)">NA
												<input type="radio" id="cessPay" name="boDecision" value="IR"
													onclick="hideShow1()" checked="checked" onkeypress="preventEnter(event)">IR & Others
												<!-- <input type="radio" id="cessPay" name="boDecision" value="OTHER"
													onclick="hideShow1()">Others/Sr.Officers&nbsp;<br> -->
											</c:when>
											<c:when test="${complain.boDecision == 'OTHER'}">
												<input type="radio" id="cessPay" name="boDecision"
													value="Filed" onclick="hideShow1()" onkeypress="preventEnter(event)">Filed
												<input type="radio" id="cessPay" name="boDecision" value="NA"
													onclick="hideShow1()" onkeypress="preventEnter(event)">NA
												<input type="radio" id="cessPay" name="boDecision" value="IR"
													onclick="hideShow1()" onkeypress="preventEnter(event)">IR & Others
												<!-- <input type="radio" id="cessPay" name="boDecision" value="OTHER"
																				checked="checked" onclick="hideShow1()">Others/Sr.Officers&nbsp;<br> -->
											</c:when>
											<c:otherwise>
												<input type="radio" id="cessPay" name="boDecision"
													value="Filed" onclick="hideShow1()" onkeypress="preventEnter(event)">Filed
												<input type="radio" id="cessPay" name="boDecision" value="NA"
													onclick="hideShow1()" onkeypress="preventEnter(event)">NA
												<input type="radio" id="cessPay" name="boDecision" value="IR"
													onclick="hideShow1()" onkeypress="preventEnter(event)">IR & Others
												<!-- <input type="radio" id="cessPay" name="boDecision" value="OTHER"
													onclick="hideShow1()">Others/Sr.Officers&nbsp;<br> -->
											</c:otherwise>
										</c:choose>

										<div>Date:<input type="text" name="boDecisionDate" id="displayboDecisionDate" value="${complain.boDecisionDate}" readonly="readonly" onkeypress="preventEnter(event)"></div> 
										<input type="Date" id="demo" name="decision" hidden="true" ><input type="hidden" name="stageIR" id="stageIR" />
									</div>
								</div>
								<br> <br>

								<div style="display: none; border: 0;" id="selectTemp8">

									<div class="form-group">
										<label> <a id="confrom"> </a>

										</label> <label> <a>

												<button type="button" id="btn_Confirmsent" 
													onclick="myFunction12(${complain.complaintNumber});">Send Confirmation
													</button>
										</a></label>

										<div class="form-list">
											Date:<input type="text" id="display12" name="boircondate" value="${complain.boircondate}" readonly="readonly" onkeypress="preventEnter(event)">
										</div>
									</div>


									<div class="form-group">
										<label>

											<button type="button" onclick="myFunction122(${complain.complaintNumber})">Send Reminder
												</button>
										</label>

										<div class="form-list">
											Date:<input type="text" id="display122" name="boirremdate" value="${complain.boirremdate}" readonly="readonly"
												value="" onkeypress="preventEnter(event)">
										</div>
									</div>



									<div class="form-group">
										<button type="button" onclick="myFunction2()">Confirmation
											Received</button>
										<div class="form-list">

											Date:<input type="text" name="boirconrecdate" id="display2"  value="${complain.boirconrecdate}" readonly="readonly"
												value="" onkeypress="preventEnter(event)">
										</div>
									</div>

									<div class="form-group">
										<label>&nbsp;Final Decision &nbsp;</label>
										<div class="form-list">
										
										
											<input type="radio" name="boirfinaldec" value="Filed" onchange="setIRFinalStage();" onkeypress="preventEnter(event)">Filed
											&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
												name="boirfinaldec" value="NA" onchange="setIRFinalStage();" onkeypress="preventEnter(event)">NA
											&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
												name="boirfinaldec" value="IR" id="IRboirfinaldec" onchange="setIRFinalStage();" onkeypress="preventEnter(event)">I & R
										</div>
										
										<div>
										 	<label>Date:</label><input id="boirfinaldecdate"  name="boirfinaldecdate" readonly="readonly" onkeypress="preventEnter(event)">										
											</div>
									</div>
									<br>




									<div class="form-group" id="div_filenumber">
										<label>&nbsp;File No.</label>
										<div class="form-list">
										<input class="form-control" type="text" name="boirfileno" id="fileno"
												 value="${complain.boirfileno}" onkeypress="preventEnter(event)"> 
										</div>
									</div>

									<div class="form-group" id="sendAckforIRdiv">
										<label> <a
											onclick="window.open('','nyWindow','width=600,Height=400,top=100,left=400');">
												<button type="button" onclick="myFunction3(${complain.complaintNumber});">Send Acknowledgement
													</button>
										</a></label>
										<div class="form-list">

											Date:<input type="text" name="boirackdate" id="display3" readonly="readonly"
												value="${complain.boirackdate}" onkeypress="preventEnter(event)">
										</div>
									</div>
								</div>


								<div class="form-group">
									<label></label>
									<div class="form-list"></div>
								</div>
								<!--NA-->
								<div style="display: none; border: 0;" id="selectTemp9">
									<br>




									<div class="form-group">
										<label> <a id="naAck"></a>

										</label> <label> <a>

												<button type="button"
													onclick="myFunction4(${complain.complaintNumber});">Send Acknowledgement
													</button>
										</a>
										</label>
										<div class="form-list">

											Date:<input type="text" id="display4" name="boNaAckDate"
												value="" onkeypress="preventEnter(event)" readonly="readonly">

										</div>
									</div>


									<div class="form-group">
										<label> <a id="naOm"> </a>

										</label> <label> <a>

												<button type="button"
													onclick="myFunction41(${complain.complaintNumber});">Office
													Memorandum</button>
										</a>

										</label>
										<div class="form-list">
											Date:<input type="text" id="display41" name="boNaOmDate"
												value="" onkeypress="preventEnter(event)" readonly="readonly">

										</div>
									</div>
								</div>


								<div class="form-group">
									<label></label>
									<div class="form-list"></div>
								</div>


								<div style="display: none; border: 0;" id="selectTemp10">



									<div class="form-group">
										<label> <a id="filedAck"></a>

										</label> <label> <a>
												<button type="button"
													onclick="myFunction111(${complain.complaintNumber});">Send Acknowledgement
													</button>
										</a>
										</label>
										<div class="form-list">

											Date:<input type="text" id="demo1" name="boFiledAckDate" onkeypress="preventEnter(event)" readonly="readonly">
										</div>
									</div>
								</div>

								<!--Other-->
								<div style="display: none; border: 0;" id="selectTemp11">

									<%-- <div class="form-group">
										<label>&nbsp;Final Decision &nbsp;</label>
										<div class="form-list">
											<input type="radio" name="finalDecision1" value="Filed" onchange="setIRFinalStage();">Filed
											&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
												name="finalDecision1" value="NA" onchange="setIRFinalStage();">NA
											&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
												name="finalDecision1" value="IR" id="IRboirfinaldec" onchange="setIRFinalStage();">I & R <br>
											<!-- Date(System Date):<input type="text"> -->
										</div>
										
										Date:<input type="text" name="boDecisionDate"
											id="displayboDecisionDate" value="${complain.boDecisionDate}" readonly="readonly"> <input
											type="hidden" id="demo" name="decision"><input type="hidden" name="stageIR" id="stageIR" value=""/>
										
									</div> --%>
									<br>


									<div class="form-group">
										<label></label>
										<div class="form-list"></div>
									</div>


									<div class="form-group">
										<label> <a
											onclick="window.open('','nyWindow','width=600,Height=400,top=100,left=400');">
												<button type="button" onclick="myFunction6()">Acknowledgement
													Sent</button>
										</a></label>
										<div class="form-list">

											Date:<input type="text" id="display6" name="boothacksentdate"
												value="" onkeypress="preventEnter(event)">
										</div>
									</div>

									<%-- <div class="form-group">
										<label><font color="red">Confirm CVO&nbsp;*</font> :</label>
										<div class="form-list">

											<form:select class="form-control select2" id="Organization1"
												path="confirmCVO" name="confirmCVO" style="width: 300px;">
												<form:option value="${complain.organization}">${complain.organization}</form:option>
												<c:forEach var="organisation1" items="${mapOfOrganisation}">
													<form:option value="${organisation.organisationName}">${organisation.organisationName}</form:option>
												</c:forEach>

											</form:select>
											<form:errors path="organization" cssClass="error"></form:errors>
										</div>
									</div>  --%>
									<br>


									<div class="form-group">
										<label> <a
											onclick="window.open('','nyWindow','width=600,Height=400,top=100,left=400');">
												<button type="button" onclick="myFunction5()">Confirmation
													Sent</button>
										</a>
										</label>
										<div class="form-list">

											Date:<input type="text" id="display5" name="boothconsendate"
												value="" onkeypress="preventEnter(event)">
										</div>
									</div>

									<div class="form-group">
										<label><button type="button" onclick="myFunction7()">Reminder
												Sent</button></label>
										<div class="form-list">

											Date:<input type="text" id="display7" name="boothremsendate"
												value="" onkeypress="preventEnter(event)">
										</div>
									</div>

									<div class="form-group">
										<label> <a
											onclick="window.open('','nyWindow','width=600,Height=400,top=100,left=400');">
												<button type="button" onclick="myFunction8()">Confirmation
													Receive</button>
										</a></label>
										<div class="form-list">

											Date:<input type="text" name="boothconrecdat" id="display8"
												value="" onkeypress="preventEnter(event)">
										</div>
									</div>

									<div class="form-group">
										<label>&nbsp;Whether Fast Track: &nbsp;</label>
										<div class="form-list">
											<input type="radio" name="whetherFastrack" value="Yes">Yes
											&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
												name="whetherFastrack" value="No">No
										</div>
									</div>

									<div class="form-group">
										<label>&nbsp;File No.</label>
										<div class="form-list">
											<input class="form-control1" type="text" name="filenumber"
												value="" onkeypress="preventEnter(event)">
										</div>
									</div>

									<div class="form-group">
										<label><button type="button" onclick="myFunction9()">Acknowledgement
												Sent</button></label>
										<div class="form-list">

											Date:<input type="text" name="boothacksntdat" id="display9"
												value="" onkeypress="preventEnter(event)">
										</div>
									</div>





								</div>
								 <br>


								<div class="form-group">
									<label><font color="red">Confirm CVO&nbsp;*</font> :</label>
									<div class="form-list">

										<form:select class="form-control select2" id="Organization1" 
											path="confirmCVO" name="confirmCVO" style="width: 300px;">
											
											
											<form:option value='${complain.organization}'>${complain.organization}</form:option>
											<c:forEach var="organisation" items="${mapOfOrganisation}">
												<form:option value='${organisation.organisationName}'>${organisation.organisationName}</form:option>
											</c:forEach>

										</form:select>
										<form:errors path="confirmCVO" cssClass="error"></form:errors>
									</div>
								</div>
								
								
							<br>
								<div class="form-group">

											<div class="form-list">
												<div id='orgCode' style="display: none;" >
													<select id="orgCode_id2" name="organisationCode" >
												
														 <option value='${complain.organisationCode}'></option> 
													</select>
												</div>

											</div>

										</div>
								<br>



								<div class="form-group">
									<label><font color="red">Forward&nbsp;*</font></label>

									<div class="form-list">
										<select class="form-control select2" id="sel_officer" onchange="getvalforsection();"
											 name="forwardto"  style="width: 300px;">
											<option  value="None" >Select officer to send</option>
											<c:forEach var="officer" items="${mapOfOfficer}">
											 <option value='${officer.officerName}'>${officer.officerName},${officer.officerDesiganation} </option>
											</c:forEach>

										</select> 
									
										<input type="text" name="forwradvalue" id="forwradvalue" hidden="true"></input>
											 
										
									</div>

								</div>
								<br>

								<div align="center">
									<label style="color: red;" id="agree"> </label>
								</div>
								<br />





								<div class="form-group" align="right">

									<%-- <div style="display: none; border: 0;" id="selectTemp111">
								 <input type="button" class="button-2" id="btn-closed" value="Close" title="press to send complain to the record room"
										onclick="sessionUpdate('complainNumber_${complain.complaintNumber}','5');"
										name="save"> 
							</div>	 --%>

								<c:if test="${complain.boirfinaldec!=null}">
								
									<input type="button" class="button-2" id="btn-closed" 
										value="Send to Record Room"
										title="press to send complain to the record room"
										onclick="recordRoom('${complain.complaintNumber}');"
										name="save"/>
								
									</c:if>	
										 &nbsp;&nbsp;
								 	<button type="button"  id="btn-save"
								title="your complain will be saved"
										onclick="fieldComplain(${complain.complaintNumber})"
										name="save" hidden="true">Save</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="form-list" align="left">

										<%-- <a href="<c:url value="/user/goBack"/>">
											<button type="button" class="button-2" name="close">Close
												without Save</button>
										</a>&nbsp;&nbsp;&nbsp;&nbsp; --%>
										<button type="button" class="button-2"
											title="press to forward complain" name="submit"
											id="btn-forward"
											onclick="forwardValidate(${complain.complaintNumber});"
											value="send">Forward</button>
										<input type='submit' id='btn_tmpSubmit' style="display: none;" />

									</div>
								</div>


							<div class="form-list">
									
									
									<%-- <form:input size="25" type="text" id="logintype" name="logintype"
											path="logintype" value="${loginId}" /> --%>
											
											
											
										<input type="text" disabled="disabled" id="logintype" name="logintype"
											path="logintype"  hidden="true"
											value="${loginId}">
								
											<input type="text" id="rollttype" name="rollttype"  
												
														 value="${rollttype}"  onload="getrolltype();" hidden="true"/>
											
											
											<input type="text" id="sectiontype" name="sectiontype" 
												
														 value="${sectiontype}" onload="getrolltype();" hidden="true" />
											
											
											
											<input type="text" id="txtbodec" name="boDecisionnew"  hidden="true"
												
														 value="${boDecisionnew}" />
											
											
											 <input type="text" id="txtbodecfinal" name="boirfinaldectemp" value="${complain.boirfinaldec}"  hidden="true"/> 										
											  <input type="text" id="txtbodecfinaldate" name="boirfinaldecdatetemp" value="${complain.boirfinaldecdate}" hidden="true" /> 
											 <!-- <div id='rollttype'  > -->
													
											<!-- 	</div> -->
										
									</div>



							</div>
					</div>
				</div>
			</section>

		</form:form>
	</c:forEach>
	<div id="dialog-confirm" title="Send To Record Room">
  	
	</div>
</body>
