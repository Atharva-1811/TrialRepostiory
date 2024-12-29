<!-- AccessControlList.jsp -->
<%@page import="com.embelSoft.bean.UserDetailsBean"%>
<%@page import="com.embelSoft.dao.UserDetailasDao"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<link href="/embelSoft/staticContent/css/StyleValidation.css"
	rel="stylesheet" type="text/css" />
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="/embelSoft/staticContent/js/AccessControl.js"></script>

<script>
	$(document).ready(function() {
		accessControlList();
	});
</script>
<script type="text/javascript">
	function Back() {
		window.location = "AccessControl.jsp";
	}
</script>

<!-- For datatable to pdf,print,excel etc conversion -->



<!-- For datatable to pdf,print,excel etc conversion to connect offline jars -->
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/jszip.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/pdfmake.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/vfs_fonts.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/jsForReport/buttons.print.min.js"></script>
<link rel="stylesheet"
	href="/embelSoft/staticContent/cssForReport/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="/embelSoft/staticContent/cssForReport/buttons.dataTables.min.css">

<link rel="stylesheet"
	href="/embelSoft/staticContent/css/venderlist.css">

<style type="text/css">
td {
	color: black;
}
</style>
</head>
<body>
	<div class="container">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Access Control List</h2>
			</div>
		</div>
		<div class="row">
			<div class="form-group" align="right">
				<div class="col-sm-offset-6 col-md-5 control-label">
					<div id="date">
						<label id="demo"></label>
						<script>
							var date = new Date();
							document.getElementById("demo").innerHTML = date
									.toDateString();
						</script>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>

		<div id="date">
			<label id="demo"></label>
			<script>
				var date = new Date();
				document.getElementById("demo").innerHTML = date.toDateString();
			</script>
		</div>
		<div id="dataTab">
			<!-- <div class="container"> -->
			<div class="table-responsive">
				<table class="table table-bordered table-striped table-condensed cf"
					id="list2" class="display"
					style="border: 1px solid white; border-collapse: collapse;">
					<thead>
						<tr>
							<th>Sr No</th>
							<th>Name</th>
							<th>User Name</th>
							<th>Password</th>
							<th>User Type</th>
						</tr>
					</thead>
					<tfoot>
					</tfoot>
				</table>
			</div>
		</div>

		<div class="wrapper" align="center">
			<input type="button" style="font-size: 25" value="Back" id="listBtn"
				class="btn btn-primary btn-lg btnn" onclick="Back()" />
		</div>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#list2').DataTable({
					"paging" : false,
					"ordering" : false,
					"info" : false
				});
			});
		</script>
		<%@include file="commons/newFooter.jsp"%>
	</div>
</body>