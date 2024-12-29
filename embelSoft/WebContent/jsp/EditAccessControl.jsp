<!-- EditAccessControl.jsp -->

<%@page import="com.embelSoft.hibernate.AccessControlHibernate"%>
<%@page import="com.embelSoft.dao.AccessControlDao"%>
<%@page import="com.embelSoft.bean.UserDetailsBean"%>

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

<script src="/embelSoft/staticContent/js/AccessControl.js"></script>

<script type="text/javascript">
	function back()
	{
		window.location = "AccessControl.jsp";
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
			<h2 class="form-name style_heading" >Edit Access Control</h2>
		</div>
	</div>
	<div class="row">
		<div class="form-group">
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
		<form class="form-horizontal" name="editAccessControlForm">
		
			<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1">
				<label class="control-label" for="name">Select Name&nbsp;:<sup>*</sup></label>
				</div>
          		<div class="col-sm-3">
					<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				    	<%
				    		AccessControlDao dao = new AccessControlDao();
							List userNameList = dao.getAllAccessControlDetails();
						%>
						<input list="userNameList" id="pk_user_id" class="form-control" onchange="getAccessControlForEdit()" placeholder="Select Name">
						<datalist id="userNameList">
							<%
								for (int i = 0; i < userNameList.size(); i++) {
									AccessControlHibernate hibernate = (AccessControlHibernate) userNameList.get(i);
							%>
							<option data-value="<%=hibernate.getPkACUserId()%>" value="<%=hibernate.getName()%>">						
							<%
								}
							%>
						</datalist>
					</div>
				</div>
			</div>
		
		
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
					<label class="control-label">User Name&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text" id='userName' name="userName" class="form-control" onkeypress="return isAlphabets(event)" placeholder="Enter User Name">
					</div>
				</div>
				<div class="col-sm-2" >
					<label class="control-label">Password&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input type="text" id='password' name="password" maxlength="12" class="form-control" placeholder="Enter password">
					</div>
				</div>					
			</div>
		
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label" for="userType">Select User Type&nbsp;:<sup>*</sup></label>
					</div>
          			<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<select class="form-control" id='userType'>
								<option value="selected">--Select User Type--</option>
								<option value="admin">Admin</option>
								<option value="accountant">Accountant</option>
								<option value="employee">Employee</option>
							</select>
						</div>
					</div>
				</div>
			
			
		<div align="center">
			<div class="col-md-12">
				<input type="button" class="btn btn-success btn-lg btnn" value="Update" name="updateBtn" onclick="validateUpdateAccessControlDetails()">
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
