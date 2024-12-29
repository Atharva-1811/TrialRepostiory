
<%@page import="java.util.*"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat" %>

<!-- ComponentBilling.jsp -->

<%@page import="com.embelSoft.dao.ProductBillingDao"%>
<%@page import="com.embelSoft.hibernate.ProductDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ComponentReceivedPODao"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>
<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.bean.CompoenentBillingBean"%>
<%@page import="com.embelSoft.dao.CompoenentBillingDao"%>
<%@page import="com.embelSoft.dao.ResourceBillingDao"%>
<%@page import="com.embelSoft.bean.ResourceBillingBean"%>
<%@page import="com.embelSoft.hibernate.CompoentCategoryDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ComponentCategoryDetailsDao"%>

<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>

<%@page import="com.embelSoft.bean.ProductBillingBeanNew" %>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<html>
<head>
<link rel="stylesheet" href="/embelSoft/staticContent/css/shree.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">




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
		  
 <script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>	

<script src="/embelSoft/staticContent/js/billing.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
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
.leftmanu{
    width: 190px;
    background: #c50000a6;
    color:  white;
	}
label {
	text-align:left;
}
.quo {
	font-weight:600;
	color: red; 
	font-family: digital-clock-font;
}
</style>

<script type="text/javascript">
function componentStock()
{
	window.location = "ComponentStock.jsp";
} 
</script>
<script type="text/javascript">
function componentReceivedPOList()
{
	window.location = "ComponentReceivedPOList.jsp";
} 
</script>
<script type="text/javascript">
function clientProformaList()
{
	window.location = "ClientProformaList.jsp";
} 
</script>

<script type="text/javascript">
function ResourcePIList()
{
	window.location = "ResourceProformaInvoiceList.jsp";
} 
</script>

<script>
function resetsServicePage()
{
	location.reload(true);
	data-toggle="tab" data-target = "#ClientPI";
}
function resets()
{
	location.reload(true);
}
</script>
<script>
function lettersonly(input) 
{
	var regex = /[^a-z ]/gi;
	input.value = input.value.replace(regex, "");	
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
<script type="text/javascript">
function isAlphabets(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
		return false;
	}
	return true;
}
</script>
<script type="text/javascript">
function isAlphabetsWithSpace(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
		return false;
	}
return true;
}
</script>
<script type="text/javascript">
function clearFiled()
{
	document.getElementById("componentType").value="";
}
</script>
<style type="text/css">
	.quo {
    	font-weight: 600;
    	color: red;
    	font-family: digital-clock-font;
	}
	.control-label {
		text-align: left !important;
	}
</style>
</head>
<body>

<div class="container-fluid" > 
<div class="row">
<div  class="col-md-12">
	<h3>Left Tabs</h3>
 	<hr/>
	<div class="col-md-2" align="center">
 		<ul class="nav nav-tabs">
 			<li><a class="leftmanu" href="#ClientPI" data-toggle="tab">Client PI</a></li>
 			<li><a class="leftmanu" href="#resourceBilling" data-toggle="tab">Service PI</a></li>
		</ul>
	</div>


<!-- Tab panes -->	
<div class="col-md-9">
<div class="tab-content">

<!-- 	<div class="row">
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
	</div> -->


	<%
String Hr;
SimpleDateFormat simpleformat = new SimpleDateFormat(" dd MM yyyy");

// displaying month in MMMM format
simpleformat = new SimpleDateFormat("MM yyyy");
String strMonth= simpleformat.format(new Date());
System.out.println("Month in MMMM format = "+strMonth);

String d1123 = strMonth.toString();	
String[] d = d1123.split(" ");
String year = d[1];
String month = d[0];
String HrBill = "PI"+"/"+month+"/"+year+"/"+"1";		
%>
<%
CompoenentBillingDao RBDao = new CompoenentBillingDao();
List bill = RBDao.getproframaLastBillNo11();

for(int i=0;i<bill.size();i++)
{
	CompoenentBillingBean bean = (CompoenentBillingBean)bill.get(i);
	
	Hr = bean.getBillNo();	//Jun/2020/22
	String[] HrBil = Hr.split("/");
	
	String lNo = HrBil[3];
	
	int lstNo = Integer.parseInt(lNo);		
	int LastNo = lstNo + 1;
	
	HrBill = "PI"+"/"+month+"/"+year+"/"+LastNo;
	
	System.out.println("IN All Billing proframa Billing Stop 1");
}
%>


<!------------ CLIENT PI ---------->
<div class="tab-pane active" id="ClientPI">
<!-- <form class="form-horizontal" method="post" action="" name="quotation"> -->
	<div class="container-fluid">
	<div class="row">
		<div align="center">
			<h2 class="form-name">Client Proforma Invoice</h2>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color:#c1b1b1;">
			</div>
		</div>
	</div>	
	</div>
	
<div class="container-fluid">
	
	<div align="right" id="billno">
		<h4 class="quo">Bill No ::<%= HrBill%></h4>
	</div>	

<div class="row">
<div id="wrqpper">
	<form class="form-horizontal" method="post" action="" name="productBilling">	
	<div class="row form-group"></div>
	
	 <div class="row form-group">
		<div class="col-sm-2 col-sm-offset-1">
			<label class="control-label" for="clientName">Client Name :<sup>*</sup></label>
		</div>
		<div class="col-sm-3">
			<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>			
				<%
					ClientEnquiryDao dao = new ClientEnquiryDao();
					List list = dao.getAllClientNames();				
				%>
				<input list="clientNamesList" id="fkClientId" class="form-control" placeholder="Select Client Name">
					<datalist id="clientNamesList">
						<%
							for (int i = 0; i < list.size(); i++) {
								ClientEnquiryHibernate sup = (ClientEnquiryHibernate) list.get(i);
						%>
						<option data-value="<%=sup.getPkClientEnquiryId() %>" value="<%=sup.getFirstName()%>">
						<%
							}
						%>
					</datalist>
			</div>
		</div>					
		<div class="col-sm-2">
			<label class="control-label">Date :<sup>*</sup></label>
			<%
				SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
				String todayDate2 = simpleDateFormat2.format(new Date());
			%>
		</div>
		<div class="col-sm-3">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span> 
				<input type="date" id='productBillDate' name="productBillDate" value="<%= todayDate2%>" class="form-control" placeholder="Select Bill Date" />
			</div>
		</div>
	</div>
	
		<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1">
				<label class="control-label">Product Name :<sup>*</sup></label>
			</div>
         	<div class="col-sm-3">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
			    <%
			    	ProductBillingDao productDao = new ProductBillingDao();
					List productNameList = productDao.getAllProductNames();
				%>
				<input list="productNameList" id="productName" class="form-control" placeholder="Select Product Name" onchange="getProductBillGrid1()">
					<datalist id="productNameList">
						<%
							for (int i = 0; i < productNameList.size(); i++) {
								ProductDetailsHibernate hibernate = (ProductDetailsHibernate) productNameList.get(i);
						%>
						<option data-value="<%=hibernate.getPkProductDetailsId()%>" value="<%=hibernate.getProductName()%>">									
						<%
							}
						%>
					</datalist>
			</div>
			</div>
				<div class="col-sm-2">
						<label class="control-label">Shipping Address&nbsp;:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-home"></i>
							</span>
							<textarea id="ShipAddress" name="shipAddress" class="form-control" placeholder="Enter Shipping Address" rows="3" cols="12"></textarea>
							
                            <!-- <input type="text" id='businessAddress' name="businessAddress" class="form-control" placeholder="Enter Business Address" /> -->
						</div>
					</div>
		</div>
	
		<div class="row form-group">
		<div class="col-sm-2 col-sm-offset-1">
			<label class="control-label">Courier name :</label>
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-pencil "></i></span>
			<input id='CourierName' name="CourierName" class="form-control" placeholder="Enter Courier Name"  rows="1" cols="2"/>
		</div>
		</div>
		
					<div class="col-sm-2">
						<label class="control-label"> Courier Tracking Number :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-home"></i>
							</span>
							<input id="Courierid" name="Courierid" class="form-control" placeholder="Enter Courier Number"/>
							
                            <!-- <input type="text" id='businessAddress' name="businessAddress" class="form-control" placeholder="Enter Business Address" /> -->
						</div>
					</div>
	</div>
	
	<div class="row form-group">
	<div class="table-responsive row" style="padding-top: 20px; padding-bottom: 15px; margin-left: 0px;">			
		<table id="productGrid" ></table>
		<div id="jqGridPager1"></div>
	</div>
	</div>
	
	<div class="row form-group"></div>
					
	<div class="row form-group">
		<div class="col-sm-2 col-md-offset-6">
			<label class="control-label"  for="hamaliExpence"><b>Total SubTotal&nbsp;:&nbsp;&nbsp;</b></label>  
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
			<input type="text" id="totalSubTotalProduct"  name="totalSubTotalProduct" placeholder="Total SubTotal" class="form-control input-md" readonly="readonly">
		</div>
		</div>
	</div>
	<div class="row form-group">
		<div class="col-sm-2 col-md-offset-6">
			<label class="control-label"  for="hamaliExpence"><b>Total Tax Amount&nbsp;:&nbsp;&nbsp;</b></label>  
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
			<input type="text" id="totalTaxAmountProduct"  name="totalTaxAmountProduct" placeholder=" Total Tax Amount" class="form-control input-md" readonly="readonly">
		</div>
		</div>
	</div>
	<div class="row form-group">
		<div class="col-sm-2 col-md-offset-6">
			<label class="control-label" for="grossTotal"><h4><b>Gross Total&nbsp;:&nbsp;&nbsp;</b></h4></label>  
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
			<input type="text" id="grossTotalProduct" name="grossTotalProduct" placeholder="Gross Total" class="form-control input-md" style="font-size: 25px;  height: 55px;"  readonly="readonly" >
		</div>
		</div>
	</div>
	
	   
	<div align="center">
		<div class="col-md-12">
	   		<input type="button" id="btn2" name="btn2" style="font-size: 25" class="btn btn-success btn-lg btnn " onclick="productBillDetailsValidation1(); return false;" value="Print">
			<input type="reset" id="btn3" name="btn3" style="font-size: 25" class="btn btn-danger btn-lg btnn" onclick="resets()" value="Cancel"> 
        	<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="clientProformaList()">
		</div>
	</div>
</form>
</div>
</div>
</div>
</div>


<!------------ HR / Resource Profroma Invoice No calculation---------->

<%
String Hr2;
SimpleDateFormat simpleformat2 = new SimpleDateFormat(" dd MM yyyy");

// displaying month in MMMM format
simpleformat2 = new SimpleDateFormat("MM yyyy");
String strMonth2= simpleformat2.format(new Date());
System.out.println("Month in MMMM format = "+strMonth2);

String d2 = strMonth2.toString();	
String[] d22 = d2.split(" ");
String year2 = d22[1];
String month2 = d22[0];
String HrBill2 = "RPI"+"/"+month2+"/"+year2+"/"+"1";		
%>
<%
ResourceBillingDao RBDao2 = new ResourceBillingDao();
List bill2 = RBDao2.getResourceLastBillNo11();

for(int i=0;i<bill2.size();i++)
{
	ResourceBillingBean bean2 = (ResourceBillingBean)bill2.get(i);
	
	Hr2 = bean2.getBillNo();	//Jun/2020/22
	String[] HrBil2 = Hr2.split("/");
	
	String lNo2 = HrBil2[3];
	
	int lstNo2 = Integer.parseInt(lNo2);		
	int LastNo2 = lstNo2 + 1;
	
	HrBill2 = "RPI"+"/"+month2+"/"+year2+"/"+LastNo2;
	
	System.out.println("IN All Billing proframa Billing Stop 1");
}
%>


<!------------Resource Profroma Invoice ---------->

<div class="tab-pane" id="resourceBilling">
<!-- <form class="form-horizontal" method="post" action="" name="resourceBilling"> -->
  <div class="container-fluid">	
	<div class="row">
		<div align="center">
			<h2 class="form-name">Service Proforma Invoice</h2>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color:#c1b1b1;">
			</div>
		</div>
	</div>	
	</div>
	
	<div class="container-fluid">
	<div align="right" id="billno">
		<h4 class="quo">Bill No ::<%= HrBill2%></h4>
	</div>
		
	<div class="row">
	 <div id="wrqpper">
		<form class="form-horizontal" method="post" action="" name="resourceBilling">
	<div class="row form-group"></div>
	<div class="row form-group">
		<div class="col-sm-2 col-sm-offset-1">
			<label class="control-label" for="employeename">Vendor Name :<sup>*</sup></label>
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			<%
				VendorDetailsDao vendorDao = new VendorDetailsDao();
				List vendorList = vendorDao.getAllVendorNames();
			%>
			<input list="vendorNamesList" id="fkVendorId" class="form-control" placeholder="Select Vendor Name">
				<datalist id="vendorNamesList">
					<%
						for (int i = 0; i < vendorList.size(); i++) {
						VendorDetailsHibernate vendorHibernate = (VendorDetailsHibernate) vendorList.get(i);
					%>
					<option data-value="<%=vendorHibernate.getPkVendorDetailsId()%>"value="<%=vendorHibernate.getVendorName() %>">
					<%
						}
					%>
				</datalist>
		</div>
		</div>
		<div class="col-sm-2">
			<label class="control-label">Date :<sup>*</sup></label>
			<%
				SimpleDateFormat simpleDateFormat11 = new SimpleDateFormat("yyyy-MM-dd");
				String todayDate11 = simpleDateFormat11.format(new Date());
			%>
		</div>
		<div class="col-sm-3">
			<div class="input-group">
				<span class="input-group-addon"><i	class="glyphicon glyphicon-calendar"></i></span> 
				<input type="date" id='billDate' name="billDate" value="<%= todayDate11%>" class="form-control" placeholder="Select Bill Date" />
			</div>
		</div>
	</div>
	<div class="row form-group">
		<div class="col-sm-2 col-sm-offset-1">
			<label class="control-label">Billing Period Start Date :<sup>*</sup></label>
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			<input type="date" id='billPeriodStartDate' name="billPeriodStartDate" class="form-control">
		</div>
		</div>
		<div class="col-sm-2">
			<label class="control-label">End Date :<sup>*</sup></label>
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			<input type="date" id='billPeriodEndDate' name="billPeriodEndDate" class="form-control" />
		</div>
		</div>
	</div>
	<div class="row form-group">
		<div class="col-sm-2 col-sm-offset-1">
			<label class="control-label">Service/Resource Name :<sup>*</sup></label>
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="glyphicon glyphicon-pencil "></i></span>
			<textarea id='ResourceName' name="ResourceName" class="form-control" placeholder="Enter Resource" onchange="getResourceBillGrid12()" rows="1" cols="2"></textarea>
		</div>
		</div>
	</div>
	
	<div class="row form-group">
	<div class="table-responsive row" style="padding-top: 20px; padding-bottom: 15px; margin-left: 0px;">			
		<table id="jqgrid2" ></table>
		<div id="jqGridPager2"></div>
	</div>
	</div>
	
	<div class="row form-group"></div>
	<div class="row form-group">
		<div class="col-sm-2 col-md-offset-6">
			<label class="control-label"  for="totalSubTotal"><b>Total SubTotal&nbsp;:&nbsp;&nbsp;</b></label>  
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
			<input type="text" id="totalSubTotal"  name="totalSubTotal" placeholder="Total SubTotal" class="form-control input-md" readonly="readonly">
		</div>
		</div>
	</div>
	<div class="row form-group">
		<div class="col-sm-2 col-md-offset-6">
			<label class="control-label"  for="totalTaxAmount"><b>Total Tax Amount&nbsp;:&nbsp;&nbsp;</b></label>  
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
			<input type="text" id="totalTaxAmount"  name="totalTaxAmount" placeholder=" Total Tax Amount" class="form-control input-md" readonly="readonly">
		</div>
		</div>
	</div>
	<div class="row form-group">
		<div class="col-sm-2 col-md-offset-6">
			<label class="control-label"  for="grossTotal"><h4><b>Gross Total&nbsp;:&nbsp;&nbsp;</b></h4></label>  
		</div>
		<div class="col-sm-3">
		<div class="input-group">
			<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
			<input type="text" id="grossTotal" name="grossTotal" placeholder="Gross Total" class="form-control input-md" style="font-size: 25px;  height: 55px;"  readonly="readonly" >
		</div>
		</div>
	</div>
	<div align="center">
		<div class="col-md-12">
			<input type="button" id="btn1" name="btn1" class="btn btn-success btn-lg btnn "  onclick="resourceBillValidation12(); return false;" value="Print">
			<input type="reset" id="btn4" name="btn4" class="btn btn-danger btn-lg btnn" onclick="resetsServicePage()" value="Cancel">
			<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="ResourcePIList()">
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
</div>

</body>
</html>
<%@include file="commons/newFooter.jsp" %>



