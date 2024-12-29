<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.hibernate.ClientPaymentDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ClientPaymentDetailsDao"%>
<%@page import="com.embelSoft.hibernate.VendorPaymentDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorPaymentDetailsDao"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.bean.ExpenditureDetailsBean"%>
<%@page import="com.embelSoft.dao.ExpenditureDetailsDao"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.hibernate.PurchaseHibernate"%>

<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.hibernate.EmployeePaymentBeanHibernate"%>


<%@page import="java.util.List"%>

<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<head>


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

</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="/embelSoft/staticContent/css/tabDemo.css">

<script type="text/javascript"
	src="/embelSoft/staticContent/js/billing.js"></script>


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
.leftmanu {
	width: 190px;
	background: #c50000a6;
	color: white;
}
</style>

<body>
	<div class="container-fluid">
		<div class="row" style="min-height: 300px;">
			<div class="col-md-12">
				<h3>Left Tabs</h3>
				<hr />
				<div class="col-md-2">
					<!-- required for floating -->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs">
						<li class=""><a class="leftmanu" href="#messages"
							data-toggle="tab">Resource Billing Report</a></li>
						<li><a class="leftmanu" href="#client" data-toggle="tab">Product
								Billing Report</a></li>


					</ul>
				</div>
				<div class="col-xs-9">
					<!-- Tab panes -->
					<div class="tab-content">



						<!------------ Hr Billing Report ---------->
						<div class="tab-pane active" id="messages">
							<form class="form-horizontal" method="post" action="" name="emp">
								<div class="row">
									<div align="center">
										<h2 class="form-name style_heading">Resource Billing
											Report</h2>
									</div>
									<div class="row">
										<div class="col-sm-offset-1 col-md-10">
											<hr style="border-top-color: #c1b1b1;">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group">
										<div class="col-md-2 col-sm-offset-1" align="right">
											<label class="control-label" for="employeename">Vendor
												Name:<sup>*</sup>
											</label>
										</div>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span>
												<%
													VendorDetailsDao sdd3 = new VendorDetailsDao();
													List sList4 = sdd3.getAllVendorNames();
												%>
												<input list="vendorNameList" id="fk_vendor_id"
													class="form-control">
												<datalist id="vendorNameList">
													<%
														for (int i = 0; i < sList4.size(); i++) {
															VendorDetailsHibernate sup = (VendorDetailsHibernate) sList4.get(i);
													%>

													<option data-value="<%=sup.getPkVendorDetailsId()%>"
														value="<%=sup.getVendorName()%>">

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
												</span> <input type="date" id="fisDate" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>

										<div class="col-sm-2" align="right">
											<label class="control-label">End Date:<sup>*</sup></label>
										</div>
										<div class="col-sm-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="date" id="endDate" placeholder="End Date"
													class="form-control input-md ac_district" type="text">
											</div>
										</div>
									</div>
								</div>

								<div class="row form-group buttons_margin_top ">
									<div align="center">
										<input type="button" id="btn" name="save"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											onclick="getVendorHrBillingDetailsByName()" value="Search" />
									</div>
								</div>

								<table
									class="table table-bordered table-striped table-condensed cf"
									id="vendorBetweenTwoDates" class="display"
									style="border: 2px solid black; border-collapse: collapse;">
									<thead>
										<tr>
											<th>Sr No</th>
											<th>Vendor Name</th>
											<th>Bill No</th>
											<th>Date Of Billing</th>
											<th>Description</th>
											<th>Quantity</th>
											<th>Unit Price</th>
											<!-- <th>Amount</th> -->
											<th>GST</th>
											<th>VAT</th>
											<th>Gross Total</th>
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
							<!--  </form>    -->
						</div>

						<!------------ Product Billing Payment ---------->
						<div class="tab-pane active" id="client">
							<form class="form-horizontal" method="post" action="" name="emp">
								<div class="row">
									<div align="center">
										<h2 class="form-name style_heading">Product Billing
											Report</h2>
									</div>
									<div class="row">
										<div class="col-sm-offset-1 col-md-10">
											<hr style="border-top-color: #c1b1b1;">
										</div>
									</div>
								</div>

								<!-- <form class="form-horizontal" method="post" action="" name="empReport1"> -->
								<div class="row">
									<div class="form-group">
										<div class="col-md-2 col-sm-offset-1" align="right">
											<label class="control-label" for="employeename">Client
												Name:<sup>*</sup>
											</label>
										</div>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span>
												<%
													ClientEnquiryDao dao = new ClientEnquiryDao();
													List list = dao.getAllClientNames();
												%>

												<input list="clientNameList" id="fk_client_id"
													class="form-control">
												<datalist id="clientNameList">
													<%
														for (int i = 0; i < list.size(); i++) {
															ClientEnquiryHibernate sup = (ClientEnquiryHibernate) list.get(i);
													%>

													<option data-value="<%=sup.getPkClientEnquiryId()%>"
														value="<%=sup.getFirstName() + " " + sup.getLastName()%>">

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
												</span> <input type="date" id="fis1Date" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>

										<div class="col-sm-2" align="right">
											<label class="control-label">End Date:<sup>*</sup></label>
										</div>
										<div class="col-sm-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span> <input type="date" id="end1Date" placeholder="End Date"
													class="form-control input-md ac_district" type="text">
											</div>
										</div>
									</div>
								</div>

								<div class="row form-group buttons_margin_top ">
									<div align="center">
										<input type="button" id="btn" name="save"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											onclick="getClientHrBillingDetailsByName()" value="Search" />
									</div>
								</div>

								<table
									class="table table-bordered table-striped table-condensed cf"
									id="clientBetweenTwoDates" class="display"
									style="border: 2px solid black; border-collapse: collapse;">
									<thead>
										<tr>
											<th>Sr No</th>
											<th>Client Name</th>
											<th>Bill No</th>
											<th>Date Of Billing</th>
											<th>Description</th>
											<th>Quantity</th>
											<th>Unit Price</th>
											<!-- <th>Amount</th> -->
											<th>GST</th>
											<th>VAT</th>
											<th>Gross Total</th>
										</tr>
									</thead>
									<tfoot>


									</tfoot>
								</table>
							</form>
						</div>


					</div>
				</div>


			</div>
		</div>
	</div>

</body>
</html>
