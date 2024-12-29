<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	
<!-- <script src="/embelSoft/staticContent/js/productDetails.js"></script> -->
<script src="/embelSoft/staticContent/js/ComponentDetails.js"></script>
	
<script type="text/javascript">
	 function componentList()
	{
		window.location = "ComponentList.jsp";
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
</head>
<body>
<div class="container-fluid">
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading" style="margin-top: 80px">Component Details</h2>
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
	
    <form class="form-horizontal" name="componentDetailsForm">
    		
		<div class="row">
			<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Component Name&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span> 
						<input type="text" id='componentName' name="componentName" class="form-control" placeholder="Enter Component Name" />
						<!-- onkeypress="return isAlphabetsWithSpace(event)" -->
					</div>
				</div>
				<div class="col-sm-2" align="right">
					<label class="control-label">Date&nbsp;:<sup>*</sup></label>
					<%
					  	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					  	String todayDate = simpleDateFormat.format(new Date());
				  	%>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
						<input type="date" id='addingDate' name="addingDate" value="<%= todayDate%>"  class="form-control" placeholder="Select Date" />
					</div>
				</div>					
			</div>
		</div>					
		<div class="row">
			<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1" align="right">
					<label class="control-label">Description&nbsp;:&nbsp;&nbsp;</label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
							<textarea rows="3" cols="15" id='description' name="description" class="form-control" placeholder="Enter Description"></textarea>							 
					</div>
				</div>										
				<div class="col-sm-2" align="right">
					<label class="control-label">Features&nbsp;:&nbsp;&nbsp;</label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span> 
							<textarea rows="3" cols="15" id='features' name="features" class="form-control" placeholder="Enter Features"></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="container" align="center">
			<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="btn" onclick="validateComponentDetails()">
			<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
			<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="componentList()">
			<input type="button" value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="editVendor()">
		</div>
	</form>
</div>
</body>
</html>
<%@include file="commons/newFooter.jsp"%>
