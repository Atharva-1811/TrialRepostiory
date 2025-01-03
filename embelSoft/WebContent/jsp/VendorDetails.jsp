<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>

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
		
        <script src="/embelSoft/staticContent/js/vendorDetails.js"></script>
        <link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
        <script src="sweetalert2.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css">
		
		<link rel="stylesheet" href="/embelSoft/staticContent/css/style1.css">
        
        <script type="text/javascript">
          		 function vendorList()
          		 {
          			 window.location = "vendorList.jsp";
          		 }
          		</script> 
          		
          		<script type="text/javascript">
          		function editVendor()
          		{
          			 window.location = "editVendorDetails.jsp";
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
          		
        <script type="text/javascript">

				function checkForDuplicateEntry(){
          			<%
          			VendorDetailsDao dao2 = new VendorDetailsDao();
          			List list = dao2.getAllVendorNames();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				VendorDetailsHibernate   bean = (VendorDetailsHibernate)list.get(z);
          			%>
          			var componentName = "<%=bean.getVendorName()%>";
          			
          			var compName = document.getElementById("vendorName").value;
          			
          			var componentName1 = componentName.toLowerCase();
          			
          			var compName1 = compName.toLowerCase();
          			
          			if(componentName1 == compName1 || componentName == compName){
          				alert("This Vender is already exist...Duplicate Not allowed");
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
				<h2 class="form-name style_heading">Vendor Details</h2>
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
				<!-- <hr style="border-top-color: #c1b1b1;"> -->
				<hr class="style-one">
			</div>
		</div>
		
	<div id="wrqpper">
    <form class="form-horizontal" name="vendorForm">
		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Vendor Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='vendorName' name="vendorName" class="form-control" onkeypress="return isAlphabetsWithSpace(event)"  onchange="checkForDuplicateEntry()" placeholder="Enter Vendor Name"  />
						<!-- onkeypress="return isAlphabetsWithSpace(event)" -->
						</div>
					</div>
					
		<div class="col-sm-2">
			<label class="control-label">Date :</label>
			<%
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				String todayDate = simpleDateFormat.format(new Date());
			%>
		</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="date" id='enquiryDate' value="<%= todayDate%>" name="enquiryDate" class="form-control" 
                            placeholder="Select Date" />
						</div>
					</div>
				 </div> 
			
		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Contact Number :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='contactNo' name="contactNo" onkeypress="return isNumber(event);" maxlength="10"
								class="form-control" onclick="checkForDuplicateEntry()" placeholder="Enter Contact Number">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Alternate Contact Number :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='alternateContactNumber' onkeypress="return isNumber(event);" maxlength="15" name="alternateContactNumber" 
								class="form-control" placeholder="Enter Alternate Contact Number">
						</div>
					</div>
				</div>
	
				<div class="row form-group">

					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Emergency Contact Number :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='emergenctContactNumber' maxlength="10" name="emergenctContactNumber" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Emergency Contact Number">
						</div>
					</div>
				
					<div class="col-sm-2">
						<label class="control-label">Address :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-home"></i>
							</span>
							<textarea rows="3" cols="15" id='address' name="address" class="form-control" onclick="checkForDuplicateEntry()" placeholder="Enter Address"></textarea>
							
							 <!-- <input type="text" id='address' name="address" class="form-control" placeholder="Enter Address"> -->
						</div>
					</div>
					
				</div>

				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Company Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='companyName' name="companyName" class="form-control" placeholder="Enter Company Name" />
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Company Address :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-home"></i>
							</span>
							<textarea id='companyAddress' name="companyAddress" class="form-control" placeholder="Enter Company Address" rows="3" cols="10"></textarea>
				
						</div>
					</div>
		
				</div>
			
				<div class="row form-group"> 
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Company Mobile Number :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone-alt"></i>
							</span> <input type="text" id='companyNumber' name="companyNumber" maxlength="10" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Company Number">
						</div>
					</div>
	
					<div class="col-sm-2">
						<label class="control-label">PAN Number :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='PANNum' name="PANNum" class="form-control" maxlength="10"  placeholder="Enter PAN Number">
						</div>
					</div>
					
				</div>
				
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">GSTIN No :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='gstInNo' name="gstInNo"	class="form-control" maxlength="15" placeholder="Enter GSTIN Number">
						</div>
					</div>
					
					  <div class="col-sm-2">
						<label class="control-label">CIN No :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
					 <input type="text" id='CIMNo' name="gstInNo" class="form-control"  placeholder="Enter CIN Number">
						</div>
					</div>
					
				</div>
			
			
				<div class="row form-group">
							
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Contact Person Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='contactPersonName' name="contactPersonName" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Contact Person Name">
						</div>
					</div>
					
				<div class="col-sm-2">
						<label class="control-label">Zip Code :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='zipCode' name="zipCode" maxlength="6" onkeypress="return isNumber(event)" class="form-control" placeholder="Enter Zip Code"> 
						</div>
					</div>
	
	
				</div>

	
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">State :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
					 <input type="text" id='state' name="state"	class="form-control" onkeypress="return isAlphabetsWithSpace(event)" placeholder="Enter State">
						</div>
					</div>
				
					<div class="col-sm-2">
						<label class="control-label">Country :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='country' name="country"	onkeypress="return isAlphabetsWithSpace(event)" class="form-control" placeholder="Enter Country">
						</div>
					</div>
			     </div>
			
				<div class="row form-group">

			         <div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Email :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> 
							<input type="text" id='emailId' name="emailId" class="form-control" placeholder="Enter Email Id">
						</div>
					</div>

				</div>
			<br>
			<br>
		
			<div align="center">
					<div class="col-md-12">
						<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="btn" onclick="vendorDetailValidation()"> 
						<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
						<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="vendorList()">
						<input type="button" value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="editVendor()">
					</div>
			</div>
		</form>
		</div>
		</div>
</body>
</html>

<%@include file="commons/newFooter.jsp"%>
