<%@page import="com.embelSoft.hibernate.BillOfMaterialHibernate"%>
<%@page import="com.embelSoft.dao.BillOfMaterialDao"%>
<%@page import="com.embelSoft.dao.CompoenentBillingDao"%>
<%@page import="com.embelSoft.hibernate.CompoentCategoryDetailsHibernate"%>
<%@page import="com.embelSoft.hibernate.CompoenentBillingHibernate"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ComponentCategoryDetailsDao"%>
<%@page import="com.embelSoft.hibernate.ClientPaymentDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ClientPaymentDetailsDao"%>
<%@page import="com.embelSoft.bean.BillOfMaterialBean"%>


<%@page import="java.util.List"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- For datatable to pdf,print,excel etc conversion -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
 <script type="text/javascript" src="//cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

<!-- For datatable to pdf,print,excel etc conversion to connect offline jars -->
<!-- <script type="text/javascript" src="/embelSoft/staticContent/jsForReport/jquery-1.12.4.js"></script> 
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
<link rel="stylesheet" href="/embelSoft/staticContent/css/tabDemo.css"> -->

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<script type="text/javascript" src="/embelSoft/staticContent/js/billofmaterial.js"></script>

<link rel="stylesheet" href="/embelSoft/staticContent/css/Inventary.css"> 
<!-- <link rel="stylesheet" href="/embelSoft/staticContent/css/style2.css"> -->
<script>
function employeePaymentList()
{
	 window.location = "EmployeePaymentList.jsp";
}
</script>
<script>
function vendorPaymentList()
{
	window.location = "VendorPaymentList.jsp";
}
</script>
<script>
function ClientPaymentList()
{
	 window.location = "ClientPaymentList.jsp";	 
}		
</script>
<script>
function expenditurePaymentList()
{
	window.location = "ExpendirurePaymentList.jsp";
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
		
		<!-- <script type="text/javascript">
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
		</script> -->
					
<style>
.leftmanu {
	width: 190px;
	background: #c50000a6;
	color:  white;
}
.dataTables_wrapper .dataTables_paginate .ellipsis {
    padding: 0 1em;
    color: #fff;
}
.dataTables_wrapper .dataTables_paginate .paginate_button {
    box-sizing: border-box;
    display: inline-block;
    min-width: 1.5em;
    padding: 0.5em 1em;
    margin-left: 2px;
    text-align: center;
    text-decoration: none !important;
    cursor: pointer;
    *cursor: hand;
    color: #fff !important;
    border: 1px solid transparent;
    border-radius: 2px;
}
tbody {
    color: #000;
}
</style>

</head>
<body>
<div class="container" > 
<div class="row" >
<div  class="col-md-12">
     

		<!------------ Client Payment Report Between Two Dates And Name ---------->
		
		<div class="tab-pane" id="client">
		<!-- <form method="post" action="" name="exp"> -->
		<div class="row">
			<div align="center">
				  <h2 class="form-name style_heading">Bill Of Material Report</h2>
			</div>
			<div class="form-group">
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
		</div>
	
	<div class="col-md-12" align="center">
		<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home1"><h4 style="color:blue">Project Name Wise</h4></a></li>
			<!--  <li ><a data-toggle="tab" href="#category"><h4 style="color:blue">Component Category  Wise</h4></a></li>	
			<li><a data-toggle="tab" href="#compoenetName"><h4 style="color:blue">Component Name  Wise</h4></a></li>-->
	    	
			<li><a data-toggle="tab" href="#twoDates1"><h4 style="color:blue"> Range Wise</h4></a></li>
				   
 	 	</ul>
 	 </div>

 		<div class="row">
			<div class="col-md-12">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		
<div class="tab-content" >
 	 
<div id="home1" class="tab-pane fade in active">		
	 <div id="wrqpper">
	<form class="form-horizontal" method="post" action="" name="dates">
		<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" >
				<label class="control-label" for="expenditureName" >Project-Name&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-stats"></i>
					</span>
		 <%
						BillOfMaterialDao exdd2 = new BillOfMaterialDao();
						List clList = exdd2.getAllprojectNameForEdit();
					%>
					<input list="cli_drop" id="projectName" class="form-control">
					<datalist id="cli_drop">
						<%
							for (int i = 0; i < clList.size(); i++) {
								BillOfMaterialBean expbean = (BillOfMaterialBean) clList.get(i);
						%>
						<option data-value="<%=expbean.getPkCompBomId()%>"
							value="<%=expbean.getProjectName()%>">
						<%
							}
						%>											
					</datalist>
				</div>
			</div>								
		</div>
	
		<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" >
				<label class="control-label" >Start Date&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-calendar"></i>
					</span> 
					<input type="date" id="fisDate4" placeholder="Start Date" class="form-control input-md" type="text">
				</div>
			</div>								
			<div class="col-sm-2">
				<label class="control-label" for="endDate">End Date&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
					</span> 
					<input type="date" id="endDate4" placeholder="End Date" class="form-control input-md ac_district" type="text">
				</div>
			</div>
		</div>

	<div class="row form-group buttons_margin_top ">
		<div align="center">
			<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="reportsbyprojecttname()" value="Search"/>
		</div>
	</div>
	<div class="container">
				<div class="table-responsive">
	<table class="table table-bordered table-striped table-condensed cf" id="clientBetweenTwoDatesAndName" class="display"
	 style="border: 1px solid white; border-collapse: collapse;">
		<thead>
			<tr>
								<th>Sr No</th>
							<!--  	<th>Project Name</th>
								<th>Board Name</th>-->
								
								<th>Component Category</th>
								<th>Component Name</th>
								<th>Ref-Designator</th>
								<th>Part Number</th>
								<th>Package</th>
								<th>Tol/Va Rating</th>
								<th>Value</th>
								<th>Manufacture Name</th>
								<th>Description</th>
								<th>One Board Quantity</th>				
								<th>Unit Price</th>
								<th>Board Cost</th>
								<th>Remark</th>				
								<th>Vendor Name</th>			               
			</tr>
		</thead>		
	</table>
</div>
</div>
	</form>	
</div>	
</div>

		
 <div id="twoDates1" class="tab-pane">		
 	 <div id="wrqpper">
		<form class="form-horizontal" method="post" action="" name="dates">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
								<label class="control-label">Start Date :<sup>*</sup></label>
									</div>
										<div class="col-sm-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-calendar"></i>
												</span> 
												<input type="date" id="fisDate42" placeholder="Start Date" class="form-control input-md" type="text">
											</div>
										</div>
				
				
					                    <div class="col-sm-2" >
										     <label class="control-label" for="endDate">End Date :<sup>*</sup></label>
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
														
      <div class="row form-group buttons_margin_top ">
			<div align="center">
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="ok()" value="Search" />
			</div>
	  </div>
<div class="container">
				<div class="table-responsive">
	<table class="table table-bordered table-striped table-condensed cf" id="clientBetweenTwoDate" class="display" 
	style="border: 1px solid white; border-collapse: collapse;">
					<thead>
							<tr>
							   <th>Sr No</th>
								<th>Project Name</th>
								<th>Board Name</th>
								
								<th>Component Category</th>
								<th>Component Name</th>
								<th>Ref-Designator</th>
								<th>Part Number</th>
								<th>Package</th>
								<th>Tol/Va Rating</th>
								<th>Value</th>
								<th>Manufacture Name</th>
								<th>Description</th>
								<th>One Board Quantity</th>				
								<th>Unit Price</th>
								<th>Board Cost</th>
								<th>Remark</th>				
								<th>Vendor Name</th>				
				               
							</tr>
						</thead>
			
		</table>
		</div>
		</div>
</form>
</div>
</div>
			
			
<div id="category" class="tab-pane">	
 <div id="wrqpper">	
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
</form>
</div>
</div>


<div id="category" class="tab-pane fade in">	
 <div id="wrqpper">	
	<form class="form-horizontal">
		<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1">
				<label class="control-label" for="expenditureName">Component Category &nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-stats"></i>
					</span>
					<%-- <%
				    	BillOfMaterialDao dao1 = new BillOfMaterialDao();
							List compTypeList = dao1.getAllCompTypeDetails1();
						%><!--  -->
					<input list="compoentCategorylist" id="componentCategory_id" class="form-control">
					<datalist id="compoentCategorylist">
						<%
								for (int i = 0; i < compTypeList.size(); i++) {
									BillOfMaterialHibernate ctdh = (BillOfMaterialHibernate) compTypeList.get(i);
							%>
							<option data-value="<%=ctdh.getFkCompTypeId()%>" value="<%=ctdh.getComponentType()%>">									
							<%
								}
							%>										
					</datalist> --%>
				</div>
			</div>								
		</div>
	
		<div class="form-group">
			<div class="col-sm-2 col-sm-offset-1">
				<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-calendar"></i>
					</span> 
					<input type="date" id="fisDate7" placeholder="Start Date" class="form-control input-md" type="text">
				</div>
			</div>								
			<div class="col-sm-2">
				<label class="control-label" for="endDate">End Date&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
					</span> 
					<input type="date" id="endDate7" placeholder="End Date" class="form-control input-md ac_district" type="text">
				</div>
			</div>
		</div>
	<div class="row form-group buttons_margin_top ">
		<div align="center">
			<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="getCompoentCategoryBetTwoDaysvalidation()" value="Search" />
		</div>
	</div>
	<table class="table table-bordered table-striped table-condensed cf" id="categoryBetweenTwoDatesAndName" class="display" style="border: 2px solid black; border-collapse: collapse;">
		<thead>
			<tr>
								<th>Sr No</th>
								<th>Project Name</th>
								<th>Board Name</th>
								
								<th>Component Category</th>
								<th>Component Name</th>
								<th>Ref-Designator</th>
								<th>Part Number</th>
								<th>Package</th>
								<th>Tol/Va Rating</th>
								<th>Value</th>
								<th>Manufacture Name</th>
								<th>Description</th>
								<th>One Board Quantity</th>				
								<th>Unit Price</th>
								<th>Board Cost</th>
								<th>Remark</th>				
								<th>Vendor Name</th>		               
			</tr>
		</thead>		
	</table>
	</form>
</div>			
</div>


<div id="compoenetName" class="tab-pane">	
 <div id="wrqpper">	
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
</form>
</div>
</div>


<div id="compoenetName" class="tab-pane">
 <div id="wrqpper">			
	<form class="form-horizontal">
		<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1">
				<label class="control-label" for="expenditureName">Compoent Name&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-stats"></i>
					</span>
					<%-- <%
				    	BillOfMaterialDao dao2 = new BillOfMaterialDao();
							List compTypeList1 = dao2.getAllComponentNameDetails();
						%>
					<input list="Compoenetnamelist" id="CompoenentName" class="form-control">
					<datalist id="Compoenetnamelist">
						<%
								for (int i = 0; i < compTypeList1.size(); i++) {
									BillOfMaterialHibernate ctdh = (BillOfMaterialHibernate) compTypeList1.get(i);
							%>
					
							<option data-value="<%=ctdh.getPkCompBomId()%>" value="<%=ctdh.getComponentName()%>">									
							<%
								}
							%>												
					</datalist> --%>
				</div>
			</div>								
		</div>
	
		<div class="form-group">
			<div class="col-sm-2 col-sm-offset-1">
				<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-calendar"></i>
					</span> 
					<input type="date" id="fisDate6" placeholder="Start Date" class="form-control input-md" type="text">
				</div>
			</div>								
			<div class="col-sm-2">
				<label class="control-label" for="endDate">End Date&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
					</span> 
					<input type="date" id="endDate6" placeholder="End Date" class="form-control input-md ac_district" type="text">
				</div>
			</div>
		</div>

	<div class="row form-group buttons_margin_top ">
		<div align="center">
			<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="compoentnamereports()" value="Search" />
		</div>
	</div>
	<table class="table table-bordered table-striped table-condensed cf" id="CompoennetNameBetweenTwoDatesAndName" class="display" style="border: 2px solid black; border-collapse: collapse;">
		<thead>
			<tr>
								<th>Sr No</th>
								<th>Project Name</th>
								<th>Board Name</th>
								
								<th>Component Category</th>
								<th>Component Name</th>
								<th>Ref-Designator</th>
								<th>Part Number</th>
								<th>Package</th>
								<th>Tol/Va Rating</th>
								<th>Value</th>
								<th>Manufacture Name</th>
								<th>Description</th>
								<th>One Board Quantity</th>				
								<th>Unit Price</th>
								<th>Board Cost</th>
								<th>Remark</th>				
								<th>Vendor Name</th>				               
			</tr>
		</thead>		
	</table>
	</form>
	</div>
</div>	
</div>		
		<!-- </form>	 -->
	</div>
</div>				
	<%@include file="commons/newFooter.jsp" %> 			
</div>
</div>


</body>
</html>		