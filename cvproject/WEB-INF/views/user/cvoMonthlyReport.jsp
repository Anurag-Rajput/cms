<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
$(function() {
$('#sel_bo').on('change', function() {
	var boName = $("#sel_bo option:selected").val();
	$.ajax({
		url : "<c:url value='/boCodeByName'/>",
		type : "POST",
		data : {
			"boName" : boName
		},
		success : function(data) {
			$('#sel_boCode').empty();
			$.each(data, function(key, value) {
				$('#sel_boCode').append("<option value='" + value.officerCode + "'>" + value.officerCode + "</option>");
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


 <script type="text/javascript">
 
			 function myFormSubmit(){
					 $('#myform').submit();
				}
 
 		
            function PreviewImage() {
                pdffile=document.getElementById("i_docupload").files[0];
                pdffile_url=URL.createObjectURL(pdffile);

        		var anchorValue='window.open(pdffile_url,"nyWindow","width=600,Height=400,top=100,left=400");';
        		$('#filedAck').attr('onclick', anchorValue);
        		$('#filedAck').trigger( "click" );
            }
        </script>
<script>
	$(function() {
		$(".fileuploader").change(function() {

			if (typeof (FileReader) != "undefined") {
				var regex = /^([a-zA-Z0-9()\s_\\.\-:])+(.doc|.DOC|.docx|.DOCX|.rtf|.RTF|.png|.jpg|.gif|.pdf|.PDF)$/;
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
						alert(file[0].name + " is not a valid file. Please note that file extension should be doc/DOC/docx/DOCX/rtf/RTF/png/jpg/gif/pdf/PDF");
						divPreview.html("");
						return false;
					}
				});
			} else {
				alert("This browser does not support HTML5 FileReader.");
			}
			$(".fileuploader").empty();
		});
	});
		 </script>
<script type="text/javascript">


$(document).ready(
	      function year() {
	    	  var start = 2016;
	    	  var end = new Date().getFullYear();
	    	  var options = "";
	    	  for(var year = start ; year <=end; year++){
	    	    options += "<option>"+ year +"</option>";
	    	  }
	    	  document.getElementById("year").innerHTML = options;
	    	  }
	      );




</script>

<body>
<br />
<br />
<!--==============================content================================-->

<c:url value="/user/cvo/insertCvoMonthlyReport" var="myurl"/>

<form:form name="myform" id="myform"  action="${myurl}" enctype="multipart/form-data" method="post" commandName="cvoReport"    >
<section id="content">
  <div class="main">
    <div class="wrapper">
        <article class="col-1">
						<div class="inner-text"
							style="width: 300%; background-color: rgb(218,237,241); color: #0E0D01;">
							Welcome: ${loginId} <br /> <small></small>
						</div>

					</article>
          </div>
          
		
      <div class="wrapper">
    
		 
		 <div  align="center" >
		 <br>
		 
		 		<div  class="form-group">
		 			<font color="red" size="10px;"><label>${error}</label> </font>
		 		
		 		
		 		</div>
       <div   style="width:515px; background-color: rgb(218, 237, 241); color: #0E0D01;" ><h3> Upload your report.. </h3></div>
		 <br>
		 <br>
							<div class="form-group">
								<label>Month:</label>&nbsp;<select id="month"  name="month">
									<option value="0">Month</option>
									<option value="1">January</option>
									<option value="2">February</option>
									<option value="3">March</option>
									<option value="4">April</option>
									<option value="5">May</option>
									<option value="6">June</option>
									<option value="7">July</option>
									<option value="8">August</option>
									<option value="9">September</option>
									<option value="10">October</option>
									<option value="11">November</option>
									<option value="12">December</option>
									</select>
									&nbsp;&nbsp;&nbsp;
									
									
									<label>Year:</label>&nbsp;
							<select id="year" name="year">
							</select>
							</div>
							<br><br>
							
							 <div class="form-group">
										<label>	<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Download Sample File of MIS *: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;	</label>
										

													<a href="<c:url value='/resources/report/BlankMISFormat.doc'/>" download="Blank MIS Format">Click Here</a>
											</div><br> 
														
							
							
							<div class="form-group">
										<label>	<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select File *: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;	</label>
										

													<input class="fileuploader" name="uploadedReport"
														type="file" id="i_docupload" /> &nbsp;&nbsp;	&nbsp;&nbsp;	&nbsp;&nbsp;	
														
								 <input type="button" value="Preview" onclick="PreviewImage();" /> 
														 <a  id="filedAck"></a>
											</div><br>
											
											
											<br>
									<div class="form-group">
										<label>	<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select Branch Officer : </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;	</label>
											
												
													<select class="form-control select2" id="sel_bo" name="branchOfficer"
														style="width: 300px;">
														<option value="None">--Select Branch Officer--</option>
														<c:forEach var="bo" items="${mapAllBo}">
															<option value='${bo.officerName}'>${bo.officerName}</option>
														</c:forEach>
													</select>
											


									</div>
									
									<div class="form-group" style="display: none;">
										<label>	<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Branch Officer Code: </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;	</label>
													<select  id="sel_boCode" name="branchOfficerCode"
														style="width: 300px;">

													</select>
												


									</div>
									
									
									
									
									
										<br>
										<br>
											<div class="form-group" align="right">
						            	  <label><button type="button" class="button-2" onclick="myFormSubmit();"
													name="save" >Save</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									  <div class="form-list" align="left">
						               
							   		<a class="button-2"  href="<c:url value="/user/goBack"/>">Close </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							   				</div>
 										</div>
								









	<br></br>		
        
      </div>
		
		</div>
		
    </div>
</section>	
</form:form>	
				
                   
 </body>
