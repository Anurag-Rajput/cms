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


<body>
<br />
<br />
<!--==============================content================================-->

<form name="myform" id="myform" >
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
    
		 
		 <div  align="left" >
		 <br>
       	
		<table>
 			<tr>
 			 <th colspan="3"><strong>Circulars</strong> </th>
  			</tr>
			<tr>
			 <td style="width:5%;">1.<img src="<c:url value="/resources/user/images/newicon.gif"/>"></td>
 			 <td style="width:80%;"><a target="_blank" href="<c:url value="/circulars/sale_of_loan_assets_revised.pdf"/>" ><span class="blink_text" style="color: blue;">Sale of loan assets of the value of Rs. 50 Crs. and above to Assets Reconstruction Companies (ARCs) by Banks- <b>Revised</b></span></a></td>
			 <td style="width:15%;float:right"> 06-09-2018</td>	
			</tr>
 			<tr>
			 <td style="width:5%;">2.</td>
 			 <td style="width:80%;"><a target="_blank" href="<c:url value="/circulars/sale_of_loan_assets.pdf"/>" ><span class="blink_text" style="color: blue;">Sale of loan assets of the value of Rs. 50 Crs. and above to Assets Reconstruction Companies (ARCs) by Banks</span></a></td>
			 <td style="width:15%;float:right"> 30-08-2018</td>	
			</tr>
 		</table>

      </div>
		
		</div>
		
    </div>
</section>	
</form>	
				
                   
 </body>
