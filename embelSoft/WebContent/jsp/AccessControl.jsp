
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<%@page import="com.embelSoft.hibernate.UserDetailasNewHibernate"%>
<%@page import="com.embelSoft.dao.UserDetailasDao"%>
<%@page import="com.embelSoft.hibernate.UserDetailasHibernate"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@page import="com.embelSoft.dao.ClientResponseDao"%>
<%@page import="com.embelSoft.bean.ClientResponseDetailsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>

<html>
<%
	String type1 = "";
	String name1 = "";
	if (session != null) {
		if (session.getAttribute("user") != null) {
			String name = (String) session.getAttribute("user");

			HibernateUtility hbu1 = HibernateUtility.getInstance();
			Session session2 = hbu1.getHibernateSession();

			org.hibernate.Query query1 = session2
					.createSQLQuery("select * from user_login where UserName =:usr");
			query1.setParameter("usr", name1);
			UserDetailasHibernate userDetail1 = (UserDetailasHibernate) query1.uniqueResult();
		} else {
			out.println("<script>");
			out.println("alert('Please Enter valid User Name And Password');");
			out.println("location='/embelSoft/jsp/login.jsp;'");
			out.println("</script>");
		}
	} else {
		out.println("<script>");
		out.println("alert('Please Enter valid User Name And Password');");
		out.println("location='/embelSoft/jsp/login.jsp;'");
		out.println("</script>");
	}
%>
<head>

<meta charset="utf-8">

<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet"
	href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
<!-- <script type="text/javascript" src="/staticContent/js/bootbox.min.js"></script>
<script type="text/javascript" src="/staticContent/js/bootstrap.js"></script>
<link href="/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/> -->

<link href="/embelSoft/staticContent/css/StyleValidation.css"
	rel="stylesheet" type="text/css" />
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<script src="/embelSoft/staticContent/js/AccessControl.js"></script>

<%
	ClientResponseDao cDao = new ClientResponseDao();
	List<ClientResponseDetailsBean> sList4 = cDao.getClientName();

	int count = 0;
%>
<script type="text/javascript">
	function notifyMe()
	{
		   
		if (Notification.permission !== "granted" && sList4 > 0)
			Notification.requestPermission();
		else
		{				 
			<%for (int i = 0; i < sList4.size(); i++) {
				count++;
				ClientResponseDetailsBean sr = (ClientResponseDetailsBean) sList4.get(i);

				if (count == 1) {%>				 	
			    var notification = new Notification('Client FollowUp', 
				{
			        icon: '/embelSoft/staticContent/img/followUp.jpg',   
								      
			      body:" Today Have Follow Up : !",
			      
			    });
	<%}
			}%>
				  notification.onclick = function () 
			    {
			       	 window.open("/embelSoft/jsp/todayClientResponseList.jsp");        
			    };
			  }
			}
</script>
<script type="text/javascript">
	function accessControlList()
    {
		window.location = " AccessControlList.jsp";
	}
</script>
<script type="text/javascript">
function editAccessControl()
{
	window.location = "EditAccessControl.jsp";
}
</script>
<script>
	function lettersonly(input)
	{
		var regex = /[^a-z ]/gi;
		input.value = input.value.replace(regex, "");
	}		
</script>
<script type="text/javascript">
	function isNumber(evt)
	{
		evt = (evt) ? evt : window.event;
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (charCode > 31 && (charCode < 48 || charCode > 57))
		{
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	function isAlphabets(evt)
	{
		evt = (evt) ? evt : window.event;
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
		{
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	function isAlphabetsWithSpace(evt)
	{
		evt = (evt) ? evt : window.event;
		var charCode = (evt.which) ? evt.which : evt.keyCode;
		if (charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
		{
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	
	var firstName = document.forms["userDetailsForm"]["firstName"];
	
	alert(firstName);
	
	var name_error = document.getElementById("name_error");
	firstName.addEventListener("blur", nameVerify, true);
	
	function Validate()
	{
		if(firstName.value == "")
		{
			firstName.style.border = "1px solid red";
			firstName_error.textContent = "First Name is required";
			firstName.focus();
			return false;
		}
	}
	function nameVerify()
	{
		if(firstName.value !="")
		{
			firstName.style.border = "1px solid #5E6E66";
			name_error.innerHTML="";
			return true;
		}
	}
</script>
<script type="text/javascript">
	
	//Future date disable in date picker for date of birtht
	
	$(function()
	{
		$(document).ready(function ()
			{
				var todaysDate = new Date(); // Gets today's date
				
			   // Max date attribute is in "YYYY-MM-DD".  Need to format today's date accordingly

			    var year = todaysDate.getFullYear();                        // YYYY
			    var month = ("0" + (todaysDate.getMonth() + 1)).slice(-2);  // MM
			    var day = ("0" + todaysDate.getDate()).slice(-2);           // DD

			    var maxDate = (year +"-"+ month  +"-"+ day); // Results in "MM-DD-YYYY" for today's date 

			    // Now to set the max date value for the calendar to be today's date
			    
			    $('.inspectionDate').attr('max',maxDate);
			    
				// var dateTodyValidate = document.getElementById("dob").max = maxDate;
			  });
			});
</script>
</head>
<body onLoad="notifyMe()">
	<div class="container">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Access Control</h2>
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
			<form class="form-horizontal" name="userDetailsForm"
				onsubmit="Validate()">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label" for="name">Select Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span>
							<%
								UserDetailasDao udd = new UserDetailasDao();
								List uList4 = udd.getAllMainUserDetailsNew();
							%>
							<input list="userNameList" id="fk_employee_id"
								class="form-control" onchange="getUserDtlForAccessControl()"
								placeholder="Select Name">
							<datalist id="userNameList">
								<%
									for (int i = 0; i < uList4.size(); i++) {
										UserDetailasNewHibernate udnh = (UserDetailasNewHibernate) uList4.get(i);
								%>
								<option data-value="<%=udnh.getPkUserId()%>"
									value="<%=udnh.getFirstName()%> <%=udnh.getLastName()%>">
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
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								id='userName' name="userName" class="form-control"
								onkeypress="return isAlphabets(event)"
								placeholder="Enter User Name">
						</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label">Password&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-lock"></i></span> <input type="text"
								id='password' name="password" maxlength="12"
								class="form-control" placeholder="Enter password">
						</div>
					</div>
				</div>

				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label" for="userType">Select User
							Type&nbsp;:<sup>*</sup>
						</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input list="userTypeList"
								id="userType" class="form-control" placeholder="User Type">
							<datalist id="userTypeList">
								<!-- <select class="form-control" id='userType'> -->
								<!-- <option value="selected"></option> -->
								<option value="admin">Admin</option>
								<option value="accountant">Accountant</option>
								<!-- <option value="employee">Employee</option> -->
								<option value="hr">HR</option>
								<option value="ca">CA</option>
								<option value="electronics">Electronics</option>
								<!-- 	</select> -->
							</datalist>
						</div>
					</div>
				</div>

				<div align="center">
					<div class="col-md-12">
						<input type="button" class="btn btn-success btn-lg btnn"
							value="Save" name="saveBtn"
							onclick="validateAccessControlDetails()"> <input
							type="button" class="btn btn-danger btn-lg btnn" value="Cancel"
							onclick="reset()"> <input type="button" value="List"
							id="listBtn" class="btn btn-primary btn-lg btnn"
							onclick="accessControlList()"> <input type="button"
							value="Edit" id="Btn" class="btn btn-primary btn-lg btnn"
							onclick="editAccessControl()">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

<%@include file="commons/newFooter.jsp"%>
