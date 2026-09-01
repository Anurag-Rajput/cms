<link rel='stylesheet' type='text/css' href='../resources/user/css/datePicker.css'/>
<link rel='stylesheet' type='text/css' href='../resources/user/css/jQueryTable.css'/>
<script src="../resources/user/js/datePicker.js"></script>
<script src="../resources/user/js/jQueryTable.js"></script>

<script>
$(document).ready(function(){
    $('#myOptions').change(function(){
       $(this).val() == "C_NO" ? $('#C_NO').show() : $('#C_NO').hide();
       $(this).val() == "C_NAME" ? $('#C_NAME').show() : $('#C_NAME').hide();
       $(this).val() == "C_MOB" ? $('#C_MOB').show() : $('#C_MOB').hide();
       $(this).val() == "C_EMAIL" ? $('#C_EMAIL').show() : $('#C_EMAIL').hide();
       $(this).val() == "C_PIN" ? $('#C_PIN').show() : $('#C_PIN').hide();
       $(this).val() == "C_CAN" ? $('#C_CAN').show() : $('#C_CAN').hide();
       $(this).val() == "C_GOAL" ? $('#C_GOAL').show() : $('#C_GOAL').hide();
       $(this).val() == "C_DEG" ? $('#C_DEG').show() : $('#C_DEG').hide();
       $(this).val() == "C_ORG" ? $('#C_ORG').show() : $('#C_ORG').hide();
       $(this).val() == "C_CMDATE" ? $('#C_CMDATE').show() : $('#C_CMDATE').hide();
       $(this).val() == "C_CRDATE" ? $('#C_CRDATE').show() : $('#C_CRDATE').hide();
    });
});
</script>



<script type = "text/javascript" >

		$(document).ready(
		function() {
				
			$( "#c_cmdate") .datepicker({
		        changeMonth: true,
		        changeYear: true,
		        dateFormat:"yy-mm-dd",
		        maxDate: "now"
		      });
		    
		    $( "#c_crdate") .datepicker({
		        changeMonth: true,
		        changeYear: true,
		        dateFormat:"yy-mm-dd",
		        maxDate: "now"
		      });
			    
			   
			    });
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
            height: 1000px;
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
   background-color: rgb(197, 224, 234);
    color: black;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>

</head>
<body>
<form >


<!--==============================content================================-->

<section id="content">
  <div class="main">
    <div class="wrapper" align="center">
    
     
      
       <div style="width:515px; background-color: rgb(218, 237, 241); color: #0E0D01;" ><h3> Complaint Cell</h3></div>
		 
		 <div  align="center" style=" background-color: rgb(255, 201, 167); color: #0E0D01;" ></div>
		 
        <div>
        
          <form >
           
		   <div class="form-group">
            <label>Search:</label>&nbsp;
		   <select  id="myOptions" onchange="java_script_:show(this.options[this.selectedIndex].value)">
		   <option value="NONE">--SELECT SEARCH TYPE--</option>
		   <option value="C_NO">By Complaint Number</option>
		   <option value="C_NAME">By Complainant Name</option>
		   <option value="C_MOB">By Mobile Number</option>
		   <option value="C_EMAIL">By Email</option>
		   <option value="C_PIN">By Pincode</option>
		   <option value="C_CAN">By Complain Against Name</option>
		   <option value="C_GOAL">By Gist Of Alligation</option>
		   <option value="C_DEG">By Desiganation</option>
		   <option value="C_ORG">By Organization</option>
		   <option value="C_CMDATE">By Complaint Date</option>
		   <option value="C_CRDATE">By Created Date</option>
		   </select>
		   </div>
		
		  
            <div class="form-group" id="C_NO" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label>Provide bold number only.Ex <b style="color: red;">XXXX</b>/20XX/vigilance-X</label>
               <span>   <input  name="serach_complain" id="c_no" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>  
           
            <div class="form-group" id="C_NAME" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label>Provide  <b style="color: red;">Complaint Name</b></label>
               <span>   <input  name="serach_complain" id="c_name" size="20" autocomplete="off"/> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>  
           
           
           <div class="form-group" id="C_MOB" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label> <b style="color: red;">Mobile Number</b></label>
               <span>   <input  name="serach_complain" id="c_mob" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>  
           
           
           <div class="form-group" id="C_EMAIL" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label> <b style="color: red;">Email ID</b></label>
               <span>   <input  name="serach_complain" id="c_email" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>  
            
           
           <div class="form-group" id="C_PIN" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label> <b style="color: red;">Pin Code</b></label>
               <span>   <input  name="serach_complain" id="c_pin" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>  
           
           
           <div class="form-group" id="C_CAN" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label> <b style="color: red;">Complain Against Name</b></label>
               <span>   <input  name="serach_complain" id="c_can" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>  
           
           <div class="form-group" id="C_GOAL" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label> <b style="color: red;">Gist Of Allegation</b></label>
               <span>   <input  name="serach_complain" id="c_goal" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>  
           
           
            <div class="form-group" id="C_DEG" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label> <b style="color: red;">Desiganation</b></label>
               <span>   <input  name="serach_complain" id="c_deg" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>
            
             <div class="form-group" id="C_ORG" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label> <b style="color: red;">Organization</b></label>
               <span>   <input  name="serach_complain" id="c_org" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>    
            
            
            <div class="form-group" id="C_CMDATE" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label> <b style="color: red;">Complaint Date</b></label>
               <span>   <input  name="serach_complain" id="c_cmdate" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>  
                        
            <div class="form-group" id="C_CRDATE" style="display: none;">
            <label>Search:</label>&nbsp; <br/>
            <label> <b style="color: red;">Created Date</b></label>
               <span>   <input  name="serach_complain" id="c_crdate" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>
            <!-- <div class="form-group" style="align:right;">
              <label></label> onclick="getComplain()" 
			  <div class="form-list" style="align:left;">
           <button type="submit" class="button-2"   name="submit" value="">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   </div>
            </div>   -->
            	<!-- <hr style='background-color:red;border-width:0;color:#000000;height:2px;line-height:0;text-align:left;width:100%;'/><br><br> 
 				<div id="result" style=" color: red; font: bold; ">
 				
 				</div>
            <br> -->
           <!-- 	<table id="table" class="flexy">
            <thead>
              <tr>
                <th align="left" style="width:15%">Sender Name</th>
    			 <th align="left" style="width:15%">Complaint Date</th>
    			 <th align="left" style="width:15%">Organization</th>
    			 <th align="left" style="width:15%">Complain No.</th>
    			 <th align="left" style="width:15%">Section</th>
    			 <th align="left" style="width:15%">Desicion taken</th>
    			 <th align="left" style="width:15%">Desicion Date</th>
    			 <th align="left" style="width:15%">Lying with</th>
    			 <th align="left" style="width:15%" > RTI</th>
    			  
    			 <th>View</th>
    			</tr>
          </thead>
            
            <tbody id="table-body">
			
			</tbody>
      </table> -->
     
           </form></div>
	 
		
       
    </div>
  </div>
</section>
<!--==============================footer=================================-->

</form>

</body>
