<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.bean.GetEmployeeDetailsBean"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<script>
$(document).ready(function(){
	employeeList();
}); 
</script>
<script type="text/javascript">
function Back() {
	 window.location = "EmployeeDetails.jsp";
}
</script>
	
<script type="text/javascript">
$('#empDetails').dataTable({
	"bInfo" : false
});
</script>
	  
<!-- For datatable to pdf,print,excel etc conversion to connect offline jars -->
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/jquery-1.12.4.js"></script> 
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/buttons.flash.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/jszip.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/pdfmake.min.js"></script>	
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/vfs_fonts.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/buttons.html5.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/buttons.print.min.js"></script>
<link rel="stylesheet" href="/embelSoft/staticContent/cssForReport/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="/embelSoft/staticContent/cssForReport/buttons.dataTables.min.css">

<script src="/embelSoft/staticContent/js/employeeDetails.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">


<link rel="stylesheet" href="/embelSoft/staticContent/css/venderlist.css">

<style type="text/css">
td {
	color:  black;
}
</style>
					     
</head>
<body>
<div class="container" style="min-height:300px;">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Employee List</h2>
			</div>
		</div>
		
		
		<div class="row">
			<div class="form-group" align="right">
			    <div class="col-sm-offset-6 col-md-5 control-label">
						<div id="date">
							<label id="demo"></label>
							<script>
							   var date = new Date();
							   document.getElementById("demo").innerHTML = date.toDateString();
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
		     <div class="container-fluid">
		<div class="table-responsive">
		<table class="table table-bordered table-striped table-condensed cf"
					id="empDetails" class="display"
					style="border: 1px solid white; border-collapse: collapse;">
			<thead>
				<tr>
					<th>Sr No</th>
					<th>First Name</th>
					<th>Middle Name</th>
					<th>Last Name</th>
					<th>Date_Of_Birth</th>
					<th>ID Number</th>
					<th>Designation</th>
					<th>Contact Number</th>
					<th>Alternate Contact Number</th>
					<th>Email</th>
					<th>Confirmation Email</th>
					<th>Current Address</th>
					<th>Permanent Address</th>
					<th>Education</th>
					<th>Technology</th>
					<th>Previous Experience</th>
					<th>Salary Description</th>
					<th>Reference By</th>
					<th>Interview Taken By</th>
					<th>Date Of_Joining</th>
					<th>Previous Company Name</th>
					<th>Zip code</th>
					<th>Comment</th>
					<th>Employee Condition</th>
					<th>Aadhaar Number</th>
					<th>Pan Number</th>
					<th>Department</th>
				</tr>
			</thead>
			<tfoot>
			</tfoot>
		</table>
		</div>
		</div>
		</div>
	<div class="wrapper" align="center">
		<input type="button" style=" font-size: 25" value="Back" id="backBtn" class="btn btn-primary btn-lg btnn" onclick="Back()" /> 
	</div>
</div>
</body>
<%@include file="commons/newFooter.jsp" %>
