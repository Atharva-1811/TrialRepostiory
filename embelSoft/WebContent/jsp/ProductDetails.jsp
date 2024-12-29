
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.embelSoft.dao.TaxDetailsDao"%>
<%@page import="com.embelSoft.hibernate.TaxDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ProductDetailsDao"%>
<%@page import="com.embelSoft.hibernate.ProductDetailsHibernate"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

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
          		function editVendor()
          		{
          			 window.location = "editProductDetails.jsp";
          		}
          		</script>
          		
          		
          		<script type="text/javascript">
			function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode!==46) {
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

<script type="text/javascript">

function checkForDuplicateEntry(){
          			<%
          			ProductDetailsDao dao2 = new ProductDetailsDao();
          			List list = dao2.getAllProductNames();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				ProductDetailsHibernate   bean = (ProductDetailsHibernate)list.get(z);
          			%>
          			var componentName = "<%=bean.getProductName()%>";
          			
          			var compName = document.getElementById("productName").value;
          			
          			var componentName1 = componentName.toLowerCase();
          			
          			var compName1 = compName.toLowerCase();
          			
          			if(componentName1 == compName1 || componentName == compName){
          				alert("This Product is already exist...Duplicate Not allowed");
          				document.vendorForm.reset(); 
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
          			
</script>
          		

</head>
<body>

	<div class="container">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Product Details</h2>
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
    	<form class="form-horizontal" name="vendorForm" id="vendorForm">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Product Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='productName' name="productName" class="form-control" placeholder="Enter Product Name" />
						</div>
					</div>

					<div class="col-sm-2">
						<!-- <label class="control-label">Date&nbsp;:<sup>*</sup></label> -->
						<label class="control-label">Product Cost&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='productCost' maxlength="10" name="productCost" onkeypress="return isNumber(event)" onclick="checkForDuplicateEntry()"
								class="form-control" placeholder="Enter Product Cost ">
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
							</span>
							<textarea rows="3" cols="15" id='description' name="description" class="form-control" placeholder="Enter Description"></textarea>
						</div>
					</div>
										
					<div class="col-sm-2">
						<label class="control-label">Features&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<textarea rows="3" cols="15" id='features' name="features" class="form-control" placeholder="Enter Features"></textarea>
						</div>
					</div>
				</div>
		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">HSN/SAC&nbsp;:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='hsnsac' name="hsnsac" class="form-control" placeholder="Enter Hsn or Sac number" />
						</div>
					</div>		
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Select Tax Type&nbsp;:&nbsp;&nbsp;<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i></span>
							<%				    	
							TaxDetailsDao dao = new TaxDetailsDao();
								List taxList = dao.getTaxDetailsForProductRegistation();
							%>
							<input list="userNameList" id="fk_employee_id" class="form-control" onclick="checkForDuplicateEntry()" onchange="getTaxDetailsForProductDetails()" placeholder="Select Name">
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

					<div class="col-sm-2">
						<label class="control-label">Tax Percentage&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='taxPercentage' maxlength="10" name="taxPercentage" 
								class="form-control" placeholder="Tax Percentage" readonly="readonly">
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
						<label class="control-label">Features&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<textarea rows="3" cols="15" id='features' name="features" class="form-control" placeholder="Enter Features"></textarea>
						</div>
					</div>					
					<div class="col-sm-2">
						<label class="control-label">Date&nbsp;:<sup>*</sup></label>
						<%
					  	//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					  	//String todayDate = simpleDateFormat.format(new Date());//todayDate
					  	%>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="date" id='enquiryDate' name="enquiryDate" value=""  class="form-control" placeholder="Select Date" />
						</div>
					</div>
				</div>
				</div> -->
				<br>
			<div class="container" align="center">
				<div class="col-md-11">
					<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="btn" onclick="checkForDuplicateEntry(); return validateProductDetails();"> 
					<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="productList()">
					<input type="button" value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="editVendor()">
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>

<%@include file="commons/newFooter.jsp"%>


