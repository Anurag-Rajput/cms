<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>cvproject</title>
<link href="<c:url value="/resources/user/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/user/fonts/css/font-awesome.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/user/css/animate.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/user/css/custom.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/user/css/icheck/flat/green.css"/>" rel="stylesheet" />
<script src="<c:url value="/resources/user/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/user/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/user/js/chartjs/chart.min.js"/>"></script>
<script src="<c:url value="/resources/user/js/nicescroll/jquery.nicescroll.min.js"/>"></script>
<script src="<c:url value="/resources/user/js/icheck/icheck.min.js"/>"></script>
<script src="<c:url value="/resources/user/js/custom.js"/>"></script>
<script src="<c:url value="/resources/user/js/bootstrap-progressbar.min.js"/>"></script>
</head>
<body class="nav-md" style="background: rgb(154,191,207);">
	<div class="container body">
		<div class="main_container">
			<!-- page content -->
			<div class="col-md-12">
				<div class="col-middle">
					<div class="text-center text-center">
						<h1 class="error-number">404</h1>
						
						<h2><img src="<c:url value="/resources/user/images/error.gif"/>" align="middle" width="100" height="100" ><label>Oops!! Something went wrong.</label></h2>
						<p>
							This page you are looking for does not exist.
						</p>
						<div class="mid_center">
							<h3>Search</h3>
							<form>
								<div class="col-xs-12 form-group pull-right top_search">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Search for..."> <span class="input-group-btn">
											<button class="btn btn-default" type="button">Go!</button>
										</span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
		</div>
		<!-- footer content -->
	</div>
	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
		</ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>
</body>
</html>