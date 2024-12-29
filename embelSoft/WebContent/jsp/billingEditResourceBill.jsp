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
	document.editRsrcBilling.totalSubTotalProduct.value="";
	document.editRsrcBilling.totalTaxAmountProduct.value="";
	document.editRsrcBilling.grossTotalProduct.value="";
}
</script>
<script type="text/javascript">
function clearField()
{
	document.editRsrcBilling.productResourceName.value="";
	document.editRsrcBilling.productName.value="";
}
</script>

<script type="text/javascript">

function backPage()
{
	window.location="BillingAll.jsp";
}
</script>

<script type="text/javascript">
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

<%
	String PoBill;

	SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
	Date dateobj = new Date();

	String d1 = dateobj.toString();

	System.out.println("FULL DATE  !!!!!!!!!!!!!!!!!  ::  " + d1);

	String[] d = d1.split(" ");

	String year = d[5];

	String month = d[1];

	String poNo = "PO" + "/" + year + "/" + month + "/" + 001;
%>


<body>

	<div class="container-fluid">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Update Service / Resource
					Billing</h2>
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
			<div class="form-group" align="right"></div>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		<div id="wrqpper">
			<form class="form-horizontal" method="post" action=""
				name="editRsrcBilling">

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
								onchange="getAlleditResourceBillNoAgainst();">
							<datalist id="vendorNamesList">
								<%
									for (int i = 0; i < vendorList.size(); i++) {
										VendorDetailsHibernate vendorHibernate = (VendorDetailsHibernate) vendorList.get(i);
								%>
								<option data-value="<%=vendorHibernate.getPkVendorDetailsId()%>"
									value="<%=vendorHibernate.getVendorName()%>">
									<%
										}
									%>
								
							</datalist>
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Resource Bill No :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-hand-right"></i></span> <select
								id='resrcbillNo' name="resrcbillNo" class="form-control"
								placeholder="Select Bill No"
								onchange="getRPIBillingDate(); return getEditResourceBillGrid2();"></select>
							<!-- getResourceBillGrid() -->
						</div>
					</div>
				</div>


				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Billing Period Start Date :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span> <input type="date"
								id='billPeriodStartDate' name="billPeriodStartDate"
								class="form-control">
						</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label">End Date :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span> <input type="date"
								id='billPeriodEndDate' name="billPeriodEndDate"
								class="form-control" />
						</div>
					</div>
				</div>

				<div class="row form-group">

					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Date :<sup>*</sup></label>
						<%
							SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
							String todayDate = simpleDateFormat.format(new Date());
						%>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span> <input type="date"
								id='billDate' name="billDate" value="<%=todayDate%>"
								class="form-control" placeholder="Select Bill Date" />
						</div>
					</div>


					<div style="display: none";>
						<div class="col-sm-2">
							<label class="control-label">Service/Resource Name :<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-pencil "></i></span>
								<textarea id='productResourceName' name="productResourceName"
									class="form-control" placeholder="Enter Product Name"
									onchange="getEditResourceBillGrid2()" rows="1" cols="2"></textarea>
								<!-- getResourceBillGrid() -->
							</div>
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
							<span class="input-group-addon"><i class="fa fa-rupee"
								style="font-size: 18px"></i></span> <input type="text"
								id="totalSubTotal" name="totalSubTotal"
								placeholder="Total SubTotal" class="form-control input-md"
								readonly="readonly">
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
							<span class="input-group-addon"><i class="fa fa-rupee"
								style="font-size: 18px"></i></span> <input type="text"
								id="totalTaxAmount" name="totalTaxAmount"
								placeholder=" Total Tax Amount" class="form-control input-md"
								readonly="readonly">
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
							<span class="input-group-addon"><i class="fa fa-rupee"
								style="font-size: 18px"></i></span> <input type="text" id="grossTotal"
								name="grossTotal" placeholder="Gross Total"
								class="form-control input-md"
								style="font-size: 25px; height: 55px;" readonly="readonly">
						</div>
					</div>
				</div>
				<div align="center">
					<div class="col-md-12">
						<input type="button" id="btn1" name="btn1"
							class="btn btn-success btn-lg btnn "
							onclick="editResourceBill(); return false;" value="Update">
						<input type="reset" id="btn4" name="btn4"
							class="btn btn-danger btn-lg btnn" onclick="resets()"
							value="Cancel"> <input type="button" value="Back"
							id="back1" class="btn btn-primary btn-lg btnn"
							onclick="backPage()">
					</div>
				</div>
			</form>
		</div>
	</div>

</body>

<script type="text/javascript">

	function afterCalculation()
	{

		alert("subTotal" +subTotal);
		vatValue = (gst)*(subTotal)/100;
		
		document.getElementById('vat').value=vatValue;
		
		
		var grossTotal = +subTotal + +vatValue;
		
		document.getElementById('grossTotal').value=grossTotal;
		
	}

</script>

</html>
<%@include file="commons/newFooter.jsp"%>