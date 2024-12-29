<!-- ClientQuotationReport.jsp -->


<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>

<%@page import="com.embelSoft.bean.QuotationBean"%>
<%@page import="com.embelSoft.dao.QuotationDao"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>

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

<!-- For datatable to pdf,print,excel etc conversion to connect offline jars -->
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

<script src="/embelSoft/staticContent/js/quotation.js"></script>

 <link rel="stylesheet" href="/embelSoft/staticContent/css/venderlist.css"> 

<style type="text/css">
	 td {
	 		color:  black;
	 	}       
</style>
<script>
$(document).ready(function(){
	venderQuotationReport();
});
</script>
<script type="text/javascript">
	 function Back() {
			 window.location = "Quotation.jsp";
	}
</script>


    <body id="dt_example" class="master_form_img">
	
	<div class="container" > 
 		<div class="row header_margin_top">
			<div align="center" >
				  <h2 class="form-name style_heading">Vender Quotation Report</h2>
			</div>
		</div>
<!-- <div class="container"> -->
<div class="row">
	
		<div class="form-group" align="right">
			<!-- <div class="col-sm-offset-8 col-md-4 control-label"> -->
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
		<!-- <div class="row"> -->
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
			<!-- </div> -->
		
    <form class="form-horizontal" method="post" action="" name="clientReport">
				
			<!-- 	<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="center">
						<label class="control-label" for="billType">Type&nbsp;:</label>
					</div>
					
					
					<div class="col-sm-4">
						<div class="col-md-4 col-xs-6 ">
							<label class="radio-inline">
							 <input type="radio" name="type" id="vendor" value="vendor" onclick="getVendorDetailas()" style="margin-left: -70px;"/>
							 <h4 style="margin-top: 0px;">Vendor</h4>
							</label>
						</div>
						
						
						<div class="col-md-6 col-xs-6 col-md-ffset-1 ">
							<label class="radio-inline">
							 <input type="radio" name="type" id="client" value="client" onclick="clientQuotationReport()" style="margin-left: -59px;"/>
							 <h4 style="margin-top: 0px;">Client</h4>
							</label>
						</div>
						</div>
					 </div> -->
				
				

		<div class="row form-group buttons_margin_top ">
			<div align="center">
				
			</div>
		</div>
	<div id="container">
                     <div class="table-responsive">
	
					<table
						class="table table-bordered table-striped table-condensed cf"
						id="typeWiseReportForQuo" class="display"
						style="border: 1px solid white; border-collapse: collapse; width:100%;" >
						<thead>
							<tr>
							  
							    <th>Sr No</th>
							    <th>Quotation No</th>
							    <th>Quotation Date</th>
							    <th>Type</th>
								<th>Vender Name</th>
				                <th>Company Name</th>
				                <th>Company Address</th>
				                <th>State</th>
								<th>Zip</th>
								<th>Phone Number</th>
<!-- 								<th>Features</th> -->
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
<!-- 								<th>SGST</th> -->
								<th>IGST</th>
								<th>Tax Amount</th>				
								<th>Total</th>
								<th>Total Sub Total</th>
								<th>Total Tax Amount</th>
								<th>Gross Total</th>
								
							</tr>
						</thead>
						<tfoot>

						</tfoot>
					</table>
					</div>
					</div>
			</form>
		
		
				<div class="wrapper" align="center">
		<input type="button" style=" font-size: 25" value="Back" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="Back()" /> 
	</div>
</div>
</div>
	</body>
</html>