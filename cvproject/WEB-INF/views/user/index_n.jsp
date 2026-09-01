<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><head>
<meta charset="utf-8" />
<link rel="shortcut icon" href="<c:url value="/resources/user/images/indeximage/vigilance-icon.png"/>" type="image/vnd.microsoft.icon" />

<meta name="Generator" content="Drupal 7 (http://drupal.org)" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="MobileOptimized" content="width">
<meta name="HandheldFriendly" content="true">
<meta name="apple-mobile-web-app-capable" content="yes">
<!--[if IEMobile]>  <meta http-equiv="cleartype" content="on">  
<![endif]-->
<title>Home | Central Vigilance Commission</title>
<link href="<c:url value="/resources/user/css/system/system.base.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/system.menus.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/system.messages.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/system.theme.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/b51d98b03049363d38c6e8ef608716d2.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/at.layout.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/styleindex.css"/>" rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/user/css/system/search.css"/>" rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/user/js/modules/jquery.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/jquery.once.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/drupal.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/panels.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/jquery.cycle.all.2.74.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/jquery-ui.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/spotlight_carrousel.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/dropdown.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/modules/nic.js"/>" type="text/javascript"></script>
<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {
        if (!navigator.onLine) {
            document.body.innerHTML = 'Loading...';
            window.location = 'ErrorPage.html';}}
      );

</script>

<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 300px; /* Location of the box */
    left: 70;
    top: 0;
    width: 60%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: rgb(44,63,149);
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: rgb(44,63,149);
    color: white;
}

span.tab{
    padding: 0 80px; /* Or desired space*/
}
</style>


<script>

	function searchComplain(){
		var complainNo = document.getElementById("edit-search-block-form--2").value;
		
		$.ajax({
			url : "<c:url value='/user/getDetailsByComplaintNumber'/>",
			type : "POST",
			data : {
				"complainNo" : complainNo
			},
			success : function(data) {
				
					if (data.length > 0) {
				$.each(data, function(key, value) {

					if(value.decision == 'Pending'){
						document.getElementById('modal-para1-body').innerHTML = "Complaint Against<span class='tab'>"+value.complaintAgainstName+"</span><br>Allegation<span class='tab'>"+value.allegationDeatils+"</span><br>Organisation<span class='tab'>"+value.organizationName+"</span><br>&nbsp;";
						document.getElementById('modal-para2-body').innerHTML = "Status<span class='tab' style='color : red;'>Under Process</span><br>";
						$('#myBtn').trigger( "click" );
						
					}else if (value.decision == 'NA') {
						document.getElementById('modal-para1-body').innerHTML = "Complaint Against:<span class='tab'>"+value.complaintAgainstName+"</span><br>Allegation:<span class='tab'>"+value.allegationDeatils+"</span><br>Organisation:<span class='tab'>"+value.organizationName+"</span><br><br><span class='tab'><b>ACTION DETAILS</b></span>";
						document.getElementById('modal-para2-body').innerHTML = "Action taken by CVC: <span class='tab'>Sent to CVO "+value.organizationName+" for necessary action(NA)</span><br>Action Date:<span class='tab'>"+value.decisiondate+"</span><br>Status:<span class='tab' style='color : green;'>Commission dose not expect any report in this matter. Complainant may contact the Cheif Vigilance Officer concerned for futher action in the matter.</span><br> &nbsp;";
						$('#myBtn').trigger( "click" );
						
					}else if (value.decision == 'Filed') {
						document.getElementById('modal-para1-body').innerHTML = "Complaint Against:<span class='tab'>"+value.complaintAgainstName+"</span><br>Allegation:<span class='tab'>"+value.allegationDeatils+"</span><br>Organisation:<span class='tab'>"+value.organizationName+"</span><br><br><span class='tab'><b>ACTION DETAILS</b></span>";
						document.getElementById('modal-para2-body').innerHTML = "Action taken by CVC: <span class='tab'>Filed</span><br>Action Date:<span class='tab'>"+value.decisiondate+"</span><br>Status:<span class='tab' style='color : green;'>Filed as per the complaint handing policy of the commission.</span><br> &nbsp;";
						$('#myBtn').trigger( "click" );
						
					}else if (value.decision == 'IR') {
						document.getElementById('modal-para1-body').innerHTML = "Complaint Against:<span class='tab'>"+value.complaintAgainstName+"</span><br>Allegation:<span class='tab'>"+value.allegationDeatils+"</span><br>Organisation:<span class='tab'>"+value.organizationName+"</span><br><br><span class='tab'><b>ACTION DETAILS</b></span>";
						document.getElementById('modal-para2-body').innerHTML = "Investigation Agency: <span class='tab'>CVO</span><br>Action Taken:<span class='tab'>Investigation & Report(I&R)</span><br>Status:<span class='tab' style='color : red;'>Under Process.</span><br> &nbsp;";
						
						$('#myBtn').trigger( "click" );
						
					}
				});}else{
					document.getElementById('modal-para1-body').innerHTML = "<span class='tab' style='color : red;'>Complaint Number is Not Valid.</span>";
					$('#myBtn').trigger( "click" );
					
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



</script>


<script>

// Get the <span> element that closes the modal

function getModal() {
	document.getElementById('myModal').style.display = 'block';
}

function closeModal() {
	document.getElementById('myModal').style.display = 'none';
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body class="html front not-logged-in one-sidebar sidebar-second page-home i18n-en lang-en site-name-national-informatics-centre page-panels">

<button id="myBtn" onClick="getModal();" style="display: none;"></button>





  <!--<div id="skip-link">
    <a href="#main-content" class="element-invisible element-focusable"></a>
  </div>-->
    <script type="text/javascript">
  var fontSize = 100;
  var theme_path = '<c:url value="/resources/user/js/modules/nic"/>';
  </script>
<!-- Header start -->
<div id="header">
	<div class="container">
    	<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close" onClick="closeModal();">&times;</span>
      <h2>Complaint Status</h2>
    </div>
    <div class="modal-body">
    	<p id="modal-para1-body"></p> <br>
      <p id="modal-para2-body"></p>
      <p></p>
    </div>
    <div class="modal-footer">
      <h3>Central Vigilance Commission</h3>
    </div>
  </div>

</div>
    	
       <div class="logo">
        	 <!--<a href="index.html" title="National Informatics Centre">National Informatics Centre</a>-->
			 <header >

						<!-- start: Branding -->
			<div>

								
				

				
				
								<!-- start: Site name and Slogan hgroup -->
				

					
					
				
				<!-- /end #name-and-slogan -->
								<!-- start: emble -->
				

			</div>
			<!-- /end #branding -->
						 
			<!-- region: Header -->
			
		</header>
        </div>
         <img src="<c:url value="/resources/user/images/indeximage/vigilance-icon.png"/>"  width="117" height="80" style="border-left-width: 0px; border-top-width: 0px; margin-left: -180px;" /> 
        <div class="emblame">
			<img src="<c:url value="/resources/user/images/indeximage/emblame.jpg"/>" width="47" height="64" alt="Emblem" />
		</div>
		<div class="navigation">
			<div class="access">
            	<div class="access">
                      </div>
            </div>
			<div class="nav_search"  id="menu">
				<div class="nav">
						<div class="search" style="display: none;">
							<div class="search_close" title="Close"></div>
							<div class="search_form">
								<div class="region region-search">
									<div id="block-search-form"
										class="block block-search block-odd block-count-1 block-region-search"
										role="search">
										<div class="block-inner clearfix">
											<div class="block-content content">
												<form autocomplete="off" action="/" method="post"
													id="search-block-form" accept-charset="UTF-8">
													<div>
														<div class="container-inline">
															<h2 class="element-invisible">Search form</h2>
															<div
																class="form-item form-type-textfield form-item-search-block-form">
																<label class="element-invisible"
																	for="edit-search-block-form--2">Search </label> <input 
																	title="Enter the complaint number you wish to search for."
																	type="search" id="edit-search-block-form--2" placeholder="XXXX/20XX/vigilance-X"
																	name="search_block_form" style=" width: 90%; height: 100%;"
																	maxlength="28" class="form-text" tabindex="146">
															</div>
															<div class="form-actions form-wrapper" id="edit-actions">
																<input type="button" id="edit-submit" name="op" onClick="searchComplain();"
																	value="Search" class="form-submit" tabindex="147">
															</div>
														
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--<a id="mainmenu" role="link" name="Link" ></a>-->
					<!--stqc error 19-02-2015 <a id="mainmenu" role="link"> </a> -->
					<!-- Navigation elements -->
																				<!--<ul id="nav">
																				<li class=""><a href="<c:url value="/citizenRegister"/>">Citizen Registration to lodge a complain</a></li>
																			<li class=""><a href="<c:url value="/login"/>">Login to portal</a></li>
							<li>KNOW YOUR COMPLAINT STATUS &nbsp; &nbsp;<a class="srch_show" title="Search for complaint status" href="#" name="SiteSearch" tabindex="150">Search </a> </li>
							
																			
																			
																			
																			</ul>-->				</div>
				
			
						
			</div>
		</div>
    </div>
</div>
<!-- Header end -->



<!-- Four blocks end -->
				
<table width="100%"  border="1">
    <tr>
      <td width="33.5%" style="padding-left:70px;" height="700px">&nbsp;<div class="panel-pane pane-views pane-banner-animation-for-home banner"  id="banner">
  
      
  
  <div class="pane-content">
    <div class="view view-banner-animation-for-home view-id-banner_animation_for_home view-display-id-block banner-slider view-dom-id-b851f5e69598d4e2da2d76e3b92a0ace">
            <div class="view-header">
      <div id="slide_num"><div class="slide_num"></div></div>    </div>
  
  
  
      <div class="view-content">
        <div class="views-row views-row-1 views-row-odd views-row-first">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide" >
<div class="cont">
                <div class="banner_text">
                    <a href="https://cvc.nic.in/" title="External link that opens in a new window - Read More about CVC" target="_blank"></a>
                      
 <div class="color_hide">	#2c3f95 	</div>     
             
					
                    <a href="https://cvc.nic.in/" title="External link that opens in a new window - Read More about CVC" target="_blank"> </a>
                    <a href="https://cvc.nic.in/" class="banner_more" title="External link that opens in a new window - Read More about CVC" target="_blank"></a>                </div>
			<div class="banner_image">
<a href="https://cvc.nic.in/" class="banner_more" title="External Link- Read More about CVC" target="_blank"><img typeof="foaf:Image" src="resources/user/images/indeximage/cvcbanner.jpg" width="510" height="347" alt="" /></a></div>
            </div>
</div></div>  </div>  </div>
  <div class="views-row views-row-2 views-row-even">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide">
<div class="cont">
                <div class="banner_text">
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about pledge" target="_blank"></a>
                      
 <div class="color_hide">	#2c3f95 	</div>     
             
					
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about pledge" target="_blank"> </a>
                    <a href="https://pledge.cvc.nic.in/" class="banner_more" title="External link that opens in a new window - Read More about pledge" target="_blank"></a>                </div>
			<div class="banner_image">
<a href="https://pledge.cvc.nic.in/" class="banner_more" title="External Link- Read More about Read More about pledge" target="_blank"><img typeof="foaf:Image" src="resources/user/images/indeximage/vig-aware.jpg" width="510" height="347" alt="" /></a></div>
            </div>
</div></div>  </div>  </div>
  <div class="views-row views-row-3 views-row-odd">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide">
<div class="cont">
                <div class="banner_text">
                    <a href="http://pdsportal.nic.in/main.aspx" title="External link that opens in a new window - Read More about pdsportal" target="_blank"></a>
                      
 <div class="color_hide">	#2c3f95 	</div>     
             
					
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about pdsportal" target="_blank"> </a>
                    <a href="https://pledge.cvc.nic.in/" class="banner_more" title="External link that opens in a new window - Read More about pdsportal" target="_blank"></a>                </div>
			<div class="banner_image">
<a href="https://pledge.cvc.nic.in/" class="banner_more" title="External Link- Read More about pdsportal" target="_blank"><img typeof="foaf:Image" src="resources/user/images/indeximage/212.jpg" width="510" height="347" alt="" /></a></div>
            </div>
</div></div>  </div>  </div>
  <div class="views-row views-row-4 views-row-even">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide">
<div class="cont">
                <div class="banner_text">
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about scholarships" target="_blank"></a>
                      
 <div class="color_hide">	#2c3f95 	</div>     
             
					
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about scholarships" target="_blank"> </a>
                    <a href="https://pledge.cvc.nic.in/" class="banner_more" title="External link that opens in a new window - Read More about scholarships" target="_blank"></a>                </div>
			<div class="banner_image">
<a href="https://pledge.cvc.nic.in/" class="banner_more" title="External Link- Read More about scholarships" target="_blank"><img typeof="foaf:Image" src=" resources/user/images/indeximage/66.jpg"  width="510" height="347" alt="" /></a></div>
            </div>
</div></div>  </div>  </div>
  <div class="views-row views-row-5 views-row-odd views-row-last">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide">
<div class="cont">
                <div class="banner_text">
                    <a href="" title="External link that opens in a new window - Read More about CBPS Banner" target="_blank"></a>
                      
 <div class="color_hide">	 	</div>     
             
					
                    <a href="" title="External link that opens in a new window - Read More about CBPS Banner" target="_blank"><img src=" resources/user/images/indeximage/sample-certificate.jpg"  id="_8NC6yEayPuuiYaxV" width="510" height="347" alt="" onClick="javascript:window.open('https://subscriber.cbps.gov.in/aff/8NC6yEayPuuiYaxV')" style="cursor:pointer" onload="javascript:(function(){if(typeof _done == 'undefined' || !_done){this.setAttribute('src', this.getAttribute('src')+'?'+Math.floor((Math.random() * 100) + 1)); _done=true;}}).call(this)" > </a>
                    <a href="" class="banner_more" title="External link that opens in a new window - Read More about CBPS Banner" target="_blank"></a>                </div>
			<div class="banner_image">
<a href="" class="banner_more" title="External Link- Read More about CBPS Banner" target="_blank"></a></div>
            </div>
</div></div>  </div>  </div>
    </div>
</div>  </div>
  </div></td>
      <td width="33%" height="700px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <a href=" citizenRegister" ><b style="font-size:18px;"><img src="resources/user/images/bullet.png"  width="15" height="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CITIZEN REGISTRATION TO LODGE A COMPLAIN</b></a>
	  </br></br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <a href=" login" ><b style="font-size:18px;"><img src="resources/user/images/bullet.png"  width="15" height="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOGIN TO PORTAL</b></a>
	  </br></br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <a title="Search for complaint status" href="#" name="SiteSearch" tabindex="150"><b style="font-size:18px;  background:url(resources/user/images/slider-img3.jpg); background:url(../images/search-icon.png) 0 0 no-repeat;"><img src="resources/user/images/bullet.png"  width="15" height="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;KNOW YOUR COMPLAINT STATUS</b>  </a>
	  <a class="srch_show" title="Search for complaint status" href="#" name="SiteSearch" tabindex="150">Search </a>
	  
	  </td>
      <td width="33.5%" style="padding-right:70px; " height="700px;"><div class="panel-pane pane-views pane-banner-animation-for-home banner"  id="banner">
  
      
  
  <div class="pane-content">
    <div class="view view-banner-animation-for-home view-id-banner_animation_for_home view-display-id-block banner-slider view-dom-id-b851f5e69598d4e2da2d76e3b92a0ace">
            <div class="view-header">
      <div id="slide_num"><div class="slide_num"></div></div>    </div>
  
  
  
      <div class="view-content">
        <div class="views-row views-row-1 views-row-odd views-row-first">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide" >
<div class="cont">
                <div class="banner_text">
                    <a href="https://cvc.nic.in/" title="External link that opens in a new window - Read More about CVC" target="_blank"></a>
                      
 <div class="color_hide">	#2c3f95 	</div>     
             
					
                    <a href="https://cvc.nic.in/" title="External link that opens in a new window - Read More about CVC" target="_blank"> </a>
                    <a href="https://cvc.nic.in/" class="banner_more" title="External link that opens in a new window - Read More about CVC" target="_blank"></a>                </div>
			<div class="banner_image">
<a href="https://cvc.nic.in/" class="banner_more" title="External Link- Read More about CVC" target="_blank"><img typeof="foaf:Image" src="resources/user/images/indeximage/212.jpg" width="510" height="347" alt="" /></a></div>
            </div>
</div></div>  </div>  </div>
  <div class="views-row views-row-2 views-row-even">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide">
<div class="cont">
                <div class="banner_text">
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about pledge" target="_blank"></a>
                      
 <div class="color_hide">	#2c3f95 	</div>     
             
					
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about pledge" target="_blank"> </a>
                    <a href="https://pledge.cvc.nic.in/" class="banner_more" title="External link that opens in a new window - Read More about pledge" target="_blank"></a>                </div>
			<div class="banner_image">
<a href="https://pledge.cvc.nic.in/" class="banner_more" title="External Link- Read More about Read More about pledge" target="_blank"><img typeof="foaf:Image" src="resources/user/images/indeximage/66.jpg" width="510" height="347" alt="" /></a></div>
            </div>
</div></div>  </div>  </div>
  <div class="views-row views-row-3 views-row-odd">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide">
<div class="cont">
                <div class="banner_text">
                    <a href="http://pdsportal.nic.in/main.aspx" title="External link that opens in a new window - Read More about pdsportal" target="_blank"></a>
                      
 <div class="color_hide">	#2c3f95 	</div>     
             
					
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about pdsportal" target="_blank"> </a>
                    <a href="https://pledge.cvc.nic.in/" class="banner_more" title="External link that opens in a new window - Read More about pdsportal" target="_blank"></a>                </div>
			<div class="banner_image">
<a href="https://pledge.cvc.nic.in/" class="banner_more" title="External Link- Read More about pdsportal" target="_blank"><img typeof="foaf:Image" src="resources/user/images/indeximage/cvcbanner.jpg" width="510" height="347" alt="" /></a></div>
            </div>
</div></div>  </div>  </div>

<div class="views-row views-row-5 views-row-odd views-row-last">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide">
<div class="cont">
                <div class="banner_text">
                    <a href="" title="External link that opens in a new window - Read More about CBPS Banner" target="_blank"></a>
                      
 <div class="color_hide">	 	</div>     
             
					
                    <a href="" title="External link that opens in a new window - Read More about CBPS Banner" target="_blank"><img src=" resources/user/images/indeximage/sample-certificate.jpg"  id="_8NC6yEayPuuiYaxV" width="510" height="347" alt="" onClick="javascript:window.open('https://subscriber.cbps.gov.in/aff/8NC6yEayPuuiYaxV')" style="cursor:pointer" onload="javascript:(function(){if(typeof _done == 'undefined' || !_done){this.setAttribute('src', this.getAttribute('src')+'?'+Math.floor((Math.random() * 100) + 1)); _done=true;}}).call(this)" > </a>
                    <a href="" class="banner_more" title="External link that opens in a new window - Read More about CBPS Banner" target="_blank"></a>                </div>
			<div class="banner_image">
<a href="" class="banner_more" title="External Link- Read More about CBPS Banner" target="_blank"></a></div>
            </div>
</div></div>  </div>  </div>

  <div class="views-row views-row-4 views-row-even">
      
  <div class="views-field views-field-title">        <div class="field-content">
<div class="slide">
<div class="cont">
                <div class="banner_text">
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about scholarships" target="_blank"></a>
                      
 <div class="color_hide">	#2c3f95 	</div>     
             
					
                    <a href="https://pledge.cvc.nic.in/" title="External link that opens in a new window - Read More about scholarships" target="_blank"> </a>
                    <a href="https://pledge.cvc.nic.in/" class="banner_more" title="External link that opens in a new window - Read More about scholarships" target="_blank"></a>                </div>
			<div class="banner_image">
			
<a href="https://pledge.cvc.nic.in/" class="banner_more" title="External Link- Read More about scholarships" target="_blank"><img typeof="foaf:Image" src=" resources/user/images/indeximage/vig-aware.jpg"  width="510" height="347" alt="" /></a></div>
            </div>
</div></div>  </div>  </div>
  
    </div>
</div>  </div>
  </div></td>
    </tr>
  </table>



				<!-- Footer start -->
<div class="footer">
	
	<div class="top_panel">
		<div class="container">
			<div class="left">   <div class="region region-footer">
    <div id="block-panels-mini-footer" class="block block-panels-mini block-odd block-count-3 block-region-footer">
  <div class="block-inner clearfix">
                <div class="block-content content">
      <div class="panel-flexible panels-flexible-18 clearfix" id="mini-panel-footer">
<div class="panel-flexible-inside panels-flexible-18-inside">
<div class="panels-flexible-region panels-flexible-region-18-left panels-flexible-region-first ">
  <div class="inside panels-flexible-region-inside panels-flexible-region-18-left-inside panels-flexible-region-inside-first">
<div class="panel-pane pane-custom pane-4" >
  
      
  
  <div class="pane-content">
    <ul class="footer_nav"><li ><a href="http://cvc.gov.in/useful_links.htm" >Useful Links</a></li><li ><a href="http://cvc.gov.in/tofuse.htm" target="_BLANK" title="External site that opens in a new window ">Terms of Use</a></li><li ><a href="http://cvc.nic.in/contact.htm">Contact Us</a></li></ul>  </div>

  
  </div>
  </div>
</div>
<div class="panels-flexible-region panels-flexible-region-18-center ">
  <div class="inside panels-flexible-region-inside panels-flexible-region-18-center-inside">
<div class="panel-pane pane-custom pane-3" >
  
      
  
  <div class="pane-content">
    <div class="project_logos project_logos2">
   <h3 class="hide">Related Links</h3>
	<ul>
<li></li>
		
	</ul>
</div>

  </div>

  
  </div>
  </div>
</div>
<div class="panels-flexible-region panels-flexible-region-18-regoin4 panels-flexible-region-last ">
  <div class="inside panels-flexible-region-inside panels-flexible-region-18-regoin4-inside panels-flexible-region-inside-last">
<div class="panel-pane pane-custom pane-5 footer_add" >
  
      
  
  <div class="pane-content">
    <span>Contact Details:</span>
                    <div ><a href="http://cvc.nic.in/"  title="CENTRAL VIGILANCE COMMISSION">CENTRAL VIGILANCE COMMISSION</a></div>
                    Satarkata Bhavan , A-Block<br>
					GPO Complex , INA <br>                    
                    New Delhi - 110 003 India<br>
                    EPABX :- 011- 24600200  (30 Lines)   <br>
					FAX : 011- 24651010/24651186		
	  </div>

  
  </div>
  </div>
</div>
</div>
</div>
    </div>
  </div>
</div>
  </div>
			</div>
		   		</div>
	</div>
	
	<div class="bottom_panel">
		<div class="container">
			Content Provided & Maintained by Central Vigilance Commission | Website Designed & Developed by National Informatics Centre
		</div>
	</div>
</div>
<!-- Footer end -->

  </body>
</html>
