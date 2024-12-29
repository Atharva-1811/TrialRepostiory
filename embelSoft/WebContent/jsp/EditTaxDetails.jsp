<!-- EditTaxDetails.jsp -->
<!-- EditUserDetails.jsp -->

<%@page import="com.embelSoft.hibernate.UserDetailasNewHibernate"%>
<%@page import="com.embelSoft.bean.UserDetailsBean"%>
<%@page import="com.embelSoft.dao.UserDetailasDao"%>


<%@page import="com.embelSoft.dao.TaxDetailsDao"%>
<%@page import="com.embelSoft.hibernate.TaxDetailsHibernate"%>
<%@page import="com.embelSoft.bean.TaxDetailsBean"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>

<script type="text/javascript" src="/embelSoft/staticContent/bootstrap.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/bootstrap.js"></script>

<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>

<script src="/embelSoft/staticContent/js/userDetails.js"></script>
<script src="/embelSoft/staticContent/js/taxDetails.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<script type="text/javascript">
	function back()
	{
		window.location = "TaxDetails.jsp";
	}
</script>
<script type="text/javascript">
	function isNumberWithFloat(evt)
	{
		evt = (evt) ? evt : window.event;
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (charCode > 31 && (charCode < 48 || charCode > 57 ) && (charCode < 46 || charCode > 46))
		{
			return false;
		}
		return true;
	}
</script>
<script>
function totalTaxCalculation()
{
	var CGST = $('#CGST').val();
	var SGST = $('#SGST').val();
	
	var taxPercentage = Number(CGST) + Number(SGST);
	//var totalTaxAmount =  CGST + (Number)SGST;
	//document.getElementById("totalTax").innerHTML = CGST + SGST;
	//document.userDetailsForm.gst1.value="";
	
	document.getElementById("taxPercentage").value = taxPercentage;
 	//document.getElementById("taxPercentage").value = taxPercentage.toFixed(2);
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
			<h2 class="form-name style_heading">Edit Tax Details</h2>
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
	<form class="form-horizontal" name="editTaxDetailsForm">

			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
					<label class="control-label" for="taxTypeList">Select Tax Type :<sup>*</sup></label>
          		</div>
          		<div class="col-sm-3">
					<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
				    	<%
				    	TaxDetailsDao dao = new TaxDetailsDao();
							List taxTypeList = dao.getTaxDetailsForEdit();
						%>
						<input list="taxTypeList" id="pk_tax_details_id" class="form-control" onchange="getTaxDetailsForEdit()" placeholder="Select Tax Type">
						<datalist id="taxTypeList">
							<%
								for (int i = 0; i < taxTypeList.size(); i++) {
									TaxDetailsHibernate hibernate = (TaxDetailsHibernate) taxTypeList.get(i);
							%>
							<option data-value="<%=hibernate.getPkTaxDetailsId()%>" value="<%=hibernate.getTaxType()%>">									
							<%
								}
							%>
						</datalist>
					</div>
				</div>
			</div>
		
			<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Tax Type :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>					 
							<input type="text" id='taxType' name="taxType" class="form-control textInput" placeholder="tax Type"  />
							<div id="name_error" class="val_error"></div>
						</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label">Tax Percentage :<sup>*</sup></label>
					</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
						<input type="text" id='taxPercentage' name="taxPercentage" class="form-control" readonly="readonly" placeholder="Tax Percentage">
					</div>
				</div>
			</div>
		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">CGST % :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
							<input type="text" id='CGST' maxlength="5" name="CGST" onkeypress="return isNumberWithFloat(event)" onchange="totalTaxCalculation()" class="form-control" placeholder="CGST %">
						</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label">SGST % :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
							<input type="text" id='SGST' maxlength="5" name="SGST" onkeypress="return isNumberWithFloat(event)" onchange="totalTaxCalculation()" class="form-control" placeholder="SGST %">
						</div>
					</div>
				</div>
		
			
		<div align="center">
			<div class="col-md-12">
				<input type="button" class="btn btn-success btn-lg btnn" value="Update" name="updateBtn" onclick="validateUpdateTaxDetails()">
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
