<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>

<head>


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

  	<script src="/embelSoft/staticContent/js/clientEnquiry.js"></script>

  	
  	<script>
	     $(document).ready(function(){
	    	 clientResponseFollowUp();
	}); 
	</script>
	
	<html>
  <body id="dt_example" class="master_form_img">
<div class="container" > 
<div class="row" style="min-height:300px;">


 		<div class="row">
			<div align="center" style="margin-top: 75px">
				  <h2 class="form-name style_heading">Client FollowUp Report</h2>
			</div>
				 	
			 <div class="row">
				<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color:#c1b1b1;">
				</div>	
			  </div>
		</div>

    <div  class="col-md-12">
<!-- 
		<ul class="nav nav-tabs">
		
		    <li class="active"><a data-toggle="tab" href="#betweendates"><h4 style="color:blue">Range</h4></a></li>
		    <li><a data-toggle="tab" href="#withnames"><h4 style="color:blue">Employee Name Wise</h4></a></li>
	    
 	 	</ul> -->
	<div class="tab-content" style="float: left">
	
 					<!------------ Employee Payment Report Between Two Dates ---------->
 				
 <div class="tab-pane fade in active" id="betweendates">
<form class="form-horizontal" method="post" action="" name="dates">


	<div class="row">
	
		<div class="form-group" align="right">
			<div class="col-sm-offset-8 col-md-4 control-label">
				<div id="date">
					<label id="demo"></label>
					<script>
						var date = new Date();
						document.getElementById("demo").innerHTML = date.toDateString();
					</script>
				</div>
			</div>
		</div>
 
		<div class="row">
		<!-- 	<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		 -->
	 	<form class="form-horizontal" method="post" action="" name="empReport1">
				<div class="row">
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Start Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fisDate4" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>

						<div class="col-sm-2" align="right">
							<label class="control-label">End Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
								 <input type="date" id="endDate4" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
				</div>

		<div class="row form-group buttons_margin_top ">
			<div align="center">
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="clientResponseFollowUpValidation()" value="Search" />
			</div>
		</div>

					<table
						class="table table-bordered table-striped table-condensed cf"
						id="clientResponseFollowUp" class="display"
						style="border: 2px solid black; border-collapse: collapse;">
						<thead>
							<tr>
							 	<th>Sr No</th>
								<th>Client Name</th>
								<th>Business Name</th>
				                <th>Contact Person Name</th>
								<th>Product Name</th>
				                <th>Client Response</th>
				                <th>Client FollowUp Date</th>
				                <th>Response Details</th>	
							</tr>
						</thead>
						<tfoot>
						
							<!-- <tr>
								<th colspan="5" style="text-align: right">Total:</th>
								<th></th>
								<th></th>
								<th></th>
						   </tr> -->
						
						</tfoot>
					</table>
			</form>
			</div>
		</div>
		</form>
		</div> 
<%-- 	
		 					<!------------ Employee Payment Report Between Two Dates ---------->
		 					
		 					
 <div class="tab-pane " id="withnames">
<form class="form-horizontal" method="post" action="" name="names">
	

<div class="row">
	
		<div class="form-group" align="right">
			<div class="col-sm-offset-8 col-md-4 control-label">
				<div id="date">
					<label id="demo"></label>
					<script>
						var date = new Date();
						document.getElementById("demo").innerHTML = date.toDateString();
					</script>
				</div>
			</div>
		</div>
 
		<div class="row">
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		
 <form class="form-horizontal" method="post" action="" name="empReport1">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
						<label class="control-label" for="employeename">Employee Name:<sup>*</sup></label>  
          				</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"></i>
							</span>
						    <%
						    EmployeeDetailsDao sdd3 = new EmployeeDetailsDao();
							List sList4 = sdd3.getAllMainEmployee();
							 %>
							 <input list="employeeNameList" id="fk_employee_id" class="form-control">
								<datalist id="employeeNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
									EmployeeDetailsHibernate sup = (EmployeeDetailsHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkEmpId()%>"
									value="<%=sup.getFirstName()%>  <%=sup.getLastName()%>">
									
									<%
										}
									%>
								</datalist>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Start Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fisDate" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>

						<div class="col-sm-2" align="right">
							<label class="control-label">End Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
								 <input type="date" id="endDate" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
				</div>

		<div class="row form-group buttons_margin_top ">
			<div align="center">
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getTeacherPaymentDetailsBetTwoDaysValidation()" value="Search" />
			</div>
		</div>

					<table
						class="table table-bordered table-striped table-condensed cf"
						id="empBetweenTwoDates" class="display"
						style="border: 2px solid black; border-collapse: collapse;">
						<thead>
							<tr>
							    <th>Sr No</th>
							    <th>Employee Name</th>
								<th>Payment Date</th>
								<th>Payment Type</th>
								<th>Payment Mode</th>
								<th>Payment Amount</th>
								<th>Accountant Name</th>
								<th>Account No</th>
								<th>Bank Name</th>
								<th>Reason</th>
							</tr>
						</thead>
						<tfoot>
						
						   <!--
						    <tr>
								<th colspan="5" style="text-align: right">Total:</th>
								<th></th>
								<th></th>
								<th></th>
						   </tr> -->
						
						</tfoot>
					</table>
			</form>
			</div>
		</div>

		</form>
		</div>
		 --%>
		
		</div>
		</div>
		</div>
		</div>
		</div>
		
		
		
		
	</body>
</html>
