
<%@page import="com.embelSoft.hibernate.ProductDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ProductDetailsDao"%>
<%@page import="com.embelSoft.dao.TaxDetailsDao"%>
<%@page import="com.embelSoft.hibernate.TaxDetailsHibernate"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<html>
<head>

		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
		<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
		
        <script src="/embelSoft/staticContent/js/productDetails.js"></script>
        
        <link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
		<script src="sweetalert2.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css">

        <script type="text/javascript">
          		 function productList()
          		 {
          		 window.location = "productList.jsp";
          		 }
          		</script> 
          		
          		<script type="text/javascript">
					function back()
					{
						window.location = "ProductDetails.jsp";	
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
		
		<script type="text/javascript">
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


		</script>
          		
          		

</head>
<body>

	<div class="container">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Edit Product Details</h2>
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
			<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
		

    <div id="wrqpper">
    <form class="form-horizontal" name="vendorForm">
		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label" for="employeename">Select Product Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<%
								ProductDetailsDao sdd3 = new ProductDetailsDao();
								List sList4 = sdd3.getAllProductNames();
							%>
							<input list="productNameList" id="fk_product_id" class="form-control" onchange="getProductListForEdit()">
							<datalist id="productNameList">
								<%
									for (int i = 0; i < sList4.size(); i++) {
									ProductDetailsHibernate sup = (ProductDetailsHibernate) sList4.get(i);
								%>

								<option data-value="<%=sup.getPkProductDetailsId()%>"
								value="<%=sup.getProductName()%>">

									<%
										}
									%>
								
							</datalist>
						</div>
					</div>
				

					<div class="col-sm-2">
						<label class="control-label">Product Name&nbsp;:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group"> <span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i> </span>
						<input type="text" id='productName' name="productName" class="form-control" placeholder="Enter Product Name">	
						</div>
					</div>

				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label" for="employeename">HSN/SAC&nbsp;:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='hsnsac' name="hsnsac"  class="form-control" placeholder="Enter Hsn Or Sac">						
						</div>
					</div>						

					<div class="col-sm-2">
						<label class="control-label">Product Cost&nbsp;:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group"> <span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i> </span>
						<input type="text" id='cost' name="cost" class="form-control" placeholder="Enter Cost">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Description&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <textarea rows="3" cols="15" id='description' name="description" class="form-control" placeholder="Enter Description"></textarea>
						</div>
					</div>
					
					
					<div class="col-sm-2">
						<label class="control-label">Features&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <textarea rows="3" cols="15" id='features' name="features" class="form-control" placeholder="Enter Features"></textarea>
						</div>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Select Tax Type&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i></span>
							<%				    	
							TaxDetailsDao dao = new TaxDetailsDao();
								List taxList = dao.getTaxDetailsForProductRegistation();
							%>
							<input list="userNameList" id="fk_employee_id" class="form-control" onchange="getTaxDetailsForProductDetails()" placeholder="Select Name">
							<datalist id="userNameList">
							<%
								for (int i = 0; i < taxList.size(); i++) {
									TaxDetailsHibernate hibernate = (TaxDetailsHibernate) taxList.get(i);
							%>
							<option data-value="<%=hibernate.getPkTaxDetailsId()%>" value="<%=hibernate.getTaxType()%>">							
							<%
								}
							%>
							</datalist>
						</div>
					</div>
					
					<input type="hidden" id="fkTaxTypeId" class="form-control" value="" >
					
					<div class="col-sm-2">
						<label class="control-label">Tax Percentage&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"> </i> </span>
							<input type="text" id='taxPercentage' maxlength="10" name="taxPercentage" class="form-control" placeholder="Tax Percentage" readonly="readonly">
						</div>
					</div>					
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">CGST % &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='CGST' name="CGST" class="form-control" placeholder="CGST %" readonly="readonly" />
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">SGST &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='SGST' name="SGST" maxlength="10" class="form-control" placeholder="SGST %" readonly="readonly">
						</div>
					</div>
				</div>
			
			
			<!-- <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Date&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> 
							<input type="date" id='enquiryDate' name="enquiryDate" class="form-control" placeholder="Select Date">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Product Cost&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group"> <span class="input-group-addon"> <i class="glyphicon glyphicon-home"></i> </span>
						<input type="text" id='cost' name="cost" class="form-control" placeholder="Enter Cost">
						</div>
					</div>
				</div>
			</div> -->
			<br>
			
			<div class="container" align="center">
				<div class="col-md-11">
					<input type="button" class="btn btn-success btn-lg btnn" value="Update" name="btn" onclick="validateupdateProductDetails()"> 
					<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button" class="btn btn-primary btn-lg btnn" value="Back" onclick="back()">
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>

