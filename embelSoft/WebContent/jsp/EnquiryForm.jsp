<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.hibernate.EnquiryFormHibernate"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

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
		
		<link rel="stylesheet" href="/embelSoft/staticContent/css/style1.css">
		
		
		
	
<script>
	function enquiryFormList()
	{
		window.location="EnquiryFormList.jsp";
	}
	
	function editEnquiryForm()
	{
		window.location="EditEnquiryForm.jsp";
	}
	
</script>

<script type="text/javascript">
function resetEnqForm()
{
	document.enqForm.reset();	

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

	
<style>
	.quo {
		font-weight:600;
		color: red; 
		font-family: digital-clock-font;
	}
</style>
	
</head>

<body>
<div class="container">
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading">Enquiry Form</h2>
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
		<div class="form-group" align="right"></div>
	</div>
	
	<div class="row">
		<div class="col-sm-offset-1 col-md-10" align="right">
				<!-- <hr style="border-top-color: #c1b1b1;"> -->
				<hr class="style-one">
		</div>
	</div>
<div id="wrqpper">
	<form class="form-horizontal" method="post" action="" name="enqForm">
	
 		<div class="row form-group">
 			<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='prsnName' name="prsnName" onkeypress="return isAlphabetsWithSpace(event)"
							class="form-control" placeholder="Enter Your Name"/>
						</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label">Enquiry Date&nbsp;:</label>
						<%
				SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
				String todayDate1 = simpleDateFormat1.format(new Date());
			%>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="date" id='enquiryDate' name="enquiryDate" value="<%= todayDate1%>" class="form-control" placeholder="Select Enquiry Date" />
						</div>
					</div>
					
				</div>

		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Contact Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> 
							<input type="text" id='contactNo' name="contactNo" maxlength="10" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Contact Number">
						</div>
					</div>
					
				<div class="col-sm-2">
						<label class="control-label">Alternate Contact Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> 
							<input type="text" id='alternativeContactNo' name="alternativeContactNo" maxlength="10" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Alternate Contact No">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Business Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span> 
							<input type="text" id='businessName' name="businessName" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Business Name">
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Business Address&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-home"></i>
							</span>
							<textarea id='businessAddress' name="businessAddress" class="form-control" placeholder="Enter Business Address" rows="3" cols="15"></textarea>
						</div>
					</div>
				</div>
			
				<div class="row form-group">

				<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Email&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> <input type="text" id='emailId' name="emailId"
								class="form-control" placeholder="Enter Email Id">
						</div>
					</div>
					
					
			<div class="col-sm-2">
				<label class="col-sm-3 control-label" style="text-align: right;">Enquiring For&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-sm-3">
				<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i>
				</span>
					<select class ="form-control" id="enqrdFor" name="clientResponse">
					<!-- 	<option selected="selected">---select---</option> -->
						<option value="">--Select Response--</option>
						<option value="Product">Product</option>
						<option value="Service">Service</option>
						<!-- <option value="Followup">Follow Up</option> -->
					</select>
			
				</div>
				</div>
			</div>
			
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1">
							<label class="control-label">Description&nbsp;:<sup>*</sup></label>
						</div>
						<div class="col-sm-8">
						<div class="input-group">
						
						<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<textarea id="description" class="form-control" rows="4" cols="100" placeholder="Enter Enquiry Details"></textarea>
						</div>
						</div>
					</div>
	                <br>
	                <br>
					<div class="col-md-12" align="center">
						<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="btn" onclick="enquiryFormDetailValidation()"> 
						<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" name="btn2" onclick="resetEnqForm()">
						<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="enquiryFormList()">
						<input type="button" value="Edit" class="btn btn-primary btn-lg btnn" name="editBtn" onclick="editEnquiryForm()">
					</div>
				
      		</form>
	</div>
</div>
</body>

</html>

<%@include file="commons/newFooter.jsp"%>
		   	