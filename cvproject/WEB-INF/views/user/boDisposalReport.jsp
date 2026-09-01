<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

    	  
    	  
        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

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
	function monthlyReport() {
		var fromDate = document.getElementById("fromDate").value;
		var toDate = document.getElementById("toDate").value;
		$.ajax({
			type : "POST",
			url : "<c:url value='/user/getBoReport'/>",
			data : {
				"fromDate" : fromDate,
				"toDate" : toDate
			},
			success : function(data) {
				$('#report_Detail').empty();
				
				var tab='<div id="printReport">'+
				'<table style="width:100%" >'+
				  '<tr>'+
				  '  <th >Sno</th>'+
				  '  <th >BO Name</th>'+
				  '  <th >Brought forward</th>'+
				   ' <th >Receipts</th>'+
				   ' <th >Total Disposal</th>'+
				   ' <th >Total pending</th>'+
				  '</tr>';
				
				$.each(data, function(index, value) {
					
					for(var i = 0;i<=data.length;i++){
						
					if(index==i){
							var x = i + 1;
							tab=   tab+	'<tr>'+
							   ' <td>'+x+'</td>'+
							   ' <td>'+value.boName+'</td>'+
							   ' <td>'+value.broughtForward+'</td>'+
							  '  <td>'+value.receipt+'</td>'+
							  '  <td>'+value.totalDisposal+'</td>'+
							 '   <td>'+value.totalPending+'</td>'+
							'  </tr>';
						}
						
					}
				});
				
				tab=tab+'</table>'+'</div>'+'<button onclick="printPDF();">Print</button>'+'</center>'+'</div>'
				
				$('#report_Detail').append(tab);
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
	
	

	function printPDF() {
		$("#printReport").print({
            globalStyles: true,
            mediaPrint: true,
            stylesheet: null,
            noPrintSelector: ".no-print",
            iframe: true,
            append: null,
            prepend: null,
            manuallyCopyFormValues: true,
            deferred: $.Deferred(),
            timeout: 750,
            title: null,
            doctype: '<div>'
    });
		
	};
	
	
	
	
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
							From Date<input name="fDate" placeholder="yyyy-mm-dd"  autofocus="autofocus" id="fromDate" size="20" >
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

</div>




		</section>

	
</body>
