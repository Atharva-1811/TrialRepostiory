<!-- UserDetail.jsp -->
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
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
		String type1= "";
		String name1 = "";
		if (session != null)
		{
			if (session.getAttribute("user") != null) 
			{
				String  name = (String) session.getAttribute("user");
				
				HibernateUtility hbu1=HibernateUtility.getInstance();
				Session session2=hbu1.getHibernateSession();
				
				org.hibernate.Query query1 = session2.createSQLQuery("select * from user_login where UserName =:usr");
				query1.setParameter("usr", name1);
				UserDetailasHibernate userDetail1 = (UserDetailasHibernate) query1.uniqueResult();
			}
			else
			{	             
				out.println("<script>");
				out.println("alert('Please Enter valid User Name And Password');");
				out.println("location='/embelSoft/jsp/login.jsp;'");
				out.println("</script>");  						
			}
		}
		else
		{
			out.println("<script>");
		    out.println("alert('Please Enter valid User Name And Password');");
		    out.println("location='/embelSoft/jsp/login.jsp;'");
		    out.println("</script>"); 
		}
	%>
<head>

<meta charset="utf-8">

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

<!-- <script type="text/javascript" src="/staticContent/js/bootbox.min.js"></script>
<script type="text/javascript" src="/staticContent/js/bootstrap.js"></script> --> 

<script src="/embelSoft/staticContent/js/userDetails.js"></script>

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
			<%				 	
				for(int i=0;i<sList4.size();i++)
				{
					count++;
					ClientResponseDetailsBean sr=(ClientResponseDetailsBean)sList4.get(i);
 
					if(count==1)
					{ 			
			%>				 	
			    var notification = new Notification('Client FollowUp', 
				{
			        icon: '/embelSoft/staticContent/img/followUp.jpg',   
								      
			      body:" Today Have Follow Up : !",
			      
			    });
	<%}}%>
				  notification.onclick = function () 
			    {
			       	 window.open("/embelSoft/jsp/todayClientResponseList.jsp");
			    };
			  }
			}
</script>
<script type="text/javascript">
function userDetailsList()
{
	window.location = "UserDetailsList.jsp"
}
</script> 
<script type="text/javascript">
function editUserDetails()
{
	window.location = "EditUserDetails.jsp";
}
</script>
<script>
	function lettersonly(input)
	{
		var regex = /[^a-z ]/gi;
		input.value = input.value.replace(regex, "");
	}		
				/* function numbersonly(input) {
					var regex = /[^0-9 .]/gi;
					input.value = input.value.replace(regex, "");
				} */
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
			<h2 class="form-name style_heading" >User Details</h2>
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
		<form class="form-horizontal" name="userDetailsForm" onsubmit="Validate()">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
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
				<div class="col-sm-2" >
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
					<div class="col-sm-2 col-sm-offset-1" >
						<label class="control-label">Email Id :<sup>*</sup></label>
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
			
				<div class="form-group">
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
					<input type="button"  class="btn btn-success btn-lg btnn" value="Save" name="saveBtn" onclick="validateSaveUserDetails()">
					<input type="button"  class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button"  value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="userDetailsList()">
					<input type="button"  value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="editUserDetails()">
				</div>
			</div>
		</form>
		</div>
</div>
<%@include file="commons/newFooter.jsp"%>
</body>
</html>