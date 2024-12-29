<!-- ComponentReceivedPOReport.jsp -->

<%@page import="com.embelSoft.dao.ComponentReceivedPODao" %>
<%@page import="com.embelSoft.bean.ComponentReceivedPOBean" %>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
			
<!-- 	<!-- For datatable to pdf,print,excel etc conversion -->
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
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

<script src="/embelSoft/staticContent/js/ComponentDetails.js"></script>

<script>
$(document).ready(function(){
	componentReceivedPOReport();
});
</script>  
<style type="text/css">
	td	{
		color:  black;
	}
</style>
</head>
<div class="container-fluid" style="min-height:300px;">

				<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Component Received PO Report</h2>
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

	<div id="demo_jui">
	   <table class="table table-bordered table-striped table-condensed cf"
			id="purchaseOrderCreatelist" class="display" style="border: 2px solid black; border-collapse: collapse;">
			<thead>
				<tr>
					<th>Sr No</th>
					<th>Bill/Challan No</th>
					<th>Vendor Name</th>
	                <th>Purchase Order Date</th>
					<th>Expect Payment Date</th>
					<th>Component Type</th>
					<th>Component Name</th>
	                <th>Component Value</th>
	                <th>Part Name</th>
					<th>Manufacturer Name</th>
					<th>Description</th>
					<th>Type</th>
					<th>Package</th>
					<th>tolerance</th>
					<th>Unit</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th>Sub Total</th>
					<th>GST</th>
					<th>IGST</th>
					<th>Tax Amount</th>
					<th>Total</th>
					<th>Total Tax Amount</th>
					<th>Total Sub Total</th>					
					<th>Gross Total</th>	
				</tr>
			</thead>
			<tfoot>
<!-- 				<th colspan="7" style="text-align: right">Total:</th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
<!-- 				<th></th> -->
			
			</tfoot>
		</table>
	</div>
<%@include file="commons/newFooter.jsp" %>
</div>