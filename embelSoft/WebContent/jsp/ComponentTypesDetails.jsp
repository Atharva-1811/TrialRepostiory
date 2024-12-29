<!-- ComponentTypesDetails.jsp -->

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<%@page import="com.embelSoft.dao.ComponentTypesDao"%>
<%@page import="com.embelSoft.hibernate.CompTypeDetailsHibernate"%>

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

<script src="/embelSoft/staticContent/js/ComponentDetails.js"></script>
	
<script type="text/javascript">
	 function compTypeList()
	{
		window.location = "ComponentTypeList.jsp";
	}
</script>
<script type="text/javascript">
function editComponentTypesDetails()
{
	window.location = "EditComponentTypesDetails.jsp";
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
          			
          		

</head>
<body>
<div class="container">
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading" >Component Category Details</h2>
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
	<div class="row">
	  <p align="center"> Note : Please check category list before adding a new category (caution : avoid a duplication and multiple entries)</p>
	</div>
	<div id="wrqpper"> 
    	<form class="form-horizontal" name="componentTypeDetailsForm" id="componentTypeDetailsForm">
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-3" >
					<label class="control-label">Component Category :<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span> 
						<input type="text" id='componentType' name="componentType" class="form-control" placeholder="Enter Component Category"/>
					</div>
				</div>			
			</div>
		<br>
		<div align="center">
			<div class="col-md-12">
				<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="saveBtn" onclick="checkForDuplicateEntry(); return compTypesDetailsValidate();">
				<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
				<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="compTypeList()">
				<input type="button" value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="editComponentTypesDetails()">
			</div>
		</div>
	</form>
 </div>
</div>
</body>
</html>
<%@include file="commons/newFooter.jsp"%>
