<!-- ComponentReceivedPO.jsp -->

<%@page import="com.embelSoft.hibernate.CompoentCategoryDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ComponentCategoryDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsBean"%>
<%@page import="com.embelSoft.dao.ComponentReceivedPODao"%>
<%@page import="java.util.List"%>
<%@page import="com.embelSoft.hibernate.UserDetailasNewHibernate"%>
<%@page import="com.embelSoft.dao.UserDetailasDao"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>

<html>
<head>
<link rel="stylesheet" href="/embelSoft/staticContent/css/shree.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">

<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">	

<script src="/embelSoft/staticContent/js/ComponentDetails.js"></script>
<script src="/embelSoft/staticContent/js/SubCategoryDetails.js"></script>

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
function componentReceivedPOBulkUp()
{
	window.location = "ComponentReceivedPOBulkUpload.jsp";
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
</head>
<body>
<div class="container">
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading">Component Received</h2>
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
		<div class="col-sm-offset-1 col-md-11" align="right">
			<hr style="border-top-color: #c1b1b1;">
		</div>
	</div>
	<div id="wrqpper"> 
	<form class="form-horizontal" name="CompReceivedPO">
			<div class="row form-group">
			<div class="col-sm-3 col-sm-offset-0" >
			<label class="control-label" for="name">Select Vender Name :<sup>*</sup></label>
			</div>
          		<div class="col-md-3">
					<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				    	<%
				    	
				    		VendorDetailsDao vdd = new VendorDetailsDao();
							List vendorList = vdd.getAllVendorName();
						%>
						<input list="venderNameList" id="fk_employee_id" class="form-control" placeholder="Select Vender Name">
						<datalist id="venderNameList">
							<%
								for (int i = 0; i < vendorList.size(); i++) {
									
									Object[] o = (Object[]) vendorList.get(i);
									
									VendorDetailsBean bean=new VendorDetailsBean();
									bean.setVendorId(o[0].toString());
									bean.setVendorName(o[1].toString());
							%>
							<option data-value="<%=bean.getVendorId()%>" value="<%=bean.getVendorName()%>">				
							<%
								}
							%>
						</datalist>
					</div>
				</div>
				<div class="col-sm-3">
					<label class="control-label">Bill/Challan No. :<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-hand-right"></i>
						</span> 
						<input type="text" id='billno' name="billno" class="form-control" placeholder="Enter Bill/Challan No.">
					</div>
				</div>
			</div>
		
			<div class="row form-group">
				<div class="col-sm-3 col-sm-offset-0">
					<label class="control-label">Purchase Order Date :<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-calendar"></i>
						</span>
						<input type="date" id='purchasedate' name="purchasedate" class="form-control" placeholder="select date">
					</div>
				</div>
				<div class="col-sm-3">
						<label class="control-label">Expect Payment Date :<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
						</span>
					 	<input type="date" id='expectPaymentDate' name="expectPaymentDate" class="form-control" placeholder="select date">
					</div>
				</div>
			</div>
		
		<div class="row form-group">	
		<div class="col-sm-3 col-sm-offset-0">
				<label class=" control-label" for="name">Component Category :<sup>*</sup></label>
				</div>
          		<div class="col-md-3">
					<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
				    	<%
				    	ComponentReceivedPODao dao = new ComponentReceivedPODao();
							List compTypeList = dao.getAllCompTypeDetails();
						%>
						<input list="componentNameList" id="componentType" class="form-control" placeholder="Select Component Type" onchange="getComponentSubcategory()" >
						<datalist id="componentNameList">
							<%
								for (int i = 0; i < compTypeList.size(); i++) {
									CompTypeDetailsHibernate ctdh = (CompTypeDetailsHibernate) compTypeList.get(i);
							%>
							<option data-value="<%=ctdh.getPkCompTypeId()%>" value="<%=ctdh.getComponentType()%>">									
							<%
								}
							%>
						</datalist>
					</div>
				</div>
			
			 <div class="col-sm-3 " >
						<label class="control-label">Component SubCategory&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-hand-right"></i></span>	
						<input list="subCategoryList" id="subCategory" name="subCategoryList" class="form-control" placeholder="Select Component Name" onchange="GetCompoentNameagainestCategory1()" >
						<datalist id="subCategoryList">
						</datalist>
							
						</div>
					</div> 				
				</div>
				
		<div class="row form-group">	
			<div class="col-sm-3 " >
						<label class="control-label">Component Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i></span> 
						<input list="componentName_id1" id="componentName_id" name="componentName_id" class="form-control" placeholder="Select Component Name" onchange="getGridForComponentTypeInRecive();clearFiled()" >
						<datalist id="componentName_id1">
						</datalist>
							
						</div>
					</div>					
				</div>

		<div class="container">
				<div class="table-responsive">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
		 	</div>
		 </div>
		
	 		<div class="row form-group"></div>	
		   	<div class="row form-group" style="margin-top:15px;">
		   	<div class="col-sm-3 col-md-offset-6">
				<label class=" control-label"  for="totalSubTotal"><b>Total Sub Total&nbsp;:&nbsp;&nbsp;</b></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa fa-rupee" style="font-size:18px"></i> </span>
	              		<input type="text" id="totalSubTotal"  name="totalSubTotal" placeholder="Total SubTotal" class="form-control input-md" readonly="readonly">
	            	</div>
	            </div>
            </div>
		
	 		<div class="row form-group"></div>	
		   	<div class="row form-group" style="margin-top:15px;">
		   		<div class="col-sm-3 col-md-offset-6">
				<label class="  control-label"  for="totalTaxAmount"><b>Total Tax Amount&nbsp;:&nbsp;&nbsp;</b></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa fa-rupee" style="font-size:18px"></i> </span>
	              		<input type="text" id="totalTaxAmount"  name="totalTaxAmount" placeholder="Total Tax Amount" class="form-control input-md" readonly="readonly">
	            	</div>
	            </div>
            </div>
	
	 		<div class="row form-group"></div>	
		   	<div class="row form-group" style="margin-top:15px;">
		   	
		   		<div class="col-sm-3 col-sm-offset-6">
				<label class="control-label"  for="grossTotal"><h4><b>Gross Total&nbsp;:&nbsp;&nbsp;</b></h4></label> 
				</div> 
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"> <i class="fa fa-rupee" style="font-size:18px"></i> </span>
	              		<input readonly="readonly" id="grossTotal" name="grossTotal"  class="form-control input-md" type="text" style="font-size: 20px; height: 55px;" placeholder="Gross Total">
	            	</div>
	            </div>
            </div>
		
		<div align="center">
			<div class="col-md-12">
				<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="btn" onclick="componentReceivedPODetailsValidation()">
				<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="resets()" onclick="reset()">
				<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="componentReceivedPOList()">
				<input type="button" style="width:125px;" value="Bulk Upload" id="blkUp" class="btn btn-primary btn-lg btnn" onclick="componentReceivedPOBulkUp()">
				<input type="button" value="Stock" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="componentStock()">
			</div>
		</div>
	</form>
	</div>
</div>
</body>
</html>
<%@include file="commons/newFooter.jsp"%>
