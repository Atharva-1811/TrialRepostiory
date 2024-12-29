<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.dao.HRBillingDao"%>
<%@page import="com.embelSoft.bean.HrBillingBean"%>
<%@page import="com.embelSoft.dao.ProductBillingDao"%>
<%@page import="com.embelSoft.bean.ProductBillingBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>

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

<style>
.leftmanu {
	width: 190px;
	background: #c50000a6;
	color: white;
}
</style>
<!-- for Hr Billing -->
<script>
function clearProductCalculation()
{
	document.productForm.gst1.value="";
	document.productForm.vat1.value="";
	document.productForm.grossTotal2.value="";
}
</script>
<script>
function ResourceBillingList()
{
	window.location="ResourceBillingList.jsp";
}
</script>
<script type="text/javascript">
function productBillingList()
{
	window.location="ProductBillingList.jsp";
}
</script>
<script>
function resets()
{
	location.reload(true);
}
</script>
<script type="text/javascript">
function clearField()
{
	document.hrBilling.description.value="";
	document.productForm.description1.value="";
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

<%
	if (session.getAttribute("user") != null) {
%>
<body>
	<div class="container-fluid">
		<div class="row" style="min-height: 300px;">
			<div class="col-md-12">
				<h3>Left Tabs</h3>
				<hr />
				<div class="col-md-2">
					<ul class="nav nav-tabs">
						<li class=""><a class="leftmanu" href="#messages"
							data-toggle="tab">Resource Billing</a></li>
						<li><a class="leftmanu" href="#settings" data-toggle="tab">Product
								Billing</a></li>
					</ul>
				</div>
				<div class="col-xs-9">
					<!-- Tab panes -->
					<div class="tab-content">
						<%
							String Hr;

								SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
								Date dateobj = new Date();

								String d1 = dateobj.toString();
								String[] d = d1.split(" ");

								String year = d[5];
								String month = d[1];

								String HrBill = month + "/" + year + "/" + "1";
						%>
						<%
							HRBillingDao hrDao = new HRBillingDao();
								List bill = hrDao.getVendorBill();

								for (int i = 0; i < bill.size(); i++) {
									HrBillingBean bean = (HrBillingBean) bill.get(i);

									Hr = bean.getBill();
									String[] HrBil = Hr.split("/");

									String lNo = HrBil[2];

									int lstNo = Integer.parseInt(lNo);
									int LastNo = lstNo + 1;

									HrBill = month + "/" + year + "/" + LastNo;
								}
						%>
						<!------------ HR / Resource Billing ---------->
						<div class="tab-pane active" id="messages">
							<form class="form-horizontal" method="post" action=""
								name="hrBilling">
								<div class="row">
									<div align="center">
										<h2 class="form-name style_heading">Resource Billing</h2>
									</div>
									<div class="row">
										<div class="col-sm-offset-1 col-md-10">
											<hr style="border-top-color: #c1b1b1;">
										</div>
									</div>
								</div>
								<div align="right" style="margin-right: 150px;" id="billno">
									<h3 style="color: red; font-family: digital-clock-font;">
										Bill No ::<%=HrBill%>
									</h3>
								</div>
								<div class="row form-group"></div>
								<div class="row">
									<div class="row form-group">
										<label class="col-md-3 control-label" for="employeename">Vendor
											Name :<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-user"></i></span>
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
										<div class="col-sm-2" align="right">
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
													type="date" id='billingDate' name="billingDate"
													value="<%=todayDate%>" class="form-control"
													placeholder="Select Enquiry Date" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<!-- 	<h4 style="margin-left: 60vh;margin-top: -1px;margin-bottom: 10px">TO</h4> -->
										<div class="col-sm-3" align="right">
											<label class="control-label">Billing Period Start
												Date :<sup>*</sup>
											</label>
										</div>
										<div class="col-sm-3">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i></span> <input
													type="date" id='billingPeriodFrom' name="billingPeriodFrom"
													class="form-control">
											</div>
										</div>
										<div class="col-sm-2" align="right">
											<label class="control-label">End Date :<sup>*</sup></label>
										</div>
										<div class="col-sm-3">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-calendar"></i></span> <input
													type="date" id='billingPeriodTo' name="billingPeriodTo"
													class="form-control" />
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<div class="col-md-2 col-sm-offset-1" align="left">
											<label class="control-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Description
												:<sup>*</sup>
											</label>
										</div>
										<div class="col-md-8">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-pencil "></i></span>
												<textarea id='description' name="description"
													class="form-control" placeholder="Enter description"
													onchange="getHrBillingGrid();clearHrCalculation();clearField()"
													rows="1" cols="2"></textarea>
											</div>
										</div>
									</div>
								</div>
								<div class="table-responsive	row "
									style="PADDING-TOP: 20PX; PADDING-BOTTOM: 15PX; margin-left: -190px;">
									<table id="jqgrid"></table>
									<div id="jqGridPager"></div>
								</div>
								<div class="row form-group">
									<label class="col-md-2 col-md-offset-6 control-label"
										for="hamaliExpence"><b>Sub
											Total&nbsp;:&nbsp;&nbsp;</b></label>
									<div class="col-sm-3">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-rupee"
												style="font-size: 18px"></i></span> <input id="subTotal"
												readonly="readonly" name="subTotal" placeholder="Sub Total"
												style="width: 80;" class="form-control input-md" type="text">
										</div>
									</div>
								</div>
								<div class="row form-group">
									<label class="col-md-2 col-md-offset-6 control-label"
										for="hamaliExpence"><b>GST&nbsp;:<sup>*</sup></b></label>
									<div class="col-sm-3">
										<div class="input-group">
											<span class="input-group-addon">%</span> <input id="gst"
												name="gst" placeholder=" GST" class="form-control input-md"
												type="text" onchange="CalculateGstAmount()"
												onkeypress="return isNumber(event)">
										</div>
									</div>
								</div>
								<div class="row form-group">
									<label class="col-md-2 col-md-offset-6 control-label"
										for="hamaliExpence"><b>Total Tax
											Amount&nbsp;:&nbsp;&nbsp;</b></label>
									<div class="col-sm-3">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-rupee"
												style="font-size: 18px"></i></span> <input id="vat"
												readonly="readonly" name="Gst Amount"
												placeholder=" Gst Amount" class="form-control input-md"
												type="text">
										</div>
									</div>
								</div>
								<div class="row form-group">
									<label class="col-md-offset-6 col-md-2 control-label"
										for="grossTotal1"><h4>
											<b>Gross Total&nbsp;:&nbsp;&nbsp;</b>
										</h4></label>
									<div class="col-sm-3">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-rupee"
												style="font-size: 18px"></i></span> <input readonly="readonly"
												id="grossTotal1" name="grossTotal1"
												placeholder="Gross Total" class="form-control input-md"
												type="text" style="font-size: 25px; height: 55px;">
										</div>
									</div>
								</div>
								<div class="row form-group ">
									<div class="col-md-10 text-center">
										<input type="button" id="btn1" name="btn1"
											style="font-size: 25" class="btn btn-success btn-lg btnn "
											onclick="addHrBillValidation(); return false;" value="Print">
										<input type="reset" id="btn1" name="btn1"
											style="font-size: 25" class="btn btn-danger btn-lg btnn"
											onclick="resets()" value="Cancel"> <input
											type="button" value="List" id="listBtn"
											class="btn btn-primary btn-lg btnn"
											onclick="ResourceBillingList()">
									</div>
								</div>
							</form>
						</div>

						<!------------------ Product Coding Billing ------------>
						<%
							String pr;

								SimpleDateFormat dateFormat11 = new SimpleDateFormat("yyyy-MM-dd");
								Date dateobj2 = new Date();

								String d11 = dateobj.toString();

								String[] d12 = d11.split(" ");

								String year2 = d12[5];
								String month2 = d12[1];

								String productBill = month2 + "/" + year2 + "/" + "1";
						%>

						<%
							ProductBillingDao proDao = new ProductBillingDao();
								List billNo = proDao.getClientBill();

								for (int i = 0; i < billNo.size(); i++) {
									ProductBillingBean bean2 = (ProductBillingBean) billNo.get(i);
									pr = bean2.getBillNo();

									String[] prBill = pr.split("/");

									String lNo = prBill[2];

									int lstNo = Integer.parseInt(lNo);
									int lastNo = lstNo + 1;

									productBill = month2 + "/" + year2 + "/" + lastNo;
								}
						%>

						<!------------------ Product Billing ------------>
						<div class="tab-pane" id="settings">
							<form method="post" action="" name="productForm">
								<div class="row">
									<div align="center">
										<h2 class="form-name style_heading">Product Billing</h2>
									</div>
									<div class="row">
										<div class="col-md-11">
											<hr style="border-top-color: #c1b1b1;">
										</div>
									</div>
								</div>



								<div align="right" style="margin-right: 150px;" id="billno">
									<h3 style="color: red; font-family: digital-clock-font;">
										Bill No ::
										<%=productBill%>
									</h3>
								</div>
								<div class="row form-group"></div>

								<div class="row form-group">
									<label class="col-md-2 control-label" for="employeename"
										style="text-align: right;" style="margin-top: 9px;">Client
										Name&nbsp;:<sup>*</sup>
									</label>
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

									<div class="col-sm-2" align="right">
										<label class="control-label" style="margin-top: 9px;">Date&nbsp;:<sup>*</sup></label>
										<%
											SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
												String todayDate2 = simpleDateFormat2.format(new Date());
										%>
									</div>
									<div class="col-sm-3">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="glyphicon glyphicon-calendar"></i>
											</span> <input type="date" id='billingDate1' name="billingDate1"
												value="<%=todayDate2%>" class="form-control"
												placeholder="Select Enquiry Date" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group">
										<div class="col-md-2" align="right">
											<label class="control-label" style="margin-top: 9px;">Description&nbsp;:<sup>*</sup></label>
										</div>
										<div class="col-md-8">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-pencil "></i>
												</span>
												<textarea id='description1' name="description"
													class="form-control" placeholder="Enter description"
													onchange="getProductBillingGrid();clearProductCalculation();clearField()"
													rows="2" cols="10"></textarea>

												<!-- <input type="text" id='description1' name="description" class="form-control" placeholder="enter description" onchange="getProductBillingGrid();clearProductCalculation();clearField()" /> -->
											</div>
										</div>



									</div>
								</div>

								<div class="table-responsive	row col-md-offset-1"
									style="PADDING-TOP: 20PX; PADDING-BOTTOM: 15PX; margin-left: -190px;">

									<table id="productGrid"></table>
									<div id="jqGridPager1"></div>
								</div>

								<div class="row form-group">
									<label class="col-md-2 col-md-offset-6 control-label"
										style="margin-top: 9px;"><b>Sub
											Total&nbsp;:&nbsp;&nbsp;</b></label>
									<div class="col-sm-3">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-rupee" style="font-size: 18px"></i>

											</span> <input id="subTotal1" name="subTotal1" readonly="readonly"
												placeholder="Sub Total" style="width: 80;"
												class="form-control input-md" type="text">
										</div>
									</div>
								</div>

								<div class="row form-group">
									<label class="col-md-2 col-md-offset-6 control-label"
										for="hamaliExpence" style="margin-top: 9px;"><b>GST&nbsp;:<sup>*</sup></b></label>
									<div class="col-sm-3">
										<div class="input-group">
											<span class="input-group-addon"> % </span> <input id="gst1"
												name="gst1" placeholder="GST" class="form-control input-md"
												type="text" onchange="CalculateGstAmount1()"
												onkeypress="return isNumber(event)">
										</div>
									</div>
								</div>

								<div class="row form-group">
									<label class="col-md-2 col-md-offset-6 control-label"
										for="hamaliExpence" style="margin-top: 9px;"><b>GST
											Amount&nbsp;:&nbsp;&nbsp;</b></label>
									<div class="col-sm-3">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-rupee" style="font-size: 18px"></i>

											</span> <input id="vat1" name="vat1" placeholder=" Gst Amount"
												readonly="readonly" class="form-control input-md"
												type="text">
										</div>
									</div>

								</div>

								<div class="row form-group">
									<label class="col-md-offset-6 col-md-2 control-label"
										for="grossTotal1" style="margin-top: 9px;"><h4>
											<b>Gross Total&nbsp;:&nbsp;&nbsp;</b>
										</h4></label>
									<div class="col-sm-3">
										<div class="input-group">
											<span class="input-group-addon"> <i
												class="fa fa-rupee" style="font-size: 18px"></i>

											</span> <input readonly="readonly" id="grossTotal2"
												name="grossTotal2" placeholder="Gross Total"
												class="form-control input-md" type="text"
												style="font-size: 25px; height: 55px;">
										</div>
									</div>
								</div>
								<div class="row form-group " style="text-align: center;">
									<input type="button" id="btn2" name="btn2"
										style="font-size: 25" class="btn btn-success btn-lg btnn "
										onclick="ProductBillingDetailsValidation(); return false;"
										value="Print"> <input type="reset" id="btn2"
										name="btn2" style="font-size: 25"
										class="btn btn-danger btn-lg btnn" onclick="resets()"
										value="Cancel"> <input type="button"
										style="font-size: 25" value="List" id="listBtn"
										class="btn btn-primary btn-lg btnn"
										onclick="productBillingList()">
								</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="commons/newFooter.jsp"%>
</body>
<%
	}
%>
</html>
