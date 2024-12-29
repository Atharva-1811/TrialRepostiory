<%@page import="com.embelSoft.hibernate.ClientPaymentDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ClientPaymentDetailsDao"%>

<%@page import="com.embelSoft.hibernate.VendorPaymentDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorPaymentDetailsDao"%>

<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>

<%@page import="com.embelSoft.bean.ExpenditureDetailsBean"%>
<%@page import="com.embelSoft.dao.ExpenditureDetailsDao"%>
<%@page import="com.embelSoft.hibernate.ExpenditureDetailsHibernate"%>
<%@page import="com.embelSoft.bean.EmployeePaymentDetailBean" %>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.hibernate.PurchaseHibernate"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.hibernate.EmployeePaymentBeanHibernate"%>
<%@page import="com.embelSoft.bean.VendorPaymentDetailsBean"%>


<%@page import="java.util.List"%>

<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- For datatable to pdf,print,excel etc conversion -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"
	src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript"
	src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

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

<link href="/embelSoft/staticContent/css/StyleValidation.css"
	rel="stylesheet" type="text/css" />
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">


<link rel="stylesheet" href="/embelSoft/staticContent/css/tabDemo.css">

<script type="text/javascript"
	src="/embelSoft/staticContent/js/cashbankbook.js"></script>

<link rel="stylesheet" href="/embelSoft/staticContent/css/Report.css">

<link rel="stylesheet" href="/embelSoft/staticContent/css/style3.css">

<script>
function employeePaymentList()
{
	 window.location = "EmployeePaymentList.jsp";
}
</script>
<script>
function vendorPaymentList()
{
	window.location = "VendorPaymentList.jsp";
}
</script>
<script>
function ClientPaymentList()
{
	 window.location = "ClientPaymentList.jsp";
}		
</script>
<script>
function expenditurePaymentList()
{
	window.location = "ExpendirurePaymentList.jsp";
}
</script>
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

.leftmanu {
	width: 190px;
	background: #c50000a6;
	color: white;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>Left Tabs</h3>
				<hr />
				<div class="col-md-2" align="center">
					<!-- required for floating -->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs">
						<li class=""><a class="leftmanu" href="#messages"
							data-toggle="tab">Employee Payment Report</a></li>
						<li><a class="leftmanu" href="#vendor" data-toggle="tab">Vendor
								Payment Report</a></li>
						<li><a class="leftmanu" href="#client" data-toggle="tab">Client
								Payment Report</a></li>
						<li><a class="leftmanu" href="#settings" data-toggle="tab">Expenditure
								Payment Report</a></li>
					</ul>
				</div>
				<div class="col-md-9">
					<!-- Tab panes -->
					<div class="tab-content">

						<!------------ Employee Payment ---------->
						<div class="tab-pane active" id="messages">
							<!-- <form class="form-horizontal" method="post" action="" name="emp"> -->
							<div class="container-fluid">
								<div class="row">
									<div align="center">
										<h2 class="form-name">Employee Payment Report</h2>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>

							<div class="container-fluid">
								<div class="row">
									<div id="wrqpper">
										<form class="form-horizontal" method="post" action=""
											name="emp">
											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label" for="employeename">Employee
														Name&nbsp;:<sup>*</sup>
													</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-user"></i></span>
														<%
															EmployeeDetailsDao sdd3 = new EmployeeDetailsDao();
															List sList4 = sdd3.getAllMainEmployeeForPayment();
														%>
														<input list="employeeNameList" id="fk_employee_id" class="form-control">
															
														<datalist id="employeeNameList">
															<%
																for (int i = 0; i < sList4.size(); i++) {
																	EmployeePaymentDetailBean sup = (EmployeePaymentDetailBean) sList4.get(i);
															%>
															<option data-value="<%=sup.getFkEmployeeId()%>"value="<%=sup.getEmployeeName()%>">
																
																<%
																	}
																%>
															
														</datalist>
													</div>
												</div>
											</div>

											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-calendar"> </i></span> <input
															type="date" id="fisDate" placeholder="Start Date"
															class="form-control input-md" type="text">
													</div>
												</div>
												<div class="col-sm-2">
													<label class="control-label">End Date&nbsp;:<sup>*</sup></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-calendar"></i></span> <input
															type="date" id="endDate" placeholder="End Date"
															class="form-control input-md ac_district" type="text">
													</div>
												</div>
											</div>

											<div class="row form-group buttons_margin_top ">
												<div align="center">
													<input type="button" id="btn" name="save"
														class="btn btn-lg btn-success btn-md button_hw button_margin_right"
														onclick="getTeacherPaymentDetailsBetTwoDaysValidation()"
														value="Search" />
												</div>
											</div>
											<!-- 	<div class="container">  -->
											<div class="table-responsive">
												<table
													class="table table-bordered table-striped table-condensed cf"
													id="empBetweenTwoDates" class="display"
													style="border: 1px solid white; border-collapse: collapse; width: 100%;">
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
						</div>

						<!--------------- Vendor Payment Report Between Two Dates And Name ----------------->

						<div class="tab-pane" id="vendor">
							<!-- <form method="post" action="" name="exp"> -->
							<div class="container-fluid">
								<div class="row">
									<div align="center">
										<h2 class="form-name">Vendor Payment</h2>
									</div>
								</div>
							</div>
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
							<div class="col-md-12" align="center">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#home"><h4
												style="color: blue">Vendor Name Wise</h4></a></li>
									<li><a data-toggle="tab" href="#twoDates"><h4
												style="color: blue">Vendor Range Wise</h4></a></li>
								</ul>
							</div>
							<div class="row">
								<div class="col-md-12">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>
							<div class="tab-content">

								<div id="home" class="tab-pane fade in active">

									<!-- <div id="home" class="tab-pane fade in active">	 -->
									<div id="wrqpper">
										<form method="post" action="" name="exp">
											<div class=" row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label" for="expenditureName">Vendor
														Name&nbsp;:<sup>*</sup>
													</label>
												</div>

												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-stats"></i>
														</span>
														<%
															VendorPaymentDetailsDao exdd = new VendorPaymentDetailsDao();
															List vdList = exdd.getVendornameForPaymentReports();
														%>
														<input list="ven_drop" id="vendorName"
															class="form-control">
														<datalist id="ven_drop">
															<%
																for (int i = 0; i < vdList.size(); i++) {
																	VendorPaymentDetailsBean expbean = (VendorPaymentDetailsBean) vdList.get(i);
															%>
															<option data-value="<%=expbean.getFkVenderId()%>"value="<%=expbean.getVendorName()%>">
																
																<%
																	}
																%>
															
														</datalist>
													</div>
												</div>
											</div>

											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
												</div>

												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-calendar"></i>
														</span> <input type="date" id="fisDate14"
															placeholder="Start Date" class="form-control input-md"
															type="text">
													</div>
												</div>
												<div class="col-sm-2">
													<label class="control-label" for="endDate">End
														Date&nbsp;:<sup>*</sup>
													</label>
												</div>

												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-calendar"></i>
														</span> <input type="date" id="endDate14" placeholder="End Date"
															class="form-control input-md ac_district" type="text">
													</div>
												</div>
											</div>

											<div class="row form-group buttons_margin_top ">
												<div align="center">
													<input type="button" id="btn" name="save"
														class="btn btn-lg btn-success btn-md button_hw button_margin_right"
														onclick="getVendorPaymentDetailsByNameValidation()"
														value="Search" />
												</div>
											</div>
											<!-- <div class="container">   -->
											<div class="table-responsive">
												<table
													class="table table-bordered table-striped table-condensed cf"
													id="vendorBetweenTwoDates" class="display"
													style="border: 1px solid white; border-collapse: collapse; width: 100%;">
													<thead>
														<tr>
															<th>Sr No</th>
															<th>Vendor Name</th>
															<th>Total Amount</th>
															<th>Remaining Amount</th>
															<th>Paid Amount</th>
															<th>Balance Amount</th>
															<th>Payment Date</th>
														</tr>
													</thead>
												</table>
											</div>
										</form>
									</div>
								</div>

								<!------------ Expenditure Payment Report Between Two Dates---------->

								<div id="twoDates" class="tab-pane">




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


									<!-- <div id="home" class="tab-pane fade in active"> -->
									<div id="wrqpper">
										<form class="form-horizontal" method="post" action=""
											name="dates">
											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-calendar"></i>
														</span> <input type="date" id="fisDate24"
															placeholder="Start Date" class="form-control input-md"
															type="text">
													</div>
												</div>

												<div class="col-sm-2">
													<label class="control-label" for="endDate">End
														Date&nbsp;:<sup>*</sup>
													</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-calendar"></i>
														</span> <input type="date" id="endDate24" placeholder="End Date"
															class="form-control input-md ac_district" type="text">
													</div>
												</div>
											</div>

											<div class="row form-group buttons_margin_top ">
												<div align="center">
													<input type="button" id="btn" name="save"
														class="btn btn-lg btn-success btn-md button_hw button_margin_right"
														onclick="getVendorPaymentDetailsBetDaysValidation()"
														value="Search" />
												</div>
											</div>
											<!--  <div class="container">   -->
											<div class="table-responsive">
												<table
													class="table table-bordered table-striped table-condensed cf"
													id="vendorBetweenTwoDate" class="display"
													style="border: 1px solid white; border-collapse: collapse; width: 100%;">
													<thead>
														<tr>
															<th>Sr No</th>
															<th>Vendor Name</th>
															<th>Total Amount</th>
															<th>Remaining Amount</th>
															<th>Paid Amount</th>
															<th>Balance Amount</th>
															<th>Payment Date</th>
														</tr>
													</thead>
												</table>
											</div>
											<!-- </div> -->

										</form>
									</div>
									<!-- </div> -->
								</div>
							</div>
						</div>

						<!------------ Client Payment Report Between Two Dates And Name ---------->

						<div class="tab-pane" id="client">
							<!-- <form method="post" action="" name="exp"> -->
							<div class="row">
								<div align="center">
									<h2 class="form-name">Client Payment Report</h2>
								</div>
								<div class="row">
									<div class="col-md-12">
										<hr style="border-top-color: #c1b1b1;">
									</div>
								</div>
							</div>
							<div class="col-md-12" align="center">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#home1"><h4
												style="color: blue">Client Name Wise</h4></a></li>
									<li><a data-toggle="tab" href="#twoDates1"><h4
												style="color: blue">Client Range Wise</h4></a></li>
								</ul>
							</div>
							<div class="tab-content">
								<div id="home1" class="tab-pane fade in active">
									<!-- <form class="form-horizontal" method="post" action="" name="dates"> -->

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



									<!-- <div id="home1" class="tab-pane fade in active">	 -->
									<div id="wrqpper">
										<form class="form-horizontal" method="post" action=""
											name="dates">
											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label" for="expenditureName">Client
														Name&nbsp;:<sup>*</sup>
													</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-stats"></i>
														</span>
														<%
															ClientPaymentDetailsDao exdd2 = new ClientPaymentDetailsDao();
															List clList = exdd2.getClientNameForRep();
														%>
														<input list="cli_drop" id="clientName"
															class="form-control">
														<datalist id="cli_drop">
															<%
																for (int i = 0; i < clList.size(); i++) {
																	ClientPaymentDetailsHibernate expbean = (ClientPaymentDetailsHibernate) clList.get(i);
															%>
															<option data-value="<%=expbean.getFkClientId()%>"
																value="<%=expbean.getClientName()%>">
																<%
																	}
																%>
															
														</datalist>
													</div>
												</div>
											</div>

											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-calendar"></i>
														</span> <input type="date" id="fisDate4" placeholder="Start Date"
															class="form-control input-md" type="text">
													</div>
												</div>
												<div class="col-sm-2">
													<label class="control-label" for="endDate">End
														Date&nbsp;:<sup>*</sup>
													</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-calendar"></i>
														</span> <input type="date" id="endDate4" placeholder="End Date"
															class="form-control input-md ac_district" type="text">
													</div>
												</div>
											</div>

											<div class="row form-group buttons_margin_top ">
												<div align="center">
													<input type="button" id="btn" name="save"
														class="btn btn-lg btn-success btn-md button_hw button_margin_right"
														onclick="getClientPaymentDetailsByNameValidation()"
														value="Search" />
												</div>
											</div>

											<!-- <div id="container"> -->
											<div class="table-responsive">
												<table
													class="table table-bordered table-striped table-condensed cf"
													id="clientBetweenTwoDatesAndName" class="display"
													style="border: 1px solid white; border-collapse: collapse; width: 100%;">
													<thead>
														<tr>
															<th>Sr No</th>
															<th>Client Name</th>
															<th>Total Amount</th>
															<th>Remaining Amount</th>
															<th>Paid Amount</th>
															<th>Balance Amount</th>
															<th>Payment Date</th>
														</tr>
													</thead>
												</table>
											</div>
											<!-- </div> -->
										</form>
										<!-- </div> -->
									</div>
								</div>

								<!------------ Expenditure Payment Report Between Two Dates---------->



								<div id="twoDates1" class="tab-pane">
									<!-- <form class="form-horizontal" method="post" action="" name="dates"> -->

									<div class="form-group" align="right">
										<div class="col-sm-offset-8 col-md-4 control-label">
											<div id="date">
												<label id="demo1"></label>
												<script>
						var date = new Date();
						document.getElementById("demo1").innerHTML = date.toDateString();
					</script>
											</div>
										</div>
									</div>



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



									<div id="twoDates1" class="tab-pane fade in active">
										<div id="wrqpper">
											<form class="form-horizontal" method="post" action=""
												name="dates">

												<div class="form-group">

													<div class="col-sm-2 col-sm-offset-1">
														<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
													</div>
													<div class="col-sm-3">
														<div class="input-group">
															<span class="input-group-addon"> <i
																class="glyphicon glyphicon-calendar"></i>
															</span> <input type="date" id="fisDate42"
																placeholder="Start Date" class="form-control input-md"
																type="text">
														</div>
													</div>


													<div class="col-sm-2">
														<label class="control-label" for="endDate">End
															Date&nbsp;:<sup>*</sup>
														</label>
													</div>
													<div class="col-sm-3">
														<div class="input-group">
															<span class="input-group-addon"> <i
																class="glyphicon glyphicon-calendar"></i>
															</span> <input type="date" id="endDate42" placeholder="End Date"
																class="form-control input-md ac_district" type="text">
														</div>
													</div>
												</div>

												<div class="row form-group buttons_margin_top ">
													<div align="center">
														<input type="button" id="btn" name="save"
															class="btn btn-lg btn-success btn-md button_hw button_margin_right"
															onclick="getClientPaymentDetailsByDateValidation()"
															value="Search" />
													</div>
												</div>
												<!-- <div id="container"> -->
												<div class="table-responsive">
													<table
														class="table table-bordered table-striped table-condensed cf"
														id="clientBetweenTwoDate" class="display"
														style="border: 1px solid white; border-collapse: collapse; width: 100%;">
														<thead>
															<tr>
																<th>Sr No</th>
																<th>Vendor Name</th>
																<th>Total Amount</th>
																<th>Remaining Amount</th>
																<th>Paid Amount</th>
																<th>Balance Amount</th>
																<th>Payment Date</th>

															</tr>
														</thead>

													</table>
												</div>
												<!-- </div> -->
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- </form> -->

						</div>



						<!------------ Expenditure Payment Report Between Two Dates And Name ---------->
						<div class="tab-pane" id="settings">
							<!-- <form method="post" action="" name="exp"> -->
							<div class="row">
								<div align="center">
									<h2 class="form-name">Expenditure Payment Report</h2>
								</div>

							</div>

							<div class="row">
								<div class="col-md-12">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>


							<div class="col-md-12" align="center">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#home3"><h4
												style="color: blue">Expenditure Name Wise</h4></a></li>
									<li><a data-toggle="tab" href="#twoDates3"><h4
												style="color: blue">Expenditure Range Wise</h4></a></li>

								</ul>
							</div>

							<div class="tab-content">

								<div id="home3" class="tab-pane fade in active">
									<!-- <form class="form-horizontal" method="post" action="" name="dates"> -->

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

									<div id="home" class="tab-pane fade in active">
										<div id="wrqpper">
											<form class="form-horizontal" method="post" action=""
												name="dates">
												<div class="row form-group">
													<div class="col-sm-2 col-sm-offset-1">
														<label class="control-label" for="expenditureName">Expenditure
															Name&nbsp;:<sup>*</sup>
														</label>
													</div>
													<div class="col-sm-3">
														<div class="input-group">
															<span class="input-group-addon"> <i
																class="glyphicon glyphicon-stats"></i>
															</span>
															<%
																ExpenditureDetailsDao exdd3 = new ExpenditureDetailsDao();
																List exList = exdd3.getAllExpenseName();
															%>
															<input list="exp_drop" id="expenseName"
																class="form-control">
															<datalist id="exp_drop">
																<%
																	for (int i = 0; i < exList.size(); i++) {
																		ExpenditureDetailsHibernate expbean = (ExpenditureDetailsHibernate) exList.get(i);
																%>
																<option data-value="<%=expbean.getPkExpenseId()%>"
																	value="<%=expbean.getExpenseName()%>">
																	<%
																		}
																	%>
																
															</datalist>
														</div>
													</div>
												</div>

												<div class="row form-group">
													<div class="col-sm-2 col-sm-offset-1">
														<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
													</div>
													<div class="col-sm-3">
														<div class="input-group">
															<span class="input-group-addon"> <i
																class="glyphicon glyphicon-calendar"></i>
															</span> <input type="date" id="fisDate34"
																placeholder="Start Date" class="form-control input-md"
																type="text">
														</div>
													</div>
													<div class="col-sm-2">
														<label class="control-label" for="endDate">End
															Date&nbsp;:<sup>*</sup>
														</label>
													</div>
													<div class="col-sm-3">
														<div class="input-group">
															<span class="input-group-addon"> <i
																class="glyphicon glyphicon-calendar"></i>
															</span> <input type="date" id="endDate34" placeholder="End Date"
																class="form-control input-md ac_district" type="text">
														</div>
													</div>
												</div>

												<div class="row form-group buttons_margin_top ">
													<div align="center">
														<input type="button" id="btn" name="save"
															class="btn btn-lg btn-success btn-md button_hw button_margin_right"
															onclick="getExpensePaymentDetailsBetTwoDaysValidation()"
															value="Search" />
													</div>
												</div>
												<!-- <div id="container"> -->
												<div class="table-responsive">
													<table
														class="table table-bordered table-striped table-condensed cf"
														id="expenseBetweenTwoDates" class="display"
														style="border: 1px solid white; border-collapse: collapse; width: 100%;">
														<thead>
															<tr>
																<th>Sr No</th>
																<th>Expense Name</th>
																<th>Service Provider</th>
																<th>Accountant Name</th>
																<th>Credit Amount</th>
																<th>Debit Name</th>
																<th>Insert Date</th>

															</tr>
														</thead>


													</table>

												</div>
												<!-- </div> -->
											</form>
										</div>
									</div>
								</div>

								<!------------ Expenditure Payment Report Between Two Dates---------->

								<div id="twoDates3" class="tab-pane">
									<!-- <form class="form-horizontal" method="post" action="" name="dates"> -->
									<div class="form-group" align="right">
										<div class="col-sm-offset-8 col-md-4 control-label">
											<div id="date">
												<label id="demo1"></label>
												<script>
						var date = new Date();
						document.getElementById("demo1").innerHTML = date.toDateString();
					</script>
											</div>
										</div>
									</div>
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
									<div id="home" class="tab-pane fade in active">
										<div id="wrqpper">
											<form class="form-horizontal" method="post" action=""
												name="dates">
												<div class="form-group">
													<div class="col-sm-2 col-sm-offset-1">
														<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
													</div>
													<div class="col-sm-3">
														<div class="input-group">
															<span class="input-group-addon"> <i
																class="glyphicon glyphicon-calendar"></i>
															</span> <input type="date" id="fisDate43"
																placeholder="Start Date" class="form-control input-md"
																type="text">
														</div>
													</div>
													<div class="col-sm-2">
														<label class="control-label" for="endDate">End
															Date&nbsp;:<sup>*</sup>
														</label>
													</div>
													<div class="col-sm-3">
														<div class="input-group">
															<span class="input-group-addon"> <i
																class="glyphicon glyphicon-calendar"></i>
															</span> <input type="date" id="endDate43" placeholder="End Date"
																class="form-control input-md ac_district" type="text">
														</div>
													</div>
												</div>

												<div class="row form-group buttons_margin_top ">
													<div align="center">
														<input type="button" id="btn" name="save"
															class="btn btn-lg btn-success btn-md button_hw button_margin_right"
															onclick="getExpensePaymentDetailsBetDaysValidation()"
															value="Search" />
													</div>
												</div>
												<!-- <div id="container"> -->
												<div class="table-responsive">
													<table
														class="table table-bordered table-striped table-condensed cf"
														id="expenseBetweenDates" class="display"
														style="border: 1px solid white; border-collapse: collapse; width: 100%;">
														<thead>
															<tr>
																<th>Sr No</th>
																<th>Expense Name</th>
																<th>Service Provider</th>
																<th>Accountant Name</th>
																<th>Credit Amount</th>
																<th>Debit Name</th>
																<th>Insert Date</th>
															</tr>
														</thead>
													</table>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%@include file="commons/newFooter.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
