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
		
        <script src="/embelSoft/staticContent/js/vendorDetails.js"></script>
        <link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
 		<script src="sweetalert2.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css">
        <!-- <script type="text/javascript">
          		 function vendorList()
          		 {
          		 window.location = "vendorList.jsp";
          		 }
          		</script> --> 
          		
          		<script type="text/javascript">
					function back()
					{
						window.location = "VendorDetails.jsp";	
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
				<h2 class="form-name style_heading">Edit Vendor Details</h2>
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
		
	<div id="wrqpper">
    <form class="form-horizontal" name="vendorForm">
		
		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label" for="employeename">Vendor Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
							<%
								VendorDetailsDao sdd3 = new VendorDetailsDao();
								List sList4 = sdd3.getAllVendorNames();
							%>
							<input list="vendorNameList" id="fk_vendor_id" class="form-control" onchange="getVendorListForEdit()">
							<datalist id="vendorNameList">
								<%
									for (int i = 0; i < sList4.size(); i++) {
									VendorDetailsHibernate sup = (VendorDetailsHibernate) sList4.get(i);
								%>

								<option data-value="<%=sup.getPkVendorDetailsId()%>"
								value="<%=sup.getVendorName()%>">

									<%
										}
									%>
								
							</datalist>
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label" for="employeename">Vendor Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
							<input type="text" id='vendorName' name="vendorName" 
								class="form-control" placeholder="Enter Vendor Name">
							<!-- onkeypress="return isAlphabetsWithSpace(event)"-->
						</div>
					</div>
				

					<div class="col-sm-2">
						<label class="control-label">Date&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="date" id='enquiryDate' name="enquiryDate" class="form-control" placeholder="Select Date" />
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Contact Number&nbsp;:<sup></sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> 
							<input type="text" id='contactNo' name="contactNo" maxlength="15" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Contact Number">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Address&nbsp;:<sup></sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-home"></i>
							</span> <input type="text" id='address' name="address"
								class="form-control" placeholder="Enter Address">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Alternate Contact Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='alternateContactNumber' maxlength="15" name="alternateContactNumber" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Alternate Contact Number">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Emergency Contact Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-home"></i>
							</span> <input type="text" id='emergenctContactNumber' maxlength="10" name="emergenctContactNumber" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Emergency Contact Number">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Company Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='companyName' name="companyName" class="form-control" placeholder="Enter Company Name" />
						</div>
					</div>


					<div class="col-sm-2">
						<label class="control-label">Company Address&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="text" id='companyAddress' name="companyAddress" class="form-control" placeholder="Enter Company Address" />
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Contact Person Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='contactPersonName' name="contactPersonName" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Contact Person Number">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Company Number&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='companyNumber' name="companyNumber" maxlength="10" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Company Number">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Zip Code&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> 
							<input type="text" id='zipCode' name="zipCode" maxlength="6" onkeypress="return isNumber(event)" class="form-control" placeholder="Enter Zip Code"> 
						</div>
					</div>
					
			         <div class="col-sm-2">
						<label class="control-label">Email&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> 
							<input type="text" id='emailId' name="emailId" class="form-control" placeholder="Enter Email Id">
						</div>
					</div>
			     </div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Country&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='country' name="country"	onkeypress="return isAlphabetsWithSpace(event)" class="form-control" placeholder="Enter Country">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">State&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
					 <input type="text" id='state' name="state"	class="form-control" onkeypress="return isAlphabetsWithSpace(event)" placeholder="Enter State">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">PAN Number&nbsp;:<sup></sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='PANNum' name="PANNum"class="form-control" maxlength="10"  placeholder="Enter PAN Number">
						</div>
					</div>
					
			         <div class="col-sm-2">
						<label class="control-label">CIN Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
					 <input type="text" id='CIMNo' name="gstInNo"	class="form-control" placeholder="Enter CIM Number">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">GSTIN Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='gstInNo' name="gstInNo"	class="form-control" placeholder="Enter GSTIN Number">
						</div>
					</div>


				</div>
			
			<div align="center">
				<div class="col-md-12">
					<input type="button" class="btn btn-success btn-lg btnn" value="Update" name="btn" onclick="validationUpdateVendorDetail()"> 
					<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button" class="btn btn-primary btn-lg btnn" value="Back" onclick="back()">
				</div>	
			</div>
		</form>
		</div>
	</div>
</body>
</html>

<%@include file="commons/newFooter.jsp"%>
