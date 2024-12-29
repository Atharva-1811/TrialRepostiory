<!-- ComponentBilling.jsp -->

<%@page import="com.embelSoft.hibernate.ComponentStockHibernate"%>
<%@page import="com.embelSoft.dao.ComponentReceivedPODao"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>
<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.bean.CompoenentBillingBean"%>
<%@page import="com.embelSoft.dao.CompoenentBillingDao"%>
<%@page import="com.embelSoft.dao.ResourceBillingDao"%>
<%@page import="com.embelSoft.bean.ResourceBillingBean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.embelSoft.hibernate.CompoentCategoryDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ComponentCategoryDetailsDao"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>

<html>
<head>
<link rel="stylesheet"
	href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"
	href="/embelSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet"
	href="/embelSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">




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

<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript"src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
<link href="/embelSoft/staticContent/css/StyleValidation.css"rel="stylesheet" type="text/css" />
<script src="/embelSoft/staticContent/js/compoentBill.js"></script>
<script src="/embelSoft/staticContent/js/SubCategoryDetails.js"></script>
<script src="/embelSoft/staticContent/js/ComponentDetails.js"></script>

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
<script>
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
	document.getElementById("subCategory").value="";
	
}
</script>
<style type="text/css">
.quo {
	font-weight: 600;
	color: red;
	font-family: digital-clock-font;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Component Stock Outward</h2>
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
			CompoenentBillingDao RBDao = new CompoenentBillingDao();
			List bill = RBDao.getCompoentLastBillNo123();

			for (int i = 0; i < bill.size(); i++) {
				CompoenentBillingBean bean = (CompoenentBillingBean) bill.get(i);

				Hr = bean.getBillNo(); //Jun/2020/22
				String[] HrBil = Hr.split("/");

				String lNo = HrBil[2];

				int lstNo = Integer.parseInt(lNo);
				int LastNo = lstNo + 1;

				HrBill = month + "/" + year + "/" + LastNo;

				System.out.println("IN All Billing Compoent Billing Stop 1");
			}
		%>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		<div align="right" id="billno">
			<h4 class="quo">
				Bill No ::<%=HrBill%></h4>
		</div>
		<div id="wrqpper">
			<form class="form-horizontal" name="CompBilling">

				<div class="row form-group">
					<div class="col-sm-2 col-md-offset-1">
						<label class="control-label" for="clientName">Client Name
							:<sup>*</sup>
						</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<%
								CompoenentBillingDao dao = new CompoenentBillingDao();
								List list = dao.getAllClientNames();
							%>
							<input list="clientNamesList" id="fkClientId"
								class="form-control" placeholder="Select Client Name">
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
						<label class="control-label">Date :<sup>*</sup></label>
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
				</div>

				<div class="row form-group">
					<div class="col-sm-2 col-md-offset-1">
						<label class=" control-label" for="clientName">Project
							Name :</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								id="ProjectName" class="form-control"
								placeholder="Enter Project Name">

						</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label" for="BoardName">Board Name :</label>

					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								id='BoardName' name="BoardName" class="form-control"
								placeholder="Enter Board Name" />
						</div>
					</div>
				</div>

				<div class="row form-group"></div>
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Component Category&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i></span>
							<%
								ComponentCategoryDetailsDao dao1 = new ComponentCategoryDetailsDao();
								List compTypeList = dao1.getAllCompTypeDetails();
							%>
							<span> 				
					<input list="componentNameList" id="componentType" class="form-control"	placeholder="Select Component Category" onchange="getComponentSubcategory()">
								<datalist id="componentNameList">
									<%
										for (int i = 0; i < compTypeList.size(); i++) {
											CompTypeDetailsHibernate ctdh = (CompTypeDetailsHibernate) compTypeList.get(i);
									%>
									<option data-value="<%=ctdh.getPkCompTypeId()%>"
										value="<%=ctdh.getComponentType()%>">
										<%
											}
										%>									
								</datalist>
								</span>
						</div>
					</div>
					<div>
						<div class="col-sm-2">
							<label class="control-label">ComponentSubCategory:<sup>*</sup></label>
								
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-hand-right"></i></span> 
							<input list="subCategoryList" id='subCategory' name="componentBoxSubcategory" 
							class="form-control" placeholder="Enter Component SubCategory" onchange="GetCompoentNameagainestCategory1()">
								<datalist id="subCategoryList">

								</datalist>
							</div>
						</div>
					</div>
				</div>




				<div class="row form-group"></div>

				<div class="row form-group">
					<div class="col-sm-2 col-md-offset-1">
						<label class="control-label">Component Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i></span> 
						   <input list="componentName_id1" class="form-control input-md" id='componentName_id' name="componentName_id" placeholder="Select Component Name" onchange="getComponentDetailsV();clearFiled()" />	
							<datalist id="componentName_id1"></datalist>
							
						</div>
					</div>
					<div class="col-sm-2 ">
						<label class="control-label"><b>Description&nbsp;:&nbsp;&nbsp;</b></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-rupee"
								style="font-size: 18px"></i></span>
							<textarea rows="4" cols="22" id="description"></textarea>
						</div>
					</div>
					<div class="row form-group"></div>
						<div class="container">
							<div class="table-responsive">
								<table id="list4"></table>
								<div id="jqGridPager"></div>
							</div>
						</div><br>
					
					<div class="col-sm-2 col-md-offset-6">
						<label class="control-label" for="hamaliExpence"><b>Total
								SubTotal&nbsp;:&nbsp;&nbsp;</b></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-rupee"
								style="font-size: 18px"></i></span> <input type="text"
								id="totalSubTotalProduct" name="totalSubTotalProduct"
								placeholder="Total SubTotal" class="form-control input-md"
								readonly="readonly">
						</div>
					</div>
				</div>

				<div class="row form-group"></div>
				<div class="row form-group">
					<div class="col-sm-2 col-md-offset-6">
						<label class=" control-label" for="hamaliExpence"><b>Total
								Tax Amount&nbsp;:&nbsp;&nbsp;</b></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-rupee"
								style="font-size: 18px"></i></span> <input type="text"
								id="totalTaxAmountProduct" name="totalTaxAmountProduct"
								placeholder=" Total Tax Amount" class="form-control input-md"
								readonly="readonly">
						</div>
					</div>
				</div>
				<div class="row form-group"></div>
				<div class="row form-group">
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
								placeholder="Gross Total" class="form-control input-md"
								style="font-size: 25px; height: 55px;" readonly="readonly">
						</div>
					</div>
				</div>

				<div align="center">
					<div class="col-md-12">
						<input type="button" id="btn2" name="btn2" style="font-size: 25"
							class="btn btn-success btn-lg btnn "
							onclick="Compoentbillingvalidation10()" value="Save"> <input
							type="reset" id="btn2" name="btn2" style="font-size: 25"
							class="btn btn-danger btn-lg btnn" onclick="resets()"
							value="Cancel"> <input type="button" value="Stock"
							id="listBtn" class="btn btn-primary btn-lg btnn"
							onclick="componentStock()">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>