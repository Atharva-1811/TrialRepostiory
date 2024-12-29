<%@page import="com.embelSoft.dao.ExpenditureDetailsDao"%>
<%@page import="java.util.List"%>
<%@page import="com.embelSoft.hibernate.ExpenditureDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ExpenditureDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.min.css">     
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>"WebContent/jsp/expenditureDetails.jsp"
<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>

<script type="text/javascript"src="/embelSoft/staticContent/js/expenditureDetails.js"></script>
<script src="/embelSoft/staticContent/js/AccessControl.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">


<script type="text/javascript">
	function expenseList()
    {
		window.location = " ExpenseList.jsp";
	}
</script> 
<script type="text/javascript">
function expenditureEdit()
{
	window.location = "ExpenditureEdit.jsp";
}
</script>

<script type="text/javascript">	
		function cheakForExpenditure(){
			<%
				ExpenditureDetailsDao exp = new ExpenditureDetailsDao();
					List cList1 =exp.getAllExpenseNames();
			%>
			var expenditureName = $('#expenseName').val();
    		var upExpenditureName = expenditureName.toUpperCase();
    		var duplicate;
			<%
			for(int i=0;i< cList1.size();i++){
				ExpenditureDetailsHibernate cat=(ExpenditureDetailsHibernate)cList1.get(i);
			%>
			var subCat = "<%=cat.getExpenseName()%>";
			var subcatName=document.getElementById("expenseName").value;
			var UpValue = subCat.toUpperCase();
			if(upExpenditureName == UpValue)
			{
					duplicate = "found";
			}
			if(subcatName == subCat){
				alert("Expenditure already exist...Duplicate Not allowed");
				location.reload();
				return false;
			}
			<%
			}
			%>
			if(duplicate == "found"){
    			document.expenseDetails.btn.disabled = true;	
				alert("Expenditure Name Already Exist..!!!");
				location.reload();
				document.expenseDetails.btn.disabled = false;
    			return false;
    		}
		}
</script>
</head>
<body>
		<div class="container">

				<div class="row header_margin_top">
					<div align="center">
						<h2 class="form-name style_heading" style="margin-top: 80px">Expenditure Details</h2>
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
	<form class="form-horizontal" method="post" action="" name="expenseDetailsForm">
		<!-- Value of 'name' attribute is used in customerDetails.js  -->
		<fieldset>
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-3">
					<label class="control-label" for="expenseName">Expenditure Name&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"> <i class="	glyphicon glyphicon-hand-right"></i> </span>
						<%
							ExpenditureDetailsDao cdd = new ExpenditureDetailsDao();
           						List cList =cdd.getAllExpenseNames();
							%>
						<input list="cat_drop" id="expenseName" class="form-control" onchange="cheakForExpenditure()">
						<datalist id="cat_drop">
							<%
					           for(int i=0;i<cList.size();i++){
					        	   ExpenditureDetailsHibernate hibernate =(ExpenditureDetailsHibernate)cList.get(i);
							%>
							<option data-value="<%=hibernate.getPkExpenseId()%>" value="<%=hibernate.getExpenseName()%>">
							<% } %>
						</datalist>
					</div>
				</div>
			</div>
		<div align="center">
			<div class="col-md-12">
				<input type="button" id="save" name="saveBtn" style="font-size: 25" class="btn btn-success btn-lg btnn " onclick="expenseDetailsValidation()" value="Submit"> 
				<input id="save" name="btn" class="btn btn-danger btn-lg btnn" type="reset" onclick="reset()" value="Cancel">
				<input type="button"  value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="expenseList()">
				<input type="button"  value="Edit" id="editBtn" class="btn btn-primary btn-lg btnn" onclick="expenditureEdit()">
			</div>
		</div>
	</fieldset>
	</form>
	</div>
</div>
</body>
</html>
<%@include file="commons/newFooter.jsp" %> 
