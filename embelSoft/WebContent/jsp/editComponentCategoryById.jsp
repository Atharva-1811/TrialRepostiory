<%@page import="com.embelSoft.hibernate.CompoentCategoryDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ComponentCategoryDetailsDao"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.BillOfMaterialDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.embelSoft.dao.TaxDetailsDao"%>
<%@page import="com.embelSoft.hibernate.TaxDetailsHibernate"%>
<%@page import="com.embelSoft.bean.CompoentCategoryDetailBean"%>

<%@page import="org.hibernate.Session"%>

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
		
		<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
		
        <script src="/embelSoft/staticContent/js/compoentCategorydetails.js"></script>
        
        <script type="text/javascript">
          		 function CompoenentCategoryDetailList()
          		 {
          			 window.location = "CompoenentCategoryDetailList.jsp";
          		 }
          		</script> 
          		
          		
          		<script type="text/javascript">
          		function editVendor()
          		{
          			 window.location = "editProductDetails.jsp";
          		}
          		</script>
          		
          		<script type="text/javascript">
          		function resetForm()
          		{
          			 document.getElementById('editCompCatDetailById').reset();
          		}
          		</script>
 
<script>
<% String pkId = (String)request.getSession().getAttribute("ComponentName_Id2"); %>
<% String compName = (String)request.getSession().getAttribute("compName2"); %>
<% String compCat = (String)request.getSession().getAttribute("compCat2"); %>
<% String compValue = (String)request.getSession().getAttribute("compValue2"); %>
<% String compPartNo = (String)request.getSession().getAttribute("compPartNo2"); %>
<% String compManufacturerName = (String)request.getSession().getAttribute("compManufacturerName2"); %>
<% String compDscrptn = (String)request.getSession().getAttribute("compDscrptn2"); %>
<% String compType = (String)request.getSession().getAttribute("compType2"); %>
<% String compPackage = (String)request.getSession().getAttribute("compPackage2"); %>
<% String compTovRating = (String)request.getSession().getAttribute("compTovRating2"); %>
<% String compQuantity = (String)request.getSession().getAttribute("compQuantity2"); %>
<% String compUnitPrice = (String)request.getSession().getAttribute("compUnitPrice2"); %>
<% String compDuty = (String)request.getSession().getAttribute("compDuty2"); %>
<% String compUnitCustDuty = (String)request.getSession().getAttribute("compUnitCustDuty2"); %>
<% String compTaxType = (String)request.getSession().getAttribute("compTaxType2"); %>
<% String compTaxPercnt = (String)request.getSession().getAttribute("compTaxPercnt2"); %>
<% String compCGST = (String)request.getSession().getAttribute("compCGST2"); %>
<% String compSGST = (String)request.getSession().getAttribute("compSGST2"); %>

/* $(document).ready(function(){
	getComponetCategoryDetailsByComponetIdPkForEdit();
}); */
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
          <!-- ================= unit Price With custom Duty =================== -->
          
         function unitpriceinclcustomduty() {
			
        	var unitPrice=document.getElementById("unitPrice").value;
        	var CustomDuty=document.getElementById("duty").value; 
        	
        	
        	var rate=(unitPrice*(1+(CustomDuty/100)));
        	
        	
        	document.getElementById("unitPrice1").value = Math.round(rate * 100) / 100;
		}
          
          </script>  		

</head>
<body>

	<div class="container">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" >Edit Component Category Details</h2>
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
    <form class="form-horizontal" name="editCompCatDetailById" id="editCompCatDetailById">
	
    		<div class="form-group" style="display:none;">
    		
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Component PkId&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i></span> 
							<input type="text" id='componentName_id' name="componentName_id" value="<%=pkId%>" class="form-control">
						</div>
					</div>	
					
				<div class="col-sm-2" align="right" >
						<label class="control-label">Component Name&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='componentName11' name="componentName" value="<%=compName%>" class="form-control">
								
						</div>
					</div>					
				</div>
						
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Component Category&nbsp;:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i></span> 
						<%
				    	ComponentCategoryDetailsDao dao1 = new ComponentCategoryDetailsDao();
							List compTypeList = dao1.getAllCompTypeDetails();
						%>	
				    	
						<input list="compoentCategorylist" id='componentCategory' value="<%=compCat%>" class="form-control" >
						 <datalist id="compoentCategorylist">
							<%
								for (int i = 0; i < compTypeList.size(); i++) {
									CompTypeDetailsHibernate ctdh = (CompTypeDetailsHibernate) compTypeList.get(i);
							%>
							<option data-value="<%=ctdh.getPkCompTypeId()%>" value="<%=ctdh.getComponentType()%>">									
							<%
								}
							%>
						</datalist>
						</div>
					</div>

					<div class="col-sm-2">
						<!-- <label class="control-label">Date&nbsp;:<sup>*</sup></label> -->
						<label class="control-label">Component Name&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='componentName' name="componentName" value="<%=compName%>" class="form-control" >
								
						</div>
					</div>					
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Component Value&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='componentValue' name="componentValue" value="<%=compValue%>" class="form-control">
						</div>
					</div>
										
					<div class="col-sm-2">
						<label class="control-label">Part Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="partNumber" name="partNumber" value="<%=compPartNo%>" class="form-control">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">Manufacturer Name &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='manufacturerName' name="manufacturerName" value="<%=compManufacturerName%>" class="form-control">
						</div>
					</div>
										
					<div class="col-sm-2">
						<label class="control-label">Description &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="description" name="description" value="<%=compDscrptn%>" class="form-control">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label"> Type &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='type' name="type" value="<%=compType%>" class="form-control">
						</div>
					</div>
										
					<div class="col-sm-2">
						<label class="control-label">Package &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="packages" name="packages" value="<%=compPackage%>" class="form-control">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label"> Tol/Va Rating &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='totalVolt' name="totalVolt" value="<%=compTovRating%>" class="form-control">
						</div>
					</div>
										
					<div class="col-sm-2">
						<label class="control-label">Quantity &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="unit" name="unit" value="<%=compQuantity%>" class="form-control">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Unit Price &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='unitPrice' name="unitPrice" class="form-control" value="<%=compUnitPrice%>" onkeyup="unitpriceinclcustomduty()">
						</div>
					</div>
					<div class="col-sm-2" >
						<label class="control-label">Custom Duty % &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="duty" name="duty" class="form-control" value="<%=compDuty%>"  onkeyup="unitpriceinclcustomduty()">
						</div>
					</div>
					
					</div>
					
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Unit Price(lncl Custom duty) &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='unitPrice1' name="unitPrice" value="<%=compUnitCustDuty%>" class="form-control"  readonly="readonly">
						</div>
					</div>
					</div>
					
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">Select Tax Type&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i></span>
							<%				    	
							TaxDetailsDao dao = new TaxDetailsDao();
								List taxList = dao.getTaxDetailsForProductRegistation();
							%>
							<input list="taxNameList" id="fk_tax_id" class="form-control" value="<%=compTaxType%>" onchange="getTaxDetailsForCompoentCategoryDetails()" placeholder="Select Tax">
							<datalist id="taxNameList">
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

					<div class="col-sm-2" >
						<label class="control-label">Tax Percentage&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='taxPercentage' maxlength="10" name="taxPercentage" 
								class="form-control" value="<%=compTaxPercnt%>" readonly="readonly">
						</div>
					</div>					
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">CGST % &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='CGST' name="CGST" class="form-control" value="<%=compCGST%>" readonly="readonly" />
						</div>
					</div>

					<div class="col-sm-2" >
						<label class="control-label">SGST &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='SGST' name="SGST" class="form-control" value="<%=compSGST%>" readonly="readonly">
						</div>
					</div>
				</div>
				
			<div align="center">
				<div class="col-md-12">
					<input type="button" class="btn btn-success btn-lg btnn" value="Update" name="btn" onclick="updateCompoentCategoryDetailById()"> 
					<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="resetForm()">
					<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="CompoenentCategoryDetailList()">
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>

<%@include file="commons/newFooter.jsp"%>
