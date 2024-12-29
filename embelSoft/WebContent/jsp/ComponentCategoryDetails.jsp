<%@page import="com.embelSoft.hibernate.SubcategoryHibernate"%>
<%@page import="com.embelSoft.dao.ComponentSubCategoryDao"%>
<%@page import="com.embelSoft.dao.ComponentCategoryDetailsDao"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.BillOfMaterialDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.embelSoft.dao.TaxDetailsDao"%>
<%@page import="com.embelSoft.dao.ComponentTypesDao"%>
<%@page import="com.embelSoft.hibernate.TaxDetailsHibernate"%>

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
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="/embelSoft/staticContent/js/ComponentDetails.js"></script>
		<script src="/embelSoft/staticContent/js/SubCategoryDetails.js"></script>
		
		<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<style>
.btn {
    padding: 4px 5px !important;
    height: 30px !important;
}


/* Style the form */


/* Style the input fields */
input {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
  display: none;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

/* Mark the active step: */
.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #04AA6D;
}
</style>
		
         <script src="/embelSoft/staticContent/js/compoentCategorydetails.js"></script>
       <!-- <script src="/embelSoft/staticContent/js/ComponentDetails.js"></script> -->
        <script type="text/javascript">
function checkForDuplicateEntry(){
          			<%
          			ComponentTypesDao dao2 = new ComponentTypesDao();
          			List list = dao2.getAllComponentTypes();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				CompTypeDetailsHibernate   bean = (CompTypeDetailsHibernate)list.get(z);
          			%>
          			var componentName = "<%=bean.getComponentType()%>";
          			
          			var compName = document.getElementById("componentType").value;
          			
          			var componentName1 = componentName.toLowerCase();
          			
          			var compName1 = compName.toLowerCase();
          			
          			if(componentName1 == compName1 || componentName == compName){
          				alert("This Category is already exist...Duplicate Not allowed");
          				document.componentTypeDetailsForm.reset(); 
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
          			
</script>
        <script type="text/javascript">
          		 function CompoenentCategoryDetailList()
          		 {
          			 window.location = "ComponentList.jsp";
          		 }
          		</script> 
          		
          		
          		<script type="text/javascript">
          		function editVendor()
          		{
          			 window.location = "editCompoentCategoryDetails.jsp";
          		}
          		</script>
          		
          		<script type="text/javascript">
          		function bulkUpload()
          		{
          			 window.location = "ComponentCategoryBulkUpload.jsp";
          		}
          		</script>
          		
		           	
          		<!-- <script>
          		function forPartOne()
          		{
          			$("#part1").show(); 
		           	$("#part2").hide();
		           	$("#part3").hide();
          		}
          		
          		function forPartTwo()
          		{
          			$("#part1").hide(); 
		           	$("#part2").show();
		           	$("#part3").hide();
          		}
          		
          		function forPartThree()
          		{
          			$("#part1").hide(); 
		           	$("#part2").hide();
		           	$("#part3").show();
          		}
          		</script> -->
          		
          		
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
          
          function duty() {
        	  document.getElementById("duty").value=0;
        	  
        	  
		}
          
          </script>
          
          <script type="text/javascript">
          <!-- ================= unit Price With custom Duty =================== -->
          
         function unitpriceinclcustomduty() {
			
        	var unitPrice=document.getElementById("unitPrice").value;
        	var CustomDuty=document.getElementById("duty").value; 
        	
        	if(CustomDuty=="" || CustomDuty==null )
        		{
        		duty= document.getElementById("duty").value=0;
        		var rate=(unitPrice*(1+(duty/100)));
            	document.getElementById("unitPrice1").value = Math.round(rate * 100) / 100;
        		}
        	else
        		{
        	var rate=(unitPrice*(1+(CustomDuty/100)));
        	document.getElementById("unitPrice1").value = Math.round(rate * 100) / 100;
        		}
        		}
          
          </script>	
          


</head>
<body  onload="forPartOne()">

	<div class="container" >
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading"  >Component Details</h2>
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
		
       <section id="part1" class="formsection">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Component Category&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i></span> 
							<%
				    	ComponentCategoryDetailsDao dao1 = new ComponentCategoryDetailsDao();
							List compTypeList = dao1.getAllCompTypeDetails();
						%>
				    	<span>
						<input list="compoentCategorylist" id="componentCategory" class="form-control" placeholder="Select Component Category" onchange="compSubcategoryDetails()">
						<datalist id="compoentCategorylist">
							<%
								for (int i = 0; i < compTypeList.size(); i++) {
									CompTypeDetailsHibernate ctdh = (CompTypeDetailsHibernate) compTypeList.get(i);
							%>
							<option data-value="<%=ctdh.getPkCompTypeId()%>" value="<%=ctdh.getComponentType()%>">									
							<%
								}
							%>
						</datalist></span>
						<!-- <span><button type="button" class="btn btn-default" onclick="showAddComponentCategoryBox()">+</button></span> -->
                         </div>
						</div>
					
			<div id="addComponentCategoryBox" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">Add Component Category</h4>
				      </div>
				      <div class="modal-body">
				      
				        <div class="col-md-6 " >
					        <label class="control-label">Component Category :<sup>*</sup></label>
				       </div>
				
				<div class="col-md-6">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span> 
						<input type="text" id='componentType' name="componentType" class="form-control" placeholder="Enter Component Category"/>
					</div>
				</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary" onclick="checkForDuplicateEntry(); return compTypesDetailsValidate();">Add</button>
				      </div>
				    </div>
				  </div>
			</div>

					<div class="col-sm-2">
						<!-- <label class="control-label">Date&nbsp;:<sup>*</sup></label> -->
						<label class="control-label">Component Subcategory&nbsp;:&nbsp;&nbsp;</label>
					</div>
					
					<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> 
									<i class="glyphicon glyphicon-hand-right"></i></span> 									
									<select id="componentSubcategory" name="componentSubcategory" class="form-control" placeholder="Select Subcategory"></select>
							</div>
						</div>	
					
					<div id="addComponentSubCategoryBox" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">Add Component Sub-Category</h4>
				      </div>
				      <div class="modal-body">
				      
				      
				      
				       <div class="row form-group">
				<div class="col-md-4 col-sm" >
					<label class="control-label">Component Category :<sup>*</sup></label>
				</div>
				<div class="col-sm-6">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span> 
						<%ComponentTypesDao cdao =new ComponentTypesDao();
						   List compList =cdao.getAllComponentTypes();
						%>
						<input list="compList" id='componentBoxType' name="componentBoxType" class="form-control" placeholder="Select Category"/>
						<datalist id="compList">
							<%
								for (int i = 0; i < compList.size(); i++) {
									CompTypeDetailsHibernate ctdh = (CompTypeDetailsHibernate) compList.get(i);
							%>
							<option data-value="<%=ctdh.getPkCompTypeId() %>" value="<%=ctdh.getComponentType() %>">									
							<%
								}
							%>
						</datalist>
					</div>
				</div>			
			</div>
			<div class="row form-group">
				<div class="col-sm-4 col-sm" >
					<label class="control-label">Component SubCategory :<sup>*</sup></label>
				</div>
				<div class="col-sm-6">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span> 
						<input type="text" id='componentBoxSubcategory' name="componentBoxSubcategory" class="form-control" placeholder="Enter Component SubCategory"/>
					</div>
				</div>			
			</div>
				
				
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary" onclick="compSubTypesDetailsValidate();">Add</button>
				      </div>
				    </div>
				  </div>
					</div>				
				</div>
				<div class="row form-group">
					
					

					<div class="col-sm-2 col-sm-offset-1">
						<!-- <label class="control-label">Date&nbsp;:<sup>*</sup></label> -->
						<label class="control-label">Component Name&nbsp;:&nbsp;&nbsp;<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id="componentName"  name="componentName" class="form-control" placeholder="Enter component Name">
								
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
							<input type="text" id='componentValue' name="componentValue" class="form-control" placeholder="Enter component Value" >
						</div>
					</div>
										
					<div class="col-sm-2" >
						<label class="control-label">Part Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="partNumber" name="partNumber" class="form-control" placeholder="Enter Part Number" onchange="forPartTwo()"><!--  onkeypress="return isNumber(event);" -->
						</div>
					</div>
				</div>
		</section>
		<section id="part2" class="formsection">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">Manufacturer Name &nbsp;:&nbsp;&nbsp;<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='manufacturerName' name="manufacturerName" class="form-control" placeholder="Enter manufacturer Name">
						</div>
					</div>
										
					<div class="col-sm-2" >
						<label class="control-label">Description &nbsp;:&nbsp;&nbsp;<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="description" name="description" class="form-control" placeholder="Enter Description">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label"> Type &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='type' name="type" class="form-control" placeholder="Enter Type">
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
							<input type="text" id="packages" name="packages" class="form-control" placeholder="Enter Package">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label"> Tol/Va Rating &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='totalVolt' name="totalVolt" class="form-control" placeholder="Enter Tol/Va Rating">
						</div>
					</div>
										
					<div class="col-sm-2" >
						<label class="control-label">Quantity &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="unit" name="unit" class="form-control" onkeypress="return isNumber(event);" placeholder="Enter Unit" onchange="forPartThree()">
						</div>
					</div>
				</div>
		</section>	
		<section id="part3" class="formsection">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Unit Price(Excl) &nbsp;:&nbsp;&nbsp;<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='unitPrice' name="unitPrice" class="form-control" placeholder="Enter Unit Price" value="0" onkeypress="return isNumber(event);" onkeyup="unitpriceinclcustomduty()">
						</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label">Custom Duty % &nbsp;:&nbsp;&nbsp;<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="duty" name="duty" class="form-control" placeholder="Enter Custom Duty % " value="0" onkeyup="unitpriceinclcustomduty()">
						</div>
					</div>
				</div>
					
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">Unit Price(lncl Custom duty) &nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id='unitPrice1' name="unitPrice" class="form-control" value="0" placeholder="Unit Price Incl Custom duty" readonly="readonly">
						</div>
					</div>
					</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">Select Tax Type&nbsp;:&nbsp;&nbsp;<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i></span>
							<%				    	
							TaxDetailsDao dao = new TaxDetailsDao();
								List taxList = dao.getTaxDetailsForProductRegistation();
							%>
							<input list="taxNameList" id="fk_tax_id" class="form-control" onchange="getTaxDetailsForCompoentCategoryDetails()" placeholder="Select Tax">
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
								class="form-control" placeholder="Tax Percentage" readonly="readonly">
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
							<input type="text" id='CGST' name="CGST" class="form-control" placeholder="CGST %" readonly="readonly" />
						</div>
					</div>

					<div class="col-sm-2" >
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
			</section>
			
			<!-- <div style="overflow:auto;">
				 <div style="float:right;">
				  <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
				  <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
				 </div>
           </div> -->
           
           <!-- Circles which indicates the steps of the form: -->
			<!-- <div style="text-align:center;margin-top:40px;">
			  <span class="step"></span>
			  <span class="step"></span>
			  <span class="step"></span>
			</div> -->
			
		<br><br><br>
			
			<div align="center">
				<div class="col-md-12">
					<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="btn" onclick="CompoentCategoryDetialvalidate()"> 
					<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="CompoenentCategoryDetailList()">
					<input type="button" value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="editVendor()">
					<!-- <input type="button" style="width:125px;" value="BulkUpload" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="bulkUpload()"> -->
					<input type="button" style="width:125px;" value="BulkUpload" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="bulkUpload()">
				
				</div>
			</div>
		</form>
	</div>
	</div>
	
	
</body>
</html>

<%@include file="commons/newFooter.jsp"%>
