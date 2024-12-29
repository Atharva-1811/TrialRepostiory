
<%@page import="com.embelSoft.dao.PurchaseOrderDao" %>
<%@page import="com.embelSoft.bean.PurchaseOrderCreateBean" %>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<!-- <script src="/embelSoft/staticContent/js/employeeDetails.js"></script> -->
  	
  	<script src="/embelSoft/staticContent/js/purchaseOrderDetails.js"></script>
  	
  	<link rel="stylesheet" href="/embelSoft/staticContent/css/Report.css">
       
       
       
         
  	 <script>
	     $(document).ready(function(){
	    	 purchaseOrderCreateReport();
		}); 
	</script>
	
  	
  	
<script type="text/javascript">
	 function Back() 
	 {
			 window.location = "PurchaseOrderCreate.jsp";
	 }
</script>

<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>

<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

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
	
<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">				  
					  
					     <style type="text/css">
					      td {
					       color:  black;
					      }
					     </style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="/embelSoft/staticContent/css/tabDemo.css">
	
	<script type="text/javascript" src="/embelSoft/staticContent/js/cashbankbook.js"></script>
	
	<script src="/embelSoft/staticContent/js/clientEnquiry.js"></script>   
	
     <link rel="stylesheet" href="/embelSoft/staticContent/css/Report.css"> 
     
          <link rel="stylesheet" href="/embelSoft/staticContent/css/style3.css"> 


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
	h2.form-name {
    margin-top: 12px;
    font-size: 25px;
    font-weight: 600;
    text-transform: uppercase;
    
}
		.leftmanu
		{
		    width: 190px;
		    background: #c50000a6;
		    color:  white;
		}
	</style>


<body>
<div class="container-fluid" > 
<div class="row" >
    <div  class="col-md-12">
        <h3>Left Tabs</h3>
        <hr/>
        <div class="col-md-2" align="center">
            <!-- required for floating -->
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class=""><a class="leftmanu" href="#enquiry" data-toggle="tab" >All Purchase Report</a></li>
                <li><a class="leftmanu" href="#followup" data-toggle="tab">Between Two Dates Report</a></li>
            </ul>
            <br>
        </div>
        <div class="col-md-9">
            <!-- Tab panes -->
    <div class="tab-content">    
	<!------------ Client Enquiry Report ---------->
    <div class="tab-pane active" id="enquiry">
           		<!-- <form class="form-horizontal" method="post" action="" name="emp"> -->
	<div class="container-fluid">

				<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" >Purchase Order Report</h2>
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
			<div class="col-md-12">
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
	 <div id="container">
                     <div class="table-responsive">
	   <table class="table table-bordered table-striped table-condensed cf"
			id="purchaseOrderCreatelist" class="display" style="border: 1px solid white; border-collapse: collapse;">
			<thead>
			<tr>
				<th>Sr No</th>
					<th>Bill No</th>
					<th>Vendor_Name</th>
					<th>Vendor Company Name</th>
					<th>Contact No</th>
					<th>Street Address</th>					
					<th>Company Address</th>
					<th>GST/TIN Number</th>
					<th>Pan Number</th>
					<th>Cin Number</th>
					<th>City</th>
					<th>Zip Code</th>
					<th>Phone</th>
					<th>Fax</th>
					<th>Product Name</th>
					<th>Description</th>
					<th>HSN/Sac</th>
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
				<th colspan="8" style="text-align: right">Total:</th>
				<th colspan="4"></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			
			</tfoot>
		</table>
		</div>
		</div>
	</div>
			<!-- </form> -->			
	
		</div>
		</div>
 
  
 	
 			<!------------ Client FollowUp Report ---------->
  <div class="tab-pane" id="followup">
		<!-- <form method="post" action="" name="exp"> -->
			<div class="container-fluid">
			<div class="row">
			<div align="center">
				  <h2 class="form-name style_heading">Between Two Dates Report</h2>
			</div>
		</div>
</div>
   


	<div class="container-fluid">
	
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
 
		<div class="row">
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		<div class="row">
			 <div id="wrqpper">
	 	<form class="form-horizontal" method="post" action="" name="empReport1">
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1" >
							<label class="control-label">Start Date :<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"> </i>
								</span> 
								<input type="date" id="fisDate4" placeholder="Start Date" class="form-control input-md" type="text">
							</div>
						</div>

						<div class="col-sm-2" >
							<label class="control-label">End Date :<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
								 <input type="date" id="endDate4" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>

		<div class="row form-group buttons_margin_top ">
			<div align="center">
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" 
				onclick="purchaseReportRangeWise()" value="Search" />
			</div>
		</div>

                     <div class="table-responsive">
					<table class="table table-bordered table-striped table-condensed cf" id="purchaseReportRangeWise" class="display"
						style="border: 1px solid white; border-collapse: collapse; width:100%;">
						<thead>
			
				    <th>Sr No</th>
					<th>Bill No</th>
					<th>Vendor_Name</th>
					<th>Vendor Company Name</th>
					<th>Contact No</th>
					<th>Street Address</th>					
					<th>Company Address</th>
					<th>GST/TIN Number</th>
					<!-- <th>Pan Number</th>
					<th>Cin Number</th> -->
					<th>City</th>
					<!-- <th>Zip Code</th>
					<th>Phone</th>
					<th>Fax</th> -->
					<th>Product Name</th>
					<th>Description</th>
					<th>HSN/Sac</th>
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
				
			</thead>
			<tfoot>
				
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th colspan="3" style="text-align: right">Total:</th>
				<th colspan="4"></th>
			
			</tfoot>
					</table>
					</div>
			</form>
			</div>
			</div>
		</div>
		<!-- </form> -->
			</div> 

		
		</div>
		</div>
		</div>
		
		</div> 
		</div>    

</body>
</html>		