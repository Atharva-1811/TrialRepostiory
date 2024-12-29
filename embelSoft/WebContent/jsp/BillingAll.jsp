<!-- BillingAll.jsp -->
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="com.embelSoft.dao.ResourceBillingDao"%>
<%@page import="com.embelSoft.bean.ResourceBillingBean"%>
<%@page import="com.embelSoft.hibernate.ResourceBillingHibernate"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.dao.ProductBillingDao"%>
<%@page import="com.embelSoft.hibernate.ProductDetailsHibernate"%>
<%@page import="com.embelSoft.bean.ProductBillingBeanNew"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<link rel="stylesheet" href="/embelSoft/staticContent/css/shree.css">
<link rel="stylesheet"
	href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"
	href="/embelSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet"
	href="/embelSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>

<script src="/embelSoft/staticContent/js/billing.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css"
	rel="stylesheet" type="text/css" />
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

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

label {
	text-align: left;
}

.quo {
	font-weight: 600;
	color: red;
	font-family: digital-clock-font;
}
</style>

<style type="text/css">
.ui-jqgrid .ui-jqgrid-htable .ui-jqgrid-labels th div {
	overflow: hidden;
	position: relative;
	height: 35px;
	margin: 2px;
	font-size: 14px;
}
</style>


<!-- for Hr Billing -->
<script>
function clearProductCalculation()
{
	document.productBilling.totalSubTotalProduct.value="";
	document.productBilling.totalTaxAmountProduct.value="";
	document.productBilling.grossTotalProduct.value="";
}
</script>
<script type="text/javascript">
function clearField()
{
	document.resourceBilling.productResourceName.value="";
	document.productBilling.productName.value="";
}
</script>

<script type="text/javascript">

function resourceBillingList()
{
	window.location="ResourceBillingListNew1.jsp";
}

function productBillingList()
{
	window.location="ProductBillingListNew1.jsp";
}

function editResourceBilling()
{
	window.location="billingEditResourceBill.jsp";
}

function editProductBilling()
{
	window.location="billingEditProductBill.jsp";
}

function resets()
{
	location.reload(true);
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

<script>		
	function numbersonly(input) {
		var regex = /[^0-9 .]/gi;
		input.value = input.value.replace(regex, "");
	}
</script>

</head>
<body>
	<%
		if (session.getAttribute("user") != null) {
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<h3>Left Tabs</h3>
				<hr />
				<div class="col-md-2" align="center">
					<ul class="nav nav-tabs">

						<li><a class="leftmanu" href="#productBilling"
							data-toggle="tab">Product Billing</a></li>
						<li class=""><a class="leftmanu" href="#resourceBilling"
							data-toggle="tab">Service Billing</a></li>

					</ul>
				</div>

				<!-- Tab panes -->
				<div class="col-md-9">
					<div class="tab-content">

						<!------------ HR / Resource Billing Java code---------->
						<!------------ HR / Resource Bill No calculation---------->
						<%
							String Hr;

								SimpleDateFormat simpleformat = new SimpleDateFormat(" dd MM yyyy");

								// displaying month in MMMM format
								simpleformat = new SimpleDateFormat("MM yyyy");
								String strMonth = simpleformat.format(new Date());
								System.out.println("Month in MMMM format = " + strMonth);

								String d1123 = strMonth.toString();
								String[] d = d1123.split(" ");
								String year = d[1];
								String month = d[0];

								String HrBill = month + "/" + year + "/" + "1";
						%>
						<%
							ResourceBillingDao RBDao = new ResourceBillingDao();
								List bill = RBDao.getResourceLastBillNo();

								for (int i = 0; i < bill.size(); i++) {
									ResourceBillingBean bean = (ResourceBillingBean) bill.get(i);

									Hr = bean.getBillNo(); //Jun/2020/22
									String[] HrBil = Hr.split("/");

									String lNo = HrBil[2];

									int lstNo = Integer.parseInt(lNo);
									int LastNo = lstNo + 1;

									HrBill = month + "/" + year + "/" + LastNo;

									System.out.println("IN All Billing Resourece Billing Stop 1");
								}
						%>
						<!------------ HR / Resource Billing HTML code---------->
						<div class="tab-pane" id="resourceBilling">
							<!-- <form class="form-horizontal" method="post" action="" name="resourceBilling"> -->
							<div class="container-fluid">
								<div class="row">
									<div align="center">
										<h2 class="form-name">Service Billing</h2>
									</div>
									<div class="row">
										<div class="col-sm-offset-1 col-md-10">
											<hr style="border-top-color: #c1b1b1;">
										</div>
									</div>
								</div>
							</div>
							<div class="container-fluid">
								<div align="right" id="billno">
									<!-- 		<label class="col-md-3 control-label" for="billNo">Bill No ::</label> -->
									<%-- 		<input type="text" id='billNo' placeholder="<%= HrBill%>" style="color: red;font-family: digital-clock-font;"> --%>
									<h4 class="quo">
										Bill No ::<%=HrBill%></h4>
								</div>
								<div class="row">
									<div id="wrqpper">

										<form class="form-horizontal" method="post" action=""
											name="resourceBilling">
											<div class="row form-group"></div>
											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label" for="employeename">Vendor
														Name :<sup>*</sup>
													</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-user"></i></span>
														<%
															VendorDetailsDao vendorDao = new VendorDetailsDao();
																List vendorList = vendorDao.getAllVendorNames();
														%>
														<input list="vendorNamesList" id="fkVendorId"
															class="form-control" placeholder="Select Vendor Name"
															onchange="fetchResourcebillno();">
														<datalist id="vendorNamesList">
															<%
																for (int i = 0; i < vendorList.size(); i++) {
																		VendorDetailsHibernate vendorHibernate = (VendorDetailsHibernate) vendorList.get(i);
															%>
															<option
																data-value="<%=vendorHibernate.getPkVendorDetailsId()%>"
																value="<%=vendorHibernate.getVendorName()%>">
																<%
																	}
																%>
															
														</datalist>
													</div>
												</div>

												<div class="col-sm-2">
													<label class="control-label">RPI Bill No :<sup>*</sup></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-hand-right"></i></span> <select
															id='resrcbillNo' name="resrcbillNo" class="form-control"
															placeholder="Select Bill No"
															onchange="getResourceBillGrid2()"></select>
														<!-- getResourceBillGrid() -->
													</div>
												</div>
											</div>


											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label">Billing Period Start
														Date :<sup>*</sup>
													</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-calendar"></i></span> <input
															type="date" id='billPeriodStartDate'
															name="billPeriodStartDate" class="form-control">
													</div>
												</div>
												<div class="col-sm-2">
													<label class="control-label">End Date :<sup>*</sup></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-calendar"></i></span> <input
															type="date" id='billPeriodEndDate'
															name="billPeriodEndDate" class="form-control" />
													</div>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label">Service/Resource Name
														:<sup>*</sup>
													</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-pencil "></i></span>
														<textarea id='productResourceName'
															name="productResourceName" class="form-control"
															placeholder="Enter Product Name"
															onchange="getResourceBillGrid2()" rows="1" cols="2"></textarea>
														<!-- getResourceBillGrid() -->
													</div>
												</div>

												<div class="col-sm-2">
													<label class="control-label">Date :<sup>*</sup></label>
													<%
														SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
															String todayDate = simpleDateFormat.format(new Date());
													%>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-calendar"></i></span> <input
															type="date" id='billDate' name="billDate"
															value="<%=todayDate%>" class="form-control"
															placeholder="Select Bill Date" />
													</div>
												</div>

											</div>

											<div class="row form-group">
												<div class="table-responsive row"
													style="padding-top: 20px; padding-bottom: 15px; margin-left: 0px;">
													<table id="jqgrid"></table>
													<div id="jqGridPager"></div>
												</div>
											</div>

											<div class="row form-group"></div>
											<div class="row form-group">
												<div class="col-sm-2 col-md-offset-6">
													<label class="control-label" for="totalSubTotal"><b>Total
															SubTotal&nbsp;:&nbsp;&nbsp;</b></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-rupee" style="font-size: 18px"></i></span> <input
															type="text" id="totalSubTotal" name="totalSubTotal"
															placeholder="Total SubTotal"
															class="form-control input-md" readonly="readonly">
													</div>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2 col-md-offset-6">
													<label class="control-label" for="totalTaxAmount"><b>Total
															Tax Amount&nbsp;:&nbsp;&nbsp;</b></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-rupee" style="font-size: 18px"></i></span> <input
															type="text" id="totalTaxAmount" name="totalTaxAmount"
															placeholder=" Total Tax Amount"
															class="form-control input-md" readonly="readonly">
													</div>
												</div>
											</div>
											<div class="row form-group">
												<div class="col-sm-2 col-md-offset-6">
													<label class="control-label" for="grossTotal"><h4>
															<b>Gross Total&nbsp;:&nbsp;&nbsp;</b>
														</h4></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-rupee" style="font-size: 18px"></i></span> <input
															type="text" id="grossTotal" name="grossTotal"
															placeholder="Gross Total" class="form-control input-md"
															style="font-size: 25px; height: 55px;"
															readonly="readonly">
													</div>
												</div>
											</div>
											<div align="center">
												<div class="col-md-12">
													<input type="button" id="btn1" name="btn1"
														class="btn btn-success btn-lg btnn "
														onclick="resourceBillValidation(); return false;"
														value="Print"> <input type="reset" id="btn4"
														name="btn4" class="btn btn-danger btn-lg btnn"
														onclick="resets()" value="Cancel"> <input
														type="button" value="List" id="listBtn"
														class="btn btn-primary btn-lg btnn"
														onclick="resourceBillingList()"> <input
														type="button" value="Edit" id="editBtn"
														class="btn btn-primary btn-lg btnn"
														onclick="editResourceBilling()">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>


						<!------------------ Product Coding Billing Java code ------------>
						<%
							String pr;

								simpleformat = new SimpleDateFormat("MM yyyy");
								String strMonth1 = simpleformat.format(new Date());
								System.out.println("Month in MMMM format = " + strMonth1);

								String d11231 = strMonth.toString();
								String[] d11 = d11231.split(" ");
								String year2 = d11[1];
								String month2 = d11[0];

								String productBill = month2 + "/" + year2 + "/" + "1";
						%>
						<%
							ProductBillingDao proDao = new ProductBillingDao();
								List billNo = proDao.getProductLastBillNo();

								for (int i = 0; i < billNo.size(); i++) {
									ProductBillingBeanNew productBean = (ProductBillingBeanNew) billNo.get(i);
									pr = productBean.getBillNo();

									String[] prBill = pr.split("/");

									String lNo = prBill[2];

									int lstNo = Integer.parseInt(lNo);
									int lastNo = lstNo + 1;

									productBill = month2 + "/" + year2 + "/" + lastNo;
								}
						%>

						<!------------------ Product Billing ------------>
						<div class="tab-pane active" id="productBilling">
							<!-- <form method="post" action="" name="productBilling"> -->
							<div class="container-fluid">
								<div class="row">
									<div align="center">
										<h2 class="form-name">Product Billing</h2>
									</div>
									<div class="row">
										<div class="col-sm-offset-1 col-md-10">
											<hr style="border-top-color: #c1b1b1;">
										</div>
									</div>
								</div>
							</div>
							<div class="container-fluid">
								<div align="right" id="billno">
									<h4 class="quo">
										Bill No ::<%=productBill%></h4>
								</div>
								<div class="row">
									<div id="wrqpper">
										<form class="form-horizontal" method="post" action=""
											name="productBilling">
											<div class="row form-group"></div>
											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label" for="clientName">Client
														Name :<sup>*</sup>
													</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-user"></i></span>
														<%
															ClientEnquiryDao dao = new ClientEnquiryDao();
																List list = dao.getAllClientNames();
														%>
														<input list="clientNamesList" id="fkClientId"
															class="form-control" placeholder="Select Client Name"
															onchange="fetchbillno();">
														<datalist id="clientNamesList">
															<%
																for (int i = 0; i < list.size(); i++) {
																		ClientEnquiryHibernate sup = (ClientEnquiryHibernate) list.get(i);
															%>
															<option data-value="<%=sup.getPkClientEnquiryId()%>"
																value="<%=sup.getFirstName()%>">
																<%
																	}
																%>
															
														</datalist>
													</div>
												</div>
												<div class="col-sm-2">
													<label class="control-label">PI Bill No :<sup>*</sup></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-hand-right"></i></span> <select
															id='BillNo' name="BillNo" class="form-control"
															placeholder="Select Bill No"
															onchange="getProductBillGrid()"></select>
													</div>
												</div>
											</div>


											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label" style="margin-top: 9px;">Date
														:<sup>*</sup>
													</label>
													<%
														SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
															String todayDate2 = simpleDateFormat2.format(new Date());
													%>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-calendar"></i></span> <input
															type="date" id='productBillDate' name="productBillDate"
															value="<%=todayDate2%>" class="form-control"
															placeholder="Select Bill Date" />
													</div>
												</div>
											</div>


											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label">Product Name :<sup>*</sup></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-hand-right"></i></span>
														<%
															ProductBillingDao productDao = new ProductBillingDao();
																List productNameList = productDao.getAllProductNames();
														%>
														<input list="productNameList" id="productName"
															class="form-control" placeholder="Select Product Name"
															onchange="getProductBillGrid()">
														<datalist id="productNameList">
															<%
																for (int i = 0; i < productNameList.size(); i++) {
																		ProductDetailsHibernate hibernate = (ProductDetailsHibernate) productNameList.get(i);
															%>
															<option
																data-value="<%=hibernate.getPkProductDetailsId()%>"
																value="<%=hibernate.getProductName()%>">
																<%
																	}
																%>
															
														</datalist>
													</div>
												</div>
												<div class="col-sm-2">
													<label class="control-label">Shipping Address :</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-home"></i>
														</span>
														<textarea id="ShipAddress" name="shipAddress"
															class="form-control" placeholder="Enter Shipping Address"
															rows="3" cols="10"></textarea>

														<!-- <input type="text" id='businessAddress' name="businessAddress" class="form-control" placeholder="Enter Business Address" /> -->
													</div>
												</div>
											</div>

											<!-- <div class="row form-group">
	
	</div> -->
											<div class="row form-group">
												<div class="col-sm-2 col-sm-offset-1">
													<label class="control-label">Courier name :</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="glyphicon glyphicon-pencil "></i></span> <input
															id='CourierName' name="CourierName" class="form-control"
															placeholder="Enter Courier Name" rows="1" cols="2" />
													</div>
												</div>

												<div class="col-sm-2">
													<label class="control-label"> Courier Tracking
														Number :</label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"> <i
															class="glyphicon glyphicon-home"></i>
														</span> <input id="Courierid" name="Courierid"
															class="form-control" placeholder="Enter Courier Number" />

														<!-- <input type="text" id='businessAddress' name="businessAddress" class="form-control" placeholder="Enter Business Address" /> -->
													</div>
												</div>
											</div>

											<div class="row form-group">
												<div class="table-responsive row"
													style="padding-top: 20px; padding-bottom: 15px; margin-left: 0px;">
													<table id="productGrid"></table>
													<div id="jqGridPager1"></div>
												</div>
											</div>

											<div class="row form-group"></div>

											<div class="row form-group" style="margin-top: 15px;">
												<div class="col-sm-2 col-md-offset-6">
													<label class="control-label" for="hamaliExpence"><b>Total
															SubTotal&nbsp;:&nbsp;&nbsp;</b></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-rupee" style="font-size: 18px"></i></span> <input
															type="text" id="totalSubTotalProduct"
															name="totalSubTotalProduct" placeholder="Total SubTotal"
															class="form-control input-md" readonly="readonly">
													</div>
												</div>
											</div>
											<div class="row form-group" style="margin-top: 15px;">
												<div class="col-sm-2 col-md-offset-6">
													<label class="control-label" for="hamaliExpence"><b>Total
															Tax Amount&nbsp;:&nbsp;&nbsp;</b></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-rupee" style="font-size: 18px"></i></span> <input
															type="text" id="totalTaxAmountProduct"
															name="totalTaxAmountProduct"
															placeholder=" Total Tax Amount"
															class="form-control input-md" readonly="readonly">
													</div>
												</div>
											</div>
											<div class="row form-group" style="margin-top: 15px;">
												<div class="col-sm-2 col-md-offset-6">
													<label class="control-label" for="grossTotal"><h4>
															<b>Gross Total&nbsp;:&nbsp;&nbsp;</b>
														</h4></label>
												</div>
												<div class="col-sm-3">
													<div class="input-group">
														<span class="input-group-addon"><i
															class="fa fa-rupee" style="font-size: 18px"></i></span> <input
															type="text" id="grossTotalProduct"
															name="grossTotalProduct" placeholder="Gross Total"
															class="form-control input-md"
															style="font-size: 25px; height: 55px;"
															readonly="readonly">
													</div>
												</div>
											</div>

											<div align="center">
												<div class="col-md-12">
													<input type="button" id="btn2" name="btn2"
														class="btn btn-success btn-lg btnn "
														onclick="productBillDetailsValidation(); return false;"
														value="Print"> <input type="reset" id="btn3"
														name="btn3" class="btn btn-danger btn-lg btnn"
														onclick="resets()" value="Cancel"> <input
														type="button" value="List" id="listBtn"
														class="btn btn-primary btn-lg btnn"
														onclick="productBillingList()"> <input
														type="button" value="Edit" id="editBtn1"
														class="btn btn-primary btn-lg btnn"
														onclick="editProductBilling()">
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>
<%@include file="commons/newFooter.jsp"%>


