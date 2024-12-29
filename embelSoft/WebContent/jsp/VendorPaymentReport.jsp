<%@page import="com.embelSoft.hibernate.VendorPaymentDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorPaymentDetailsDao"%>
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

<script type="text/javascript" src="/embelSoft/staticContent/js/cashbankbook.js"></script>

   <!--  <script>
	     $(document).ready(function(){
	    	 getExpensePaymentDetailsBetTwoDays();
	}); 
	</script> -->
	
    <body id="dt_example" class="master_form_img">
    
    <div class="container">
    
	
 		<div class="row">
			<div align="center" style="margin-top: 75px">
				  <h2 class="form-name style_heading">Vendor Payment Report</h2>
			</div>
			
		</div>

		
		
		<ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#home"><h4 style="color:blue">Vendor Name Wise</h4></a></li>
	    <li><a data-toggle="tab" href="#twoDates"><h4 style="color:blue">Range</h4></a></li>
	   
 	 </ul>
 	 
 	  	<div class="tab-content" style="float: left">
 	 
 		<!------------ Expenditure Payment Report Between Two Dates And Name---------->



 <div id="home" class="tab-pane fade in active">		
	<form class="form-horizontal" method="post" action="" name="dates">
 	
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



 <div id="home" class="tab-pane fade in active">		
	<form class="form-horizontal">
			<div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
								<label class="control-label" for="expenditureName">Vendor Name:</label>
								</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							 <i class="glyphicon glyphicon-stats"></i>
							</span>
								<%
								VendorPaymentDetailsDao exdd = new VendorPaymentDetailsDao();
									List vdList = exdd.getAllVendorame();
								%>
								<input list="ven_drop" id="vendorName" class="form-control">
								<datalist id="ven_drop">
									<%
										for (int i = 0; i < vdList.size(); i++) {
											VendorPaymentDetailsHibernate expbean = (VendorPaymentDetailsHibernate) vdList.get(i);
									%>
									<option data-value="<%=expbean.getFkVendorId() %>"
										value="<%=expbean.getVendorName()%>">
										<%
											}
										%>
											
										</datalist>
									</div>
								</div>
								

								</div>
							</div>


            <div class="row">
				<div class="form-group">
				
					<div class="col-md-2 col-sm-offset-1" align="right">
								<label class="control-label">Start Date:</label>
									</div>
										<div class="col-sm-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span> 
												<input type="date" id="fisDate4" placeholder="Start Date" class="form-control input-md" type="text">
											</div>
										</div>
				
				
									<div class="col-md-2" align="right">
										<label class="control-label" for="endDate">End Date:</label>
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
									</div>
      <div class="row form-group buttons_margin_top ">
			<div align="center">
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getVendorPaymentDetailsByName()" value="Search" />
			</div>
	  </div>

	<table class="table table-bordered table-striped table-condensed cf" id="vendorBetweenTwoDates" class="display" style="border: 2px solid black; border-collapse: collapse;">
					<thead>
						<tr>
						    <th>Sr No</th>
							<th>Vendor Name</th>
							<th>Total Amount</th>
							<th>Remaining Amount</th>
			                <th>Paid Amount</th>
							<th>Balance Amount</th>
			                <th>Payment Date</th>
							
						 </tr>
					 </thead>
			
		</table>

		</div>
		</form>
		</div>
		
	
			 		<!------------ Expenditure Payment Report Between Two Dates---------->



 <div id="twoDates" class="tab-pane">		
	<form class="form-horizontal" method="post" action="" name="dates">
 	
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



 <div id="home" class="tab-pane fade in active">		
	<form class="form-horizontal">



            <div class="row">
				<div class="form-group">
				
					<div class="col-md-2 col-sm-offset-1" align="right">
								<label class="control-label">Start Date:</label>
									</div>
										<div class="col-sm-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span> 
												<input type="date" id="fisDate42" placeholder="Start Date" class="form-control input-md" type="text">
											</div>
										</div>
				
				
					<div class="col-md-2" align="right">
										<label class="control-label" for="endDate">End Date:</label>
										</div>
										<div class="col-sm-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span> 
												<input type="date" id="endDate42" placeholder="End Date" class="form-control input-md ac_district" type="text">
											</div>
										</div>
									</div>
									</div>
      <div class="row form-group buttons_margin_top ">
			<div align="center">
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getVendorPaymentDetailsBetDays()" value="Search" />
			</div>
	  </div>

	<table class="table table-bordered table-striped table-condensed cf" id="vendorBetweenTwoDate" class="display" style="border: 2px solid black; border-collapse: collapse;">
					<thead>
							<tr>
							    <th>Sr No</th>
								<th>Vendor Name</th>
								<th>Total Amount</th>
								<th>Remaining Amount</th>
				                <th>Paid Amount</th>
				                <th>Balance Amount</th>
				              	<th>Payment Date</th>
							</tr>
						</thead>
			
		</table>
		</div>
		</form>
		</div>
		
		
		
	
		</div>
		</div>
	</body>
</html>