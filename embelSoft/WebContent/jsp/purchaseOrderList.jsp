<%@page import="com.embelSoft.bean.GetPurchaseOrderBean"%>
<%@page import="com.embelSoft.dao.PurchaseOrderDao"%>
<%@page import="com.embelSoft.bean.GetClientEnquiryDetailsBean"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.bean.GetVendorDetailsBean"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/embelSoft/staticContent/js/purchaseOrderDetails.js"></script>
<script type="text/javascript">
	 function Back() {
			 window.location = "PurchaseOrder.jsp";
	}

</script>
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
					     <style type="text/css">
					      td {
					       color:  black;
					      }
					     </style>
</head>


   <div class="container-fluid" style="min-height:300px;">

				<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Purchase Order List</h2>
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
			    <%
			    PurchaseOrderDao dao=new PurchaseOrderDao();
	            List<GetPurchaseOrderBean> list12 = dao.getPurchaseOrderList();
	            %>
	
	<div id="date">
		<label id="demo"></label>
		<script>
			var date = new Date();
			document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>

	<div id="demo_jui">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
			<tr>
					<th>Customer Name</th>
					<th>Purchase Date</th>
	                <th>Regarding</th>
					<th>Cost</th>
	                <th>Refered By</th>
	                <th>Detail</th>
	                <th>Requirement</th>	                
								
				</tr>
			</thead>
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						GetPurchaseOrderBean sr=(GetPurchaseOrderBean)list12.get(i);
				%>
				
				<tr>
				    <td class="align"><%=sr.getCustomerName()%></td>
				    <td class="align"><%=sr.getPurchaseDate()%></td>
					<td class="align"><%=sr.getRegard()%></td>
					<td class="align"><%=sr.getCost()%></td>
					<td class="align"><%=sr.getReference()%></td>
					<td class="align"><%=sr.getDetail()%></td>
					<td class="align"><%=sr.getRequirement()%></td>
					
					
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	</div>
	<div class="wrapper" align="center">
		<input type="button" style=" height: 65px; width: 180; font-size: 25" value="Back" id="listBtn" class="btn btn-primary" onclick="Back()" /> 
	</div>
	
	<%@include file="commons/newFooter.jsp" %>
	
</div>