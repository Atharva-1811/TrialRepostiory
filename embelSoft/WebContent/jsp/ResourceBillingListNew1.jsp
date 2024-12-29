<!-- ResourceBillingListNew1.jsp -->

<%@page import="com.embelSoft.dao.ResourceBillingDao"%>
<%@page import="com.embelSoft.bean.ResourceBillingBean"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<!-- For datatable to pdf,print,excel etc conversion -->
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

<!-- <script src="/embelSoft/staticContent/js/billing.js"></script> -->

<link rel="stylesheet" href="/embelSoft/staticContent/css/venderlist.css">

<!-- <script>
$(document).ready(function(){
	resourceBillingList();
}); 
</script> -->

<script type="text/javascript">
function ServiceBack() {
	 window.location = "BillingAll.jsp";
	 //data-toggle = "tab" data-target = "#resourceBilling";
	 $("#resourceBilling").modal('tab');
}
</script>

<style type="text/css">
td 
{
	 color:  black;
}
</style>
</head>
<body>
<div class="container" style="min-height:300px;">
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading">Resource Billing List</h2>
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
		<div class="col-sm-offset-1 col-md-10">
			<hr style="border-top-color: #c1b1b1;">
		</div>
	</div>
	<div id="date">
		<label id="demo"></label>
		<script>
			var date = new Date();
			document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>
	<%
		//HRBillingDao dao=new HRBillingDao();
		//List<HrBillingBean> list = dao.getHrBillingList();
		ResourceBillingDao dao = new ResourceBillingDao();
		List<ResourceBillingBean> list = dao.getResourceBillingList();
	%>

	<div id="demo_jui">
	<div class="container">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
					<th>Sr No</th>
					<th>Bill No</th>
					<th>Bill Date</th>
					<th>Vendor Name</th>
					<th>Bill Period Start Date</th>
					<th>Bill Period End Date</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>HSN/SAC</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th>Amount</th>
					<th>Discount Percent</th>
					<th>Discount Amount</th>
					<th>Sub Total</th>				
					<th>GST</th>
					<th>IGST</th>
					<th>Tax Amount</th>				
					<th>Total</th>
					<th>Total Sub Total</th>
					<th>Total Tax Amount</th>
					<th>Gross Total</th>
				</tr>
			</thead>
			<tbody>		
   				<%
		            int k=1;
   					double total = 0.00;
		            double taxAmount = 0.00;
					for(int i=0;i<list.size();i++){
						ResourceBillingBean bean = (ResourceBillingBean)list.get(i);	
				%>				
				<tr>
					<td class="align"><%=bean.getSrNo() %></td>
					<td class="align"><%=bean.getBillNo() %></td>
					<td class="align"><%=bean.getBillDate() %></td>
					<td class="align"><%=bean.getVendorName() %></td>
					<td class="align"><%=bean.getBillPeriodStartDate() %></td>
					<td class="align"><%=bean.getBillPeriodEndDate() %></td>
					<td class="align"><%=bean.getProductName() %></td>
					<td class="align"><%=bean.getDescription() %></td>
					<td class="align"><%=bean.getHsnSac() %></td>
					<td class="align"><%=bean.getUnitPrice() %></td>
					<td class="align"><%=bean.getQuantity() %></td>
					<td class="align"><%=bean.getAmount() %></td>
					<td class="align"><%=bean.getDiscountPercent() %></td>					
					<td class="align"><%=bean.getDiscountAmount() %></td>
					<td class="align"><%=bean.getSubTotal() %></td>
					<td class="align"><%=bean.getGST() %></td>
					<td class="align"><%=bean.getIGST() %></td>
					<td class="align"><%=bean.getTaxAmount() %></td>
					<td class="align"><%=bean.getTotal() %></td>					
					<td class="align"><%=bean.getTotalSubTotal() %></td>
					<td class="align"><%=bean.getTaxAmount() %></td>
					<td class="align"><%=bean.getGrossTotal() %></td>	
				</tr>
				<%
					total =total + bean.getTotal();
					taxAmount = taxAmount + bean.getTotalTaxAmount();
					}
				%>
				<tr>
					<td colspan="23" class="align"></td>
				</tr>
			</tbody>
			<tfoot>
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
					<th colspan="8" style="text-align: right">Tax Amount :</th>
					<th colspan="2"><%=taxAmount %></th>
					<th colspan="2" style="text-align: right">Total :</th>
					<th colspan="3"><%=total %></th>
					<th colspan="8"></th>
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
			</tfoot>
		</table>
	</div>
	</div>
	</div>
	<div class="wrapper" align="center">
		<input type="button" style=" font-size: 25" value="Back" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="ServiceBack()" /> 
	</div>
</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %>
