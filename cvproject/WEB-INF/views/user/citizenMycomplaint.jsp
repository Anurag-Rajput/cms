
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%-- <script  src="<c:url value="/resources/user/js/pdf.js"/>"  type="text/javascript"></script>
<script  src="<c:url value="/resources/user/js/pdf.worker.js"/>"  type="text/javascript"></script> --%>

<%@ page import="java.util.*,java.io.*"%>
<%@ page import="java.net.*"%>

<%-- <object data="${pageContext.request.contextPath}/Test.pdf" 
type="application/pdf" width="500" height="300">
<a href="${pageContext.request.contextPath}/Test.pdf">Download file.pdf</a> --%>

<head>
<script type="text/javascript">

$(document).ready(function() {
	$('#divviewer').hide();	
});

<%-- 
<%!
public static String getMimeType(String fileUrl)
throws java.io.IOException, MalformedURLException
{
String type = null;
URL u = new URL(fileUrl);
URLConnection uc = null;
uc = u.openConnection();
type = uc.getContentType();
return type;
}

%>

<%
String file=request.getParameter("f");
File f = new File (file);
String filename=f.getName();
String type=getMimeType("file:"+file);

response.setContentType (type);
response.setHeader ("Content-Disposition", "attachment; filename=\""+filename+"\"");

String name = f.getName().substring(f.getName().lastIndexOf("/") + 1,f.getName().length());
InputStream in = new FileInputStream(f);
ServletOutputStream outs = response.getOutputStream();

int bit = 256;
int i = 0;
try {
while ((bit) >= 0) {
bit = in.read();
outs.write(bit);
}
} catch (IOException ioe) {
ioe.printStackTrace(System.out);
}
outs.flush();
outs.close();
in.close();
%>
 --%>
</script>
<script>
	function getComplain() {
		
		var complainNo = document.getElementById("c_no").value;
		
			$.ajax({
				url : "<c:url value='/user/getComplainByNo'/>",
				type : "POST",
				data : {
					"complainNo" : complainNo
				},
				success : function(data) {
						$('#table-body').empty();
						if (data.length > 0) {
		                    
					$.each(data, function(key, value) {

						/* $('#table-body').append(
			                    $('<tr>')
			                        .append($('<td>').append(""+value.senderName+""))
			                        .append($('<td>').append(""+value.complaindate+""))
			                        .append($('<td>').append(""+value.organizationName+""))
			                        .append($('<td>').append(""+value.complaint+""))
			                        .append($('<td>').append(""+value.section+""))
			                       .append($('<td>').append(""+check+"")) 
			                ); */
						
						 $('#table-body').append('<tr>'+
								'<td>'+value.senderName+'</td>'+
								'<td>'+value.complaindate+'</td>'+
								'<td>'+value.organizationName+'</td>'+
								'<td>'+value.complaint+'</td>'+
								'<td>'+value.section+'</td>'+
								'<td></td>'+
								'<td></td>'+
								'</tr>'); 
					});}
						else{
							alert("No Record Found.");
						}
					
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
	$(function() {
		$(".fileuploader").change(function() {

			if (typeof (FileReader) != "undefined") {
				var regex = /^([a-zA-Z0-9()\s_\\.\-:])+(.PDF|.pdf)$/;
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
		});});
	
	function PreviewImage() {
	/* 	pdffile=document.getElementById("i_docupload").files[0];
	    pdffile_url=URL.createObjectURL(pdffile);
	    path="C:\CVC\complain-documents\eb8b74be-eeec-45bd-a582-56995546f7a9.pdf";
	    if(path.value==document.getElementById("i_docupload").value){alert("matched");}
	    else{alert("not matched");}
	    $('#viewer').attr('src',pdffile_url); */
	}
	
/* function openPdf(){
	
	var pdf= document.getElementById("pdf").value;
	
	  	} */
 
</script>


				


<style>
table {
    width:100%;
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
</head>
<body id="page2">
<form >


<!--==============================content================================-->

<section id="content">
  <div class="main">
    <div class="wrapper">
    
     
      <center>
       <div style="width:515px; background-color: rgb(218, 237, 241); color: #0E0D01;" ><h3> Complaint Cell</h3></div>
		 
		 <div  align="center" style=" background-color: rgb(255, 201, 167); color: #0E0D01;" ></div>
		 
        <div style="width: 1000px; height: 1200px;">
        <br></br>
          <form >
           
		   
		   
		   
		
		  
            <div class="form-group">
            <label>Search:</label>&nbsp;<br/>
            <label>Provide bold number only.Ex <b>XXXX</b>/20XX/vigilance-X</label>
               <span>   <input  name="serach_complain" id="c_no" size="20" /> &nbsp;&nbsp;&nbsp;
				<button type="button" class="button-2" id="com_srch" onclick="getComplain();" >Search</button></span>
			
            </div>  <br></br>
           
                       
            <!-- <div class="form-group" style="align:right;">
              <label></label> onclick="getComplain()" 
			  <div class="form-list" style="align:left;">
           <button type="submit" class="button-2"   name="submit" value="">Reset</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   </div>
            </div>   -->
            	<hr style='background-color:red;border-width:0;color:#000000;height:2px;line-height:0;text-align:left;width:100%;'/><br><br> 
 
            
           	<table>
            <thead>
              <tr>
                <th>Sender Name</th>
    			 <th>Complaint Date</th>
    			 <th>Organization</th>
    			<th>Complain No.</th>
    			 <th>section</th>
    			 <th>Decision</th>
    			 <th>Detail View</th>
    			</tr>
          </thead>
            
            <tbody id="table-body">
			<c:forEach var="citizenComplain" items="${citizenComplain}">
           <tr class="list-group-item-success">
         	<td>${citizenComplain.senderName}</td>
			<td>${citizenComplain.complaindate}</td>
			<td>${citizenComplain.organizationName}</td>
			<td>${citizenComplain.complaint}</td>
			<td>${citizenComplain.section}</td>
			<td>${citizenComplain.decision}</td>
			<td><c:if test="${citizenComplain.uploadDocument!=''}">
			            <a style="color:blue;"  onclick="window.open('<c:url value='/uploadDoc/${citizenComplain.uploadDocument}'/>','nyWindow','width=600,Height=400,top=100,left=400');">Click Here</a>
	        </c:if></td>
	        </tr>
      	  </c:forEach>
			</tbody>
      </table>
     <!--  <input class="fileuploader" name="uploadScanDocument"	type="file" id="i_docupload" /> <br />
    <article class="col-1">
						<div class="fleft"
							style="width: 680px; height: 670px; background-color: #56595D">
							<iframe id="viewer" width="680px"
								height="670px"> </iframe>
						</div>
	</article> -->

	</form></div>

       </center>
    </div>
  </div>
  
</section>
<!--==============================footer=================================-->

<footer id="footer">
	<div class="main">
		<div class="aligncenter">
			<span>Copyright &copy; <b style="color: black;">Central vigilance
					commission</b> All Rights Reserved
			</span>
		</div>
	</div>
</footer>

</form>

</body>
