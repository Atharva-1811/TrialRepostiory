	<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
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
    
        <script src="/embelSoft/staticContent/js/clientEnquiry.js"></script>
        <link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
 		<script src="sweetalert2.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css">
		
        <script type="text/javascript">
          		 function clientEnquiryList()
          		 {
          		 	window.location = "clientEnquiryList.jsp";
          		 }
          		</script> 
        
        
        <script type="text/javascript">
          		 function clientResponseList()
          		 {
          		 	window.location = "clientResponseList.jsp";
          		 }
          		</script> 
          		
          		<script type="text/javascript">
					function back()
					{
						window.location = "ClientEnquiry.jsp";

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
<div class="container" > 
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading">Edit Client Enquiry Details</h2>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-offset-1 col-md-10">
			<hr style="border-top-color: #c1b1b1;">
		</div>
	</div>
	<div id="wrqpper">
		<form class="form-horizontal" method="post" action="" name="clientEnqForm">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Client Name&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> 
							<%
								ClientEnquiryDao dao = new ClientEnquiryDao();
								List list = dao.getAllClientNames();
								
							%>
							
							<input list="clientNameList" id="fk_client_id" class="form-control" onchange="getClientDetailsForEdit()">
							<datalist id="clientNameList">
								<%
									for (int i = 0; i < list.size(); i++) {
										ClientEnquiryHibernate sup = (ClientEnquiryHibernate) list.get(i);
								%>

								<option data-value="<%=sup.getPkClientEnquiryId() %>"
								value="<%=sup.getFirstName()%>">

									<%
										}
									%>
								
							</datalist>
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Client Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='firstName' name="firstName" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Client Name" />
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Enquiry Date&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="date" id='enquiryDate' name="enquiryDate" class="form-control" placeholder="Select Enquiry Date" />
						</div>
					</div>
					<!-- <div class="col-sm-2">
						<label class="control-label">Middle Name&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='middleName' name="middleName" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Middle Name">
						</div>
					</div> -->
				</div>
			
			<!-- <div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Last Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='lastName' name="lastName" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Last Name">
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Enquiry Date&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="date" id='enquiryDate' name="enquiryDate" class="form-control" placeholder="Select Enquiry Date" />
						</div>
					</div>
				</div>
			</div> -->
			
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Contact Person&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='businessName' name="businessName" 
								class="form-control" placeholder="Enter Contact Person Name">
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Business Address&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="text" id='businessAddress' name="businessAddress" class="form-control" placeholder="Enter Business Address" />
						</div>
					</div>
				</div>
		
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Contact Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='contactNo' name="contactNo" maxlength="10" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Contact Number">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Email&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> <input type="text" id='emailId' name="emailId"
								class="form-control" placeholder="Enter Email Id">
						</div>
					</div>
				</div>
			

				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">City&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='city' name="city" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter City">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">State&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-home"></i>
							</span> <input type="text" id='state' name="state" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter State">
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
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='zipcode' name="zipcode" maxlength="6" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Zip Code">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Country&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-home"></i>
							</span> <input type="text" id='country' name="country" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Country">
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
							</span> <input type="text" id='alternativeContactNo' name="alternativeContactNo" maxlength="10" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Alternate Contact Number">
						</div>
					</div>
					
					 <div class="col-sm-2">
						<label class="control-label">GST No&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='gst' name="gst"
								class="form-control" placeholder="Enter Gst No">
						</div>
					</div>
					<!-- <div class="col-sm-2">
						<label class="control-label">Product Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-home"></i>
							</span> <input type="text" id='productName' name="productName" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Product Name">
						</div>
					</div> -->
				</div>
			
			
			<!-- <div class="row">
				<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Reference By&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='referenceBy' name="referenceBy"
								class="form-control" placeholder="Enter Reference By">
						</div>
					</div>
		
					<div class="col-sm-2">
						<label class="control-label">Comment&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='comment' name="comment"
								class="form-control" placeholder="Enter Comment">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
	
		
			<div class="col-sm-2 col-sm-offset-1">
                 <label class="control-label">Upload PDF File&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						  <input type="file" id='uploadFile' name="uploadFile" class="form-control" placeholder="upload File .pdf">
					 	</div>
					 </div>
					 
					 <div class="col-sm-2">
						<label class="control-label">GST No&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='gst' name="gst"
								class="form-control" placeholder="Enter Gst No">
						</div>
					</div>
					 
				</div>
			</div> -->


			<div align="center">
				<div class="col-md-12">
					<input type="button" class="btn btn-success btn-lg btnn" value="Update" name="btn" onclick="validationUpdateClientEnquiryDetails()"> 
					<input type="reset" class="btn btn-danger btn-lg btnn" value="Cancel">
					<input type="button" value="Back" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="back()">
					<!-- <input type="button"  value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="edit()"> -->
				</div>
			</div>
		</form>
		</div>
   </div>
        <%@include file="commons/newFooter.jsp" %> 	
</body>
</html>		