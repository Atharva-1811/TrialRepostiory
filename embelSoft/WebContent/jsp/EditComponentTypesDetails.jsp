<!-- EditComponentTypesDetails.jsp -->

<%@page import="com.embelSoft.dao.ComponentTypesDao"%>
<%@page import="com.embelSoft.bean.CompTypeDetailsBean"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>
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

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<script src="/embelSoft/staticContent/js/ComponentDetails.js"></script>

<script type="text/javascript">
function back()
{
	window.location = "ComponentTypesDetails.jsp";
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
			<h2 class="form-name style_heading" >Edit Component Type</h2>
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
	<form class="form-horizontal" name="editComponentTypeForm">
		
			<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1" >
				<label class="control-label" for="componentType">Select Component Type :<sup>*</sup></label>
				</div>
				<div class="col-md-3">
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
					<%
						ComponentTypesDao dao = new ComponentTypesDao();
						List sList4 = dao.getAllComponentTypes();
					%>
					<input list="componentTypeList" id="componentType" class="form-control" onchange="getCompTypeListForEdit()">
					<datalist id="componentTypeList">
						<%
							for (int i = 0; i < sList4.size(); i++) {
							CompTypeDetailsHibernate sup = (CompTypeDetailsHibernate) sList4.get(i);
						%>
						<option data-value="<%=sup.getPkCompTypeId()%>" value="<%=sup.getComponentType()%>">
						<%
							}
						%>		
					</datalist>
				</div>
				</div>
				<div class="col-sm-2 " >
				<label class=" control-label">Component Type :<sup>*</sup></label>
				</div>
				<div class="col-md-3">
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
					<input type="text" id='componentTypeName' name="componentTypeName" class="form-control" placeholder="Component Type Name">
				</div>
				</div>
			</div>
		
		
		<div align="center">
			<div class="col-md-12">
				<input type="button" class="btn btn-success btn-lg btnn" value="Update" name="updateBtn" onclick="updateCompTypeDetailsValidate()"> 
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
