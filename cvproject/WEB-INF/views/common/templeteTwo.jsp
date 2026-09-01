<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title><tiles:insertAttribute name="title" /></title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
       <meta http-equiv="cache-control" content="max-age=0" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="Expires" content="-1"/>
	<meta http-equiv="pragma" content="no-cache" />
	<title>CVC</title>
	<link rel="stylesheet" href="<c:url value="/resources/user/css/reset.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/style.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/layout.css"/>" type="text/css" media="screen"></link>
<link rel="stylesheet" href="<c:url value="/resources/user/css/prettyPhoto.css"/>" type="text/css" media="screen"></link>
<link type="text/css" rel="stylesheet" href="<c:url value="/resources/user/js/select/select2.css"/>"  ></link><%-- 
<link rel="stylesheet" href="<c:url value="/resources/user/js/calendar-win2k-cold-1.css"/>" type="text/css" media="screen"></link> --%>

<script src="<c:url value="/resources/user/js/jquery-1.12.0.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-yui.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/cufon-replace.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/Dynalight_400.font.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/FF-cash.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.prettyPhoto.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/hover-image.js"/>"type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.easing.1.3.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery.bxSlider.js"/>"type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/calendar.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/jquery-1.12.0.js"/>"  type="text/javascript"></script>
<script src="<c:url value="/resources/user/js/select/select2.js"/>"  type="text/javascript"></script><%-- 
<script src="<c:url value="/resources/user/js/calendar-en.js"/>"  type="text/javascript"></script> --%>
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

<script type = "text/javascript" >

		$(document).ready(
      function burstCache() {

        if (!navigator.onLine) {

            document.body.innerHTML = 'Loading...';

            window.location = 'ErrorPage.html';}}
      );

</script>	
<script>
	$(function() {
		$(".fileuploader").change(function() {

			if (typeof (FileReader) != "undefined") {
				var regex = /^([a-zA-Z0-9()\s_\\.\-:])+(.doc|.docx|.pdf)$/;
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
		});
	
	
	
	$('#s_org').on('change', function() {
		var orgId = $("#s_org option:selected").val();
		$.ajax({
			url : "<c:url value='/branchByOrgination'/>",
			type : "POST",
			data : {
				"orgId" : orgId
			},
			success : function(data) {
				$('#section_id').empty();
				$.each(data, function(key, value) {
					$('#section_id').append("<option value='" + value.orgSection + "'>" + value.orgSection + "</option>");
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
<script>
$(document).ready(function() {
	$(".select2").select2({
		placeholder : "Select organization",
		allowClear : true,
	});
});
</script>


<!-- For Calender-->
<link type="text/css" rel="stylesheet"
	href="<c:url value="/resources/user/css/calendar.css"/>" />
<script src="<c:url value="/resources/user/js/calendar.js"/>"
	type="text/javascript"></script>

<!-- For Validation-->
<script type="text/javascript"
	src="<c:url value="/resources/user/js/gen_validatorv31.js"/>"></script>
  

</head>
<tiles:insertAttribute name="headerTwo" />
<body>
<tiles:insertAttribute name="body" />
</body>
<tiles:insertAttribute name="footer" />
</html>