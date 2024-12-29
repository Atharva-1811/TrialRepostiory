<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>

	<style type="text/css">
	
	div.dataTab 
	{
        width: 80%;
    }
	</style>
	</head>

<!-- For datatable to pdf,print,excel etc conversion -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
 <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

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

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">	

<script type="text/javascript" src="/embelSoft/staticContent/js/employeeDetails.js"></script>

<link rel="stylesheet" href="/embelSoft/staticContent/css/Report.css">

<!--     <script>
	     $(document).ready(function(){
	    	 getExEmployeeDetailsReport();
	}); 
	</script>
 -->
<!-- 	<script type="text/javascript"> -->

// 	$(document).ready(function(){
// 	    $('#exEmpDetails').DataTable();
// 	} );

<!-- 	</script> -->

	
  <body>  
	<div class="container" >
	

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" >Previous Employee Details Report</h2>
			</div>
		</div>

<!-- <div class="row"> -->


		<div class="row">
			<div class="form-group">
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
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
			</div>
		
	<!-- <div id="date">
		<label id="demo"></label>
		<script>
			var date = new Date();
			document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div> -->
		
	<div id="wrqpper">	
 <form class="form-horizontal" method="post" action="" name="empReport1">
 
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-3" >
						<label class="control-label" for="employeename">Employee Name&nbsp;:<sup>*</sup></label>  
          				</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"></i>
							</span>
						    <%
						    EmployeeDetailsDao sdd3 = new EmployeeDetailsDao();
							List sList4 = sdd3.getAllpreviousEmployee();
							 %>
							 <input list="employeeNameList" id="fk_employee_id" class="form-control">
								<datalist id="employeeNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
									EmployeeDetailsHibernate sup = (EmployeeDetailsHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkEmpId()%>"
									value="<%=sup.getFirstName()%> <%=sup.getLastName()%>">
									
									<%
										}
									%>
								</datalist>
							</div>
						</div>
					
		</div>
				<div align="center">
				      <input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getExEmployeeDetailsReportValidation()" value="Search" />
			      </div>
			      <br>
			      <br>
<!-- 
		<div class="row form-group buttons_margin_top ">
			<div align="center">
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getExEmployeeDetailsReportValidation()" value="Search" />
			</div>
		</div> -->
		
		

	<div id="dataTab">
	<div id="container">
                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf"
						id="exEmpDetails" class="display"
						style="border: 1px solid white; border-collapse: collapse;">
						<thead>
							<tr>
							    <th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Date_Of_Birth</th>
								<th>ID Number</th>
								<th>Designation</th>
								<th>Contact Number</th>
								<th>Alternate Contact Number</th>
								<th>Email</th>
								<th>Current Address</th>
								<th>Education</th>
								<th>Technology</th>
								<th>Previous Experience</th>
								<th>Salary Description</th>
								<th>Reference By</th>
								<th>Interview Taken By</th>
								<th>Date_Of_Joining</th>
								<th>Date_Of_Leaving</th>
								<th>Previous Company Name</th>
								<th>Zip code</th>
								<th>Confirmation Email</th>
								<th>Comment</th>
								<th>Employee Description</th>
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
			</form>
		</div>
		</div>
		</body>
