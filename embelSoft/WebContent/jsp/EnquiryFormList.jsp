<%@page import="com.embelSoft.bean.GetClientEnquiryDetailsBean"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.bean.GetVendorDetailsBean"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>

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

<script src="/embelSoft/staticContent/js/clientEnquiry.js"></script>
<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<link rel="stylesheet" href="/embelSoft/staticContent/css/venderlist.css"> 

 <script>
$(document).ready(function(){
	 enquiryFormList();
}); 
</script> 
<script>
$(document).ready( function () {
    $('#enquiryList').DataTable();
} );

</script>
<script type="text/javascript">
function Back() {
	 window.location = "EnquiryForm.jsp";
}
</script>

<style type="text/css">
td {
	color:  black;
}
label {
     color: black; 
    padding-bottom: 4px;
    padding-top: 4px;
    margin-right: 5px;
}

#btndwn{
    margin-bottom: 10px;
    }
</style>
</head>
<body>
<div class="container" style="min-height:300px;">

		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">All Enquiry List</h2>
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
	
	         <div class="row form-group">
						<div class="col-sm-2 ">
							<label class="control-label">Start Date:<sup>*</sup></label>
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
							<label class="control-label">End Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
								 <input type="date" id="endDate" placeholder="End Date" class="form-control input-md ac_district" type="text">
							</div>
						</div>
					</div>
				
				<div class="wrapper" align="center">
		     <input type="button" value="Search" id="btndwn" class="btn btn-success btn-lg btn mb-2" onclick="enquiryFormListForDateWise()" /> 
	           </div>

	<div id="dataTab">
	 <div class="container">
		<div class="table-responsive">
		<table class="table table-bordered table-striped table-condensed cf"
			id="enquiryList" class="display"
			style="border: 1px solid white; border-collapse: collapse;">
				<thead>
			<tr>
	
					<th>Sr No</th>
				    <th>Person Name</th>
				    <th>Enquiry Date</th>
				     <th>Business Name</th>
					 <th>Business Address</th>
	                <th>Contact Number</th>
	                <th>Email</th>	
					<th>Enquired About</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
		</table>
		</div>
	  </div>
	</div>
	
	<div class="wrapper" align="center">
		<input type="button" style=" font-size: 25" value="Back" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="Back()" /> 
	</div>	
</div>
</body>
<%@include file="commons/newFooter.jsp" %>