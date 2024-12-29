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

function backProduct()
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
				<h2 class="form-name style_heading">Update Product Billing</h2>
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
		<%-- <div align="right" id="billno">
		<h4 class="quo">Bill No :: <%= poNo%></h4>
	</div> --%>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		<div id="wrqpper">
			<form class="form-horizontal" method="post" action=""
				name="editProdBilling">
				<div class="row form-group"></div>
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label" for="clientName">Client Name
							:<sup>*</sup>
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
								onchange="fetchProdEditbillno();">
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
						<label class="control-label">Product Bill No :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-hand-right"></i></span> <select id='BillNo'
								name="BillNo" class="form-control" placeholder="Select Bill No"
								onchange="fetchEditProdBillDetails(); return getEditProductBillGrid()"></select>
						</div>
					</div>
				</div>


				<div class="row form-group" style="display: none;">
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
								onchange="getEditProductBillGrid()">
							<datalist id="productNameList">
								<%
									for (int i = 0; i < productNameList.size(); i++) {
										ProductDetailsHibernate hibernate = (ProductDetailsHibernate) productNameList.get(i);
								%>
								<option data-value="<%=hibernate.getPkProductDetailsId()%>"
									value="<%=hibernate.getProductName()%>">
									<%
										}
									%>
								
							</datalist>
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
								class="glyphicon glyphicon-calendar"></i></span> <input type="date"
								id='productBillDate' name="productBillDate"
								value="<%=todayDate2%>" class="form-control"
								placeholder="Select Bill Date" />
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
							<textarea id="ShipAddress" name="ShipAddress"
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
								class="glyphicon glyphicon-pencil "></i></span> <input id='CourierName'
								name="CourierName" class="form-control"
								placeholder="Enter Courier Name" rows="1" cols="2" />
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label"> Courier Tracking Number :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-home"></i>
							</span> <input id="Courierid" name="Courierid" class="form-control"
								placeholder="Enter Courier Number" />

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
							<span class="input-group-addon"><i class="fa fa-rupee"
								style="font-size: 18px"></i></span> <input type="text"
								id="totalSubTotalProduct" name="totalSubTotalProduct"
								placeholder="Total SubTotal" value="0.00"
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
							<span class="input-group-addon"><i class="fa fa-rupee"
								style="font-size: 18px"></i></span> <input type="text"
								id="totalTaxAmountProduct" name="totalTaxAmountProduct"
								placeholder=" Total Tax Amount" value="0.00"
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
							<span class="input-group-addon"><i class="fa fa-rupee"
								style="font-size: 18px"></i></span> <input type="text"
								id="grossTotalProduct" name="grossTotalProduct"
								placeholder="Gross Total" value="0.00"
								class="form-control input-md"
								style="font-size: 25px; height: 55px;" readonly="readonly">
						</div>
					</div>
				</div>

				<div align="center">
					<div class="col-md-12">
						<input type="button" id="btn2" name="btn2"
							class="btn btn-success btn-lg btnn "
							onclick="productBillDetailsUpdate(); return false;" value="Print">
						<input type="reset" id="btn3" name="btn3"
							class="btn btn-danger btn-lg btnn" onclick="resets()"
							value="Cancel"> <input type="button" value="Back"
							id="btn1" class="btn btn-primary btn-lg btnn"
							onclick="backProduct()">
					</div>
				</div>
			</form>
		</div>
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