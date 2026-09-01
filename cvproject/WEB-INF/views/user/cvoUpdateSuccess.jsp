<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<meta charset="utf-8" />


<style>
form {
    border: 3px solid #f1f1f1;
}

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: #66D1FF;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #01589C;
}

.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>


<!--[if lt IE 9]>
<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body >

<form name="myform" id="myform"  action="" >
  <!--<div id="skip-link">
    <a href="#main-content" class="element-invisible element-focusable"></a>
  </div>-->
    <script type="text/javascript">
  var fontSize = 100;
  var theme_path = '<c:url value="/resources/user/js/modules/nic"/>';
  </script>

<br><br><br><br>
<article class="fcentre">

						<div class="fcenter">
							<div align="center">
								<div align=""
									style="width: 515px; height:700px; background-color: white; color: #0E0D01;">
									<h3>
										<img src="<c:url value="/resources/user/images/done.gif-c200"/>" align="middle" width="30" height="30"/>CVO Profile Updated Successfully.
										<div class="fright"></div>
									</h3>
								</div>
								</div>
								</div>
								</article>

</form>
  </body>
</html>
