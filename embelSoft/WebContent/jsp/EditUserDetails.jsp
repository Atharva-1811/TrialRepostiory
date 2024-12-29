<!-- EditUserDetails.jsp -->

<%@page import="com.embelSoft.hibernate.UserDetailasNewHibernate"%>
<%@page import="com.embelSoft.bean.UserDetailsBean"%>
<%@page import="com.embelSoft.dao.UserDetailasDao"%>

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

<script src="/embelSoft/staticContent/js/userDetails.js"></script>

<script type="text/javascript">
	function back()
	{
		window.location = "UserDetail.jsp";
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
			<h2 class="form-name style_heading" >Edit User Details</h2>
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
	<form class="form-horizontal" name="editUserDetailsForm">
		
			<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1">
				<label class="control-label" for="name">Select Name&nbsp;:<sup>*</sup></label>
				</div>
          		<div class="col-sm-3">
					<div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				    	<%
							UserDetailasDao dao = new UserDetailasDao();
							List userNameList = dao.getAllMainUserDetailsNew();
						%>
						<input list="userNameList" id="pk_user_id" class="form-control" onchange="getUserDetailasForEdit()" placeholder="Select Name">
						<datalist id="userNameList">
							<%
								for (int i = 0; i < userNameList.size(); i++) {
								UserDetailasNewHibernate hibernate = (UserDetailasNewHibernate) userNameList.get(i);
							%>
							<option data-value="<%=hibernate.getPkUserId()%>" value="<%=hibernate.getFirstName()%> <%=hibernate.getLastName()%>">									
							<%
								}
							%>
						</datalist>
					</div>
				</div>
			</div>
		
		
			<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">First Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>							 
							<input type="text" id='firstName' name="firstName"  onkeypress="return isAlphabets(event)" class="form-control textInput" placeholder="Enter First Name"  />
							<div id="name_error" class="val_error"></div>
						</div>
					</div>
					<div class="col-sm-2 " >
						<label class="control-label">Last Name :<sup>*</sup></label>
					</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input type="text" id='lastName' name="lastName" onkeypress="return isAlphabets(event)" class="form-control" placeholder="Enter Last Name">
					</div>
				</div>
			</div>
		
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">Contact No. :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
							<input type="text" id='contactNo' maxlength="10" name="contactNo" onkeypress="return isNumber(event)" class="form-control" placeholder="Enter Contact Number">
						</div>
					</div>
					<div class="col-sm-2" >
						<label class="control-label">Address :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
							<textarea id="address" name="address" class="form-control" placeholder="Enter Address Line 1" rows="1" cols="15"></textarea>
						</div>
					</div>
				</div>
			
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">City :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
							<input type="text" id='city' name="city" onkeypress="return isAlphabets(event)" class="form-control" placeholder="Enter city">
						</div>
					</div>
				<div class="col-sm-2">
						<label class="control-label">Pincode :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
							<input type="text" id='pincode' name="pincode" class="form-control" onkeypress="return isNumber(event)" maxlength="6" placeholder="Enter Pincode" >
						</div>
					</div>					
				</div>
			
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Email Id:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
							<input type="text" id='emailId' name="emailId" class="form-control" placeholder="Enter Email Id">
						</div>
					</div>
					<div class="col-sm-2" >
						<label class="control-label">User Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<input type="text" id='userName' name="userName" onkeypress="return isAlphabets(event)" class="form-control" placeholder="Enter User Name">
						</div>
					</div>					
				</div>
			
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">Password :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i	class="glyphicon glyphicon-lock"></i></span>
							<input type="password" id='password' name="password" maxlength="12" class="form-control" placeholder="Enter password">
						</div>
					</div>
					<div class="col-sm-2" >
						<label class="control-label">Re-Password :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
							<input type="password" id='rePassword' name="rePassword" maxlength="12" class="form-control" placeholder="Re Enter Password">
						</div>
					</div>
				</div>
			
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">PAN No. :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i	class="glyphicon glyphicon"><b>No.</b></i></span>
							<input type="text" id='panNumber' name="panNumber" maxlength="12" class="form-control" placeholder="Enter Pan Number">
						</div>
					</div>
				</div>
			
			
		<div align="center">
			<div class="col-md-12">
				<input type="button" class="btn btn-success btn-lg btnn" value="Update" name="updateBtn" onclick="validateUpdateUserDetails()">
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
