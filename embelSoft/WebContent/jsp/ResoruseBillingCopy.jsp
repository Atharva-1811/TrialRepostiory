<%@page import="com.embelSoft.hibernate.ResourceBillingHibernate"%>
<%@page import="com.embelSoft.hibernate.ProductBillingHibernateNew"%>
<%@page import="com.embelSoft.hibernate.BillOfMaterialHibernate"%>
<%@page import="com.embelSoft.dao.BillOfMaterialDao"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<link rel="stylesheet" href="/embelSoft/staticContent/css/shree.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>

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
		  
 <script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
	
<script src="/embelSoft/staticContent/js/billofmaterial.js"></script>

<script src="sweetalert2.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="sweetalert2.min.css">	
			 
			 	   
					     <style type="text/css">
					      td {
					       color:  black;
					      }
					     </style>
					     
					     
					     
  <script type="text/javascript">
function clearFiled()
{
	document.getElementById("componentType").value="";
}
</script>
					     
<script>
function resets()
{
	location.reload(true);
}
</script>
					     
<script type="text/javascript">	
	function  BillOfMateriallist()
{
	window.location = "BillOfMaterialList.jsp";
} 				     
</script>
				     
</head>

 <body id="dt_example" class="master_form_img">
	<div class="container">
 		
 		<div class="row header_margin_top">
			<div align="center" >
				  <h2 class="form-name style_heading">Service Billing Copy</h2>
			</div>
			</div>
		

	<div class="row">
		<div class="form-group">
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

	<div id="wrqpper">
		<form class="form-horizontal" name="BillOfMaterial">
			<div class="row form-group" >
				<div class="col-sm-2 col-sm-offset-3">
				<label class="control-label" for="name" >Bill No :<sup>*</sup></label>
				</div>
          		<div class="col-sm-3" >
					<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
					
					
					<%
				    	BillOfMaterialDao dao = new BillOfMaterialDao();
							List compTypeList = dao.getResourceBillNo();
						%>
				    	
						<input list="productBillList" id="BillNo" class="form-control" placeholder="Select Bill No" ">
						<datalist id="productBillList">
							<%
								for (int i = 0; i < compTypeList.size(); i++) {
								ResourceBillingHibernate ctdh = (ResourceBillingHibernate) compTypeList.get(i);
							%>
							<option data-value="<%=ctdh.getBillNo()%>" value="<%=ctdh.getBillNo()%>>><%=ctdh.getBillDate() %>"
							myvalue="<%=ctdh.getFkVendorId()%>"
							myvalue1="<%=ctdh.getVendorName()%>"
							myvalue2="<%=ctdh.getGST()%>"
							myvalue3="<%=ctdh.getIGST()%>"
							myvalue4="<%=ctdh.getBillDate()%>"
							myvalue5="<%=ctdh.getTotalTaxAmount()%>"
							myvalue6="<%=ctdh.getTotalSubTotal()%>"
							myvalue7="<%=ctdh.getGrossTotal()%>"
							myvalue8="<%=ctdh.getBillPeriodStartDate()%>"
							myvalue9="<%=ctdh.getBillPeriodEndDate()%>"
							>									
							<%
								}
							%>
						</datalist>
						
				</div>
			</div>
		</div>

						
	  <div align="center">					
	    <div class="col-md-12">
			<input type="button" class="btn btn-success btn-lg btnn" value="Print" name="btn" onclick="validateGenerateBillCOPYForOtherBill1()">	
		</div>
	   </div>
   
</form>
</div>
</div>
</body>
</html>
<%@include file="commons/newFooter.jsp"%>