<!-- ResourceBillingList.jsp -->
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.bean.HrBillingBean"%>
<%@page import="com.embelSoft.dao.HRBillingDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
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

<script type="text/javascript">
function Back() {
	 window.location = "Billing.jsp";
}
</script>

<style type="text/css">
td 
{
	 color:  black;
}
</style>
</head>
<body>
<div class="container-fluid" style="min-height:300px;">

				<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Resource Billing List</h2>
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
	
	<%
		HRBillingDao dao=new HRBillingDao();
		List<HrBillingBean> list = dao.getHrBillingList();
	%>

	<div id="demo_jui">
	<div class="table-responsive">
		<table id="list" class="table table-bordered display">
			<thead>
				<tr>
					<th>Sr No.</th>
					<th>Vendor Name</th>
					<th>Date Of Billing</th>
	                <th>Date Of Billing From</th>
	                <th>Date Of Billing To</th>
	                <th>Description</th>
	                <th>Buy Price</th>
	                <th>Quantity</th>
	                <th>Grid Amount</th>
	                <th>Grid Discount Percent</th>
	                <th>Grid Discount Amount</th>
	                <th>Grid SubTotal</th>
	                <th>Grid Gst Percent</th>
	                <th>Grid Gst Percent Amount</th>	                	               
					<th>Total</th>
					<th>Sub Total</th>
					<th>Gst</th>
					<th>Gst Amount</th>
					<th>Gross Total</th>					
				</tr>
			</thead>
			<tbody>		
   				<%
		            	int k=1;
   						double total=0.0;
					for(int i=0;i<list.size();i++)
					{
						HrBillingBean sr=(HrBillingBean)list.get(i);	
				%>				
				<tr>
					<td class="align"><%=k++ %></td>
				    <td class="align"><%=sr.getVendorName() %></td>
					<td class="align"><%=sr.getDateOfBilling() %></td>
					<td class="align"><%=sr.getDateOfBillingFrom() %></td>
					<td class="align"><%=sr.getDateOfBillingTo() %></td>
					<td class="align"><%=sr.getDescription() %></td>
					<td class="align"><%=sr.getBuyPrice() %></td>
					<td class="align"><%=sr.getQuantity() %></td>
					<td class="align"><%=sr.getGridAmount() %></td>
					<td class="align"><%=sr.getGridDiscountPercent() %></td>
					<td class="align"><%=sr.getGridDiscountAmount() %></td>
					<td class="align"><%=sr.getGridSubTotal() %></td>
					<td class="align"><%=sr.getGridGstPercent() %></td>
					<td class="align"><%=sr.getGridGstPercentAmount() %></td>					
					<td class="align"><%=sr.getTotal() %></td>
					<td class="align"><%=sr.getSubTotal() %></td>
					<td class="align"><%=sr.getGst() %></td>
					<td class="align"><%=sr.getVat() %></td>
					<td class="align"><%=sr.getGrossTotal() %></td>					
				</tr>
				<%
					total =total + sr.getTotal();
					}
				%>
			</tbody>
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
				<th>Total :</th>
				<th><%=total %></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tfoot>
		</table>
	</div>
	</div>
	<div class="wrapper" align="center">
		<input type="button" style=" font-size: 25" value="Back" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="Back()" /> 
	</div>
</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %>
