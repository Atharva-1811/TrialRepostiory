
<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>

<%@page import="java.util.List"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
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

</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="/embelSoft/staticContent/css/tabDemo.css">
	
	<script type="text/javascript" src="/embelSoft/staticContent/js/cashbankbook.js"></script>
	
	<script src="/embelSoft/staticContent/js/clientEnquiry.js"></script>   
	
     <link rel="stylesheet" href="/embelSoft/staticContent/css/Report.css"> 
     
          <link rel="stylesheet" href="/embelSoft/staticContent/css/style3.css"> 
  
	
	
	

	<script type="text/javascript">
			function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		       
		        return false;
		    }
		    return true;
		}
	</script>

	<style>
	h2.form-name {
    margin-top: 12px;
    font-size: 25px;
    font-weight: 600;
    text-transform: uppercase;
    
}
		.leftmanu
		{
		    width: 190px;
		    background: #c50000a6;
		    color:  white;
		}
	</style>


<body>
<div class="container-fluid" > 
<div class="row" >
    <div  class="col-md-12">
        <h3>Left Tabs</h3>
        <hr/>
        <div class="col-md-2" align="center">
            <!-- required for floating -->
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class=""><a class="leftmanu" href="#enquiry" data-toggle="tab" >Client Enquiry Report</a></li>
                <li><a class="leftmanu" href="#followup" data-toggle="tab">Client FollowUp Report</a></li>
                 <!-- <li><a class="leftmanu" href="#client" data-toggle="tab">Client Payment</a></li>
                <li><a class="leftmanu" href="#settings" data-toggle="tab">Expenditure Payment</a></li> -->
            </ul>
            <br>
        </div>
        <div class="col-md-9">
            <!-- Tab panes -->
    <div class="tab-content">    
	<!------------ Client Enquiry Report ---------->
            <div class="tab-pane active" id="enquiry">
           		<!-- <form class="form-horizontal" method="post" action="" name="emp"> -->
           		<div class="container-fluid">
   	    	 <div class="row">
			<div align="center">
				  <h2 class="form-name ">Client Enquiry Report</h2>
			</div>
			</div>
		</div>

	<div class="container-fluid">
	
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
		</div>
		<div class="row">
			 <div id="wrqpper">
                  <form class="form-horizontal" method="post" action="" name="clientReport">
				   <div class="row form-group">
					   <div class="col-sm-2 col-sm-offset-1">
						    <label class="control-label" for="employeename">Client Name:<sup>*</sup></label>  
          				</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-user"></i>
							</span>
						    <%
						    ClientEnquiryDao sdd3 = new ClientEnquiryDao();
							List sList4 = sdd3.getAllClientNames();
							 %>
							 <input list="clientNameList" id="fk_client_id" class="form-control">
								<datalist id="clientNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
										ClientEnquiryHibernate sup = (ClientEnquiryHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkClientEnquiryId()%>"
								value="<%=sup.getFirstName()%>">
									
									<%
										}
									%>
								</datalist>
							</div>
						</div>
					</div>
				
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1">
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

						<div class="col-sm-2" >
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
				

		<div class="row form-group buttons_margin_top ">
			<div align="center">
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"
				 onclick="getClientDetailsBetTwoDaysValidation()" value="Search" />
			</div>
		</div>
		<!-- <div class="container">   -->
		<div class="table-responsive">
	         
					<table class="table table-bordered table-striped table-condensed cf"
						id="clientBetweenTwoDates" class="display"
						style="border: 1px solid white; border-collapse: collapse; width:100%;">
						<thead>
							<tr>
								<th>Sr No</th>
							    <th>Client Name</th>
								<!-- <th>Middle Name</th>
								<th>Last Name</th> -->
								<th>Date Of Enquiry</th>
								<th>Contact Number</th>
								<th>Email</th>
								<!-- <th>Comment</th> -->
								<!-- <th>Reference By</th> -->
								
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
					</div>
				<!-- </div> -->
			</form>
			</div>
			</div>
			</div>
			<!-- </form> -->			
	
		</div>
 
  
 	
 			<!------------ Client FollowUp Report ---------->
  <div class="tab-pane" id="followup">
		<!-- <form method="post" action="" name="exp"> -->
			<div class="container-fluid">
			<div class="row">
			<div align="center">
				  <h2 class="form-name style_heading">Client Follow Up Report</h2>
			</div>
		</div>
</div>
   <!--  <div  class="col-md-12"> -->
<!-- 
		<ul class="nav nav-tabs">
		
		    <li class="active"><a data-toggle="tab" href="#betweendates"><h4 style="color:blue">Range</h4></a></li>
		    <li><a data-toggle="tab" href="#withnames"><h4 style="color:blue">Employee Name Wise</h4></a></li>
	    
 	 	</ul> -->
<!-- 	<div class="tab-content" > -->
	
 					<!------------ Employee Payment Report Between Two Dates ---------->
 				
<!--  <div class="tab-pane fade in" id="betweendates"> -->
<!-- <form class="form-horizontal" method="post" action="" name="dates"> -->


	<div class="container-fluid">
	
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
		</div>
		<div class="row">
			 <div id="wrqpper">
	 	<form class="form-horizontal" method="post" action="" name="empReport1">
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label">Start Date :<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fisDate4" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>

						<div class="col-sm-2" >
							<label class="control-label">End Date :<sup>*</sup></label>
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

		<div class="row form-group buttons_margin_top ">
			<div align="center">
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" 
				onclick="clientResponseFollowUpValidation()" value="Search" />
			</div>
		</div>

                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf"
						id="clientResponseFollowUp" class="display"
						style="border: 1px solid white; border-collapse: collapse; width:100%;">
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
					</div>
			</form>
			</div>
			</div>
		</div>
		<!-- </form> -->
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