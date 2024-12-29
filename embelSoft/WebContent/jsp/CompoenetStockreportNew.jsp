 <%@page import="com.embelSoft.hibernate.ComponentStockHibernate"%>
<%@page import="com.embelSoft.dao.ComponentStockDao"%>
<%@page import="com.embelSoft.hibernate.ComponentReceivedPOHibernate"%>
<%@page import="com.embelSoft.dao.ComponentReceivedPODao"%>
<%@page import="com.embelSoft.hibernate.BillOfMaterialHibernate"%>
<%@page import="com.embelSoft.dao.BillOfMaterialDao"%>
<%@page import="com.embelSoft.dao.CompoenentBillingDao"%>
<%@page import="com.embelSoft.hibernate.CompoentCategoryDetailsHibernate"%>
<%@page import="com.embelSoft.hibernate.CompoenentBillingHibernate"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ComponentCategoryDetailsDao"%>
<%@page import="com.embelSoft.hibernate.ClientPaymentDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ClientPaymentDetailsDao"%>
<%@page import="com.embelSoft.bean.ComponentReceivedPOBean"%>


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
<link rel="stylesheet" href="/embelSoft/staticContent/css/tabDemo.css">

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<script type="text/javascript" src="/embelSoft/staticContent/js/componentStockDetails.js"></script>

<link rel="stylesheet" href="/embelSoft/staticContent/css/Inventary.css"> 


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
			<div align="center" >
				  <h2 class="form-name style_heading">Component Stock Report</h2>
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
			<li class="active"><a data-toggle="tab" href="#home1"><h4 style="color:blue">Component Category  Wise</h4></a></li>
			<li><a data-toggle="tab" href="#twoDates1"><h4 style="color:blue"> Range Wise</h4></a></li>
			<li><a data-toggle="tab" href="#Compoentname"><h4 style="color:blue"> Component Name Wise</h4></a></li>   
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
				<label class="control-label" for="expenditureName">Component Category&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-stats"></i>
					</span>
					<%
					ComponentStockDao exdd2 = new ComponentStockDao();
						List clList = exdd2.getCompoentCategoryFromStock();
					%>
					<input list="cli_drop" id="componentCategory_id" class="form-control">
					<datalist id="cli_drop">
						<%
							for (int i = 0; i < clList.size(); i++) {
								ComponentReceivedPOBean expbean = (ComponentReceivedPOBean) clList.get(i);
						%>
						<option data-value="<%=expbean.getFkCompTypeId()%>"
							value="<%=expbean.getComponentType()%>">
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
			<div class="col-sm-2" >
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
			<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="compoentstockreport()" value="Search"/>
		</div>
	</div>
	
	<div class="container">
				<div class="table-responsive">
	<table class="table table-bordered table-striped table-condensed cf" id="clientBetweenTwoDatesAndName" class="display" 
	style="border: 1px solid white; border-collapse: collapse; width:100%;">
		<thead>
			<tr>
					<th>Sr No</th>
					<th>Component Category</th>
	                <th>Component Name</th>
					<th>Manufacturer Name</th>
					<th>Type</th>
					<th>Package</th>
					<th>Quantity</th>
					<th>StockLastUpdateDate</th>			               
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
				
					<div class="col-sm-2 col-sm-offset-1">
								<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
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
										<label class="control-label" for="endDate">End Date&nbsp;:<sup>*</sup></label>
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
				<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="stockbetweentwodate()" value="Search" />
			</div>
	  </div>
<div class="container">
				<div class="table-responsive">
	<table class="table table-bordered table-striped table-condensed cf" id="clientBetweenTwoDate" class="display" 
	style="border: 1px solid white; border-collapse: collapse; width:100%;">
					<thead>
					<tr>
					<th>Sr No</th>
					<th>Component Category</th>

	                <th>Component Name</th>
					<th>Manufacturer Name</th>
					<th>Type</th>
					<th>Package</th>
					<th>Quantity</th>
					<th>StockLastUpdateDate</th>			
				               
							</tr>
						</thead>
			
		</table>
		</div>
		</div>
</form>
</div>
</div>
			
			

 	
		<!-- <div class="form-group" align="right">
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
		</div> -->
		
<div id="Compoentname" class="tab-pane">
		<div id="wrqpper">
	<form class="form-horizontal" method="post" action="" name="dates">
	
		<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1">
				<label class="control-label" for="expenditureName">Component Category &nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-stats"></i>
					</span>
					<%
				    	ComponentReceivedPODao dao1 = new ComponentReceivedPODao();
							List compTypeList = dao1.getCompoentCategoryFromStock();
					%>
					<input list="componentNameList" id="componentType" class="form-control" onchange="GetCompoentNameagainestCategory()">
					<datalist id="componentNameList">
						<%
								for (int i = 0; i < compTypeList.size(); i++) {
									ComponentReceivedPOBean ctdh = (ComponentReceivedPOBean) compTypeList.get(i);
							%>
							<option data-value="<%=ctdh.getFkCompTypeId()%>" value="<%=ctdh.getComponentType()%>">									
							<%
								}
							%>										
					</datalist>
				</div>
			</div>
			
						<div class="col-sm-2 " >
						<label class="control-label">Component Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i></span> 
							 
							<select class="form-control input-md" id="componentName_id"  name="componentName_id" >
					</select>
							
							
							<%-- <input list="compoentCategoryNamelist" id='componentName_id'  name="componentName_id" class="form-control" placeholder="Select Component Name" onchange="getGridForComponentTypeInRecive();clearFiled()">
							<datalist id="compoentCategoryNamelist">
						
						</datalist>	--%>
						</div>
					</div>
											
		</div>
	
		
		<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" >
				<label class="control-label">Start Date&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
						<i class="glyphicon glyphicon-calendar"></i>
					</span> 
					<input type="date" id="fisDate10" placeholder="Start Date" class="form-control input-md" type="text">
				</div>
			</div>								
			<div class="col-sm-2" >
				<label class="control-label" for="endDate10" >End Date&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
					<span class="input-group-addon">
					<i class="glyphicon glyphicon-calendar"></i>
					</span> 
					<input type="date" id="endDate10" placeholder="End Date" class="form-control input-md ac_district" type="text">
				</div>
			</div>
		</div>
	
	<div class="row form-group buttons_margin_top ">
		<div align="center">
			<input type="button" id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="compoentstockreport1()" value="Search" />
		</div>
	</div>
	<div class="container">
				<div class="table-responsive">
	<table class="table table-bordered table-striped table-condensed cf" id="categoryBetweenTwoDatesAndName1" class="display" 
	style="border: 1px solid white; border-collapse: collapse; width:100%;">
		<thead>
			<tr>
					<th>Sr No</th>
					<th>Component Category</th>
					<th>Component Name</th>
					<th>Manufacturer Name</th>
					<th>Type</th>
					<th>Package</th>
					<th>Quantity</th>
					<th>StockLastUpdateDate</th>         
			</tr>
		</thead>		
	</table>
</div>
</div>
	</form>
	</div>
</div>				
	</div>
</div>				
	<%@include file="commons/newFooter.jsp" %> 			
</div>
</div>

</div>
</body>
</html>		