<script>
$(document).ready(function(){
    $('#myOptions').change(function(){
       $(this).val() == "FILE_NO" ? $('#FILE_NO').show() : $('#FILE_NO').hide();
       
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
            height: 100px;
            overflow: auto;
            -webkit-flex-flow: row wrap;
        }
        .flexy tbody tr{
            display: -webkit-flex;
            width: 100%;
        }

        .flexy tr td {
            width: 17%;
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
    <div class="wrapper" align="center">
    
     
     
       <div style="width:515px; background-color: rgb(218, 237, 241); color: #0E0D01;" align="center"><h3> Complaint Cell</h3></div>
		 
		 <div  align="center" style=" background-color: rgb(255, 201, 167); color: #0E0D01;" ></div>
		 
        <div style="width: 1000px; height:500px; ">
        <br></br>
          <form >
           
		   <div class="form-group">
            <label>Search:</label>&nbsp;
		   <select  id="myOptions" onchange="java_script_:show(this.options[this.selectedIndex].value)">
		   <option value="NONE">--SELECT SEARCH TYPE--</option>
		   <option value="FILE_NO">By File Number</option>
		   
		   </select>
		   </div><br></br>
		
		  
            <div class="form-group" id="FILE_NO" style="display: none;" align="center">
            <!-- <label>Search:</label>&nbsp; <br/> -->
            <label> <b style="color: red;">File Number</b></label>
               <span>   <input  name="serach_complain" id="fileNo" size="20" autocomplete="off" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain()" >Search</button></span>
            </div>  <br></br>
           
            	<hr style='background-color:red;border-width:0;color:#000000;height:2px;line-height:0;text-align:left;width:100%;'/><br><br> 
 				<div id="result" style=" color: red; font: bold; ">
 				
 				</div>
            <br>
           	<table id="table" class="flexy">
            <thead>
              <tr>
                <th align="left" style="width:15%">File No.</th>
    			 <th align="left" style="width:15%">Department Name</th>
    			 <th align="left" style="width:15%">Department Ref NO.</th>
    			 <th align="left" style="width:15%">Purpose </th>
    			 <th align="left" style="width:15%">Organization</th>
    			 <th align="left" style="width:15%">Date On File</th>
    			 <th align="left" style="width:15%">Edit</th>
    			  
    			<!--  <th>View</th> -->
    			</tr>
          </thead>
            
            <tbody id="table-body" style="padding-bottom: 270px;">
			
			</tbody>
      </table>
     
           </form></div>
	 
		
       
    </div>
  </div>
</section>
<!--==============================footer=================================-->

</form>

</body>
