
<%@page import="com.embelSoft.bean.ComponentStockBean"%>
<%@page import="com.embelSoft.dao.ComponentStockDao"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>

<%@page import="java.util.List"%>
  	<% boolean isHome=false;%>
	<%@include file="commons/header.jsp"%>
	
	<link href="/Shop/WebContent/staticContent/css/dataTa.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/Shop/staticContent/css/dataTables.jqueryui.min.css"  rel="stylesheet" type="text/css" media="all">
	<link rel="stylesheet" href="/Shop/staticContent/css/tabDemo.css">
 	<link rel="stylesheet" href="/Shop/staticContent/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/Shop/staticContent/css/ui.jqgrid.min.css">
    
    <script src="/Shop/staticContent/js/jquery.min.js"></script>
    <script src="/Shop/staticContent/js/jquery.jqgrid.min.js"></script>
	<script src="/Shop/staticContent/js/jquery.dataTables.js" type="text/javascript"></script>
	<script type="text/javascript" src="/Shop/staticContent/js/jqueryUi.js"></script>
	
	
	
<html>
	<head>

		<title>Compoenent Stock</title>
		
  		
  		<script type="text/javascript">
  			function Back()
  			{
  				window.location = "ComponentReceivedPO.jsp" ;
  			}
  			/* function deletProduct()
    		 {
    		 window.location = "DeletProduct.jsp";
    		 } */
  			
  			
  		</script>
		<style>
.btn-default,.btn-primary,.btn-success,.btn-info,.btn-warning,.btn-danger
 {
    border-radius:23px;
}


</style>

	</head>

	

	<script type="text/javascript"> 
		$(document).ready(function () 
		{
	         var table=$("#list").dataTable({


				    "bProcessing": true,
				    "sAutoWidth": false,
				    "bDestroy":true,
				    "sPaginationType": "bootstrap", // full_numbers
				    "iDisplayStart ": 10,
				    "iDisplayLength": 10,
				    "bPaginate": false, //hide pagination
				    //"bFilter": false, //hide Search bar
				    "bInfo": false, // hide showing entries
	    		         
	    		     });
	        
	         
			 var tableTools = new $.fn.dataTable.TableTools(table,{				 
				 'sSwfPath':'//cdn.datatables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf',				 
				 	'aButtons':['copy','print','csv',
					 {
						 'sExtends':'xls',
						 'sFileName':'Data.xls',
						 'sButtonText': 'Save to Excel'
					 }
					],				
			});
				$(tableTools.fnContainer()).insertBefore('#list_wrapper');
		});
	</script>

<body id="dt_example">
		<div class="row" style="margin-top:70px">
				    <div align="center">
				  		<h2 class="form-name style_heading " >Product List</h2>
				  	</div>
				 	
			     <div class="row">
					     <div class="col-sm-offset-1 col-md-10">
							  		<hr style="border-top-color:#c1b1b1;">
					     </div>	
			   		 </div>
		</div>
			    
	<%
	ComponentStockDao dao=new ComponentStockDao();
	List list12=dao.getComponentStock();
	%>
	<div class="container">
	<div class="row">
	
	<div id="date" style="padding-top:2%">
		<label id="demo"></label>
		<script>
			var date = new Date();
			document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>

	<div id="demo_jui">
		<table id="list" class="display" border="1">
			<thead>
				<tr>
				<th>Sr No</th>
					<th>Component Type</th>
	                <th>Component Name</th>
					<th>Manufacturer Name</th>
					<th>Package</th>
					<th>Type</th>
					<th>Unit</th>
					<th>Quantity</th>
					<th>StockLastUpdateDate</th>	
					 					 
					<!-- <th>Credit Customer Sale Price</th> -->
					
					
				</tr>
			</thead>
			
			<tbody>
   				<%
						for(int i=0;i<list12.size();i++){
						ComponentStockBean sr=(ComponentStockBean)list12.get(i);
						//System.out.println(sr.getProduct()+" "+sr.getCat()+" "+sr.getManufacturer()+" "+sr.getTaxType()+" "+sr.getTaxPercentage()+" "+sr.getBuyPrice()+" "+sr.getWeight()+" "+sr.getSubCatName());
				%>
				
				<tr>
					<td class="align"><%=sr.getSrNo()%></td>
					<td class="align"><%=sr.getComponentType()%></td>
					<td class="align"><%=sr.getComponentName()%></td>
				    <td class="align"><%=sr.getManufacturarName()%></td> 
					<td class="align"><%=sr.getCompPackage()%></td>
					<td class="align"><%=sr.getType()%></td>
					<td class="align"><%=sr.getUnit()%></td> 
					<td class="align"><%=sr.getQuantity()%></td>
					<td class="align"><%=sr.getCompStockLastUpdateDate()%></td>
					
					 
					 
					
					<%-- <td class="align"><%=sr.getCreditSalePrice()%></td> --%>
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	</div>
	</div>
	
	<div class="wrapper" align="center">
		<input type="button" font-size: 25" value="Back" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="Back()" /> 
	</div>
<%@include file="commons/newFooter.jsp" %>
</html>

