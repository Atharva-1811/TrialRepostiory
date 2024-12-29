<!-- BillingReportNew.jsp -->

<%@page import="com.embelSoft.hibernate.ProductBillingHibernateNew"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>

<%@page import="com.embelSoft.dao.ResourceBillingDao"%>
<%@page import="com.embelSoft.bean.ResourceBillingBean"%>
<%@page import="com.embelSoft.dao.ProductBillingDao"%>
<%@page import="com.embelSoft.bean.ProductBillingBeanNew"%>


<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="java.util.List"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">  -->
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"> -->

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
<!-- <link rel="stylesheet" href="/embelSoft/staticContent/cssForReport/jquery.dataTables.min.css">  -->
<link rel="stylesheet" href="/embelSoft/staticContent/cssForReport/buttons.dataTables.min.css">

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">	

<link rel="stylesheet" href="/embelSoft/staticContent/css/tabDemo.css">

<script type="text/javascript" src="/embelSoft/staticContent/js/billing.js"></script>

<link rel="stylesheet" href="/embelSoft/staticContent/css/Report.css">

<script>
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
<style>
	.leftmanu
	{
		   width: 190px;
	    background: #c50000a6;
	    color:  white;
	}
	h2.form-name {
    margin-top: 20px;
    text-transform: uppercase;
    font-size: 25px;
    font-weight: 600;
}
</style>
</head>
<body>
<div class="container-fluid" > 
<div class="row" >
<div  class="col-md-12">
    <h3>Left Tabs</h3>
	<hr/>
	<div class="col-md-2" align="center">
		<ul class="nav nav-tabs">
		    <li><a class="leftmanu" href="#productBillingReport1" data-toggle="tab">Between Dates Billing Report</a></li>
			<li><a class="leftmanu" href="#resourceBillingReport" data-toggle="tab" >Service Billing Report</a></li>
			<li><a class="leftmanu" href="#productBillingReport" data-toggle="tab">Product Billing Report</a></li>
			<li><a class="leftmanu" href="#proformaBillingReport" data-toggle="tab">Profroma Billing Report</a></li>
			
 		</ul>
 	</div>
<!-- Tab panes -->
<div class="col-md-9">
<div class="tab-content">

<!------------ Resource Billing Report ---------->
<div class="tab-pane active" id="productBillingReport1">
	<div class="row">
		<div align="center" >
			<h2 class="form-name">Between Dates Billing Report</h2>
		</div>
	</div>
	<div class="row">
		<div class="form-group" align="right">
			<div class="col-sm-offset-8 col-md-4 control-label">
				<div id="date">
					<label id="demo2"></label>
					<script>
						var date = new Date();
						document.getElementById("demo2").innerHTML = date.toDateString();
					</script>
				</div>
			</div>
		</div>	
	</div>
	<div class="row">
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		<div class="col-md-12" align="center">
					<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab"
								href="#home1"><h4 style="color: blue">Product Billing</h4></a></li>
							<li><a data-toggle="tab"
								href="#home2"><h4 style="color: blue;">Service Billing</h4></a></li>
							
								<!-- <li><a data-toggle="tab" href="#home3"><h4 style="color: blue">Proforma Billing</h4></a></li> -->
							
							<!-- <li><a data-toggle="tab" href="#home4"><h4 style="color: blue">Common Billing(Product/Service)</h4></a></li> -->
							
						</ul>
					</div>
		<div class="row">
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div> 
			
	<div class="tab-content" id="tabname">

	<div id="home1" class="tab-pane fade in active">
		<div id="wrqpper">
			<form class="form-horizontal" method="post" action="" name="">
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label">Start Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fis1Date55" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>
						<div class="col-sm-2" >
							<label class="control-label">End Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								<input type="date" id="end1Date55" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
			
				<div class="row form-group buttons_margin_top ">
					<div align="center">
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getProductBillingReportByDatesValidation()" value="Search" />
						<!-- <input type="button" id="down" name="Download" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="downloadPdf()" value="Download" />  -->
					</div>
				</div>
				<!-- <div id="container"> -->
                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf" id="productBetweenTwoDates" class="display" 
					style="border: 1px solid white; border-collapse: collapse; ">
						<thead>
							<tr>
							    <th>Sr No</th>
								<th>Bill No</th>
								<th>Bill Date</th>
								<th>Client Name</th>
								<th>Product Name</th>
								<th>Description</th>
								<th>HSN/SAC</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Amount</th>
								<th>Discount Percent</th>
								<th>Discount Amount</th>
								<th>Sub Total</th>				
								<th>CGST</th>
								<th>SGST</th>
								<th>IGST</th>
								<th>Tax Amount</th>				
								<th>Total</th>
								<th>Total Sub Total</th>
								<th>Total Tax Amount</th>
								<th>Gross Total</th>
								<th>Shipping Address</th>
								<th>Courier Name </th>
								<th>Tracking Number</th>
								<th>GST No</th>
								<!-- <th>Download</th> --> 
							</tr>
						</thead>
						<tfoot>
							
						</tfoot>
					</table>
					</div>
					</form>
					</div>
					</div>
					
					<div id="home2" class="tab-pane">
			<div id="wrqpper">
				<form class="form-horizontal" method="post" action="" name="">
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label">Start Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fis1Date66" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>
						<div class="col-sm-2" >
							<label class="control-label">End Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								<input type="date" id="end1Date66" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
				
				<div class="row form-group buttons_margin_top ">
					<div align="center">
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getResourseBillingReportByDatesValidation()" value="Search" />
					    <!-- <input type="button" id="btn" name="download" class="btn btn-lg btn-success btn-md button_hw button_margin_left" onclick="getPDFofAllResourceBilling()" value="Download" /> --> 
					</div>
				
				</div>
				<!-- <div id="container"> -->
                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf" id="resourceTwoDates" class="display" 
					style="border: 1px solid white; border-collapse: collapse; ">
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
<!-- 								<th>SGST</th> -->
								<th>IGST</th>
								<th>Tax Amount</th>				
								<th>Total</th>
								<th>Total Sub Total</th>
								<th>Total Tax Amount</th>
								<th>Gross Total</th>
								<th>GST No</th>
								
							</tr>
						</thead>
						<tfoot>
						</tfoot>
					</table>
					</div>
					<!-- </div> -->
				</form>
			</div>
		</div>
					
		
	<div id="home3" class="tab-pane">
	 	<div id="wrqpper">
				<form class="form-horizontal" method="post" action="" name="">
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label">Start Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fis1Date555" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>
						<div class="col-sm-2" >
							<label class="control-label">End Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								<input type="date" id="end1Date555" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
				
				<div class="row form-group buttons_margin_top ">
					<div align="center">
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getProductBillingReportByDatesValidation1()" value="Search" />
					</div>
				</div>
				<!-- <div id="container"> -->
                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf" id="productBetweenTwoDates1" class="display" 
					style="border: 1px solid white; border-collapse: collapse; ">
						<thead>
							<tr>
							    <th>Sr No</th>
								<th>Bill No</th>
								<th>Bill Date</th>
								<th>Client Name</th>
								<th>Product Name</th>
								<th>Description</th>
								<th>HSN/SAC</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Amount</th>
								<th>Discount Percent</th>
								<th>Discount Amount</th>
								<th>Sub Total</th>				
								<th>CGST</th>
								<th>SGST</th>
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
					<!-- </div> -->
					</form>
					</div>
					</div>
		
		
		<div id="home4" class="tab-pane">
			<div id="wrqpper">
				<form class="form-horizontal" method="post" action="" name="">
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label">Start Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="startDate" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>
						<div class="col-sm-2" >
							<label class="control-label">End Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								<input type="date" id="endDate" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
				
				<div class="row form-group buttons_margin_top ">
					<div align="center">
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getCommonBillingReportByDatesValidation()" value="Search" />
					</div>
				
				</div>
                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf" id="commonTable" class="display" 
					style="border: 1px solid white; border-collapse: collapse; ">
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
						<tfoot>
						</tfoot>
					</table>
					</div>
					
				</form>
			</div>
		</div>
		
		
	</div>
</div>
<div class="tab-pane " id="resourceBillingReport">
 	<div class="row">
		<div align="center">
			<h2 class="form-name">Service Billing Report</h2>
		</div>
	</div>
	<div class="row">
		<div class="form-group" align="right">
			<div class="col-sm-offset-8 col-md-4 control-label">
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
		<div class="col-md-12">
			<hr style="border-top-color:#c1b1b1;">
		</div>	
	</div>
 
		<div class="container-fluid">
			<div class="row">
			 <div id="wrqpper">
				<form class="form-horizontal" method="post" action="" name="resourceBillingReport">
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1">
							<label class="control-label" for="employeename">Vendor Name :<sup>*</sup></label>  
          				</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						    	<%
									VendorDetailsDao vendorDao = new VendorDetailsDao();
									List sList4 = vendorDao.getAllVendorNames();
								%>
								<input list="vendorNameList" id="fk_vendor_id" class="form-control">
									<datalist id="vendorNameList">
										<%
											for (int i = 0; i < sList4.size(); i++) {
												VendorDetailsHibernate hibernate = (VendorDetailsHibernate) sList4.get(i);
										%>
										
										<option data-value="<%=hibernate.getPkVendorDetailsId()%>" value="<%=hibernate.getVendorName()%>">
										<%
											}
										%>
									</datalist>
							</div>
						</div>
					</div>
				
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fisDate" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>
						<div class="col-sm-2" >
							<label class="control-label">End Date&nbsp;:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								 <input type="date" id="endDateV" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
				
				<div class="row form-group buttons_margin_top ">
					<div align="center">
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getResourceBillingReportByNameAndDatesValidation()" value="Search" />
					</div>
				</div>
				<!-- <div id="container"> -->
                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf" id="vendorBetweenTwoDates" class="display"
						style="border: 1px solid white; border-collapse: collapse;">
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
							<!-- <tr>
								<th colspan="13" style="text-align: right">Total:</th>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
						</tr> -->
						</tfoot>
					</table>
				</div>
				<!-- </div> -->
			</form>
			</div>	
	</div>
</div>
</div>
	
<!------------ Product Billing Report ---------->
<div class="tab-pane" id="productBillingReport">
	<div class="row">
		<div align="center" >
			<h2 class="form-name">Product Billing Report</h2>
		</div>
	</div>
	<div class="row">	
		<div class="form-group" align="right">
			<div class="col-sm-offset-8 col-md-4 control-label">
				<div id="date">
					<label id="demo1"></label>
					<script>
						var date = new Date();
						document.getElementById("demo1").innerHTML = date.toDateString();
					</script>
				</div>
			</div>
		</div> 
		</div>
		<div class="row">
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>	
		</div>
		<div class="container-fluid">
			<div class="row">
			 <div id="wrqpper">
	 			<form class="form-horizontal" method="post" action="" name="empReport1">
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label" for="employeename">Client Name:<sup>*</sup></label>  
          				</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						    	<%
									ClientEnquiryDao dao = new ClientEnquiryDao();
									List list = dao.getAllClientNames4();
								%>
								<input list="clientNameList" id="fk_client_id" class="form-control">
									<datalist id="clientNameList">
										<%
											for (int i = 0; i < list.size(); i++) {
												ProductBillingHibernateNew sup = (ProductBillingHibernateNew) list.get(i);
											%>
											<option data-value="<%=sup.getFkClientId() %>" value="<%=sup.getClientName()%>">
											<%
												}
											%>
									</datalist>
							</div>
						</div>
					</div>
				
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label">Start Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fis1Date" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>
						<div class="col-sm-2" >
							<label class="control-label">End Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								<input type="date" id="end1Date" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
				
				<div class="row form-group buttons_margin_top ">
					<div align="center">
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getProductBillingReportByNameAndDatesValidation()" value="Search" />
					</div>
				</div>
				<!-- <div id="container"> -->
                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf" id="clientBetweenTwoDates" class="display" 
					style="border: 1px solid white; border-collapse: collapse;">
						<thead>
							<tr>
							    <th>Sr No</th>
								<th>Bill No</th>
								<th>Bill Date</th>
								<th>Client Name</th>
								<th>Product Name</th>
								<th>Description</th>
								<th>HSN/SAC</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Amount</th>
								<th>Discount Percent</th>
								<th>Discount Amount</th>
								<th>Sub Total</th>				
								<th>CGST</th>
								<th>SGST</th>
								<th>IGST</th>
								<th>Tax Amount</th>				
								<th>Total</th>
								<th>Total Sub Total</th>
								<th>Total Tax Amount</th>
								<th>Gross Total</th>
								<th>Shipping Address</th>
								<th>Courier Name </th>
								<th>Tracking Number</th>
							</tr>
						</thead>
						<tfoot>
							
						</tfoot>
					</table>
					</div>
			</form>
			</div>
		</div>
	</div>
</div>

<div class="tab-pane" id="proformaBillingReport">
	<div class="row">
		<div align="center" >
			<h2 class="form-name">Profroma Billing Report</h2>
		</div>
	</div>
	<div class="row">	
		<div class="form-group" align="right">
			<div class="col-sm-offset-8 col-md-4 control-label">
				<div id="date">
					<label id="demo1"></label>
					<script>
						var date = new Date();
						document.getElementById("demo1").innerHTML = date.toDateString();
					</script>
				</div>
			</div>
		</div> 
		</div>
		<div class="row">
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>	
		</div>
		<div class="container-fluid">
			<div class="row">
			 <div id="wrqpper">
	 			<form class="form-horizontal" method="post" action="" name="empReport1">
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label" for="employeename">Client Name:<sup>*</sup></label>  
          				</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						    	<%
									ClientEnquiryDao dao1 = new ClientEnquiryDao();
									List list1 = dao1.getAllClientNames();
								%>
								<input list="clientNameList1" id="fk_client_id1" class="form-control">
									<datalist id="clientNameList1">
										<%
											for (int i = 0; i < list1.size(); i++) {
												ClientEnquiryHibernate sup = (ClientEnquiryHibernate) list1.get(i);
											%>
											<option data-value="<%=sup.getPkClientEnquiryId() %>" value="<%=sup.getFirstName()%>">
											<%
												}
											%>
									</datalist>
							</div>
						</div>
					</div>
				
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label">Start Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fis1Date1" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>
						<div class="col-sm-2" >
							<label class="control-label">End Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								<input type="date" id="end1Date1" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
			
				<div class="row form-group buttons_margin_top ">
					<div align="center">
						<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getProductBillingReportByNameAndDatesValidation1()" value="Search" />
					</div>
				</div>
				<!-- <div id="container"> -->
                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf" id="clientBetweenTwoDates1" class="display" 
					style="border: 1px solid white; border-collapse: collapse;">
						<thead>
							<tr>
							    <th>Sr No</th>
								<th>Bill No</th>
								<th>Bill Date</th>
								<th>Client Name</th>
								<th>Product Name</th>
								<th>Description</th>
								<th>HSN/SAC</th>
								<th>Unit Price</th>
								<th>Quantity</th>
								<th>Amount</th>
								<th>Discount Percent</th>
								<th>Discount Amount</th>
								<th>Sub Total</th>				
								<th>CGST</th>
								<th>SGST</th>
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
<%@include file="commons/newFooter.jsp"%>
