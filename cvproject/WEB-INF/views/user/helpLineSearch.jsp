
<script>
$(document).ready(function(){
    $('#myOptions').change(function(){
       $(this).val() == "C_NO" ? $('#C_NO').show() : $('#C_NO').hide();
       $(this).val() == "C_NAME" ? $('#C_NAME').show() : $('#C_NAME').hide();
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
<body>
<form >


<!--==============================content================================-->

<section id="content">
  <div class="main">
    <div class="wrapper">
    
     
      <center>
       <div style="width:515px; background-color: rgb(218, 237, 241); color: #0E0D01;" ><h3> Complaint Cell</h3></div>
		 
		 <div  align="center" style=" background-color: rgb(255, 201, 167); color: #0E0D01;" ></div>
		 
        <div style="width: 1000px; ">
        
          <form >
           
		   <div class="form-group">
            <label>Search:</label>&nbsp;
		   <select  id="myOptions" >
		   <option value="NONE">--SELECT SEARCH TYPE--</option>
		   <option value="C_NO">By Complain Number</option>
		   <option value="C_NAME">By Complaint Name</option>
		   
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
           
           
            
            <!-- <div class="form-group" style="align:right;">
              <label></label> onclick="getComplain()" 
			  <div class="form-list" style="align:left;">
           <button type="submit" class="button-2"   name="submit" value="">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   </div>
            </div>   -->
            	<!-- <hr style='background-color:red;border-width:0;color:#000000;height:2px;line-height:0;text-align:left;width:100%;'/><br><br> 
 				<div id="result" style=" color: red; font: bold; ">
 				
 				</div>
            <br>
           	<table id="table" class="flexy">
            <thead>
              <tr>
                <th align="left" style="width:15%">Sender Name</th>
    			 <th align="left" style="width:20%">Complaint Date</th>
    			 <th align="left" style="width:20%">Organization</th>
    			<th align="left" style="width:20%">Complain No.</th>
    			 <th align="left" style="width:15%">Section</th>
    			  <th align="left" style="width:15%">Desicion taken</th>
    			  <th align="left" style="width:15%">Desicion Date</th>
    			  <th align="left" style="width:15%">Lying with</th>
    			 <th>View</th>
    			</tr>
          </thead>
            
            <tbody id="table-body">
			
			</tbody>
      </table> -->
     
           </form></div>
	 
		
       </center>
    </div>
  </div>
</section>
<!--==============================footer=================================-->

</form>

</body>
