<!-- ExpenditureEdit.jsp -->

<%@page import="com.embelSoft.hibernate.ExpenditureDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ExpenditureDetailsDao"%>
<%@page import="com.embelSoft.bean.ExpenditureDetailsBean"%>

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

<script type="text/javascript"src="/embelSoft/staticContent/js/expenditureDetails.js"></script>
<script src="/embelSoft/staticContent/js/AccessControl.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">


<script type="text/javascript">
	function back()
	{
		window.location = "expenditureDetails.jsp";
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
			<h2 class="form-name style_heading" style="margin-top: 80px">Edit Expenditure</h2>
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
	<form class="form-horizontal" name="editExpenditureForm">
			<div class="row form-group">
				<div class="col-sm-2 col-md-offset-1">
					<label class="control-label" for="name">Select Name&nbsp;:<sup>*</sup></label>
          		</div>
          		<div class="col-sm-3">
					<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
				    	<%
				    	ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
						List expenseNameList = dao.getExpenditureListForEdit();
						%>
						<input list="expenseNameList" id="pkExpenseId" class="form-control" onchange="getExpenditureForEdit()" placeholder="Select Name">
						<datalist id="expenseNameList">
							<%
								for (int i = 0; i < expenseNameList.size(); i++) {
									ExpenditureDetailsHibernate hibernate = (ExpenditureDetailsHibernate) expenseNameList.get(i);
							%>
							<option data-value="<%=hibernate.getPkExpenseId()%>" value="<%=hibernate.getExpenseName()%>">						
							<%
								}
							%>
						</datalist>
					</div>
				</div>
				
				<div class="col-sm-2">
					<label class="control-label">Expenditure Name :<sup>*</sup></label>
				</div>
				<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
						<input type="text" id="expenditureName" name="expenditureName" class="form-control"  placeholder="Expenditure Name">
					</div>
				</div>
				
			</div>
	
		<div align="center">
			<div class="col-md-12">
				<input type="button" class="btn btn-success btn-lg btnn" value="Update" name="updateBtn" onclick="updateExpenditureValidate()">
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
