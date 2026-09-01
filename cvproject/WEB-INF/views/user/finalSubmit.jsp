<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
 <script>
 
 function nextPage()
 {
 	var qpr_id=document.getElementById('qpr_id').value;
 	var last_qpr_id=document.getElementById('last_qpr_id').value;
 	
 	location.replace("<c:url value="/user/cvofficer/vigilanceInvestigations"/>?qpr_id="+qpr_id+"&last_qpr_id="+last_qpr_id);	
 }

 function backPage()
 {
 	location.replace("<c:url value="/user/cvofficer/QPR"/>");
 }
 </script>
<style>
table,table td,table th {
    border: 1px solid black;
}
table tr:nth-child(even)  {
    background-color: #eee;
    text-align: center;
	}
	table tr:nth-child(odd)  {
    background-color: #fff;
    text-align: center;
	}
table th {
    background-color: rgb(77,109,244);
    color: white;
    font-size:15px; 
	}
	
	input[type=text] {
    width: 40px;
    box-sizing:border-box;
}
	.center {
    margin: auto;
    width: 64%;
    border: 2px solid #73AD21;
    padding: 10px;
    font-size:12px; 
}
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


</head>


<body>
<br />
<br />
<!--==============================content================================-->

<section id="content">
  <div class="main">
    <div class="wrapper">
        <article class="col-1">
						<div class="inner-text"
							style="width: 110%; background-color: rgb(218,237,241); color: #0E0D01;">
							Welcome: ${loginId} <br /> <small></small>
						</div>

					</article>
          </div>
          
		
      <div class="wrapper">
          <div  align="center" >
		 <br>
       <div   style="width:515px; background-color: rgb(218, 237, 241); color: #0E0D01;" ><h3>QUARTERLY PROGRESS REPORT</h3></div>
		 <br>
		 <br>
				<img src="<c:url value="/resources/user/images/done.gif-c200"/>" align="middle" width="30" height="30"/><label style="font-size:200%; " >You have already submitted form for this quarter.</label>
	<br></br>		
         </div>
		</div>
		</div>
</section>	

<!------==============COMPLAINTS==================---->
<form:form name="myform" id="myform" commandName="complaintQrcForm">
<div class="table-responsive">
<h3 align="center" style="font-size:25px; " ><b>QUARTERLY PROGRESS REPORT</b></h3>
<h3 align="center" style="font-size:24px; " ><b>COMPLAINTS</b></h3>

<br>
	<table style="margin: auto; width:66%;" class="table">  
	
			<tr>
			   <th rowspan=2><b>Source</b></th>
			   <th rowspan=2><b>Opening Balance</b></th>
			   <th rowspan=2><b>Received During The Quarter</b></th>
			   <th rowspan=2><b>Total</b></th>
			   <th rowspan=2 style="width:20%"><b>Disposal During The Quarter</b><br>(Filed/Sent for NA and Registered as Vig. for Investigation by CVO)</th>
			   <th rowspan=2><b>Balance Pending</b></th>	
			   <th colspan=3><b>Age Wise Pendency</b> (Months)</th>						
		   </tr>
		   <tr>
               <th>
		   			<1
		   		</th>
		   			
		   		<th>
		   			1-3
		   		</th>
		   		<th>
		   			Over 3 months
		   		</th>
		   </tr>
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
				
			</tr>
		  <tr>
				<td style=" text-align: left;"><b>&nbsp;&nbsp;CVC #</b></td>
				<td><b><form:input style="padding: 2px;" class="qty1 comcvc"   path="ComCVCOpeningBalance"     name="comCVCOpeningBalance" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				<td><b><form:input style="padding: 2px;" class="qty1 comRec"  path="ComCVCReceived_during_quarter"    name="comCVCReceived_during_quarter" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				<td><b><form:input style="padding: 2px;" class="total comtotal subbptotal"  path="comCVCTotal"   name="comCVCTotal" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class ="comDis subbptotal disQTR"      path="comCVCDisposal_during_quarter"    name="comCVCDisposal_during_quarter"  onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				<td><b><form:input style="padding: 2px;" class="comBalance totalsubbptotal"   path="comCVCBalance_pending"    name="comCVCBalance_pending" onkeypress="return isNumberKey(event);" readonly="true"/></b></td>
				<td><b><form:input style="padding: 2px;" class="comGreaterOne bPTotalCVC" path="comCVCage_less_one"    name="comCVCage_less_one" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				<td><b><form:input style="padding: 2px;" class="comOnetoThree  bPTotalCVC"  path="comCVCage_pendency_betweenOne_Three"   name="comCVCage_pendency_betweenOne_Three" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				<td><b><form:input style="padding: 2px;" class="comThreetoSix  bPTotalCVCFinal"  path="comCVCage_pendency_betweenThree_Six"   name="comCVCage_pendency_betweenThree_Six" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
			 </tr>
			  <tr>
				 <td style=" text-align: left;"><b>&nbsp;&nbsp;OTHERs$</b></td>
				 <td><b><form:input style="padding: 2px;" class="comother comcvc" path="comOtherOpeningBalance"       name="comOtherOpeningBalance" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				 <td><b><form:input style="padding: 2px;" class="comother comRec"  path="comOtherReceived_during_quarter"      name="comOtherReceived_during_quarter" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				 <td><b><form:input style="padding: 2px;" class="totaloob comtotal subbpothtotal" path="comOtherTotal"   name="comOtherTotal" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input style="padding: 2px;" class ="comDis subbpothtotal disQTROther"         path="comOtherDisposal_during_quarter"     readOnly="true" name="comOtherDisposal_during_quarter" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				 <td><b><form:input style="padding: 2px;" class="comBalance totalsubbpothtotal"      path="comOtherBalance_pending"      name="comOtherBalance_pending" onkeypress="return isNumberKey(event);" readonly="true"/></b></td>
				 <td><b><form:input style="padding: 2px;" class="comGreaterOne  bPTotalOther"   path="comOtherage_less_One"      name="comOtherage_less_One" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				 <td><b><form:input style="padding: 2px;" class="comOnetoThree  bPTotalOther"   path="comOtherage_pendency_betweenOne_Three"      name="comOtherage_pendency_betweenOne_Three" onkeypress="return isNumberKey(event);"  readonly="true"/></b></td>
				 <td><b><form:input style="padding: 2px;" class="comThreetoSix  bPTotalOtherFinal"   path="comOtherage_pendency_betweenThree_Six"  readonly="true"     name="comOtherage_pendency_betweenThree_Six" onkeypress="return isNumberKey(event);" /></b></td>
				</tr>
				 <tr>
				 <td style=" text-align: left;"><b>&nbsp;&nbsp;TOTAL</b></td>
				 <td><b><form:input  style="padding: 2px;" class="totalcomcvc"   path="comTotalOpeningBalance"         name="comTotalOpeningBalance" readOnly="true" onkeypress="return isNumberKey(event);"   /></b></td>
				 <td><b><form:input  style="padding: 2px;" class="totalcomRec"    path="comTotalReceived_during_quarter"     name="comTotalReceived_during_quarter" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalcomtotal"  path="comTotal"      name="comTotal" readOnly="true"  onkeypress="return isNumberKey(event);"/></b></td>
				  <td><b><form:input style="padding: 2px;" class ="totalcomDis"   path="comTotalDisposal_during_quarter"      name="comTotalDisposal_during_quarter" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalcomBalance" path="comTotalBalance_pending"     name="comTotalBalance_pending" readOnly="true" onkeypress="return isNumberKey(event);" readonly="true"/></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalcomGreaterOne" path="comTotalage_less_One"  name="comTotalage_less_One" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalcomOnetoThree" path="comTotalage_pendency_betweenOne_Three"   name="comTotalage_pendency_betweenOne_Three" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalThreetoSix"  path="comTotalage_pendency_betweenThree_Six"   name="comTotalage_pendency_betweenThree_Six" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				</tr>
		</table>

<br>
<div class="center">
  <p><sup>$</sup>Exclude details of PIDPI (Whistle Blower) complaints which are to be provided in para 1.3 below<br>
  # Complaints received for <strong>necessary action</strong> from CVC <strong>only to be reflected</strong><br>
  <strong>Pl note: Anonymous complaints received should not be included/reflected in Col. 3 above</strong></p>

</div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>1.1 Break Up of Complaints Received Under Source 'OTHERS' During The Quarter</b></div>
<br>
    <table style="margin: auto; width:66%;" class="table">
        
            <tr> 
	            <td style=" text-align: left;"><b>&nbsp;&nbsp;(a) Signed Complaints</b></td>
				<td><b><form:input style=" padding:2px;" path="complaints_Signed_Complaints"  class="signedComplaints"   name="complaints_Signed_Complaints"  onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
			</tr>
			<tr>  
	             <td style=" text-align: left;"><b>&nbsp;&nbsp;(b) Complaints from Ministry/Department</b></td>
				 <td><b><form:input style=" padding:2px;" path="complaints_department"  class="signedComplaints"   name="complaints_department"  onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
			</tr>
			<tr>  
	             <td style=" text-align: left;"><b>&nbsp;&nbsp;(c) Complaints from CBI </b></td>
				 <td><b><form:input style="padding:2px;" path="complaints_cbi"   class="signedComplaints"   name="complaints_cbi"  onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
			</tr>
			<tr>  
	             <td style=" text-align: left;"><b>&nbsp;&nbsp;(d) Complaints from Other Source </b></td>
				 <td><b><form:input style=" padding:2px;"  path="complaints_other"  class="signedComplaints"    name="complaints_other"  onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
			</tr>
			<tr>  
	             <td style=" text-align: left;"><b>&nbsp;&nbsp;(e) Detected through Audit(No. of paras turns into Vigilance paras) </b></td>
				 <td><b><form:input style=" padding:2px;"  path="complaints_audit"  class="signedComplaints"   name="complaints_audit"  onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
			</tr>
			<tr>  
	             <td style=" text-align: left;"><b>&nbsp;&nbsp;(f) Detected through Inspection/Scrutiny of Contracts etc . </b></td>
				 <td><b><form:input style=" padding:2px;"  path="complaints_detected"  class="signedComplaintsFinal"    name="complaints_detected"  onkeypress="return isNumberKey(event);"  readonly="true"/></b></td>
			</tr>
	</table>
	<br>
<div style="padding:5px;  margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>1.2 Break Up of Diposal of  Complaints During the Quarter</b> </div>
<br>
	<table style="margin: auto; width:66%;" class="table">
            
            <tr>  
	            <td style=" text-align: left;"><b>&nbsp;&nbsp;(a) Sent to CBI for Investigation/appropriate action</b></td>
				<td><b><form:input style=" padding:2px;"  path="complaints_cbi_action"   class="breakDisposal"  readOnly="true" name="complaints_cbi_action"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>  
	             <td style=" text-align: left;"><b>&nbsp;&nbsp;(b) Taken up for detailed investigation by CVO</b></td>   
				 <td><b><form:input style=" padding:2px;" path="complaints_cvoInvestigation"   class="breakDisposal"   readOnly="true" name="complaints_cvoInvestigation"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>  
	             <td style=" text-align: left;"><b>&nbsp;&nbsp;(c) Signed complaints filed being non-specific/vague/generalallegations </b></td>
				 <td><b><form:input style=" padding:2px;" path="complaints_signed_filed"   class="breakDisposal"  readOnly="true" name="complaints_signed_filed"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>  
	             <td style=" text-align: left;"><b>&nbsp;&nbsp;(d) Signed complaints not confirmed by sender- Filed as Pseudonymous </b></td>
				 <td><b><form:input style="20%;padding:2px;" path="complaints_signed_notConfirmed"   class="breakDisposal"   readOnly="true" name="complaints_signed_notConfirmed"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>  
	             <td style=" text-align: left;"><b>&nbsp;&nbsp;(e) Passed on to administraive authorities for appropriate action having no vigilance angle/allegation of corruption</b></td>
				 <td><b><form:input style="20%;padding:2px;" path="complaints_actionforNoVigilance"    class="breakDisposalFinal"  readOnly="true" name="complaints_actionforNoVigilance"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
				</table>
			
			<br>
			<div class="center">
 					 <p><strong>NB: Aggregate of (a), (b), (c) (d)&amp; (e) of para 1.2 should tally with total figure under Col 5of para 1</strong></p>
			</div>
			<br>
			
<div style="padding:5px;  margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>1.3 PIDPI* Complaints</b> </div>
<br>	
<table style="margin: auto; width:66%;" class="table">  
	       <tr>
			   <th rowspan=2><b>Source</b></th>
			   <th rowspan=2><b>Opening Balance</b></th>
			   <th rowspan=2><b>Received During the Quarter</b></th>
			   <th rowspan=2><b>Total</b></th>
			   <th rowspan=2 style="width:20%"><b>Reports submitted to CVC/CVO,Admin.Ministry During the quarter</b></th>
			   <th rowspan=2><b>Balance Pending</b></th>	
			   <th colspan=3><b>Age wise Pendency for Investigation by CVO</b></th>	
               <th rowspan=2><b>Reasons for delay beyond 3 months</b></th>			   
		   </tr>
		   <tr>
		   		<th>
		   			Upto 3 month
		   		</th>
		   			
		   		<th>
		   			3-6 months
		   		</th>
		   		<th>
		   			> 6 months
		   		</th>
				
		   </tr>
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
				<td>&nbsp;10</td>
			</tr>
		   <tr>
				<td style=" text-align: left;"><b>&nbsp;&nbsp;CVC</b></td>
				<td><b><form:input style="padding: 2px;" class="pidpiBalance cvcPidpi"   path="cvcpidpi_opening_balance"  readOnly="true" name="cvcpidpi_opening_balance" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="pidpiRecived cvcPidpi"  path="cvcpidpi_ReceiveQuarter"  readOnly="true" name="cvcpidpi_ReceiveQuarter" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalcvcPidpi pidpiTotal balPenTotal"  path="cvcpidpi_Total"  readOnly="true" name="cvcpidpi_Total" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="pidpiReports balPenTotal disQTRPidpi"  path="cvcpidpi_report_quarter"  readOnly="true" name="cvcpidpi_report_quarter"  data-field="cvcfirst" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalbalPenTotal pidpiBalancePending" path="cvcpidpi_balance_pending"  readOnly="true" name="cvcpidpi_balance_pending" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="pidpiUptoOne  bPTotalpidpiCVC"  path="cvcpidpi_three_month"  readOnly="true" name="cvcpidpi_three_month" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="pidpiOnetoTwo  bPTotalpidpiCVC"  path="cvcpidpi_three_to_six"  readOnly="true" name="cvcpidpi_three_to_six" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="pidpiGreaterTwo  bPTotalpidpiCVCFinal" path="cvcpidpi_less_six"  readOnly="true" name="cvcpidpi_less_six" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px; width:250px; "  path="cvcpidpi_delay_one_month"  readOnly="true" name="cvcpidpi_delay_one_month" /></b></td>
			 </tr>
			  <tr>
				<td style=" text-align: left;"><b>&nbsp;&nbsp;Other Designated Authority</b></td>
				<td><b><form:input style="margin-top:18px;" class="pidpiBalance otherPidpi"  path="otherpidpi_opening_balance"  readOnly="true" name="otherpidpi_opening_balance" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="margin-top:18px;" class="pidpiRecived otherPidpi"  path="otherpidpi_ReceiveQuarter"   readOnly="true" name="otherpidpi_ReceiveQuarter" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="margin-top:18px;" class="totalotherPidpi pidpiTotal othBalPenTotal"  path="otherpidpi_Total"  readOnly="true" name="otherpidpi_Total" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="margin-top:18px;" class="pidpiReports othBalPenTotal disQTRPidpiOther"  path="otherpidpi_report_quarter"  readOnly="true" name="otherpidpi_report_quarter"  data-field="cvcsecond" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="margin-top:18px;" class="totalothBalPenTotal pidpiBalancePending"  path="otherpidpi_balance_pending"  readOnly="true" name="otherpidpi_balance_pending" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="margin-top:18px;" class="pidpiUptoOne   bPTotalotherpidpi"  path="otherpidpi_three_month"  readOnly="true" name="otherpidpi_three_month" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="margin-top:18px;" class="pidpiOnetoTwo  bPTotalotherpidpi"  path="otherpidpi_three_to_six"  readOnly="true" name="otherpidpi_three_to_six" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="margin-top:18px;"   class="pidpiGreaterTwo  bPTotalotherpidpiFinal"  path="otherpidpi_less_six"  readOnly="true" name="otherpidpi_less_six" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="margin-top:18px; width:250px;"  path="otherpidpi_delay_one_month"   readOnly="true" name="otherpidpi_delay_one_month"  /></b></td>
			 </tr>
				 <tr>
				 <td style=" text-align: left;"><b>&nbsp;&nbsp;TOTAL</b></td>
				 <td><b><form:input style="padding: 2px;"  class="totalpidpiBalance" path="totalpidpi_opening_balance"    name="totalpidpi_opening_balance" readOnly="true"  onkeypress="return isNumberKey(event);"/></b></td>
				 <td><b><form:input style="padding: 2px;"  class="totalpidpiRecived"  path="totalpidpi_ReceiveQuarter"   name="totalpidpi_ReceiveQuarter" readOnly="true"  onkeypress="return isNumberKey(event);"/></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalpidpiTotal"  path="totalpidpi_Total"   name="totalpidpi_Total" readOnly="true"  onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalpidpiReports"  path="totalpidpi_report_quarter"   name="totalpidpi_report_quarter"  readOnly="true"  onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalpidpiBalancePending" path="totalpidpi_balance_pending"    name="totalpidpi_balance_pending"  readOnly="true"  onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalpidpiUptoOne" path="toatlpidpi_three_month"   name="toatlpidpi_three_month" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalpidpiOnetoTwo" path="toatlpidpi_three_to_six"   name="toatlpidpi_three_to_six" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalpidpiGreaterTwo" path="totalpidpi_less_six"   name="totalpidpi_less_six" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				   <td><b><form:input style="padding: 2px; width:250px;"  path="toatlpidpi_delay_one_month"  readOnly="true" name="toatlpidpi_delay_one_month" /></b></td>
				</tr>
	</table>
	
		<br>
			<div class="center">
  				<p><strong><sup>*</sup></strong>Complaints as received for Investigation &amp; Reportfrom CVC and Admn. Ministry to be reflected separately under Public Interest Disclosure &amp; Protection of Informers Resolution dated 21.4.2004 and Amendment Resolution dated 29.8.2013/Whistle Blowers Protection Act, 2011(when WBP Act,2011 comes into effect)</p>
			</div>
		<br>
<div style="padding:5px;  margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>1.4 Advice and Action Taken on PIDPI Investigation Reports</b> </div>
<br>	
			


	<table style="margin: auto; width:66%;" class="table">  
	<tr></tr>
			<tr>
			   <th rowspan=2><b>Agency</b></th>
			   <th rowspan=2><b>Advice of CVC/Designated Agency received till end of previous quarter  </b></th>
			   <th rowspan=2><b>Reports sent during the quarter by CVO(Col.5 of para 1.3 above)</b></th>
			   <th rowspan=2><b>Reports in which Advice received during the quarter</b></th>
			   <th rowspan=2 ><b>Total Advice received</b></th>
			   <th rowspan=2><b>Action Taken during the quarter</b></th>	
			   <th colspan=4><b>Balance Pending for Action by Management/Orgn.</b></th>	
			   
		   </tr>
		   <tr>
		   		<th>
		   			<3 months
		   		</th>
		   			
		   		<th>
		   			3-6 months
		   		</th>
		   		<th>
		   			6-12 months
		   		</th>
				<th>
		   			>12 months
		   		</th>
				
		   </tr>
		   
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
				<td>&nbsp;10</td>
			 </tr>
		    <tr>
				<td style=" text-align: left;"> <b>&nbsp;&nbsp;CVC</b> </td>
				<td><b><form:input style="padding: 2px;" class="adviceCVC  adviceReportCVC"  path="cvcPIDPIInvestAdviceCVC"   readOnly="true" name="cvcPIDPIInvestAdviceCVC" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="reporSendtQtr" path="cvcPIDPIInvesQuarterReportbyCVO"  readOnly="true" name="cvcPIDPIInvesQuarterReportbyCVO" id="reporSendtQtr1" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="reportsReceiveQtr  adviceReportCVC" path="cvcPIDPIInvesQuarterAdviceReceive"  readOnly="true" name="cvcPIDPIInvesQuarterAdviceReceive" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="adviceTotal  totaladviceReportCVC"  path="cvcPIDPIInvesTotalAdviceReceive"  readOnly="true" name="cvcPIDPIInvesTotalAdviceReceive" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="actionTakenQtr actionTakenQtrLessThanTotal" path="cvcPIDPIInvesActionduringQuarter"  readOnly="true" name="cvcPIDPIInvesActionduringQuarter" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="greaterThree pendingTotal" path="cvcPIDPIInvesBalanceGreterThreeMonth"  readOnly="true" name="cvcPIDPIInvesBalanceGreterThreeMonth" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="threetoSix pendingTotal" path="cvcPIDPIInvesBalanceBetweenThreetoSix"  readOnly="true" name="cvcPIDPIInvesBalanceBetweenThreetoSix" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="sixtoTwelve pendingTotal" path="cvcPIDPIInvesBalanceBetweenSixtoTwelve"   readOnly="true" name="cvcPIDPIInvesBalanceBetweenSixtoTwelve" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="lessTwelve pendingTotalFinal" path="cvcPIDPIInvesBalancelessTwelve"  readOnly="true" name="cvcPIDPIInvesBalancelessTwelve" onkeypress="return isNumberKey(event);" /></b></td>
			 </tr>
			  <tr>
				 <td style=" text-align: left;"><b>&nbsp;&nbsp;CVO,Admn.Ministry</b></td>
				 <td><b><form:input style="padding: 2px;" class="adviceCVC  adviceReportCVO" path="cvoPIDPIInvestAdviceCVC"  readOnly="true" name="cvoPIDPIInvestAdviceCVC" onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input style="padding: 2px;" class="reporSendtQtr"  path="cvoPIDPIInvesQuarterReportbyCVO"   name="cvoPIDPIInvesQuarterReportbyCVO"  id="reporSendtQtr2" onkeypress="return isNumberKey(event);" readonly="true"/></b></td>
				  <td><b><form:input style="padding: 2px;" class="reportsReceiveQtr adviceReportCVO" path="cvoPIDPIInvesQuarterAdviceReceive"  readOnly="true" name="cvoPIDPIInvesQuarterAdviceReceive" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="adviceTotal  totaladviceReportCVO"  path="cvoPIDPIInvesTotalAdviceReceive"  readOnly="true" name="cvoPIDPIInvesTotalAdviceReceive" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="actionTakenQtr actionTakenQtrLessThanTotal"  path="cvoPIDPIInvesActionduringQuarter"  readOnly="true" name="cvoPIDPIInvesActionduringQuarter" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="greaterThree pendingTotalOther" path="cvoPIDPIInvesBalanceGreterThreeMonth"   readOnly="true" name="cvoPIDPIInvesBalanceGreterThreeMonth" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="threetoSix pendingTotalOther"  path="cvoPIDPIInvesBalanceBetweenThreetoSix"  readOnly="true" name="cvoPIDPIInvesBalanceBetweenThreetoSix" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;"   class="sixtoTwelve pendingTotalOther" path="cvoPIDPIInvesBalanceBetweenSixtoTwelve"  readOnly="true" name="cvoPIDPIInvesBalanceBetweenSixtoTwelve" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;"   class="lessTwelve pendingTotalOtherFinal"  path="cvoPIDPIInvesBalancelessTwelve" readOnly="true" name="cvoPIDPIInvesBalancelessTwelve" onkeypress="return isNumberKey(event);" /></b></td>
				</tr>
				
				 <tr>
				 <td style=" text-align: left;"><b>&nbsp;&nbsp;TOTAL</b></td>
				 <td><b><form:input style="padding:  2px;" class="totaladviceCVC" path="totalPIDPIInvestAdviceCVC"   name="totalPIDPIInvestAdviceCVC" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input style="padding:  2px;" class="totalreporSendtQtr"  path="totalPIDPIInvesQuarterReportbyCVO"   name="totalPIDPIInvesQuarterReportbyCVO" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalreportsReceiveQtr"  path="totalPIDPIInvesQuarterAdviceReceive"   name="totalPIDPIInvesQuarterAdviceReceive" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totaladviceTotal"  path="totalPIDPIInvesTotalAdviceReceive"   name="totalPIDPIInvesTotalAdviceReceive" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalactionTakenQtr" path="totalPIDPIInvesActionduringQuarter"    name="totalPIDPIInvesActionduringQuarter" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalgreaterThree" path="totalPIDPIInvesBalanceGreterThreeMonth"    name="totalPIDPIInvesBalanceGreterThreeMonth" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalthreetoSix" path="totalPIDPIInvesBalanceBetweenThreetoSix"   name="totalPIDPIInvesBalanceBetweenThreetoSix" readOnly="true"  onkeypress="return isNumberKey(event);"/></b></td>
				  <td><b><form:input style="padding: 2px;" class="totalsixtoTwelve"  path="totalPIDPIInvesBalanceBetweenSixtoTwelve"    name="totalPIDPIInvesBalanceBetweenSixtoTwelve" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input style="padding: 2px;" class="totallessTwelve"  path="totalPIDPIInvesBalancelessTwelve"  name="totalPIDPIInvesBalancelessTwelve"  readOnly="true" onkeypress="return isNumberKey(event);"/></b></td>
				</tr>
				
				
		</table>

<br>
<div class="center">
  <p><sup>*</sup> Final decision taken by DA after CVOs recommendations and&nbsp; charge-sheet for major/minor RDA issued/final decision taken for administrative action or decision of CVO for closure of case on investigation reports.</p>
</div>
<br>

<div style="padding:5px;  margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>1.5 Action taken report on complaints sent by Central Vigilance Commission for "Necessary Action" under PIDPI Resolution</b> </div>
<br>		



	<table style="margin: auto; width:66%;" class="table"> 
	
	        <tr>
			   <th ><b>Brought forward</b></th>
			   <th ><b>Received during the quarter</b></th>
			   <th ><b>Total</b></th>
			   <th  style="width:20%"><b>Filed/closed without taking any action</b></th>
			   <th ><b>Taken up for further investigation</b></th>	
			   <th ><b>Complaints resulting in administrative action</b></th>
               <th ><b>Complaints resulting in imposition of major/minor penalty</b></th>	
               <th ><b>Total complaints disposed of during the quarter</b></th>	
               <th ><b>Pending at the end of the quarter</b></th>					
		    </tr>
		     <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
			 </tr>
			 <tr>
				  <td><b><form:input style="padding: 2px;"  path="naPIDPIBroughtforward"  class="pidpi-forward-received"   readOnly="true" name="naPIDPIBroughtforward" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td><b><form:input style="padding: 2px;"  path="naPIDPIReceiveQtr"  class="pidpi-forward-received"  readOnly="true" name="naPIDPIReceiveQtr" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td><b><form:input style="padding: 2px;"  path="naPIDPITotal"    class="pidpi-for-rec-ttl" readonly="readonly"                readOnly="true" name="naPIDPITotal" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td><b><form:input style="padding: 2px;"  path="naPIDPIClosedwithoutAction"  class="pidpi-complaints"  readOnly="true" name="naPIDPIClosedwithoutAction" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td><b><form:input style="padding: 2px;"  path="naPIDPIFurtherInvestigation"  class="pidpi-pend"  readOnly="true" name="naPIDPIFurtherInvestigation" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td><b><form:input style="padding: 2px;"  path="naPIDPIAdminAction"  class="pidpi-complaints"  readOnly="true" name="naPIDPIAdminAction" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td><b><form:input style="padding: 2px;"  path="naPIDPIImpositionPenalty" class="pidpi-complaints"  readOnly="true" name="naPIDPIImpositionPenalty" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td><b><form:input style="padding: 2px;"  path="naPIDPIDisposedQtr"  class="pidpi-complaints-quaterly" readonly="readonly"  name="naPIDPIDisposedQtr" onkeypress="return isNumberKey(event);" Readonly="true"  /></b> </td>
				  <td><b><form:input style="padding: 2px;"  path="naPIDPIPendingQtr"  class="pidpi-pending-ttl" readonly="readonly"  name="naPIDPIPendingQtr" onkeypress="return isNumberKey(event);" Readonly="true" /></b> </td>
			 </tr>
			</table>	
<br>
<div style="padding:5px;  margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>1.6 Scrutiny of Audit Reports</b> </div>
<br>
		
			

	<table style="margin: auto; width:66%;" class="table"> 
	
	        <tr>
			   <th ><b>Type of Audit</b></th>
			   <th ><b>Paras B/F from previous years</b></th>
			   <th ><b>No. of reports examined during the quarter</b></th>
			   <th  style="width:20%"><b>No. of para in which vigilance angle observed and identified for examination*</b></th>
			   <th ><b>No. of paras in which  investigation completed</b></th>	
			   <th ><b>No. of paras pending for investigation</b></th>						
		    </tr>
		    <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
			 </tr>
			  <tr>
			  	  <td style=" text-align: left;"><b>&nbsp;&nbsp;CAG</b></td>
				  <td> <b> <form:input style="padding: 2px;" path="scrutinyReportbfPreviousYear" class="ScruAudit bfPreviousYear"  readOnly="true" name="scrutinyReportbfPreviousYear" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportExaminedQtr" class="ScruAudit ExaminedQtr" readOnly="true" name="scrutinyReportExaminedQtr" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportIdentifiedExami" class="ScruAudit IdentifiedExami" readOnly="true" name="scrutinyReportIdentifiedExami" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportCompleteInvestigation" class="ScruAudit CompleteInvestigation" readOnly="true" name="scrutinyReportCompleteInvestigation" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportPendingInvestigation" class="ScruAudit PendingInvestigation"   name="scrutinyReportPendingInvestigation" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
			 </tr>
			 <tr>
			  	  <td style=" text-align: left;"><b>&nbsp;&nbsp;Concurrent</b></td>
				  <td> <b> <form:input style="padding: 2px;" path="scrutinyReportbfPreviousYearConcurrent" class="ScruAuditConcurrent bfPreviousYear"  readOnly="true" name="scrutinyReportbfPreviousYearConcurrent" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportExaminedQtrConcurrent" class="ScruAuditConcurrent ExaminedQtr" readOnly="true" name="scrutinyReportExaminedQtrConcurrent" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportIdentifiedExamiConcurrent" class="ScruAuditConcurrent IdentifiedExami" readOnly="true" name="scrutinyReportIdentifiedExamiConcurrent" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportCompleteInvestigationConcurrent" class="ScruAuditConcurrent CompleteInvestigation" readOnly="true" name="scrutinyReportCompleteInvestigationConcurrent" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportPendingInvestigationConcurrent" class="ScruAuditConcurrent PendingInvestigation"   name="scrutinyReportPendingInvestigationConcurrent" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
			 </tr>
			 <tr>
			  	  <td style=" text-align: left;"><b>&nbsp;&nbsp;Internal</b></td>
				  <td> <b> <form:input style="padding: 2px;" path="scrutinyReportbfPreviousYearInternal" class="ScruAuditInternal bfPreviousYear"  readOnly="true" name="scrutinyReportbfPreviousYearInternal" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportExaminedQtrInternal" class="ScruAuditInternal ExaminedQtr" readOnly="true" name="scrutinyReportExaminedQtrInternal" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportIdentifiedExamiInternal" class="ScruAuditInternal IdentifiedExami" readOnly="true" name="scrutinyReportIdentifiedExamiInternal" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportCompleteInvestigationInternal" class="ScruAuditInternal CompleteInvestigation" readOnly="true" name="scrutinyReportCompleteInvestigationInternal" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportPendingInvestigationInternal" class="ScruAuditInternal PendingInvestigation"   name="scrutinyReportPendingInvestigationInternal" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
			 </tr>
			 <tr>
			  	  <td style=" text-align: left;"><b>&nbsp;&nbsp;Statutory</b></td>
				  <td> <b> <form:input style="padding: 2px;" path="scrutinyReportbfPreviousYearStatutory" class="ScruAuditStatutory bfPreviousYear"  readOnly="true" name="scrutinyReportbfPreviousYearStatutory" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportExaminedQtrStatutory" class="ScruAuditStatutory ExaminedQtr" readOnly="true" name="scrutinyReportExaminedQtrStatutory" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportIdentifiedExamiStatutory" class="ScruAuditStatutory IdentifiedExami" readOnly="true" name="scrutinyReportIdentifiedExamiStatutory" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportCompleteInvestigationStatutory" class="ScruAuditStatutory CompleteInvestigation" readOnly="true" name="scrutinyReportCompleteInvestigationStatutory" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportPendingInvestigationStatutory" class="ScruAuditStatutory PendingInvestigation"   name="scrutinyReportPendingInvestigationStatutory" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
			 </tr>
			 <tr>
			  	  <td style=" text-align: left;"><b>&nbsp;&nbsp;Others</b></td>
				  <td> <b> <form:input style="padding: 2px;" path="scrutinyReportbfPreviousYearOthers" class="ScruAuditOthers bfPreviousYear"  readOnly="true" name="scrutinyReportbfPreviousYearOthers" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportExaminedQtrOthers" class="ScruAuditOthers ExaminedQtr" readOnly="true" name="scrutinyReportExaminedQtrOthers" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportIdentifiedExamiOthers" class="ScruAuditOthers IdentifiedExami" readOnly="true" name="scrutinyReportIdentifiedExamiOthers" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportCompleteInvestigationOthers" class="ScruAuditOthers CompleteInvestigation" readOnly="true" name="scrutinyReportCompleteInvestigationOthers" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportPendingInvestigationOthers" class="ScruAuditOthers PendingInvestigation"   name="scrutinyReportPendingInvestigationOthers" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
			 </tr>
			 <tr>
			  	  <td style=" text-align: left;"><b>&nbsp;&nbsp;Total</b></td>
				  <td> <b> <form:input style="padding: 2px;" path="scrutinyReportbfPreviousYearTotal" class="bfPreviousYearTotal"   name="scrutinyReportbfPreviousYearTotal" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportExaminedQtrTotal" class="ExaminedQtrTotal"  name="scrutinyReportExaminedQtrTotal" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportIdentifiedExamiTotal" class="IdentifiedExamiTotal" name="scrutinyReportIdentifiedExamiTotal" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportCompleteInvestigationTotal" class="CompleteInvestigationTotal" name="scrutinyReportCompleteInvestigationTotal" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
				  <td> <b><form:input style="padding: 2px;"  path="scrutinyReportPendingInvestigationTotal" class="PendingInvestigationTotal"   name="scrutinyReportPendingInvestigationTotal" onkeypress="return isNumberKey(event);" readonly="true"/></b> </td>
			 </tr>	
			</table>	
			
			<br>
			<div class="center">
  			<p><strong>* Should match with figures at para 1.1 (e)</strong></p>
			</div>
			<br>
			
<br>
			
		


</div>

</form:form>
<!------==============END COMPLAINTS==================---->	
	<form:form name="myform" id="myform"  commandName="VigInvestigationDtoForm" >		
<div>
<h3 align="center" style="font-size:25px; " ><b>QUARTERLY PROGRESS REPORT</b></h3>
<h3 align="center" style="font-size:24px; " ><b>VIGILANCE INVESTIGATION</b></h3>

<!-- <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>2.Vigilance Investigations</b> </div> -->
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>2.1.Complaints,Audit Reports,Inspection Reports of works / Procurements Etc.</b> </div>
<br>
<form:hidden  id="qpr_id" path="qpr_id"/>
<form:hidden  id="last_qpr_id" path="last_qpr_id"/>
<form:hidden path="Used_ip"/>
	<table style="margin: auto; width:66%;" class="table">  
	<tr></tr>
			<tr>
			   <th rowspan=2><b>Agency</b></th>
			   <th rowspan=2><b>Opening Balance </b></th>
			   <th rowspan=2><b>Taken up for investigation during the quarter</b></th>
			   <th rowspan=2><b>Total</b></th>
			   <th rowspan=2 ><b>Reports received from IO/CBI (other than Prosecution sanctions)</b></th>
			   <th rowspan=2><b>Balance Pending</b></th>	
			   <th colspan=4><b>Age wise Pendency(Months) of Investigations</b></th>	
			</tr>
		   <tr>
		   		<th>
		   			<3 
		   		</th>
		   		<th>
		   			3-6 
		   		</th>
		   		<th>
		   			6-12 
		   		</th>
				<th>
		   			>12 
		   		</th>
			</tr>
		    <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
				<td>&nbsp;10</td>
			 </tr>
		    <tr>
				<td> <b>CVC*</b> </td>
				<td><b><form:input style="padding: 2px;" class="viCVCOpening CVCOpeningvi ivCVCtotal" readOnly="true" path="viginvescvcopeningbalance" name="viginvescvcopeningbalance" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viCVCOpening CVOOpeningvi ivCVCtotal"  readOnly="true" path="viginvescvctakeninvesqtr" name="viginvescvctakeninvesqtr"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalviCVCOpening ivCVCtotal subviCVCtotal" readOnly="true"      path="viginvescvctotal" name="viginvescvctotal" onkeypress="return isNumberKey(event);"   /></b></td>
				<td><b><form:input style="padding: 2px;" class="viCVCReportsCBI CVCReportsCBIvi subviCVCtotal addviBalancePending"     readOnly="true" path="viginvescvcreportsrecivqtr" name="viginvescvcreportsrecivqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viCVCBalancePending totalsubviCVCtotal addviBalancePending"  path="viginvescvcbalancepending" name="viginvescvcbalancepending" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				<td><b><form:input style="padding: 2px;" class="viGreaterThree  cvcviGreaterThree"   readOnly="true" path="viginvescvcgreaterthree" name="viginvescvcgreaterthree" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viThreetoSix  cvcviGreaterThree"     readOnly="true" path="viginvescvcthreetosix" name="viginvescvcthreetosix" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viSixtoTwelve cvcviGreaterThree"    readOnly="true" path="viginvescvcsixtotwelve" name="viginvescvcsixtotwelve" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viLessTwelve  cvcviGreaterThreeFinal"     readOnly="true" path="viginvescvclesstwelve" name="viginvescvclesstwelve" onkeypress="return isNumberKey(event);"  /></b></td>
			 </tr>
			 <tr>
				<td><b>CVO **</b></td>
				<td><b><form:input style="padding: 2px;" class="viCVOOpening CVCOpeningvi ivCVCtotal" readOnly="true" path="viginvescvoopeningbalance" name="viginvescvoopeningbalance" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viCVOOpening CVOOpeningvi ivCVCtotal"      readOnly="true" path="viginvescvotakeninvesqtr" name="viginvescvotakeninvesqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalviCVOOpening ivCVCtotal subviCVOtotal"    readOnly="true" path="viginvescvototal" name="viginvescvototal" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viCVOReportsCBI CVCReportsCBIvi subviCVOtotal addviBalancePending"     readOnly="true" path="viginvescvoreportsrecivqtr" name="viginvescvoreportsrecivqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viCVOBalancePending totalsubviCVOtotal addviBalancePending"  path="viginvescvobalancepending" name="viginvescvobalancepending" onkeypress="return isNumberKey(event);"  readonly="true"/></b></td>
				<td><b><form:input style="padding: 2px;" class="viGreaterThree cvoviGreaterThree"   readOnly="true" path="viginvescvogreaterthree" name="viginvescvogreaterthree" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viThreetoSix  cvoviGreaterThree"     readOnly="true" path="viginvescvothreetosix" name="viginvescvothreetosix" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viSixtoTwelve  cvoviGreaterThree"    readOnly="true" path="viginvescvosixtotwelve" name="viCVOSixtoTwelve" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viLessTwelve  cvoviGreaterThreeFinal"     readOnly="true" path="viginvescvolesstwelve" name="viginvescvolesstwelve" onkeypress="return isNumberKey(event);"  /></b></td>
			 </tr>
			 <tr>
				<td><b>TOTAL</b></td>
				<td><b><form:input style="padding: 2px;" class="totalCVCOpeningvi"  readOnly="true" path="viginvestotalopeningbalance" name="viginvestotalopeningbalance" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalCVOOpeningvi"  readOnly="true" path="viginvestotaltakeninvesqtr" name="viginvestotaltakeninvesqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalivCVCtotal"    readOnly="true" path="viginvestotal" name="viginvestotal" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viTotalReportsCBI totalCVCReportsCBIvi" readOnly="true"      path="viginvestotalreportsrecivqtr" name="viginvestotalreportsrecivqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viTotalBalancePending totaladdviBalancePending" readOnly="true"  path="viginvestotalbalancepending" name="viginvestotalbalancepending" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalviGreaterThree" readOnly="true"    path="viginvestotalgreaterthree" name="viginvestotalgreaterthree" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalviThreetoSix"  readOnly="true"     path="viginvestotalthreetosix" name="viginvestotalthreetosix" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalviSixtoTwelve"  readOnly="true"    path="viginvestotalsixtotwelve" name="viginvestotalsixtotwelve" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalviLessTwelve"   readOnly="true"    path="viginvestotallesstwelve" name="viginvestotallesstwelve" onkeypress="return isNumberKey(event);"  /></b></td>
			 </tr>
		</table>
<br>
<div class="center">
 <p><strong>*Only </strong>Complaints received by CVO seeking Investigation and Report from CVC.</p>
<p><strong>** Figures as reported at Para 1.2 (b) to be included in Column no 3.</strong></p>
</div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:32px; background:rgb(204, 255, 204); "><b>2.2	VIGILANCE INVESTIGATION PENDING WHERE OFFICERS UNDER CVC JURISDICTION ARE DUE FOR RETIREMENT IN NEXT ONE YEAR (CASES REFERRABLE TO CVC)</b> </div>
<br>
    <table style="margin: auto; width:66%;" class="table">  
	       <tr>
			   <th rowspan=2><b>Opening Balance</b></th>
			   <th rowspan=2><b>Taken up for investigation during the quarter</b></th>
			   <th rowspan=2><b>Total</b></th>
			   <th rowspan=2 style="width:20%"><b>Reports received from IO (other then Prosecution sanctions)</b></th>
			   <th rowspan=2><b>Balance Pending</b></th>	
			   <th colspan=3><b>Age wise Pendency (Months) of Investigations</b></th>	
               <th rowspan=2><b>Reasons for Pendency</b></th>			   
		   </tr>
		   <tr>
		   		<th>
		   			<3 
		   		</th>
		   			
		   		<th>
		   			3-6 
		   		</th>
		   		<th>
		   			6-12
		   		</th>
		   </tr>
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
			</tr>
		    <tr>
			  <td><b><form:input style="padding: 2px;" class="addviPendingCVCcase" readOnly="true" path="viginvespendingopeningpending" name="viginvespendingopeningpending" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;" class="addviPendingCVCcase" readOnly="true" path="viginvespendinginvestqtr" name="viginvespendinginvestqtr" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;" class="totaladdviPendingCVCcase viPendingCaseCVC"  readOnly="true" path="viginvespendingtotal" name="viginvespendingtotal" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;" class="viPendingCaseCVC" readOnly="true" path="viginvespendingreportio" name="viginvespendingreportio" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;" class="totalviPendingCaseCVC"  path="viginvespendingbalancepending" name="viginvespendingbalancepending" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;"  readOnly="true" class="vigilanceagePendingCase" path="viginvespendinggreaterthree" name="viginvespendinggreaterthree" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;"  readOnly="true" class="vigilanceagePendingCase" path="viginvespendingthreetosix" name="viginvespendingthreetosix" onkeypress="return isNumberKey(event);"  /></b></td>
		      <td><b><form:input style="padding: 2px;"  readOnly="true" class="vigilanceagePendingCaseFinal" path="viginvespendingsixtotwelve" name="viginvespendingsixtotwelve" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px; width:250px;"  readOnly="true" path="viginvespendinglesstwelve" name="viginvespendinglesstwelve"  /></b></td>
			</tr>
		</table>
			<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>2.3 Action on Investigation Reports</b> </div>
<br>	
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>2.3 A Category A (officials falling under CVC jurisdiction)</b> </div>
<br>
<table style="margin: auto; width:66%;" class="table">  
	       <tr>
			   <th rowspan=2><b>Agency</b></th>
			   <th rowspan=2><b>Investigation report B/F from last Quarter</b></th>
			   <th rowspan=2><b>Received During the Quarter</b></th>
			   <th rowspan=2><b>Total</b></th>
			   <th rowspan=2 style="width:20%"><b>Disposed during the Quarter*</b></th>
			   <th rowspan=2><b>Balance Pending investigation Reports</b></th>	
			   <th colspan=4><b>Age wise Pendency (Months) of Investigation Reports(awaiting action)</b></th>	
           </tr>
		   <tr>
		   		<th>
		   			<3 
		   		</th>
		   			
		   		<th>
		   			3-6 
		   		</th>
		   		<th>
		   			 6-12 
				</th>
				<th>
		   			 >12 
				</th>
			</tr>
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
				<td>&nbsp;10</td>
			</tr>
		    <tr>
			  <td><b>CBI</b></td>
			  <td><b><form:input style="padding: 2px;" class="viActionInvestReport vicbiInvestReport viTotalcvc"  readOnly="true" path="viginvestacbireportqtr" name="viginvestacbireportqtr"  onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input style="padding: 2px;" class="viActionReceiveds vicbiInvestReport viTotalcvc"  readOnly="true" path="viginvestacbireceiveqtr" name="viginvestacbireceiveqtr"  onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input style="padding: 2px;" class="totalvicbiInvestReport viTotalcvc subviActionundercvc"   path="viginvestacbitotal" name="viginvestacbitotal" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
			  <td><b><form:input style="padding: 2px;" class="viDisposedQtr subviActionundercvc addofficialsfalling"  readOnly="true" path="viginvestacbidisposedqtr" name="viginvestacbidisposedqtr" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;" class="totalsubviActionundercvc addofficialsfalling"   path="viginvestacbibalancepending" name="viginvestacbibalancepending" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
			  <td><b><form:input style="padding: 2px;" class="vicvcGraterThree pendingCBI"  readOnly="true" path="viginvestacbigreaterthree" name="viginvestacbigreaterthree" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;" class="vicvcThreetoSix pendingCBI"  readOnly="true" path="viginvestacbithreetosix" name="viginvestacbithreetosix" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;" class="vicvcSixtiTwelve pendingCBI"  readOnly="true" path="viginvestacbisixtotwelve" name="viginvestacbisixtotwelve" onkeypress="return isNumberKey(event);"  /></b></td>
			  <td><b><form:input style="padding: 2px;" class="vicvclessTwelve pendingCBIFinal"  readOnly="true" path="viginvestacbilesstwelve" name="viginvestacbilesstwelve" onkeypress="return isNumberKey(event);"  /></b></td>
			</tr>
			<tr>
				<td><b>CVO</b></td>
				<td><b><form:input style="padding: 2px;" class="viActionInvestReport viCVOInvestReport viTotalcvc" readOnly="true" path="viginvestacvoreportqtr" name="viginvestacvoreportqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viActionReceiveds viCVOInvestReport viTotalcvc" readOnly="true" path="viginvestacvoreceiveqtr" name="viginvestacvoreceiveqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalviCVOInvestReport viTotalcvc subviActionCVOCase"    path="viginvestacvototal" name="viginvestacvototal" onkeypress="return isNumberKey(event);"  readonly="true"/></b></td>
				<td><b><form:input style="padding: 2px;" class="viDisposedQtr subviActionCVOCase addofficialsfalling"   readOnly="true" path="viginvestacvodisposedqtr" name="viginvestacvodisposedqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalsubviActionCVOCase addofficialsfalling"  path="viginvestacvobalancepending" name="viginvestacvobalancepending" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				<td><b><form:input style="padding: 2px;" class="vicvcGraterThree pendingCVO" readOnly="true" path="viginvestacvogreaterthree" name="viginvestacvogreaterthree" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="vicvcThreetoSix pendingCVO"  readOnly="true" path="viginvestacvothreetosix" name="viginvestacvothreetosix" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="vicvcSixtiTwelve pendingCVO" readOnly="true" path="viginvestacvosixtotwelve" name="viginvestacvosixtotwelve" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="vicvclessTwelve pendingCVOFinal"  readOnly="true" path="viginvestacvolesstwelve" name="viginvestacvolesstwelve" onkeypress="return isNumberKey(event);"  /></b></td>
			</tr>
			<tr>
				<td><b>TOTAL</b></td>
				<td><b><form:input style="padding: 2px;"  class="totalviActionInvestReport"  path="viginvestatotalreportqtr" name="viginvestatotalreportqtr" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;"  class="totalviActionReceiveds"     path="viginvestatotalreceiveqtr" name="viginvestatotalreceiveqtr" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;"  class="totalviTotalcvc"            path="viginvestatotal" name="viginvestatotal" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;"  class="totalviDisposedQtr"         path="viginvestatotaldisposedqtr" name="viginvestatotaldisposedqtr" readOnly="true"   onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;"  class="totaladdofficialsfalling"   path="viginvestatotalbalancepending" name="viginvestatotalbalancepending" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;"  class="totalvicvcGraterThree"      path="viginvestatotalgreaterthree" name="viginvestatotalgreaterthree"  readOnly="true"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;"  class="totalvicvcThreetoSix"       path="viginvestatotalthreetosix" name="viginvestatotalthreetosix"  readOnly="true"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;"  class="totalvicvcSixtiTwelve"      path="viginvestatotalsixtotwelve" name="viginvestatotalsixtotwelve" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;"  class="totalvicvclessTwelve"       path="viginvestatotallesstwelve" name="viginvestatotallesstwelve" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
			</tr>
	</table>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>2.3 (B) Break up of Disposal</b> </div>
<br>	
<table style="margin: auto; width:66%;" class="table">
            <tr>  
	            <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;(a) C/Sheet for RDA for Major Penalty issued</b></td>
				<td><b><form:input style=" width:20%;padding:2px;"  readOnly="true" class="disposalBreakUp" path="viginvestardamajorpenalty" name="viginvestardamajorpenalty" /></b></td>
			</tr>
			<tr>  
	             <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;(b)C/Sheet for RDA for Minor Penalty issued</b></td>   
				 <td><b><form:input style=" width:20%;padding:2px;"  readOnly="true" class="disposalBreakUp" path="viginvestardaminorpenalty" name="viginvestardaminorpenalty" /></b></td>
			</tr>
			<tr>  
	             <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;(c) Final decision taken for Administrative Action </b></td>
				 <td><b><form:input style=" width:20%;padding:2px;"  readOnly="true" class="disposalBreakUp" path="viginvestadecisionadminaction" name="viginvestadecisionadminaction" /></b></td>
			</tr>
			<tr>  
	             <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;(d) Final decision taken for Closure of case </b></td>
				 <td><b><form:input style=" width:20%;padding:2px;"  readOnly="true" class="disposalBreakUpFinal" path="viginvestadecisionclosurecase" name="viginvestadecisionclosurecase" /></b></td>
			</tr>
		</table>
<br>
<div class="center">
<p>* Disposal Criteria - Final decision takenby DA after CVC advice and whencharge-sheet for major/minor RDA issued/final decision taken for administrative action or closure of case.</p>
<p><strong>NB: Aggregate of (a), (b), (c) &amp; (d) in para 2.2 (B) &nbsp;should tally with total figure under Col 5 of para 2.2 (A)</strong></p>
</div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>2.3 (C) Category B (officials not falling under CVC jurisdiction)</b> </div>
<br>		
<table style="margin: auto; width:66%;" class="table">  
	       <tr>
			   <th rowspan=2><b>Agency</b></th>
			   <th rowspan=2><b>Investigation report B/F from last Quarter</b></th> 
			   <th rowspan=2><b>Received During the Quarter</b></th>
			   <th rowspan=2><b>Total</b></th>
			   <th rowspan=2 style="width:20%"><b>Sent to DAs concerned for Action(ie RDA/AA)</b></th>
			   <th rowspan=2><b>Disposed during the Quarter* (After decision of DA)</b></th>
			   <th rowspan=2><b>Balance Pending Investigations</b></th>		
			   <th colspan=4><b>Age wise Pendency (Months) of Investigation Reports(awaiting action)</b></th>	
           </tr>
		   <tr>
		   		<th>
		   			<3 
		   		</th>
		   			
		   		<th>
		   			3-6 
		   		</th>
		   		<th>
		   			 6-12 
				</th>
				<th>
		   			 >12 
				</th>
		  </tr>
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
				<td>&nbsp;10</td>
				<td>&nbsp;11</td>
			</tr>
		    <tr>
				<td><b>CBI</b></td>
				<td><b><form:input style="padding: 2px;" class="viJuriInvestReport viJuriInvest JuriInvest"  readOnly="true" path="viginvestbcbireportbfqtr" name="viginvestbcbireportbfqtr"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="viJuriReceiv viJuriInvest JuriInvest"  readOnly="true" path="viginvestbcbireceiveqtr" name="viginvestbcbireceiveqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalviJuriInvest JuriInvest"   path="viginvestbcbitotal" name="viginvestbcbitotal" onkeypress="return isNumberKey(event);"  readonly="true"/></b></td>
				<td><b><form:input style="padding: 2px;" class="sentToDA"  readOnly="true" path="viginvestbcbisentdaaction" name="viginvestbcbisentdaaction" /></b></td>
				<td><b><form:input style="padding: 2px;" class="pendDisCBI disposalTotal pendTotal"  readOnly="true" path="viginvestbcbidisposedqtr" name="viginvestbcbidisposedqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="pendTotalSum"   path="viginvestbcbibalancepending" name="viginvestbcbibalancepending" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				<td><b><form:input style="padding: 2px;" class="JuriGratterThree juriPendTotal"  readOnly="true" path="viginvestbcbigreaterthree" name="viginvestbcbigreaterthree" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="JuriThreetoSix juriPendTotal"  readOnly="true" path="viginvestbcbithreetosix" name="viginvestbcbithreetosix" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="JuriSixtoTwelve juriPendTotal"  readOnly="true" path="viginvestbcbisixtotwelve" name="viginvestbcbisixtotwelve" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="JuriLessTwelve juriPendTotalFinal"  readOnly="true" path="viginvestbcbilesstwelve" name="viginvestbcbilesstwelve" onkeypress="return isNumberKey(event);"  /></b></td>
			 </tr>
			  <tr>
				 <td><b>CVO</b></td>
				 <td><b><form:input style="padding: 2px;" class="viJuriInvestReport viJuriReport JuriInvest"  readOnly="true" path="viginvestbcvoreportbfqtr" name="viginvestbcvoreportbfqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input style="padding: 2px;" class="viJuriReceiv viJuriReport JuriInvest"  readOnly="true" path="viginvestbcvoreceiveqtr" name="viginvestbcvoreceiveqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input style="padding: 2px;" class="totalviJuriReport JuriInvest"   path="viginvestbcvototal" name="viginvestbcvototal" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				 <td><b><form:input style="padding: 2px;" class="sentToDA"  readOnly="true" path="viginvestbcvosentdaaction" name="viginvestbcvosentdaaction" /></b></td>
				 <td><b><form:input style="padding: 2px;" class="pendDisCVO disposalTotal pendTotal"  readOnly="true" path="viginvestbcvodisposedqtr" name="viginvestbcvodisposedqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input style="padding: 2px;" class="pendTotalSum"   path="viginvestbcvobalancepending" name="viginvestbcvobalancepending" onkeypress="return isNumberKey(event);" readonly="true" /></b></td>
				 <td><b><form:input style="padding: 2px;" class="JuriGratterThree juriPendTotalCVO"  readOnly="true" path="viginvestbcvogreaterthree" name="viginvestbcvogreaterthree" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input style="padding: 2px;" class="JuriThreetoSix juriPendTotalCVO"  readOnly="true" path="viginvestbcvothreetosix" name="viginvestbcvothreetosix" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input style="padding: 2px;" class="JuriSixtoTwelve juriPendTotalCVO"  readOnly="true" path="viginvestbcvosixtotwelve" name="viginvestbcvosixtotwelve" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input style="padding: 2px;" class="JuriLessTwelve juriPendTotalCVOFinal"  readOnly="true" path="viginvestbcvolesstwelve" name="viginvestbcvolesstwelve" onkeypress="return isNumberKey(event);"  /></b></td>
			 </tr>
			 <tr>
				<td><b>TOTAL</b></td>
				<td><b><form:input style="padding: 2px;" class="totalviJuriInvestReport"  path="viginvestbtotalreportbfqtr" name="viginvestbtotalreportbfqtr" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalviJuriReceiv"  path="viginvestbtotalreceiveqtr" name="viginvestbtotalreceiveqtr" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalJuriInvest"  path="viginvestbtotal" name="viginvestbtotal" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class=""   path="viginvestbtotalsentdaaction" name="viginvestbtotalsentdaaction" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class=""  path="viginvestbtotaldisposedqtr" name="viginvestbtotaldisposedqtr" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class=""  path="viginvestbtotalbalancepending" name="viginvestbtotalbalancepending" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalJuriGratterThree"  readOnly="true"  path="viginvestbtotalgreaterthree" name="viginvestbtotalgreaterthree" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalJuriThreetoSix"  path="viginvestbtotalthreetosix" name="viginvestbtotalthreetosix"  readOnly="true"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalJuriSixtoTwelve"  path="viginvestbtotalsixtotwelve" name="viginvestbtotalsixtotwelve" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input style="padding: 2px;" class="totalJuriLessTwelve"  path="viginvestbtotallesstwelve" name="viginvestbtotallesstwelve" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
			 </tr>
		</table>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>2.3 (D) Break up of Disposal</b> </div>
<br>	
		<table style="margin: auto; width:66%;" class="table">
            <tr>  
	            <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;(a) C/Sheet for RDA for Major Penalty issued</b></td>
				<td><b><form:input style=" width:20%;padding:2px;" class="juriBreakUp"    path="viginvestbrdamajorpenalty" name="viginvestbrdamajorpenalty"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>  
	             <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;(b)C/Sheet for RDA for Minor Penalty issued</b></td>   
				 <td><b><form:input style=" width:20%;padding:2px;" class="juriBreakUp"    readOnly="true" path="viginvestbrdaminorpenalty" name="viginvestbrdaminorpenalty"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>  
	             <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;(c) Final decision taken for Administrative Action </b></td>
				 <td><b><form:input style=" width:20%;padding:2px;"  class="juriBreakUp"   readOnly="true" path="viginvestbdecisionadminaction" name="viginvestbdecisionadminaction"  onkeypress="return isNumberKey(event);"/></b></td>
			</tr>
			<tr>  
	             <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;(d) Final decision taken for Closure/No action </b></td>
				 <td><b><form:input style=" width:20%;padding:2px;"  class="juriBreakUpFinal"   readOnly="true" path="viginvestbdecisionclosurecase" name="viginvestbdecisionclosurecase"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
		</table>
<br>
<div class="center">
  <p><sup>*</sup> Final decision taken by DA after CVOs recommendations and charge-sheet for major/minor RDA issued/final decision taken for administrative action or decision of CVO for closure of case on investigation reports.</p>
<p><strong>NB: Aggregate of (a), (b), (c) &amp; (d) in this sub- para should tally with total figure under Col.5 of sub-para (C) para 1.1.</strong></p>

</div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>2.4 Investigation Reports Submitted by the CVO W.R.T ALL Complaints/Auditreports,Inspection Reports of Works/Procurements.(Nos)</b> </div>
<br>
	<table style="margin: auto; width:66%;" class="table"> 
	      <tr>
			   <th rowspan=2><b>Reports submitted by the CVO during the Quarter</b></th>
			   <th colspan=4><b>Action Recommended on the Investigation Reports/Cases of the Quarter*</b></th>	
          </tr>
		   <tr>
		   		<th>
		   			Major pp 
		   		</th>
		   			
		   		<th>
		   			Minor pp
		   		</th>
		   		<th>
		   			 Others incl.Admn Action etc
				</th>
				<th>
		   			 Closure 
				</th>
		</tr>
		<tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				
			</tr>
		   <tr>
				  <td> <b><form:input style="padding: 2px;"  readOnly="true" path="viginvestreportbycvoqtr" name="viginvestreportbycvoqtr"  onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="investCVOReport" readOnly="true" path="viginvestmajorpp" name="viginvestmajorpp"  onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="investCVOReport" readOnly="true" path="viginvestminorpp" name="viginvestminorpp"  onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="investCVOReport" readOnly="true" path="viginvestotheradmnaction" name="viginvestotheradmnaction" onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="investCVOReportFinal" readOnly="true" path="viginvestclosure" name="viginvestclosure"  onkeypress="return isNumberKey(event);" /></b> </td>
		</tr>
			</table>	
<br>
<div class="center">
<p>* Action recommended in cases/reports&amp; no. of officers against whom action recommended by CVO</p>
</div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>2.5 Risk wise Break up of Action Recommended in PARA 2.3 Above During the Quarter</b> </div>
<br>
		<table style="margin: auto; width:66%;" class="table"> 
	        <tr>
			   <th rowspan=2><b>**Category</b></th>
			   <th colspan=5><b>Action Recommended on the cases of the month</b></th>
		   </tr>
		   <tr>
		   		<th>
		   			Major pp 
		   		</th>
		   		<th>
		   			Minor pp
		   		</th>
		   		<th>
		   			Others incl.Admn Action etc
		   		</th>
		   		<th>
		   			 Closure 
				</th>
				<th>
		   			 Total
				</th>
		 </tr>
		  <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
			</tr>
		   <tr>
				  <td> <b>Group C</b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankpp groupCTotal" readOnly="true" path="viginvestreskgroupcmajorpp" name="viginvestreskgroupcmajorpp" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankMinorPP groupCTotal" readOnly="true" path="viginvestreskgroupcminorpp" name="viginvestreskgroupcminorpp" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankAction groupCTotal" readOnly="true" path="viginvestreskgroupcotheraction" name="viginvestreskgroupcotheraction" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankClosure groupCTotal" readOnly="true" path="viginvestreskgroupcclosure" name="viginvestreskgroupcclosure" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankTotal" readOnly="true" path="viginvestreskgroupctotal" name="viginvestreskgroupctotal" onkeypress="return isNumberKey(event);"  /></b> </td>
			</tr>
			 <tr>
				  <td> <b>Group B</b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankpp groupBTotal"  readOnly="true" path="viginvestreskgroupbmajorpp" name="viginvestreskgroupbmajorpp" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankMinorPP groupBTotal" readOnly="true" path="viginvestreskgroupbminorpp" name="viginvestreskgroupbminorpp" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankAction groupBTotal" readOnly="true" path="viginvestreskgroupbotheraction" name="viginvestreskgroupbotheraction" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankClosure groupBTotal" readOnly="true" path="viginvestreskgroupbclosure" name="viginvestreskgroupbclosure" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankTotal" readOnly="true" path="viginvestreskgroupbtotal" name="viginvestreskgroupbtotal" onkeypress="return isNumberKey(event);"  /></b> </td>
			 </tr>
			 <tr>
				  <td> <b>Group A upto DS/Dir level</b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankpp groupATotal"  readOnly="true" path="viginvestreskgroupamajorpp" name="viginvestreskgroupamajorpp" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankMinorPP groupATotal" readOnly="true" path="viginvestreskgroupaminorpp" name="viginvestreskgroupaminorpp" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankAction groupATotal" readOnly="true" path="viginvestreskgroupaotheraction" name="viginvestreskgroupaotheraction" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankClosure groupATotal" readOnly="true" path="viginvestreskgroupaclosure" name="viginvestreskgroupaclosure" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankTotal" readOnly="true" path="viginvestreskgroupatotal" name="viginvestreskgroupatotal" onkeypress="return isNumberKey(event);"  /></b> </td>
			 </tr>
			 <tr>
				  <td> <b>Js and above</b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankppFinal groupJSTotal"   readOnly="true" path="viginvestreskgroupjsmajorpp" name="viginvestreskgroupjsmajorpp" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankMinorPPFinal groupJSTotal"  readOnly="true" path="viginvestreskgroupjsminorpp" name="viginvestreskgroupjsminorpp" onkeypress="return isNumberKey(event);"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankActionFinal groupJSTotal"  readOnly="true" path="viginvestreskgroupjsotheraction" name="viginvestreskgroupjsotheraction" /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankClosureFinal groupJSTotal" readOnly="true" path="viginvestreskgroupjsclosure" name="viginvestreskgroupjsclosure"  /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="viRankTotal"   path="viginvestreskgroupjstotal" name="viginvestreskgroupjstotal" readonly="true" /></b> </td>
			 </tr>
			 <tr>
				  <td> <b>Total</b> </td>
				  <td> <b><form:input style="padding: 2px;" class="totalviRankpp groupTotal"    path="viginvestresktotalmajorpp" name="viginvestresktotalmajorpp" readOnly="true"  onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="totalviRankMinorPP groupTotal"   path="viginvestresktotalminorpp" name="viginvestresktotalminorpp" readOnly="true"  onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="totalviRankAction groupTotal"   path="viginvestresktotalotheraction" name="viginvestresktotalotheraction" readOnly="true"  onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="totalviRankClosure groupTotal"  path="viginvestresktotalclosure" name="viginvestresktotalclosure" readOnly="true"  onkeypress="return isNumberKey(event);" /></b> </td>
				  <td> <b><form:input style="padding: 2px;" class="totalviRankTotal groupTotal"  path="viginvestresktotal" name="viginvestresktotal" readOnly="true"  onkeypress="return isNumberKey(event);" /></b> </td>
			 </tr>
			</table>
<br>
<div class="center">
<p><strong><sup>Number of officials to be specified under each type of action recommended by CVO</sup></strong></p>
<p><sup>**</sup>Also see explanation appended at the end for equivalent categories in organisations.</p>
</div>


</div>
			
</form:form>
<br><br><br><br><br><br>
	
	<form:form name="myform" id="myform"  commandName="prosectionSanctionsForm" >	
<div>
<h3 align="center" style="font-size:25px; " ><b>QUARTERLY PROGRESS REPORT</b></h3>
<h3 align="center" style="font-size:24px; " ><b>PROSECUTION SANCTIONS</b></h3>
<!-- <div style="width:100%;border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>3. Prosecution Sanctions</b> </div> -->
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>3.1(A) Details regarding requests for Prosecution sanctions received and disposed</b> </div>
<br>
<form:hidden  id="qpr_id" path="qpr_id"/>
<form:hidden  id="last_qpr_id" path="last_qpr_id"/>
<form:hidden path="Used_ip"/>
	<table style="margin: auto; width:66%;" class="table">  
	<tr></tr>
			<tr>
			   <th rowspan=2 style="width:20%"><b>**Category</b></th>
			   <th rowspan=2><b>Opening Balance </b></th>
			   <th rowspan=2><b>Received during the qrtr. </b></th>
			   <th rowspan=2><b>Total</b></th>
			    <th rowspan=2><b>Sanction granted</b></th>
			   <th rowspan=2 ><b>Sanction refused</b></th>
			   <th rowspan=2><b>Balance Pending</b></th>	
			   <th colspan=3><b>Age wise Pendency(Months) </b></th>	
			   
		   </tr>
		   <tr>
		   		<th>
		   			<3 
		   		</th>
		   			
		   		<th>
		   			3-6 
		   		</th>
		   		<th>
		   			>6
		   		</th>
				
		   </tr>
		   
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
				<td>&nbsp;10</td>
			 </tr>
		   <tr>
				<td> <b>(1)Group C</b> </td>
				<td><b><form:input path="proseSanctGroupcOpeningBalance" style="padding: 2px;" class="proCbalance proSanctions"    readOnly="true" name="proseSanctGroupcOpeningBalance" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupCReciveQTR" style="padding: 2px;" class="proReceive  proSanctions"  readOnly="true" name="proseSanctGroupCReciveQTR" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupCTotal" style="padding: 2px;" class="totalproSanctions proTotal"  readOnly="true" name="proseSanctGroupCTotal"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupCSanctionGranted" style="padding: 2px;" class="proSanction balPendC"   readOnly="true" name="proseSanctGroupCSanctionGranted" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupCSanctionRefused" style="padding: 2px;" class="proRefused balPendC"   readOnly="true" name="proseSanctGroupCSanctionRefused" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupCBalancePending" style="padding: 2px;" class="greaterThree"   name="proseSanctGroupCBalancePending" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupCGreaterThree" style="padding: 2px;" class="proThree breakPendC"  readOnly="true" name="proseSanctGroupCGreaterThree" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupCThreetoSix" style="padding: 2px;" class="proThreetoSix breakPendC"   readOnly="true" name="proseSanctGroupCThreetoSix" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupClessSix" style="padding: 2px;" class="proLessSix breakPendCFinal"   readOnly="true" name="proseSanctGroupClessSix" onkeypress="return isNumberKey(event);" /></b></td>
			 </tr>
			  <tr>
				 <td><b>(2)Group B</b></td>
				 <td><b><form:input path="proseSanctGroupBOpeningBalance" style="padding: 2px;" class="proCbalance proGroupB"   readOnly="true" name="proseSanctGroupBOpeningBalance" onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="proseSanctGroupBReciveQTR" style="padding: 2px;" class="proReceive proGroupB"   readOnly="true" name="proseSanctGroupBReciveQTR" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupBTotal" style="padding: 2px;" class="totalproGroupB proTotal"   readOnly="true" name="proseSanctGroupBTotal"  onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupBSanctionGranted" style="padding: 2px;" class="proSanction balPendB"   readOnly="true" name="proseSanctGroupBSanctionGranted" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupBSanctionRefused" style="padding: 2px;" class="proRefused balPendB"   readOnly="true" name="proseSanctGroupBSanctionRefused" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupBBalancePending" style="padding: 2px;" class="greaterThree"   readOnly="true" name="proseSanctGroupBBalancePending"  onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupBGreaterThree" style="padding: 2px;" class="proThree breakPendB"   readOnly="true" name="proseSanctGroupBGreaterThree" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupBThreetoSix" style="padding: 2px;"   class="proThreetoSix breakPendB" readOnly="true" name="proseSanctGroupBThreetoSix" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="proseSanctGroupBlessSix" style="padding: 2px;"   class="proLessSix breakPendBFinal"  readOnly="true" name="proseSanctGroupBlessSix" onkeypress="return isNumberKey(event);" /></b></td>
				</tr>
				
				 <tr>
				 <td><b>(3)Group A up to DS/Dir level</b></td>
				 <td><b><form:input path="proseSanctGroupAOpeningBalance" style="padding:  2px;" class="proCbalance proGroupA"   readOnly="true" name="proseSanctGroupAOpeningBalance" onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="proseSanctGroupAReciveQTR" style="padding:  2px;" class="proReceive proGroupA"   readOnly="true" name="proseSanctGroupAReciveQTR" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupATotal" style="padding: 2px;" class="totalproGroupA  proTotal"   name="proseSanctGroupATotal" readOnly="true"  onkeypress="return isNumberKey(event);"/></b></td>
				  <td><b><form:input path="proseSanctGroupASanctionGranted" style="padding: 2px;" class="proSanction balPendA"  readOnly="true" name="proseSanctGroupASanctionGranted" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupASanctionRefused" style="padding: 2px;" class="proRefused balPendA"   readOnly="true" name="proseSanctGroupASanctionRefused" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupABalancePending" style="padding: 2px;" class="greaterThree"   name="proseSanctGroupABalancePending" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupAGreaterThree" style="padding: 2px;" class="proThree breakPendA" readOnly="true" name="proseSanctGroupAGreaterThree" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupAThreetoSix" style="padding: 2px;" class="proThreetoSix breakPendA"   readOnly="true" name="proseSanctGroupAThreetoSix" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctGroupAlessSix" style="padding: 2px;" class="proLessSix breakPendAFinal"    readOnly="true" name="proseSanctGroupAlessSix" onkeypress="return isNumberKey(event);" /></b></td>
				</tr>
				<tr>
				 <td><b>(4)Js and above</b></td>
				 <td><b><form:input path="proseSanctJSOpeningBalance" style="padding:  2px;" class="proCbalance  proJs"   readOnly="true" name="proseSanctJSOpeningBalance" onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="proseSanctJSReciveQTR" style="padding:  2px;" class="proReceive  proJs"   readOnly="true" name="proseSanctJSReciveQTR" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctJSTotal" style="padding: 2px;" class="totalproJs  proTotal"  readOnly="true" name="proseSanctJSTotal" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctJSSanctionGranted" style="padding: 2px;" class="proSanction balPendJS"  readOnly="true" name="proseSanctJSSanctionGranted" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctJSSanctionRefused" style="padding: 2px;" class="proRefused balPendJS"   readOnly="true" name="proseSanctJSSanctionRefused" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctJSBalancePending" style="padding: 2px;" class="greaterThree"    name="proseSanctJSBalancePending"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctJSGreaterThree" style="padding: 2px;" class="proThree breakPendJS"   readOnly="true" name="proseSanctJSGreaterThree" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctJSThreetoSix" style="padding: 2px;" class="proThreetoSix breakPendJS"   readOnly="true" name="proseSanctJSThreetoSix" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctJSlessSix" style="padding: 2px;" class="proLessSix breakPendJSFinal"    readOnly="true" name="proseSanctJSlessSix" onkeypress="return isNumberKey(event);" /></b></td>
				</tr>
				<tr>
				 <td><b>Total</b></td>
				 <td><b><form:input path="proseSanctTotalOpeningBalance" style="padding:  2px;" class="totalproCbalance"    name="proseSanctTotalOpeningBalance" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="proseSanctTotalReciveQTR" style="padding:  2px;" class="totalproReceive"    name="proseSanctTotalReciveQTR" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctTotal" style="padding: 2px;" class="totalproTotal"   name="proseSanctTotal"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctTotalSanctionGranted" style="padding: 2px;" class="totalproSanction"   name="proseSanctTotalSanctionGranted"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctTotalSanctionRefused" style="padding: 2px;" class="totalproRefused"    name="proseSanctTotalSanctionRefused"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctTotalBalancePending" style="padding: 2px;" class="totalgreaterThree"    name="proseSanctTotalBalancePending"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctTotalGreaterThree" style="padding: 2px;" class="totalproThree"   name="proseSanctTotalGreaterThree"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctTotalThreetoSix" style="padding: 2px;" class="totalproThreetoSix"   name="proseSanctTotalThreetoSix"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				  <td><b><form:input path="proseSanctTotallessSix" style="padding: 2px;" class="totalproLessSix"    name="proseSanctTotallessSix"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				</tr>
				
				
		</table>
<br>
<div class="center">
  <p><sup>**</sup> Also see explanation appended at the end for equivalent categories of officers in organisations.</p>
</div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>3.1(B) Details of cases pending for Prosecution sanctions beyond 3 months</b> </div>
<br>
<center>
    <table  width="66%">
              <tr style="margin-top:10px;">
						<td width="15%"  align="left" valign="middle">
							Age wise Pendency:
	                    </td>
						<td width="35%" align="left" >
							<span><form:input path=""  readOnly="true" name="totalOfficer" maxlength="3" class="totalsanctions" id="name_of_officer" style="float:left;width:25%" onkeypress="return isNumberKey(event);" />
							
						</td>
						</tr>
						 <tr>
						<td colspan="4">						
						   <table id="officerNumber" width="100%"  border="1" align="center" cellpadding="10" cellspacing="1" class="tblContainer">                     
								 <thead>
									<th style="width:1%">S.No.</th>
									 <th style="width:14%">CBI FIR No.</th>
									 <th style="width:14%">Name & Designation of officer</th>
									 <th style="width:14%">Date of recommendation by Investigating Agency</th>
									 <th style="width:14%">Date of receipt of recommendation/request</th>
									 <th style="width:14%">Sanction sought under PC Act/IPC/other Laws</th>
									 <th style="width:14%">Status of request/Reasons for pendency</th>
									 <th style="width:14%">Name & designation of authority with whom pending</th>
									 <th style="width:1%">Delete</th>
								   
								</thead>
								<tbody>
									<tr>
									</tr>
							   </tbody>
							</table>
						</td>
					</tr>
						</table>	
</center>
			<br>

<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>3.2 Suspension on Vigilance / Corruotion Grounds- Category A-Officers under CVC jurisdiction</b> </div>
<br>

<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>3.2(A)Details regarding suspension(Nos )</b> </div>
<br>
    <table style="margin: auto; width:66%;" class="table">  
	       <tr>
			  <th rowspan=2><b>Nos. of officersunder suspension at the beginning of quarter</b></th>
			  <th rowspan=2><b>Suspensions ordered during the quarter</b></th>
			  <th rowspan=2><b>Total</b></th>
			  <th rowspan=2 ><b>Suspension revoked during the quarter</b></th>
			  <th rowspan=2><b>Nos. of officers under suspension at the end of quarter</b></th>	
			  		   
		   </tr>
		   <tr></tr>
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				
		  </tr>
		  <tr>
			<td><b><form:input path="proseVigiOfficerSuspension" style="padding: 2px;" class="detailsRegardingOfficer"    readOnly="true" name="proseVigiOfficerSuspension"  onkeypress="return isNumberKey(event);" /></b></td>
			<td><b><form:input path="proseVigiSuspensionOrdered" style="padding: 2px;" class="detailsRegardingOfficer"   readOnly="true" name="proseVigiSuspensionOrdered" onkeypress="return isNumberKey(event);" /></b></td>
			<td><b><form:input path="proseVigiTotal" style="padding: 2px;" class="totaldetailsRegardingOfficer  subSuspensionNos"    name="proseVigiTotal"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
			<td><b><form:input path="proseVigiSuspensionQtr" style="padding: 2px;" class="subSuspensionNos suspenQTR" readOnly="true" name="proseVigiSuspensionQtr"  onkeypress="return isNumberKey(event);" /></b></td>
			<td><b><form:input path="proseVigiSuspensionEndQtr" style="padding: 2px;" class="totalsubSuspensionNos"    name="proseVigiSuspensionEndQtr"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
			
		 </tr>
	</table>
			<br>
<div class="center">
 <p><sup>* Include number of officers falling under CVC jurisdiction- Category A officers only.</sup></p>
</div>
<br>
			<br>
			<br>
			<br>
			</form:form>
			<br><br><br><br><br><br>
		<form:form name="myform"  commandName="depatmentalProForm" >	

<div class="table-responsive">

<h3 align="center" style="font-size:25px; " ><b>QUARTERLY PROGRESS REPORT</b></h3>
<h3 align="center" style="font-size:24px; " ><b>DEPARTMENTAL PROCEEDINGS</b></h3>
<!-- <div style="width:100%;border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>4. Departmental Proceedings</b> </div>
<br> -->
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>Departmental Inquiries (Nos)</b> </div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>4.(A)Major Penalty cases pending with IOs/IAs</b> </div>
<br>

<table style="margin: auto; width:66%;" class="table">  
	<tr></tr>
			<tr>
			   <th rowspan=2 ><b>Category</b></th>
			   <th rowspan=2><b>B/F from last quarter </b></th>
			   <th rowspan=2><b>Inquiries assigned to IO during the quarter </b></th>
			   <th rowspan=2><b>Total</b></th>
			   <th rowspan=2><b>Reports received from IOs</b></th>
			   <th rowspan=2 ><b>Enquiries Pending with IOs</b></th>
			   <th colspan=4><b>Age wise Pendency(Months)** </b></th>	
			</tr>
		    <tr>
		   		<th>
		   			<6 
		   		</th>
		   		<th>
		   			6-12
		   		</th>
		   		<th>
		   			12-18
		   		</th>
				<th>
		   			>18
		   		</th>
			</tr>
		    <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
				<td>&nbsp;10</td>
			 </tr>
		    <tr>
				<td> <b>Cases under CVC Jurisdiction</b> </td>
				<td><b><form:input path="departproceedingsmajor_cvc_lastqtr" style="padding: 2px;" class="majorBFQtr  majorPenaltycvc" readOnly="true" name="departproceedingsmajor_cvc_lastqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_cvc_inquiries" style="padding: 2px;" class="majorInquiries  majorPenaltycvc"  readOnly="true" name="departproceedingsmajor_cvc_inquiries"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_cvc_total" style="padding: 2px;" class="totalmajorPenaltycvc majorPenaltytotal  subCvcEnquiries" readOnly="true"   name="departproceedingsmajor_cvc_total"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_cvc_reportsio" style="padding: 2px;" class="majorReportRec subCvcEnquiries  enqQTR"  readOnly="true" name="departproceedingsmajor_cvc_reportsio" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_cvc_enquiries" style="padding: 2px;" class="totalsubCvcEnquiries enquiriPendingMajor"   name="departproceedingsmajor_cvc_enquiries" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_cvc_greatersix" style="padding: 2px;" class="majorGreaterSix majorTotalCVC"  readOnly="true" name="departproceedingsmajor_cvc_greatersix"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_cvc_sixtotwelve" style="padding: 2px;" class="majorSixtoTwelve majorTotalCVC"  readOnly="true" name="departproceedingsmajor_cvc_sixtotwelve" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_cvc_twelvetoeighteen" style="padding: 2px;" class="majorTwelvetoEighteen  majorTotalCVC"  readOnly="true" name="departproceedingsmajor_cvc_twelvetoeighteen"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_cvc_lesseighteen" style="padding: 2px;" class="majorLessEighteen  totalmajorTotalCVC"  readOnly="true" name="departproceedingsmajor_cvc_lesseighteen" onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>
				<td><b>Other (non-CVC cases)</b></td>
				<td><b><form:input path="departproceedingsmajor_other_lastqtr" style="padding: 2px;" class="majorBFQtr  majorPenaltyOther"  readOnly="true" name="departproceedingsmajor_other_lastqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_other_inquiries" style="padding: 2px;" class="majorInquiries  majorPenaltyOther"  readOnly="true" name="departproceedingsmajor_other_inquiries" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_other_total" style="padding: 2px;" class="totalmajorPenaltyOther  majorPenaltytotal subOtherEnquirie" readOnly="true"  name="departproceedingsmajor_other_total" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_other_reportsio" style="padding: 2px;" class="majorReportRec  subOtherEnquirie enqOther"  readOnly="true" name="departproceedingsmajor_other_reportsio" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_other_enquiries" style="padding: 2px;" class="totalsubOtherEnquirie enquiriPendingMajor"   name="departproceedingsmajor_other_enquiries" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_other_greatersix" style="padding: 2px;" class="majorGreaterSix majorTotalOther"  readOnly="true" name="departproceedingsmajor_other_greatersix"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_other_sixtotwelve" style="padding: 2px;" class="majorSixtoTwelve majorTotalOther"  readOnly="true" name="departproceedingsmajor_other_sixtotwelve"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_other_twelvetoeighteen" style="padding: 2px;" class="majorTwelvetoEighteen majorTotalOther"  readOnly="true" name="departproceedingsmajor_other_twelvetoeighteen"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_other_lesseighteen" style="padding: 2px;" class="majorLessEighteen totalmajorTotalOther"  readOnly="true" name="departproceedingsmajor_other_lesseighteen" onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>
				<td><b>Total</b></td>
				<td><b><form:input path="departproceedingsmajor_total_lastqtr" style="padding: 2px;" class="totalmajorBFQtr"  readOnly="true"   name="departproceedingsmajor_total_lastqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_total_inquiries" style="padding: 2px;" class="totalmajorInquiries" readOnly="true"   name="departproceedingsmajor_total_inquiries"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_total_total" style="padding: 2px;" class="totalmajorPenaltytotal"  readOnly="true"  name="departproceedingsmajor_total_total"  onkeypress="return isNumberKey(event);"/></b></td>
				<td><b><form:input path="departproceedingsmajor_total_reportsio" style="padding: 2px;" class="totalmajorReportRec"  readOnly="true"  name="departproceedingsmajor_total_reportsio"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_total_enquiries" style="padding: 2px;" class="totalenquiriPendingMajor"  readOnly="true"  name="departproceedingsmajor_total_enquiries"  onkeypress="return isNumberKey(event);"/></b></td>
				<td><b><form:input path="departproceedingsmajor_total_greatersix" style="padding: 2px;" class="totalmajorGreaterSix" readOnly="true"   name="departproceedingsmajor_total_greatersix"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_total_sixtotwelve" style="padding: 2px;" class="totalmajorSixtoTwelve"  readOnly="true"  name="departproceedingsmajor_total_sixtotwelve"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_total_twelvetoeighteen" style="padding: 2px;"  class="totalmajorTwelvetoEighteen" readOnly="true"   name="departproceedingsmajor_total_twelvetoeighteen"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedingsmajor_total_lesseighteen" style="padding: 2px;" class="totalmajorLessEighteen" readOnly="true"  name="departproceedingsmajor_total_lesseighteen"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
	</table>
	</div>
	<br>
<div class="center">
  <p>* Minor Penalty Proceeding pending with Inquiry Officers to be included also.</p>
<p>&nbsp; ** Pendency to be reckoned w.r.f. date of appointment of IO.</p>

</div>
<div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>4.(B) Minor Penalty Proceedings pending  with Disciplinary Authorities</b> </div>
<br>
   <table style="margin: auto; width:66%;" class="table">  
	<tr></tr>
			<tr>
			   <th rowspan=2 ><b>Category</b></th>
			   <th rowspan=2><b>B/F from last quarter </b></th>
			   <th rowspan=2><b>Minor penalty charge sheet by DAs during the qrtr </b></th>
			   <th rowspan=2><b>Total</b></th>
			   <th rowspan=2><b>Cases in which Final Orders issues by DAs</b></th>
			   <th rowspan=2 ><b>Balance pending</b></th>
			   <th colspan=4><b>Age wise Pendency(Months)** </b></th>	
		   </tr>
		   <tr>
		   		<th>
		   			<6 months
		   		</th>
		   		<th>
		   			6-12 months
		   		</th>
		   		<th>
		   			12-18 months
		   		</th>
				<th>
		   			>18 months
		   		</th>
		   </tr>
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
				<td>&nbsp;10</td>
			</tr>
		    <tr>
				<td> <b>Cases under CVC Jurisdiction</b> </td>
				<td><b><form:input path="departproceedings_minor_cvc_lastqtr" style="padding: 2px;" class="minorBFLastQtr minorBFQtrLast"  readOnly="true" name="departproceedings_minor_cvc_lastqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_cvc_inquiries" style="padding: 2px;" class="minorBFLastQtr  minorPenaltyDA"  readOnly="true" name="departproceedings_minor_cvc_inquiries" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_cvc_total" style="padding: 2px;" class="totalminorBFLastQtr minorTotalPenalty subCvcminorBPending"   name="departproceedings_minor_cvc_total" readOnly="true"  onkeypress="return isNumberKey(event);"/></b></td>
				<td><b><form:input path="departproceedings_minor_cvc_reportsio" style="padding: 2px;" class="minorCaseDa subCvcminorBPending minorQTR"  readOnly="true" name="departproceedings_minor_cvc_reportsio"  onkeypress="return isNumberKey(event);"/></b></td>
				<td><b><form:input path="departproceedings_minor_cvc_enquiries" style="padding: 2px;" class="totalsubCvcminorBPending minorBalancePen"   name="departproceedings_minor_cvc_enquiries" readOnly="true"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_cvc_greatersix" style="padding: 2px;" class="minorGreaterSix minorPenaltyCVC"  readOnly="true" name="departproceedings_minor_cvc_greatersix"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_cvc_sixtotwelve" style="padding: 2px;" class="minorSixtoTwelve minorPenaltyCVC"  readOnly="true" name="departproceedings_minor_cvc_sixtotwelve"   onkeypress="return isNumberKey(event);"/></b></td>
				<td><b><form:input path="departproceedings_minor_cvc_twelvetoeighteen" style="padding: 2px;" class="minorTwelvetoEighteen minorPenaltyCVC"  readOnly="true" name="departproceedings_minor_cvc_twelvetoeighteen"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_cvc_lesseighteen" style="padding: 2px;" class="minorLessEighteen totalminorPenaltyCVC"  readOnly="true" name="departproceedings_minor_cvc_lesseighteen"  onkeypress="return isNumberKey(event);" /></b></td>
			 </tr>
			 <tr>
				<td><b>Other (non-CVC cases)</b></td>
				<td><b><form:input path="departproceedings_minor_other_lastqtr" style="padding: 2px;" class="minorMinorPenalty  minorBFQtrLast"  readOnly="true" name="departproceedings_minor_other_lastqtr" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_other_inquiries" style="padding: 2px;" class="minorMinorPenalty  minorPenaltyDA"  readOnly="true" name="departproceedings_minor_other_inquiries"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_other_total" style="padding: 2px;" class="totalminorMinorPenalty  minorTotalPenalty subOtherminorBPending"   name="departproceedings_minor_other_total" readOnly="true"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_other_reportsio" style="padding: 2px;" class="minorCaseDa subOtherminorBPending minorQTRDa"  readOnly="true" name="departproceedings_minor_other_reportsio" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_other_enquiries" style="padding: 2px;" class="totalsubOtherminorBPending minorBalancePen"   name="departproceedings_minor_other_enquiries" readOnly="true"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_other_greatersix" style="padding: 2px;" class="minorGreaterSix  minorPenaltyOther"  readOnly="true" name="departproceedings_minor_other_greatersix"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_other_sixtotwelve" style="padding: 2px;" class="minorSixtoTwelve minorPenaltyOther"  readOnly="true" name="departproceedings_minor_other_sixtotwelve"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_other_twelvetoeighteen" style="padding: 2px;" class="minorTwelvetoEighteen  minorPenaltyOther"  readOnly="true" name="departproceedings_minor_other_twelvetoeighteen"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_other_lesseighteen" style="padding: 2px;" class="minorLessEighteen  totalminorPenaltyOther"  readOnly="true" name="departproceedings_minor_other_lesseighteen"   onkeypress="return isNumberKey(event);"/></b></td>
			 </tr>
			 <tr>
				<td><b>Total</b></td>
				<td><b><form:input path="departproceedings_minor_total_lastqtr" style="padding: 2px;" class="totalminorBFQtrLast"   name="departproceedings_minor_total_lastqtr"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_total_inquiries" style="padding: 2px;" class="totalminorPenaltyDA"   name="departproceedings_minor_total_inquiries"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_total" style="padding: 2px;" class="totalminorTotalPenalty"   name="departproceedings_minor_total"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_total_reportsio" style="padding: 2px;" class="totalminorCaseDa"   name="departproceedings_minor_total_reportsio"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_total_enquiries" style="padding: 2px;" class="totalminorBalancePen"   name="departproceedings_minor_total_enquiries"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_total_greatersix" style="padding: 2px;" class="totalminorGreaterSix"   name="departproceedings_minor_total_greatersix"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_total_sixtotwelve" style="padding: 2px;" class="totalminorSixtoTwelve"   name="departproceedings_minor_total_sixtotwelve"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_total_twelvetoeighteen" style="padding: 2px;" class="totalminorTwelvetoEighteen"   name="departproceedings_minor_total_twelvetoeighteen"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="departproceedings_minor_total_lesseighteen" style="padding: 2px;" class="totalminorLessEighteen"  name="departproceedings_minor_total_lesseighteen"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
			  </tr>
		</table>
			<br>
<div>
<div class="center">
  <p>&nbsp; ** Pendency to be reckoned w.r.f. date of issue of chargesheet</p>

</div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>4(C) Details of inquiry against charged officers due for superannuation in next one year</b> </div>
<br>

<center>
    <table  width="66%">
              <tr style="margin-top:10px;">
						<td width="15%"  align="left" valign="middle">
							 Details of inquiry against charged officers:
	                    </td>
						<td width="35%" align="left" >
							<span><form:input path=""  readOnly="true" name="totalOfficer" maxlength="3" id="name_of_officer" style="float:left;width:25%" onkeypress="return isNumberKey(event);" />
							
						</td>
						</tr>
						 <tr>
						<td colspan="4">						
						   <table id="officerNumber" width="100%"  border="1" align="center" cellpadding="10" cellspacing="1" class="tblContainer">                     
								 <thead>
									<th style="width:1%"><b>S.No.</b></th>
									 <th style="width:21%"><b>Name & designation of charged officer</b></th>
									 <th style="width:19%"><b>Date of Charge-sheet</b></th>
									 <th style="width:19%"><b>Date of IO/PO appointment</b></th>
									 <th style="width:19%"><b>Date of superannuation</b></th>
									 <th style="width:19%"><b>Remarks</b></th>
									 <th style="width:1%">Delete</th>
								   
								</thead>
								<tbody>
									<tr>
									</tr>
							   </tbody>
							</table>
						</td>
					</tr>
						</table>	
</center>







    
			<br><br>
			
		
<br><br><br>
			
</div>
</form:form>
<br></br><br>
<form:form name="myform"  commandName="adviceofCvcForm" >
<div class="table-responsive">
<h3 align="center" style="font-size:25px; " ><b>QUARTERLY PROGRESS REPORT</b></h3>
<h3 align="center" style="font-size:24px; " ><b>ADVICE OF CVC</b></h3>
<!-- <div style="width:100%;border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>5. Advice of CVC </b> </div> -->

<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>5. Advice of CVC & Action Taken Thereon(Nos)</b> </div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>5.(A)Advice CVC(Nos)</b> </div>
<br>

  <table style="margin: auto; width:66%;" class="table">  
	<tr></tr>
			<tr>
			   <th rowspan=2 ><b>Stage of Advice</b></th>
			   <th rowspan=2><b>Cases referred to CVC & advice awaited (B/F from previous quarter) </b></th>
			   <th rowspan=2><b>Cases referred to CVC during the quarter</b></th>
			   <th rowspan=2><b>Advice received during the Quarter</b></th>
			   <th rowspan=2><b>Advice awaited from CVC</b></th>
			</tr>
		    <tr></tr>
		    <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
			</tr>
		    <tr>
				<td> <b>1st</b> </td>
				<td><b><form:input path="advice_cvc_first_casespreviousqtr" style="padding: 2px;" class="adviceCaseCVC stage1"  readOnly="true" name="advice_cvc_first_casespreviousqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="advice_cvc_first_casesduringqtr" style="padding: 2px;" class="adviceCaseQTR stage1"  readOnly="true" name="advice_cvc_first_casesduringqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="advice_cvc_first_adviceduringqtr" style="padding: 2px;" class="adviceDuringQtrReceiv stage1 adviceTotal"  readOnly="true" name="advice_cvc_first_adviceduringqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="advice_cvc_first_adviceawaitedcvc" style="padding: 2px;" class="adviceAwaitedFromCVC"   name="advice_cvc_first_adviceawaitedcvc"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>
				<td><b>2nd</b></td>
				<td><b><form:input path="advice_cvc_second_casespreviousqtr" style="padding: 2px;" class="adviceCaseCVC stage2"   readOnly="true" name="advice_cvc_second_casespreviousqtr" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="advice_cvc_second_casesduringqtr" style="padding: 2px;" class="adviceCaseQTR stage2"   readOnly="true" name="advice_cvc_second_casesduringqtr" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="advice_cvc_second_adviceduringqtr" style="padding: 2px;" class="adviceDuringQtrReceiv stage2 adviceTotal"   readOnly="true" name="advice_cvc_second_adviceduringqtr" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="advice_cvc_second_adviceawaitedcvc" style="padding: 2px;" class="adviceAwaitedFromCVC"    name="advice_cvc_second_adviceawaitedcvc" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
			<tr>
				<td><b>1st stage reconsideration</b></td>
				<td><b><form:input path="advice_cvc_firstreconsider_casespreviousqtr" style="padding: 2px;" class="adviceCaseCVC stage3"   readOnly="true" name="advice_cvc_firstreconsider_casespreviousqtr" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="advice_cvc_firstreconsider_casesduringqtr" style="padding: 2px;" class="adviceCaseQTR stage3"   readOnly="true" name="advice_cvc_firstreconsider_casesduringqtr"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input path="advice_cvc_firstreconsider_adviceduringqtr" style="padding: 2px;" class="adviceDuringQtrReceiv stage3 adviceTotal"  readOnly="true" name="advice_cvc_firstreconsider_adviceduringqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input path="advice_cvc_firstreconsider_adviceawaitedcvc" style="padding: 2px;" class="adviceAwaitedFromCVC"   name="advice_cvc_firstreconsider_adviceawaitedcvc" readOnly="true" onkeypress="return isNumberKey(event);"  /></b></td>
			</tr>
			<tr>
				<td><b>2nd stage reconsideration</b></td>
				<td><b><form:input path="advice_cvc_secondreconsider_casespreviousqtr" style="padding: 2px;" class="adviceCaseCVC stage4"  readOnly="true" name="advice_cvc_secondreconsider_casespreviousqtr" onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input path="advice_cvc_secondreconsider_casesduringqtr" style="padding: 2px;" class="adviceCaseQTR stage4"  readOnly="true" name="advice_cvc_secondreconsider_casesduringqtr"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input path="advice_cvc_secondreconsider_adviceduringqtr" style="padding: 2px;" class="adviceDuringQtrReceiv stage4 adviceTotal"  readOnly="true" name="advice_cvc_secondreconsider_adviceduringqtr"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input path="advice_cvc_secondreconsider_adviceawaitedcvc" style="padding: 2px;" class="adviceAwaitedFromCVC"   name="advice_cvc_secondreconsider_adviceawaitedcvc" readOnly="true" onkeypress="return isNumberKey(event);"  /></b></td>
			</tr>
			<tr>
				<td><b>Total</b></td>
				<td><b><form:input path="advice_cvc_total_casespreviousqtr" style="padding: 2px;" class="totaladviceCaseCVC"  name="advice_cvc_total_casespreviousqtr" readOnly="true"  onkeypress="return isNumberKey(event);"  /></b></td>
				<td><b><form:input path="advice_cvc_total_casesduringqtr" style="padding: 2px;" class="totaladviceCaseQTR"   name="advice_cvc_total_casesduringqtr"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="advice_cvc_total_adviceduringqtr" style="padding: 2px;" class="totaladviceDuringQtrReceiv"   name="advice_cvc_total_adviceduringqtr"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="advice_cvc_total_adviceawaitedcvc" style="padding: 2px;" class="totaladviceAwaitedFromCVC"   name="advice_cvc_total_adviceawaitedcvc" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
		</table>
	</div>
<div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>5.(B) Action on CVC Advice(Nos)</b> </div>
<br>
   <table style="margin: auto; width:66%;" class="table">  
	<tr></tr>
			<tr>
			   <th rowspan=2 ><b>Stage of Advice</b></th>
			   <th rowspan=2><b>Type of Proceeding </b></th>
			   <th rowspan=2><b>Opening Balance </b></th>
			   <th rowspan=2><b>Advices received during the Quarter</b></th>
			   <th rowspan=2><b>Disposed</b></th>
			   <th rowspan=2 ><b>Balance Pending</b></th>
			   <th colspan=4><b>Age wise Pendency(Months) </b></th>	
			</tr>
		    <tr>
		   		<th>
		   			<1
		   		</th>
		   		<th>
		   			1-3
		   		</th>
		   		<th>
		   			3-6
		   		</th>
				<th>
		   			>6
		   		</th>
			</tr>
		    <tr>
			   <td>&nbsp;1</td>
			   <td>&nbsp;2</td>
			   <td>&nbsp;3</td>
			   <td>&nbsp;4</td>
			   <td>&nbsp;5</td>
			   <td>&nbsp;6</td>
			   <td>&nbsp;7</td>
			   <td>&nbsp;8</td>
			   <td>&nbsp;9</td>
			   <td>&nbsp;10</td>
			</tr>
		    <tr>
			   <td rowspan=2> <b>1st</b> </td>
			   <td  ><b>Major</b></td>
			   <td><b><form:input path="action_cvc_firstmajor_openingbalance" style="padding: 2px;" class="adviceOpening stageB1"  readOnly="true" name="action_cvc_firstmajor_openingbalance" onkeypress="return isNumberKey(event);" /></b></td>
			   <td><b><form:input path="action_cvc_firstmajor_adviceduringqtr" style="padding: 2px;" class="adviceQtrReceive stageB1 adviceQtrReceiveFirst"  readOnly="true" name="action_cvc_firstmajor_adviceduringqtr"  onkeypress="return isNumberKey(event);" /></b></td>
			   <td><b><form:input path="action_cvc_firstmajor_disposed" style="padding: 2px;" class="adviceDisposed stageB1 adviceBPTotal"  readOnly="true" name="action_cvc_firstmajor_disposed"  onkeypress="return isNumberKey(event);" /></b></td>
			   <td><b><form:input path="action_cvc_firstmajor_balancepending" style="padding: 2px;" class="advicePendingBalance advicelessOneOne"   readOnly="true" name="action_cvc_firstmajor_balancepending"  onkeypress="return isNumberKey(event);" /></b></td>
			   <td><b><form:input path="action_cvc_firstmajor_greaterone" style="padding: 2px;" class="adviceGreaterOne advicelessOne"  readOnly="true" name="action_cvc_firstmajor_greaterone"  onkeypress="return isNumberKey(event);" /></b></td>
			   <td><b><form:input path="action_cvc_firstmajor_onetothree" style="padding: 2px;" class="adviceOnetoThree advicelessOne"  readOnly="true" name="action_cvc_firstmajor_onetothree"  onkeypress="return isNumberKey(event);" /></b></td>
			   <td><b><form:input path="action_cvc_firstmajor_threetosix" style="padding: 2px;" class="adviceThreeSix advicelessOne"  readOnly="true" name="action_cvc_firstmajor_threetosix"  onkeypress="return isNumberKey(event);" /></b></td>
			   <td><b><form:input path="action_cvc_firstmajor_lesssix" style="padding: 2px;" class="adviceLessSix advicelessOneFinal"  readOnly="true" name="action_cvc_firstmajor_lesssix"  onkeypress="return isNumberKey(event);" /></b></td>
			 </tr>
			 <tr>
			    <td><b>Minor</b></td>
				<td><b><form:input path="action_cvc_firstminor_openingbalance" style="padding: 2px;" class="adviceOpening stageB2"  readOnly="true" name="action_cvc_firstminor_openingbalance"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="action_cvc_firstminor_adviceduringqtr" style="padding: 2px;" class="adviceQtrReceive stageB2 adviceQtrReceiveFirstFinal"  readOnly="true" name="action_cvc_firstminor_adviceduringqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="action_cvc_firstminor_disposed" style="padding: 2px;" class="adviceDisposed stageB2 adviceBPTotal"  readOnly="true" name="action_cvc_firstminor_disposed"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="action_cvc_firstminor_balancepending" style="padding: 2px;" class="advicePendingBalance advicelessTwoTwo"  readOnly="true" name="action_cvc_firstminor_balancepending"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="action_cvc_firstminor_greaterone" style="padding: 2px;" class="adviceGreaterOne advicelessTwo"  readOnly="true" name="action_cvc_firstminor_greaterone"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="action_cvc_firstminor_onetothree" style="padding: 2px;" class="adviceOnetoThree advicelessTwo"  readOnly="true" name="action_cvc_firstminor_onetothree"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="action_cvc_firstminor_threetosix" style="padding: 2px;" class="adviceThreeSix advicelessTwo"  readOnly="true" name="action_cvc_firstminor_threetosix"  onkeypress="return isNumberKey(event);" /></b></td>
				<td><b><form:input path="action_cvc_firstminor_lesssix" style="padding: 2px;" class="adviceLessSix advicelessTwoFinal"  readOnly="true" name="action_cvc_firstminor_lesssix"  onkeypress="return isNumberKey(event);" /></b></td></tr>
			  <tr>
				 <td rowspan=2><b>2nd</b></td>
				 <td><b>Major</b></td>
				 <td><b><form:input path="action_cvc_secondmajor_openingbalance" style="padding: 2px;" class="adviceOpening stageB3"  readOnly="true" name="action_cvc_secondmajor_openingbalance"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondmajor_adviceduringqtr" style="padding: 2px;" class="adviceQtrReceive stageB3 adviceQtrReceiveSecond"  readOnly="true" name="action_cvc_secondmajor_adviceduringqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondmajor_disposed" style="padding: 2px;" class="adviceDisposed stageB3 adviceBPTotal"  readOnly="true" name="action_cvc_secondmajor_disposed"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondmajor_balancepending" style="padding: 2px;" class="advicePendingBalance adviceCVCtoSixBP"   readOnly="true" name="action_cvc_secondmajor_balancepending"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondmajor_greaterone" style="padding: 2px;" class="adviceGreaterOne adviceCVCtoSix"  readOnly="true" name="action_cvc_secondmajor_greaterone"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondmajor_onetothree" style="padding: 2px;" class="adviceOnetoThree adviceCVCtoSix"  readOnly="true" name="action_cvc_secondmajor_onetothree"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondmajor_threetosix" style="padding: 2px;" class="adviceThreeSix adviceCVCtoSix"  readOnly="true" name="action_cvc_secondmajor_threetosix"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondmajor_lesssix" style="padding: 2px;" class="adviceLessSix adviceCVCtoSixFinal"  readOnly="true" name="action_cvc_secondmajor_lesssix"  onkeypress="return isNumberKey(event);" /></b></td>
			   </tr>
			   <tr>
				 <td><b>Minor</b></td>
				 <td><b><form:input path="action_cvc_secondminor_openingbalance" style="padding: 2px;" class="adviceOpening stageB4"  readOnly="true" name="action_cvc_secondminor_openingbalance"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondminor_adviceduringqtr" style="padding: 2px;" class="adviceQtrReceive stageB4 adviceQtrReceiveSecondFinal"  readOnly="true" name="action_cvc_secondminor_adviceduringqtr"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondminor_disposed" style="padding: 2px;" class="adviceDisposed stageB4 adviceBPTotal"  readOnly="true" name="action_cvc_secondminor_disposed"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondminor_balancepending" style="padding: 2px;" class="advicePendingBalance advicelessSixBP"   readOnly="true" name="action_cvc_secondminor_balancepending"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondminor_greaterone" style="padding: 2px;" class="adviceGreaterOne advicelessSix"  readOnly="true" name="action_cvc_secondminor_greaterone" onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondminor_onetothree" style="padding: 2px;" class="adviceOnetoThree advicelessSix"  readOnly="true" name="action_cvc_secondminor_onetothree" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input path="action_cvc_secondminor_threetosix" style="padding: 2px;" class="adviceThreeSix advicelessSix"  readOnly="true" name="action_cvc_secondminor_threetosix"  onkeypress="return isNumberKey(event);" /></b></td>
				 <td><b><form:input path="action_cvc_secondminor_lesssix" style="padding: 2px;" class="adviceLessSix advicelessSixFinal"  readOnly="true" name="action_cvc_secondminor_lesssix"  onkeypress="return isNumberKey(event);"  /></b></td>
				</tr>
				<tr>
				 <td><b>Total</b></td>
				 <td>&nbsp;</td>
				 <td><b><form:input path="action_cvc_total_openingbalance" style="padding: 2px;" class="totaladviceOpening"   name="action_cvc_total_openingbalance" readOnly="true" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input path="action_cvc_total_adviceduringqtr" style="padding: 2px;" class="totaladviceQtrReceive"   name="action_cvc_total_adviceduringqtr" readOnly="true" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input path="action_cvc_total_disposed" style="padding: 2px;" class="totaladviceDisposed"   name="action_cvc_total_disposed" readOnly="true" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input path="action_cvc_total_balancepending" style="padding: 2px;" class="totaladvicePendingBalance"   name="action_cvc_total_balancepending" readOnly="true" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input path="action_cvc_total_greaterone" style="padding: 2px;" class="totaladviceGreaterOne"   name="action_cvc_total_greaterone" readOnly="true" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input path="action_cvc_total_onetothree" style="padding: 2px;" class="totaladviceOnetoThree"   name="action_cvc_total_onetothree" readOnly="true" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input path="action_cvc_total_threetosix" style="padding: 2px;" class="totaladviceThreeSix"   name="action_cvc_total_threetosix" readOnly="true" onkeypress="return isNumberKey(event);"  /></b></td>
				 <td><b><form:input path="action_cvc_total_lesssix" style="padding: 2px;" class="totaladviceLessSix"   name="action_cvc_total_lesssix" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
				 </tr>
	</table>
			<br>
	<div>
<div class="center">
  <p>Explanation: *Disposal criteria:1<sup>st</sup> stage- Major is on appointment of IO/PO. 1st stage- Minor is on issue of final orders.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<strong><sup>nd</sup></strong> stage &ndash; Major &amp; Minor &ndash; issue of final orders by DA</p>

</div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>5.(C) Non-Acceptance/deviation of CVC Advice</b> </div>
<br>
<center>
    <table  width="66%">
              <tr style="margin-top:10px;">
						<td width="35%"  align="left" valign="middle">
							 First Stage:
	                    </td>
						<td width="15%" align="left" >
							<span><form:input path=""  readOnly="true" name="totalOfficer" maxlength="3" id="name_of_officer" style="float:left;width:25%" onkeypress="return isNumberKey(event);" />
							
						</td>
						<td width="35%"  align="left" valign="middle">
							Second Stage:
	                    </td>
						<td width="15%" align="left" >
							<span><form:input path=""  readOnly="true" name="nameSecondofficer" maxlength="3" id="nameSecondofficer" style="float:left;width:25%" onkeypress="return isNumberKey(event);" />
						
						</td>
						</tr>
						 <tr>
						<td colspan="4">						
						   <table id="officerNumber" width="100%"  border="1" align="center" cellpadding="10" cellspacing="1" class="tblContainer secondOfficer">                     
								 <thead>
									<th style="width:1%"><b>S.No.</b></th>
									 <th style="width:14%"><b>Type</b></th>
									 <th style="width:14%"><b>Nature of CVC Advice</b></th>
									 <th style="width:14%"><b>CVC File No.</b></th>
									 <th style="width:14%"><b>Dept. Ref. No.</b></th>
									 <th style="width:14%"><b>Name of Officer and Designaion</b></th>
									 <th style="width:14%"><b>Name & Designation of DA</b></th>
									 <th style="width:14%"><b>Action taken by DA</b></th>
									 <th style="width:1%">Delete</th>
								 </thead>
				                 <tbody>
								    <tr>
									</tr>
							    </tbody>
							</table>
						</td>
					</tr>
						</table>	
</center>
			<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>5.(D) Appellate authority Deviations(Deviation / Non-acceptance)</b> </div>
<br>
<center>
    <table  width="66%">
              <tr style="margin-top:10px;">
						<td width="35%"  align="left" valign="middle">
							 First Stage:
	                    </td>
						<td width="15%" align="left" >
							<span><form:input path=""  readOnly="true" name="totalOfficerMajor" maxlength="3" id="authorityMajor" style="float:left;width:25%" onkeypress="return isNumberKey(event);" />
							
						</td>
						<td width="35%"  align="left" valign="middle">
							Second Stage:
	                    </td>
						<td width="15%" align="left" >
							<span><form:input path=""  readOnly="true" name="nameSecondofficer" maxlength="3" id="minorSecondofficer" style="float:left;width:25%" onkeypress="return isNumberKey(event);" />
						
						</td>
						</tr>
						 <tr>
						<td colspan="4">						
						   <table id="officerauthority" width="100%"  border="1" align="center" cellpadding="10" cellspacing="1" class="tblContainer secondOfficerMinor">                     
								 <thead>
									<th style="width:1%"><b>S.No.</b></th>
									 <th style="width:14%"><b>Type</b></th>
									 <th style="width:14%"><b>Nature of CVC Advice</b></th>
									 <th style="width:14%"><b>CVC File No.</b></th>
									 <th style="width:14%"><b>Dept. Ref. No.</b></th>
									 <th style="width:14%"><b>Name of Officer and Designaion</b></th>
									 <th style="width:14%"><b>Action taken by DA and Name & Designation of DA</b></th>
									 <th style="width:14%"><b>Action taken by AA</b></th>
									 <th style="width:1%">Delete</th>
								   
								</thead>
								<tbody>
									<tr>
									</tr>
							   </tbody>
							</table>
						</td>
					</tr>
						</table>	
</center>
  
	<br>
<div class="center">
 <p><strong>*for 5 (C) &amp; 5 (D) - Type /Nature of CVC Advice &ndash; ( in drop down menu)</strong></p>
<p><strong>&nbsp;Sanction for Prosecution/ Denial of Prosecution/ First stage &ndash;Major pp/ Minor pp/Admn Action </strong></p>
<p><strong>Second Stage &ndash; Imposition of Major penalty/Minor penalty/ Exoneration</strong></p>

</div><br>

</div>
			
			<br><br>

</div>
</form:form>	
<br><br><br><br>
			<br><br>
			<form:form name="myform"  commandName="StatusPendencyCaseProForm" >	
<div class="table-responsive">
<h3 align="center" style="font-size:25px; " ><b>QUARTERLY PROGRESS REPORT</b></h3>
<h3 align="center" style="font-size:24px; " ><b>STATUS OF PENDENCY OF 'FI' AND 'CA' CASES</b></h3>
  <!-- <div style="width:100%;border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
    <center><b>6. Status of Pendency of 'FI' and 'CA' cases </b></center> 
  </div> -->
<div class="center">
 <p>(FI cases refer to those where Commission has asked for further information/clarification and the departmental reply is awaited. CA cases refer to those where the CBI has submitted the SP&rsquo;s report and the comments of Department/Organisation are yet to be received by the Commission. CVOs can access these lists online after login into CVC website under the tab &lsquo; CVO&rsquo;s corner&rsquo; or obtain the same from the Commission)</p>
</div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>6.(A) FI Cases (further information/Clarification to be furnished to the Commission) (Nos.)</b> </div>
<br>

 <table style="margin: auto; width:66%;" class="table">  
	<tr></tr>
	<tr>
		<th rowspan=2 ><b>B/F from previous quarter</b></th>
		<th rowspan=2><b>Added during the quarter </b></th>
		<th rowspan=2><b>Total</b></th>
		<th rowspan=2><b>Reply furnished to the Commission during the quarter</b></th>
		<th rowspan=2><b>Reply pending</th>
		<th colspan=4><b>Age wise Pendency of reply(Months) </b></th>
	</tr>
	<tr>
		<th>
		   	<3
		</th>
		<th>
		   	3-6
		</th>
		<th>
		   	6-12
		</th>
		<th>
		   	>1yr
		</th>
	</tr>
	<tr>
		<td>&nbsp;1</td>
		<td>&nbsp;2</td>
		<td>&nbsp;3</td>
		<td>&nbsp;4</td>
		<td>&nbsp;5</td>
		<td>&nbsp;6</td>
		<td>&nbsp;7</td>
		<td>&nbsp;8</td>
		<td>&nbsp;9</td>
	</tr>
	<tr>
		<td><b><form:input path="pendency_status_fi_previousqtr" style="padding: 2px;" class="fiCaseStatus"  readOnly="true" name="pendency_status_fi_previousqtr" onkeypress="return isNumberKey(event);" /></b></td>
		<td><b><form:input path="pendency_status_fi_addduringqtr" style="padding: 2px;" class="fiCaseStatus"  readOnly="true" name="pendency_status_fi_addduringqtr" onkeypress="return isNumberKey(event);" /></b></td>
		<td><b><form:input path="pendency_status_fi_total" style="padding: 2px;" class="totalfiCaseStatus subfiCaseStatus"   name="pendency_status_fi_total" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
		<td><b><form:input path="pendency_status_fi_reply_commission" style="padding: 2px;" class="comDisfi subfiCaseStatus disQTRfi"  readOnly="true" name="pendency_status_fi_reply_commission" onkeypress="return isNumberKey(event);" /></b></td>
		<td><b><form:input path="pendency_status_fi_reply_pending" style="padding: 2px;" class="totalsubfiCaseStatus totalcomDisfi"   name="pendency_status_fi_reply_pending" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
		<td><b><form:input path="pendency_status_fi_greaterthree" style="padding: 2px;" class="pendFi"  readOnly="true" name="pendency_status_fi_greaterthree" onkeypress="return isNumberKey(event);" /></b></td>
		<td><b><form:input path="pendency_status_fi_threetosix" style="padding: 2px;" class="pendFi"  readOnly="true" name="pendency_status_fi_threetosix" onkeypress="return isNumberKey(event);" /></b></td>
		<td><b><form:input path="pendency_status_fi_sixtotwelve" style="padding: 2px;" class="pendFi"  readOnly="true" name="pendency_status_fi_sixtotwelve" onkeypress="return isNumberKey(event);" /></b></td>
		<td><b><form:input path="pendency_status_fi_lessone" style="padding: 2px;" class="pendFinal"  readOnly="true" name="pendency_status_fi_lessone" onkeypress="return isNumberKey(event);" /></b></td>
	</tr>
 </table>
</div>
<div>
<br>
  <center>
     <table>
        <tr>
           <td>Upload updated list in the format given below</td>
		   <td><form:input path="pendency_status_fi_upload" type="file" name="pendency_status_fi_upload" id="fileToUpload"/>
               
           </td>
		</tr>
	</table>
 </center> 
</div>
 <br><br>
    <table style="margin: auto; width:66%;" class="table">  
	   <tr></tr>
	   <tr>
		  <th rowspan=2 ><b>S. No.</b></th>
		  <th rowspan=2><b>CVC case registration No. [CVO,CBI,OTH,CDI,REC,MIS number as given in the FL list]</b></th>
		  <th rowspan=2><b>CVC File No.</b></th>
		  <th rowspan=2><b>Date since pending</b></th>
		  <th rowspan=2><b>Name & Designation of officers</b></th>
		  <th rowspan=2 ><b>Departmental ref. No.</b></th>
		  <th rowspan=2><b>Present Status</b></th>
		  <th rowspan=2><b>Likely date for submission of response</b></th>
		  <th rowspan=2 ><b>Remarks.</b></th>
	  </tr>
	  <tr></tr>
	  <tr>
	     <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
	  </tr>
	  <tr>
		  <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
	  </tr>
    </table>
	<br>
	<div>
     <br>
       <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
	     <b>6.(B) Comments Awaited (CA) Cases (CBI reports awaiting comments of Department/ Organization)[Nos.]</b> 
	   </div>
	   <br>
	</div>
       <table style="margin: auto; width:66%;" class="table">  
	       <tr>
			  <th rowspan=2><b>B/F from previous quarter</b></th>
			  <th rowspan=2><b>Added during the quarter</b></th>
			  <th rowspan=2><b>Total</b></th>
			  <th rowspan=2 ><b>Comments furnished to the Commission during the quarter</b></th>
			  <th rowspan=2><b>Comments Pending</b></th>	
			  <th colspan=4><b>Age wise Pendency of comments(Months) </b></th>	
		   </tr>
		   <tr>
		   	   <th>
		   		   <1 
		   	   </th>
		   	   <th>
		   		  1-2
		   	   </th>
		   	   <th>
		   		  2-3
		   	   </th>
			   <th>
		   		  >3
		   	   </th>
		   </tr>
		   <tr>
				<td>&nbsp;1</td>
				<td>&nbsp;2</td>
				<td>&nbsp;3</td>
				<td>&nbsp;4</td>
				<td>&nbsp;5</td>
				<td>&nbsp;6</td>
				<td>&nbsp;7</td>
				<td>&nbsp;8</td>
				<td>&nbsp;9</td>
			</tr>
		    <tr>
			  <td><b><form:input path="pendency_status_ca_previousqtr" style="padding: 2px;" class="caCaseStatus"  readOnly="true" name="pendency_status_ca_previousqtr" onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input path="pendency_status_ca_addduringqtr" style="padding: 2px;" class="caCaseStatus"  readOnly="true" name="pendency_status_ca_addduringqtr" onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input path="pendency_status_ca_total" style="padding: 2px;" class="totalcaCaseStatus subcaCaseStatus"   name="pendency_status_ca_total"  readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input path="pendency_status_ca_comments_commission" style="padding: 2px;" class="comDisca subcaCaseStatus disQTRfca"  readOnly="true" name="pendency_status_ca_comments_commission" onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input path="pendency_status_ca_comments_pending" style="padding: 2px;" class="totalsubcaCaseStatus totalcomDisca"   name="pendency_status_ca_comments_pending" readOnly="true" onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input path="pendency_status_ca_greaterone" style="padding: 2px;" class="pendCA"  readOnly="true" name="pendency_status_ca_greaterone" onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input path="pendency_status_ca_onetotwo" style="padding: 2px;" class="pendCA"  readOnly="true" name="pendency_status_ca_onetotwo" onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input path="pendency_status_ca_twotothree" style="padding: 2px;" class="pendCA"  readOnly="true" name="pendency_status_ca_twotothree"  onkeypress="return isNumberKey(event);" /></b></td>
			  <td><b><form:input path="pendency_status_ca_lessthree" style="padding: 2px;" class="pendCAFinal"  readOnly="true" name="pendency_status_ca_lessthree"  onkeypress="return isNumberKey(event);" /></b></td>
			</tr>
		</table>
		<br>
    <div>
      <br>
       <center>
        <table>
          <tr>
             <td>Upload updated list in the format given below</td>
			 <td><form:input path="pendency_status_ca_upload" type="file" name="pendency_status_ca_upload" id="fileToUpload"/>
                
             </td>
		  </tr>
		</table>
	   </center>
	</div>
<br><br>
   <table style="margin: auto; width:66%;" class="table">  
	  <tr></tr>
	  <tr>
		<th rowspan=2 ><b>S. No.</b></th>
		<th rowspan=2><b>CVC case registration No. [CBI number as given in the CA list]</b></th>
	    <th rowspan=2><b>CVC File No.</b></th>
		<th rowspan=2><b>RC No.</b></th>
		<th rowspan=2 ><b>Date of receipt of SP's Report in Department /Organisation</b></th>
		<th rowspan=2><b>Name & Designation of officers</b></th>
	    <th rowspan=2 ><b>Departmental Ref. No.</b></th>
		<th rowspan=2><b>Present Status</b></th>
		<th rowspan=2><b>Likely date for submission of comments</b></th>
	  </tr>
	  <tr></tr>
	  <tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
	    <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
		 <td>&nbsp;</td>
	  </tr>
 </table>
			<br><br><br>
</form:form>	
	<br><br><br>
	<form:form name="myform" id="myform"  commandName="punitiveVigilanceForm" >	
<div class="table-responsive">
<h3 align="center" style="font-size:25px; " ><b>QUARTERLY PROGRESS REPORT</b></h3>
<h3 align="center" style="font-size:24px; " ><b>PUNITIVE VIGILANCE</b></h3>
<!-- <div style="width:100%;border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>7. Punitive vigilance </b> </div> -->

<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>7 Age-Wise Data of Disposed Departmental Proceedings During the Quarter(Nos)</b> </div>
<br>



  <table style="margin: auto; width:66%;" class="table">  
	 <tr></tr>
	 <tr>
		<th rowspan=2 ><b>Nature of Proceedings</b></th>
		<th rowspan=2><b>3-6 Months</b></th>
		<th rowspan=2><b>6months-1 yrar</b></th>
		<th rowspan=2><b>1-2 year</b></th>
		<th rowspan=2><b>Over 2years</b></th>
		<th rowspan=2 ><b>Over 3 years</b></th>
	 </tr>
	 <tr></tr>
	 <tr>
		<td>&nbsp;1</td>
		<td>&nbsp;2</td>
		<td>&nbsp;3</td>
		<td>&nbsp;4</td>
		<td>&nbsp;5</td>
		<td>&nbsp;6</td>
	 </tr>
	 <tr>
		<td><b>Major</td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_major_threetosix_months" style="padding: 2px;" class="majorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_major_threetosix_months" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_major_sixtotwelve_months" style="padding: 2px;" class="majorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_major_sixtotwelve_months" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_major_onetotwo_year" style="padding: 2px;" class="majorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_major_onetotwo_year" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_major_overtwo_year" style="padding: 2px;" class="majorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_major_overtwo_year" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_major_overthree_year" style="padding: 2px;" class="majorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_major_overthree_year" onkeypress="return isNumberKey(event);"/></b></td>
	 </tr>
	 <tr>
		<td><b>Minor</td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_minor_threetosix_months" style="padding: 2px;" class="minorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_minor_threetosix_months" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_minor_sixtotwelve_months" style="padding: 2px;" class="minorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_minor_sixtotwelve_months" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_minor_onetotwo_year" style="padding: 2px;" class="minorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_minor_onetotwo_year" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_minor_overtwo_year" style="padding: 2px;" class="minorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_minor_overtwo_year" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_finaldisposal_minor_overthree_year" style="padding: 2px;" class="minorTotal"  readOnly="true" name="punitive_vigilance_finaldisposal_minor_overthree_year" onkeypress="return isNumberKey(event);"/></b></td>
	 </tr>
  </table>
	</div>
	<br>
<div class="center">
<p>Time taken to be determined with reference to date of registration of complaint for investigation by CVO to issue of final orders by DA</p>
</div>
<br>
   <br>
  <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
    <b>7.(B) Major Penalty Proceedings</b> 
  </div>
<br>
   <table style="margin: auto; width:66%;" class="table">  
	  <tr></tr>
	  <tr>
		<th rowspan=2 ><b>No. of Case</b></th>
		<th rowspan=2><b>No. of Officials against whom proceeding finalized(out of column 1)</b></th>
		<th rowspan=2><b>Cut in pension(out of column 2)</b></th>
		<th rowspan=2><b>Dismissal removal Compulsory Retirement(out of column 2)</b></th>
		<th rowspan=2><b>Reduction in Lower time Scale/ Rank(out of column 2)</b></th>
		<th rowspan=2 ><b>Other Major penalties(out of column 2)</b></th>
		<th rowspan=2><b>Minor Penalties other then Censure/ Warning(out of column 2)</b></th>
		<th rowspan=2 ><b>Censure/Warning(out of column 2)</b></th>
		<th rowspan=2 ><b>No Action/exoneration(out of column 2)</b></th>
      </tr>
	  <tr></tr>
	  <tr>
		<td>&nbsp;1</td>
		<td>&nbsp;2</td>
		<td>&nbsp;3</td>
		<td>&nbsp;4</td>
		<td>&nbsp;5</td>
		<td>&nbsp;6</td>
		<td>&nbsp;7</td>
		<td>&nbsp;8</td>
		<td>&nbsp;9</td>
	  </tr>
	  <tr>
		<td><b><form:input path="punitive_vigilance_majorpenalty_numberofcase" style="padding: 2px;" class="majorCase"   name="majorPenaltyCasesNo" readonly="true"/></b></td>
		<td><b><form:input path="punitive_vigilance_majorpenalty_numberofofficer_against" style="padding: 2px;" class="majorOfficial"  readOnly="true" name="punitive_vigilance_majorpenalty_numberofofficer_against" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_majorpenalty_cutinpension" style="padding: 2px;" class="majorBreakUp"  readOnly="true" name="punitive_vigilance_majorpenalty_cutinpension" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_majorpenalty_dismissal" style="padding: 2px;" class="majorBreakUp"  readOnly="true" name="punitive_vigilance_majorpenalty_dismissal" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_majorpenalty_reduction_scale" style="padding: 2px;" class="majorBreakUp"  readOnly="true" name="punitive_vigilance_majorpenalty_reduction_scale" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_majorpenalty_other_majorpenalties" style="padding: 2px;" class="majorBreakUp"  readOnly="true" name="punitive_vigilance_majorpenalty_other_majorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_majorpenalty_minorpenalties" style="padding: 2px;" class="majorBreakUp"  readOnly="true" name="punitive_vigilance_majorpenalty_minorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_majorpenalty_censure_warning" style="padding: 2px;" class="majorBreakUp"  readOnly="true" name="punitive_vigilance_majorpenalty_censure_warning" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="punitive_vigilance_majorpenalty_noaction" style="padding: 2px;" class="majorBreakUpFinal"  readOnly="true" name="punitive_vigilance_majorpenalty_noaction" onkeypress="return isNumberKey(event);"/></b></td>
	  </tr>
	 </table>
			<br><br>
		
   <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
     <b>7.(c) Minor Penalty Proceedings</b> 
   </div>
<br>
   <table style="margin: auto; width:66%;" class="table">  
	   <tr></tr>
	   <tr>
		  <th rowspan=2 ><b>No. of Case</b></th>
		  <th rowspan=2><b>No. of Officials against whom proceeding finalized</b></th>
		  <th rowspan=2><b>Reduction to lower stage</b></th>
		  <th rowspan=2><b>Postponement/ Withholding of Increment</b></th>
		  <th rowspan=2><b>Recovery from pay</b></th>
		  <th rowspan=2 ><b>With hlding of promotion</b></th>
		  <th rowspan=2><b>Censure</b></th>
		  <th rowspan=2 ><b>Exoneration</b></th>
	   </tr>
	   <tr></tr>
	   <tr>
		 <td>&nbsp;1</td>
		 <td>&nbsp;2</td>
		 <td>&nbsp;3</td>
		 <td>&nbsp;4</td>
		 <td>&nbsp;5</td>
		 <td>&nbsp;6</td>
		 <td>&nbsp;7</td>
		 <td>&nbsp;8</td>
	   </tr>
	   <tr>
		  <td><b><form:input path="punitive_vigilance_minorpenalty_numberofcase" style="padding: 2px;" class="minorCase"  readOnly="true" name="punitive_vigilance_minorpenalty_numberofcase" readonly="true"/></b></td>
		  <td><b><form:input path="punitive_vigilance_minorpenalty_numberofofficer_against" style="padding: 2px;" class="minorOfficial"  readOnly="true" name="punitive_vigilance_minorpenalty_numberofofficer_against" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitive_vigilance_minorpenalty_reduction_lowerstage" style="padding: 2px;" class="minorBreakUp"  readOnly="true" name="punitive_vigilance_minorpenalty_reduction_lowerstage" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitive_vigilance_minorpenalty_postponement" style="padding: 2px;" class="minorBreakUp"  readOnly="true" name="punitive_vigilance_minorpenalty_postponement" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitive_vigilance_minorpenalty_recovery_pay" style="padding: 2px;" class="minorBreakUp"  readOnly="true" name="punitive_vigilance_minorpenalty_recovery_pay" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitive_vigilance_minorpenalty_holding_promotion" style="padding: 2px;" class="minorBreakUp"  readOnly="true" name="punitive_vigilance_minorpenalty_holding_promotion" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitive_vigilance_minorpenalty_censure" style="padding: 2px;" class="minorBreakUp"  readOnly="true" name="punitive_vigilance_minorpenalty_censure" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitive_vigilance_minorpenalty_exoneration" style="padding: 2px;" class="minorBreakUpFinal"  readOnly="true" name="punitive_vigilance_minorpenalty_exoneration" onkeypress="return isNumberKey(event);"/></b></td>
       </tr>
	</table>
			<br><br>
			
  <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
    <b>7.(D) Rank- wise Break up of Major Penalty Awarded</b> 
  </div>
<br>
  <table style="margin: auto; width:66%;" class="table">  
	   <tr>
		  <th rowspan=2><b>Group</b></th>
		  <th rowspan=2><b>No. of Cases</b></th>
		  <th rowspan=2><b>No.of officials against whom proceedings finalized</b></th>
		  <th rowspan=2 ><b>Cut in pension imposed</b></th>
		  <th rowspan=2><b>Dismissal/Removal/Compulsory Retirement imposed</b></th>	
		  <th rowspan=2><b>Reduction to lower time scale/in Rank imposed</b></th>
		  <th rowspan=2><b>Other Major penalties imposed</b></th>
		  <th rowspan=2><b>minor Penalties other then Censure/ Warning</b></th>
		  <th rowspan=2 ><b>Censure imposed</b></th>
		  <th rowspan=2><b>No action exoneration</b></th>	
	  </tr>
	  <tr></tr>
	  <tr>
		 <td>&nbsp;1</td>
		 <td>&nbsp;2</td>
		 <td>&nbsp;3</td>
		 <td>&nbsp;4</td>
		 <td>&nbsp;5</td>
		 <td>&nbsp;6</td>
		 <td>&nbsp;7</td>
		 <td>&nbsp;8</td>
		 <td>&nbsp;9</td>
		 <td>&nbsp;10</td>
	   </tr>
	   <tr>
		  <td><b>(1)Group C</b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupc_numberofofficer" style="padding: 2px;" class="numberofofficer"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupc_numberofofficer" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupc_officeragainst" style="padding: 2px;" class="officeragainst"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupc_officeragainst" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupc_pensioncut" style="padding: 2px;" class="pensioncut"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupc_pensioncut" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupc_dismissal" style="padding: 2px;" class="dismissal"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupc_dismissal" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupc_reductionscale" style="padding: 2px;" class="reductionscale"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupc_reductionscale" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupc_majorpenalties" style="padding: 2px;" class="majorpenalties"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupc_majorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupc_minorpenalties" style="padding: 2px;" class="minorpenalties"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupc_minorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupc_censure" style="padding: 2px;" class="censure"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupc_censure" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupc_noaction" style="padding: 2px;" class="noaction"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupc_noaction" onkeypress="return isNumberKey(event);"/></b></td>
	   </tr>
	   <tr>
		  <td><b>(2)Group B</b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupb_numberofofficer" style="padding: 2px;" class="numberofofficer"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupb_numberofofficer" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupb_officeragainst" style="padding: 2px;" class="officeragainst"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupb_officeragainst" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupb_pensioncut" style="padding: 2px;" class="pensioncut"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupb_pensioncut" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupb_dismissal" style="padding: 2px;" class="dismissal"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupb_dismissal" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupb_reductionscale" style="padding: 2px;" class="reductionscale"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupb_reductionscale" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupb_majorpenalties" style="padding: 2px;" class="majorpenalties"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupb_majorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupb_minorpenalties" style="padding: 2px;" class="minorpenalties"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupb_minorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupb_censure" style="padding: 2px;" class="censure"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupb_censure" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupb_noaction" style="padding: 2px;" class="noaction"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupb_noaction" onkeypress="return isNumberKey(event);"/></b></td>
	   </tr>
	   <tr>
		  <td><b>(3)Group A up to DS/Dir level</b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupa_numberofofficer" style="padding: 2px;" class="numberofofficer"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupa_numberofofficer" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupa_officeragainst" style="padding: 2px;" class="officeragainst"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupa_officeragainst" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupa_pensioncut" style="padding: 2px;" class="pensioncut"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupa_pensioncut" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupa_dismissal" style="padding: 2px;" class="dismissal"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupa_dismissal" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupa_reductionscale" style="padding: 2px;" class="reductionscale"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupa_reductionscale" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupa_majorpenalties" style="padding: 2px;" class="majorpenalties"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupa_majorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupa_minorpenalties" style="padding: 2px;" class="minorpenalties"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupa_minorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupa_censure" style="padding: 2px;" class="censure"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupa_censure" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_groupa_noaction" style="padding: 2px;" class="noaction"  readOnly="true" name="punitivevigilance_riskwisebreakup_groupa_noaction" onkeypress="return isNumberKey(event);" /></b></td>
	   </tr>
	   <tr>
		  <td><b>(4)JS and above</b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_js_numberofofficer" style="padding: 2px;" class="numberofofficerFinal"  readOnly="true" name="punitivevigilance_riskwisebreakup_js_numberofofficer" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_js_officeragainst" style="padding: 2px;" class="officeragainstFinal"  readOnly="true" name="punitivevigilance_riskwisebreakup_js_officeragainst" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_js_pensioncut" style="padding: 2px;" class="pensioncutFinal"  readOnly="true" name="punitivevigilance_riskwisebreakup_js_pensioncut" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_js_dismissal" style="padding: 2px;" class="dismissalFinal"  readOnly="true" name="punitivevigilance_riskwisebreakup_js_dismissal" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_js_reductionscale" style="padding: 2px;" class="reductionscaleFinal"  readOnly="true" name="punitivevigilance_riskwisebreakup_js_reductionscale" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_js_majorpenalties" style="padding: 2px;" class="majorpenaltiesFinal"  readOnly="true" name="punitivevigilance_riskwisebreakup_js_majorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_js_minorpenalties" style="padding: 2px;" class="minorpenaltiesFinal"  readOnly="true" name="punitivevigilance_riskwisebreakup_js_minorpenalties" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_js_censure" style="padding: 2px;" class="censureFinal"  readOnly="true" name="punitivevigilance_riskwisebreakup_js_censure" onkeypress="return isNumberKey(event);"/></b></td>
		  <td><b><form:input path="punitivevigilance_riskwisebreakup_js_noaction" style="padding: 2px;" class="noactionFinal"  readOnly="true" name="punitivevigilance_riskwisebreakup_js_noaction" onkeypress="return isNumberKey(event);"/></b></td>
	   </tr>
	</table>
			<br><br><br>
			
			<br><br>
</div>
</form:form>
<br><br>
			
			
			<br><br>
<form:form name="myform"  commandName="preventiveVigilanceForm" >	
 <div class="table-responsive">
 <h3 align="center" style="font-size:25px; " ><b>QUARTERLY PROGRESS REPORT</b></h3>
<h3 align="center" style="font-size:24px; " ><b>PREVENTIVE VIGILANCE</b></h3>

<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>8.1 Preventive Vigilance Measures(Nos) </b> </div>
<br>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>8.1(A) By The CVO </b> </div>
<br>

<table style="margin: auto; width:66%;"  class="table">  
	 <tr></tr>
     <tr>
	   <th rowspan=2><b>Type</b></th>
	   <th rowspan=2><b>Up to end of the previous quarter</b></th>
	   <th rowspan=2><b>During the quarter</b></th>
	   <th rowspan=2><b>No.resulting in Vig.Cases/System Improvement</b></th>
	   <th rowspan=2><b>Recovery effected,if any (in Rs.)</b></th>
     </tr>
	 <tr></tr>
	 <tr>
	   <td>&nbsp;1</td>
	   <td>&nbsp;2</td>
	   <td>&nbsp;3</td>
	   <td>&nbsp;4</td>
	   <td>&nbsp;5</td>
	 </tr>
	 <tr>
	   <td><b>Periodic Inspection</td>
	   <td><b><form:input path="preventivevig_bycvo_periodic_end_previous_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_periodic_end_previous_qtr" onkeypress="return isNumberKey(event);"/></b></td>
	   <td><b><form:input path="preventivevig_bycvo_periodic_during_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_periodic_during_qtr" onkeypress="return isNumberKey(event);"/></b></td>
	   <td><b><form:input path="preventivevig_bycvo_periodic_system_improvement" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_periodic_system_improvement" onkeypress="return isNumberKey(event);"/></b></td>
	   <td><b><form:input path="preventivevig_bycvo_periodic_recovery_effected" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_periodic_recovery_effected" onkeypress="return isNumberKey(event);"/></b></td>
	  </tr>
	  <tr>
		<td><b>Surprise Inspection</td>
		<td><b><form:input path="preventivevig_bycvo_surprise_end_previous_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_surprise_end_previous_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_surprise_during_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_surprise_during_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_surprise_system_improvement" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_surprise_system_improvement" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_surprise_recovery_effected" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_surprise_recovery_effected" onkeypress="return isNumberKey(event);"/></b></td>
	  </tr>
	  <tr>
		<td><b>Major Work/Procurements-CTE Type Inspection</td>
		<td><b><form:input path="preventivevig_bycvo_majorwork_end_previous_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_majorwork_end_previous_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_majorwork_during_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_majorwork_during_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_majorwork_system_improvement" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_majorwork_system_improvement" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_majorwork_recovery_effected" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_majorwork_recovery_effected" onkeypress="return isNumberKey(event);"/></b></td>
	  </tr>
	  <tr>
		<td><b>Scrutiny of Files</td>
		<td><b><form:input path="preventivevig_bycvo_scrutiny_file_end_previous_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_scrutiny_file_end_previous_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_scrutiny_file_during_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_scrutiny_file_during_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_scrutiny_file_system_improvement" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_scrutiny_file_system_improvement" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_scrutiny_file_recovery_effected" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_scrutiny_file_recovery_effected" onkeypress="return isNumberKey(event);"/></b></td>
	  </tr>
	  <tr>
		<td><b>Scrutiny of Property Returns</td>
		<td><b><form:input path="preventivevig_bycvo_scrutiny_property_end_previous_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_scrutiny_property_end_previous_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_scrutiny_property_during_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_scrutiny_property_during_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_scrutiny_property_system_improvement" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_scrutiny_property_system_improvement" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_scrutiny_property_recovery_effected" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_scrutiny_property_recovery_effected" onkeypress="return isNumberKey(event);"/></b></td>
	  </tr>
	  <tr>
		<td><b>Audit reports examined</td>
		<td><b><form:input path="preventivevig_bycvo_audit_reports_end_previous_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_audit_reports_end_previous_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_audit_reports_during_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_audit_reports_during_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_cvc_audit_reports_system_improvement" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_cvc_audit_reports_system_improvement" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_audit_reports_recovery_effected" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_audit_reports_recovery_effected" onkeypress="return isNumberKey(event);"/></b></td>
	  </tr>
	  <tr>
		<td><b>Training Programs/Workshopsheld</td>
		<td><b><form:input path="preventivevig_bycvo_training_programs_end_previous_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_training_programs_end_previous_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevig_bycvo_training_programs_during_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevig_bycvo_training_programs_during_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevigi_bycvo_training_programs_system_improvement" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_bycvo_training_programs_system_improvement" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevigi_bycvo_training_programs_recovery_effected" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_bycvo_training_programs_recovery_effected" onkeypress="return isNumberKey(event);"/></b></td>
	  </tr>
	  <tr>
		<td><b>System Improvements undertaken</td>
		<td><b><form:input path="preventivevigi_bycvo_system_improvements_end_previous_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_bycvo_system_improvements_end_previous_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevigi_bycvo_system_improvements_during_qtr" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_bycvo_system_improvements_during_qtr" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevigi_bycvo_system_improvements_system_improvement" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_bycvo_system_improvements_system_improvement" onkeypress="return isNumberKey(event);"/></b></td>
		<td><b><form:input path="preventivevigi_bycvo_system_improvements_recovery_effected" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_bycvo_system_improvements_recovery_effected" onkeypress="return isNumberKey(event);"/></b></td>
	  </tr>
  </table>
	</div>
<br><br>
   <br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>8.(B) By the Administration/Managment</b> </div>
<br>
<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
  <b>8.(B) (1) Sensitive Post and Job Rotation</b>
 </div>
<br>
 <table style="margin: auto; width:66%;"  class="table">  
	<tr></tr>
	<tr>
	  <th rowspan=2 ><b>No. of Sensitive Post Identified</b></th>
	  <th rowspan=2><b>No. of Posts due for rotation during the Quarter</b></th>
	  <th rowspan=2><b>No. of Posts rotated during the Quarter</b></th>
	  <th rowspan=2><b>No. of Post due for rotation and not rotated during Quarter</b></th>
	  <th rowspan=2><b>Reasons for not effecting rotating the sensitive posts</b></th>
	  
	</tr>
	<tr></tr>
	<tr>
	  <td>&nbsp;1</td>
	  <td>&nbsp;2</td>
	  <td>&nbsp;3</td>
	  <td>&nbsp;4</td>
	  <td>&nbsp;5</td>

	</tr>
	<tr>
	  <td><b><form:input path="preventivevigi_management_job_rotation_sensitivenumberpost" style="padding: 2px;" class="SenseJob"  readOnly="true" name="preventivevigi_management_job_rotation_sensitivenumberpost" onkeypress="return isNumberKey(event);"/></b></td>
	  <td><b><form:input path="preventivevigi_management_job_rotation_postduerotation" style="padding: 2px;" class="SenseJob"  readOnly="true" name="preventivevigi_management_job_rotation_postduerotation" onkeypress="return isNumberKey(event);"/></b></td>
	  <td><b><form:input path="preventivevigi_management_job_rotation_post_qtrrotation" style="padding: 2px;" class="SenseJob"  readOnly="true" name="preventivevigi_management_job_rotation_post_qtrrotation" onkeypress="return isNumberKey(event);"/></b></td>
	  <td><b><form:input path="preventivevigi_management_job_rotation_postnotrotated" style="padding: 2px;" class="SenseJob"  readOnly="true" name="preventivevigi_management_job_rotation_postnotrotated" onkeypress="return isNumberKey(event);" readonly="true"/></b></td>
	  <td><b><form:input path="preventivevigi_management_job_rotation_reasons" style="padding: 2px; width:200px;" class="SenseJob"  readOnly="true" name="preventivevigi_management_job_rotation_reasons" /></b></td>
	</tr>
  </table>
<br><br><br><br>
 <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
   <b>8.(B) (2) FR 56J(or equivalent provisions in other rules/regulations)</b> 
 </div>
<br>
 <table style="margin: auto; width:66%;"  class="table">  
	<tr></tr>
	<tr>
	  <th rowspan=2 ><b>No. of officials covered</b></th>
	  <th rowspan=2><b>No. of reviews undertaken</b></th>
	  <th rowspan=2><b>No. of cases taken up under FR 56J</b></th>
	  <th rowspan=2><b>Action taken</b></th>
	</tr>
    <tr></tr>
	<tr>
	   <td>&nbsp;1</td>
	   <td>&nbsp;2</td>
	   <td>&nbsp;3</td>
	   <td>&nbsp;4</td>
	</tr>
	<tr>
	   <td><b><form:input path="preventivevigi_management_frj_numberofficer_covered" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_management_frj_numberofficer_covered" onkeypress="return isNumberKey(event);"/></b></td>
	   <td><b><form:input path="preventivevigi_management_frj_reviews_undertaken" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_management_frj_reviews_undertaken" onkeypress="return isNumberKey(event);"/></b></td>
	   <td><b><form:input path="preventivevigi_management_frj_case_under_fr" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_management_frj_case_under_fr" onkeypress="return isNumberKey(event);"/></b></td>
	   <td><b><form:input path="preventivevigi_management_frj_action_taken" style="padding: 2px; width:200px;" class=""  readOnly="true" name="preventivevigi_management_frj_action_taken" /></b></td>
	</tr>
 </table>
<br><br><br>
   <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
      <b>8.(B) (3) (A) Details of Vigilance Mechanism set up in subsidiaries/JVs/SPVs/RRBs etc</b> 
  </div>
<br>
  <table style="margin: auto; width:66%;"  class="table">  
	<tr></tr>
	<tr>
	  <th rowspan=2 ><b>S.No.</b></th>
	  <th rowspan=2><b>Name of sub /JV/SPV/RRB etc. where Vig.Mechanism set up</b></th>
	  <th rowspan=2><b>No.of officers / staff appointed</b></th>
	  <th rowspan=2><b>Method of control exercised by parent Organisations</b></th>
	</tr>
	<tr></tr>
	<tr>
	  <td>&nbsp;1</td>
	  <td>&nbsp;2</td>
	  <td>&nbsp;3</td>
	  <td>&nbsp;4</td>
	</tr>
	<tr>
	   <td><b><form:input path="preventivevigi_management_detailsvig_a_serial_number" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_management_detailsvig_a_serial_number" /></b></td>
	   <td><b><form:input path="preventivevigi_management_detailsvig_a_nameofsub" style="padding: 2px; width:200px;" class=""  readOnly="true" name="preventivevigi_management_detailsvig_a_nameofsub" /></b></td>
	   <td><b><form:input path="preventivevigi_management_detailsvig_a_staff_appointed" style="padding: 2px; width:200px;" class=""  readOnly="true" name="preventivevigi_management_detailsvig_a_staff_appointed" /></b></td>
	   <td><b><form:input path="preventivevigi_management_detailsvig_a_methodofcontrol" style="padding: 2px; width:200px;" class=""  readOnly="true" name="preventivevigi_management_detailsvig_a_methodofcontrol" /></b></td>
	</tr>
</table>
	<br><br><br>
  <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
   <b>8.(B) (3) (B) </b>
  </div>
<br>
   <table style="margin: auto; width:66%;"  class="table">  
	  <tr></tr>
	  <tr>
		<th rowspan=2 ><b>S.No.</b></th>
		<th rowspan=2><b>Name of sub /JV/SPV/RRB etc. where Vig.Mechanism set up</b></th>
		<th rowspan=2><b>Method of control exercised by parent organisation</b></th>
		<th rowspan=2><b>likely time for creating functional vigilance menchanism</b></th>
	  </tr>
	  <tr></tr>
	 <tr>
	   <td>&nbsp;1</td>
	   <td>&nbsp;2</td>
	   <td>&nbsp;3</td>
	   <td>&nbsp;4</td>
	 </tr>
	 <tr>
	    <td><b><form:input path="preventivevigi_management_detailsvig_b_serial_number" style="padding: 2px;" class=""  readOnly="true" name="preventivevigi_management_detailsvig_b_serial_number" /></b></td>
		<td><b><form:input path="preventivevigi_management_detailsvig_b_nameofsub" style="padding: 2px; width:200px;" class=""  readOnly="true" name="preventivevigi_management_detailsvig_b_nameofsub" /></b></td>
		<td><b><form:input path="preventivevigi_management_detailsvig_b_contral_method" style="padding: 2px; width:200px;" class=""  readOnly="true" name="preventivevigi_management_detailsvig_b_contral_method" /></b></td>
		<td><b><form:input path="preventivevigi_management_detailsvig_b_likely_time" style="padding: 2px; width:200px;" class=""  readOnly="true" name="preventivevigi_management_detailsvig_b_likely_time" /></b></td>
	 </tr>
 </table>
			<br><br>
    <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
	   <b>8.2</b> 
	</div>
<br>
    <table style="margin: auto; width:66%;"  class="table" >
       <tr> 
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(a) Whether Agreed list for current year prepared</b></td>
		  <td><b>
		  <form:radiobutton id="preventivevigi_whether_agreed_list" path="preventivevigi_whether_agreed_list" name="agreedList"  style=" width:15%;padding:1px;" value="Yes" onclick="agreedList(1);"/>Yes
		  <form:radiobutton path="preventivevigi_whether_agreed_list" name="agreedList"  style=" width:15%;padding:1px;" value="No" onclick="agreedList(0);"/>No
		 <form:input path="preventivevigi_whether_agreed_list_date" type="date" readOnly="true" name="preventivevigi_whether_agreed_list_date"/></b>
		  </td>
	   </tr>
	   <tr>  
	       <td style="text-align: left;"><b>&nbsp;&nbsp;(b) Whether List of officers of Doubtful Integrity Prepared</b></td>
		   <td><b><form:radiobutton id="preventivevigi_whether_officer_list" path="preventivevigi_whether_officer_list" name="preventivevigi_whether_officer_list"  style=" width:15%;padding:1px;" value="Yes" onclick="preventivevigi(1);"/>Yes
		  <form:radiobutton path="preventivevigi_whether_officer_list" name="preventivevigi_whether_officer_list"  style=" width:15%;padding:1px;" value="No" onclick="preventivevigi(0);"/>No
				  <form:input path="preventivevigi_whether_officer_list_date" type="date" readOnly="true" name="doubtfulIntegrityDate"/></b>
		   </td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(c) Whether annual property returns/Personal files of the officials in Agreed/Odilistscrutinised </b></td>
		  <td><b> <form:radiobutton path="preventivevigi_whether_annual_property" name="preventivevigi_whether_annual_property"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_whether_annual_property" name="preventivevigi_whether_annual_property" readOnly="true"  style=" width:15%;padding:1px;" value="No"/>No
		  </td>
	   </tr>
	   <tr>  
	     <td style="text-align: left;"><b>&nbsp;&nbsp;(d) Whether any information shared with CBI on (C)</b></td>
		  <td><b> <form:radiobutton path="preventivevigi_whether_any_information" name="preventivevigi_whether_any_information"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_whether_any_information" name="preventivevigi_whether_any_information"  readOnly="true" style=" width:15%;padding:1px;" value="No"/>No
		  </td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(e) Whether data relating to Pendency of Complaints and advicesreconciled with CVC </b></td>
		   <td><b> <form:radiobutton id="preventivevigi_whether_data_relating" path="preventivevigi_whether_data_relating" name="preventivevigi_whether_data_relating"  style=" width:15%;padding:1px;" value="Yes" onclick="preventivevigiE(1);"/>Yes
		  <form:radiobutton path="preventivevigi_whether_data_relating" name="preventivevigi_whether_data_relating"  style=" width:15%;padding:1px;" value="No" onclick="preventivevigiE(0);"/>No
				  <form:input path="preventivevigi_whether_data_relating_date" type="date" readOnly="true" name="preventivevigi_whether_data_relating_date"/></b>
		   </td>
	   </tr>
	</table>
	<br><br><br>
   <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>8.3 Other Activities</b> </div>
<br>
    <table style="margin: auto; width:66%;"  class="table">
	  <tr><td style="text-align: left;">(A) Leveraging Technology</td></tr>
	  <tr><td style="text-align: left;">&nbsp;&nbsp;&nbsp;(1) Extent of IT uasage and the e-governance</td></tr>
	  <tr>
		 <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(a) Percentage of E-payment</b></td>
		 <td><b><form:input path="preventivevigi_other_it_epayment" style="padding: 2px; width:40px;" class="greaterThree"  readOnly="true" name="preventivevigi_other_it_epayment" min="0" max="100" onkeypress="return isNumberKey(event);"/>%</b></td>
	  </tr>
	  <tr>
		  <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) Percentage of E-tendering/E-auction</b></td>
		  <td><b><form:input path="preventivevigi_other_it_etendering" style="padding: 2px; width:40px;" class="greaterThree"  readOnly="true" name="preventivevigi_other_it_etendering"  min="0" max="100" onkeypress="return isNumberKey(event);"/>%</b></td>
	  </tr>
	  <tr>
		  <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(c) Procurements/Cantracts made thru Central Procurement Portal</b></td>
		  <td><b><form:input path="preventivevigi_other_it_contracts" style="padding: 2px; width:40px;" class="greaterThree"  readOnly="true" name="preventivevigi_other_it_contracts"  min="0" max="100" onkeypress="return isNumberKey(event);"/>%</b></td>
	  </tr>
	  <tr>
		  <td style="text-align: left;"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(d) Percentage of procurement through Government E Marketplace(GeM) wherever applicable</b></td>
		  <td><b><form:input path="preventivevigi_other_it_emarketplace" style="padding: 2px; width:40px;" class="greaterThree"  readOnly="true" name="preventivevigi_other_it_emarketplace"  min="0" max="100" onkeypress="return isNumberKey(event);"/>%</b></td>
	  </tr>
	  <tr>  
	    <td style="text-align: left;"><b>&nbsp;&nbsp;(B) Whether QPR Dueha ve Been Furnished to CTE</b></td>
		<td><b><form:radiobutton id="preventivevigi_other_qpr_cte" path="preventivevigi_other_qpr_cte" name="preventivevigi_other_qpr_cte"  style=" width:15%;padding:1px;" value="Yes" readOnly="true" onclick="otherActivitesB(1);"/>Yes
		  <form:radiobutton path="preventivevigi_other_qpr_cte" name="preventivevigi_other_qpr_cte"  style=" width:15%;padding:1px;" value="No" readOnly="true" onclick="otherActivitesB(0);"/>No
               <form:input path="preventivevigi_other_qpr_cte_date" type="date" readOnly="true" name="preventivevigi_other_qpr_cte_date"/></b>
		</td>
	  </tr>
	  <tr>  
	    <td style="text-align: left;"><b>&nbsp;&nbsp;(C) Whether Review of vigilance work was done by the board/head of department </b></td>
		<td><b><form:radiobutton id="preventivevigi_other_review_vigi" path="preventivevigi_other_review_vigi" name="preventivevigi_other_review_vigi"  style=" width:15%;padding:1px;" value="Yes" onclick="otherActivitesC(1);"/>Yes
		  <form:radiobutton path="preventivevigi_other_review_vigi" name="preventivevigi_other_review_vigi"  style=" width:15%;padding:1px;" value="No" onclick="otherActivitesC(0);"/>No
			   <form:input path="preventivevigi_other_review_vigi_date" type="date" readOnly="true" name="preventivevigi_other_review_vigi_date"/></b>
		</td>
	  </tr>
	  <tr>  
	    <td style="text-align: left;"><b>&nbsp;&nbsp;(D) Whether structured meeting held by the C.E.O./Head of Department with CVO</b></td>
		<td><b><form:radiobutton id="preventivevigi_other_structured_meeting" path="preventivevigi_other_structured_meeting" name="preventivevigi_other_structured_meeting"  style=" width:15%;padding:1px;" value="Yes" onclick="otherActivitesD(1);"/>Yes
		  <form:radiobutton path="preventivevigi_other_structured_meeting" name="preventivevigi_other_structured_meeting"  style=" width:15%;padding:1px;" value="No" onclick="otherActivitesD(0);"/>No
			   <form:input path="preventivevigi_other_structured_meeting_date" type="date" readOnly="true" name="preventivevigi_other_structured_meeting_date"/></b>
		</td>
	  </tr>
	  <tr>  
	    <td style="text-align: left;"><b>&nbsp;&nbsp;(E) Whether Report on implementation of integrity pact sent</b></td>
		<td><b><form:radiobutton path="preventivevigi_other_report_implementation" name="preventivevigi_other_report_implementation"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_report_implementation" name="preventivevigi_other_report_implementation"  style=" width:15%;padding:1px;" value="No"/>No
	    </td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(F) Whether applications being used are reporting deviations as alerts</b></td>
		  <td><b><form:radiobutton id="preventivevigi_other_application_being" path="preventivevigi_other_application_being" name="preventivevigi_other_application_being"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_application_being" name="preventivevigi_other_application_being"  style=" width:15%;padding:1px;" value="No"/>No
				 <form:radiobutton path="preventivevigi_other_application_being" name="preventivevigi_other_application_being"  style=" width:15%;padding:1px;" value="Other"/>Other</b>
		  </td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(G) Whether Changes in technology is being dovetailed with changes in instructions Guidelines/Manuals</b></td>
		  <td><b><form:radiobutton path="preventivevigi_other_change_tech" name="preventivevigi_other_change_tech"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_change_tech" name="preventivevigi_other_change_tech"  style=" width:15%;padding:1px;" value="No"/>No
		  </td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(H) Whether E- Learning methodology is being used</b></td>
		  <td><b><form:radiobutton path="preventivevigi_other_e_learning" name="preventivevigi_other_e_learning"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_e_learning" name="preventivevigi_other_e_learning"  style=" width:15%;padding:1px;" value="No"/>No
		  </td>
	   </tr>
	   <tr>  
	       <td style="text-align: left;"><b>&nbsp;&nbsp;(I) Whether Pending Disciplinary Cases are Monitored</b></td>
		   <td><b><form:radiobutton path="preventivevigi_other_pending_disciplinary" name="preventivevigi_other_pending_disciplinary"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_pending_disciplinary" name="preventivevigi_other_pending_disciplinary"  style=" width:15%;padding:1px;" value="No"/>No
		   </td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(J) Whether CVO/VO Deputed for Training Abroad</b></td>
		  <td><b><form:radiobutton path="preventivevigi_other_cvo_deputed" name="preventivevigi_other_cvo_deputed"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_cvo_deputed" name="preventivevigi_other_cvo_deputed"  style=" width:15%;padding:1px;" value="No"/>No
		  </td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(K)Visits Abroad by CVO,if any</b></td>
		  <td><b><form:radiobutton path="preventivevigi_other_visit_cvo" name="preventivevigi_other_visit_cvo"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_visit_cvo" name="preventivevigi_other_visit_cvo"  style=" width:15%;padding:1px;" value="No"/>No
		  </td>
	   </tr>
	   <tr>  
	       <td style="text-align: left;"><b>&nbsp;&nbsp;(L)Whether Prior Approval of Commission obtained for Official foreign visits by CVO/VO</b></td>
		  <td><b><form:radiobutton path="preventivevigi_other_prior_approval" name="preventivevigi_other_prior_approval"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_prior_approval" name="preventivevigi_other_prior_approval"  style=" width:15%;padding:1px;" value="No"/>No
		  </td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(M)Expenditure incurred on Festival Giftsf any(Rs.)<br>(see CVC's Office Order No.40/8/2003 dated 27.08.2003)</b></td>
		  <td><b><form:input path="preventivevigi_other_expenditure" style=" width:95%; padding:2px;"  readOnly="true"  name="preventivevigi_other_expenditure" /></td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(N)Whether Tour Details of CVO Submitted to CVC <br>(see CVC's Cicular No 26/07/010 dated 15.07.2010)</b></td>
		  <td><b><form:radiobutton path="preventivevigi_other_tour_details" name="preventivevigi_other_tour_details"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_tour_details" name="preventivevigi_other_tour_details"  style=" width:15%;padding:1px;" value="No"/>No
		  </td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(O)Whether  Guidelines on Appointment of Outsiders/Retired officers As I.O for Oral InQiries Laid Down including Provisions in CDA Rules</br>(Only for orgns. other than Govt : see Circular no. 98/MSC/23 dt 25.3.2003 )</b></td>
		   <td><b><form:radiobutton path="preventivevigi_other_guidelines_appointment" name="preventivevigi_other_guidelines_appointment"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_guidelines_appointment" name="preventivevigi_other_guidelines_appointment"  style=" width:15%;padding:1px;" value="No"/>No
		   </td>
	   </tr>
	   <tr>  
	       <td style="text-align: left;"><b>&nbsp;&nbsp;(P) Victimisation of vigilance officials Reported to Commission if any <br/>(Circular No.16/3/06 dt 28.3.2006)</b></td>
		   <td><b><form:input path="preventivevigi_other_victimisation_vigilance" style=" width:95%; padding:2px;"  readOnly="true"  name="preventivevigi_other_victimisation_vigilance" /></td>
	   </tr>
	   <tr>  
	      <td style="text-align: left;"><b>&nbsp;&nbsp;(Q) Whether secrecy of Passwords Monitored by CVO in Terms of Policy Approved by the Respective Board<br>(For Banks Only)</b></td>
		  <td><b><form:radiobutton path="preventivevigi_other_secrcy_password" name="preventivevigi_other_secrcy_password"  style=" width:15%;padding:1px;" value="Yes"/>Yes
		  <form:radiobutton path="preventivevigi_other_secrcy_password" name="preventivevigi_other_secrcy_password"  style=" width:15%;padding:1px;" value="No"/>No
		  </td>
	   </tr>
	</table>
	<div class="center">
 <p>[Last date of activity to be mentioned against the date]</p>
<p><strong>* If you are not able to fill up any of the above paras, give a time line for completing the same</strong>.</p>
</div><br><br>
	

</form:form>
	<br><br><br>
	<form:form name="myform"   commandName="preventiveVigilanceActivitiesForm"  >	
 <div class="table-responsive">
 <h3 align="center" style="font-size:25px; " ><b>QUARTERLY PROGRESS REPORT</b></h3>
<h3 align="center" style="font-size:24px; " ><b>PREVENTIVE VIGILANCE ACTIVITIES </b></h3>
 <div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); ">
     <b>9. Preventive Vigilance Activities in Curing the Quarter :(Upload Doc giving brief details)</b> 
 </div>
<br>

 <table style="margin: auto; width:66%;" class="table">
	 <tr>
	   <td><b>Eg:</b></td>
	 </tr>
     <tr> 
	    <td style="text-align: left;"><b>&nbsp;&nbsp;(a) Simplification and standardization of rules inter-alia including in Procurement processes, recruitment and transfer policies   <br>Standard Operating Procedures (SOP), Manuals etc</b>
	    </td>
	 </tr>
	 <tr>  
	    <td style="text-align: left;"><b>&nbsp;&nbsp;(b) Leveraging Technology and Automation inter-alia including in procurement,recruitment,service delivery,sales and disposal etc</b></td>
	 </tr>
	 <tr>  
	    <td style="text-align: left;"><b>&nbsp;&nbsp;(c) Business Process Re-engineering</b></td>
		<td><b><form:input path="vigilance_activites_upload_doc"  type="file" name="vigilance_activites_upload_doc" id="fileToUpload"/>
               
		</td>
	  </tr>
	  <tr>  
	     <td style="text-align: left;"><b>&nbsp;&nbsp;(d) Transparency Initiatives</b></td>
	  </tr>
	  <tr>  
	     <td style="text-align: left;"><b>&nbsp;&nbsp;(e) Accountability Initiatives </b></td>
	  </tr>
	  <tr>  
	     <td style="text-align: left;"><b>&nbsp;&nbsp;(f) Control & Supervision </b></td>
	  </tr>
	  <tr>  
	     <td style="text-align: left;"><b>&nbsp;&nbsp;(G) Training & Awareness including awareness among client /vendors,public employees etc. </b></td>
	  </tr>
	  <tr>  
	     <td style="text-align: left;"><b>&nbsp;&nbsp;(h) Internal Whistle Blower Mechanism and its effectiveness in measurable terms </b></td>
	  </tr>
	</table>
	<br>
	<br>
	<div style="padding:5px; margin: auto; width:66%; border: 1px solid #4192f4; height:20px; background:rgb(204, 255, 204); "><b>10.</b> </div>
<br>
	<table style="margin: auto; width:66%;" class="table">
        <tr> 
	        <td ><b>Remarks, if any</b></td><td><form:input path="vigilance_activites_any_remark"  style=" width:250px; padding:1px;"  readOnly="true"  name="vigilance_activites_any_remark" /></td>
		</tr>
	
		<tr> 
	        <td ><b>Place</b></td><td><form:input path="vigilance_activites_place"  style=" width:250px; padding:1px;"  readOnly="true"  name="vigilance_activites_place" /></td>
		</tr>
	
		<tr> 
	        <td ><b>Date</b></td><td><form:input path="vigilance_activites_date"  style=" width:150px; padding:1px;"  type="date" readOnly="true"  name="vigilance_activites_date" /></td>
		</tr>
</table>
	
</div>
</form:form>
	<br><br><br><br><br><br>
</body>
</html>