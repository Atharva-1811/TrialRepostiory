<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="com.embelSoft.hibernate.UserDetailasHibernate"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@page import="com.embelSoft.dao.ClientResponseDao"%>
<%@page import="com.embelSoft.bean.ClientResponseDetailsBean"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>

<html>
 <% 
			
 					 String type1= "";
                     String name1 = "";
		             if (session != null) {
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
						
						 /* 
							 out.println("alert('Please Enter valid User Name And Password');");
							 
							 
						 response.sendRedirect("/embelSoft/jsp/login.jsp");
					
					      */
					     /* out.println("Please Login "); */
				     }
		           }
		             else
		                {
		            	 
		            	 /*     out.println("<script>");
						     out.println("alert('Please Enter valid User Name And Password');");
							 out.println("</script>");  
						 */	 
					     	// response.sendRedirect("/embelSoft/jsp/login.jsp");
					     					  
						 out.println("<script>");
					     out.println("alert('Please Enter valid User Name And Password');");
					     out.println("location='/embelSoft/jsp/login.jsp;'");
					     out.println("</script>");  
					     
					     //out.println("Please Login ");
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

<!--  <script type="text/javascript" src="/staticContent/js/bootbox.min.js"></script>
<script type="text/javascript" src="/staticContent/js/bootstrap.js"></script>
		 -->
<!-- 		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 -->		<!-- <script type="text/javascript" src="/staticContent/js/bootbox.js"></script> -->
		
<!--   <link rel="shortcut icon" href="/embelSoft/staticContent/img/s1.jpg" /> -->

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
		<script src="/embelSoft/staticContent/js/employeeDetails.js"></script>

             <script type="text/javascript">
          		 function employeeList()
          		 {
          		 window.location = "employeeList.jsp";
          		 }
          		 /* function editEmployee() {
          			 window.location = "editEmployeeDetails.jsp";
				} */
          		</script> 
          		<script type="text/javascript">
					function edit()
					{
						window.location = "EditEmployeeDetails.jsp"
					}		

          		</script>
          		
          		
        <script>
				function lettersonly(input) {
		
					var regex = /[^a-z ]/gi;
					input.value = input.value.replace(regex, "");
		
				}
		
				/* function numbersonly(input) {
					var regex = /[^0-9 .]/gi;
					input.value = input.value.replace(regex, "");
				} */
		</script>
		
		<script type="text/javascript">
			function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
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

			var firstName = document.forms["empd"]["firstName"];

			alert(firstName);	
			
			
			var name_error = document.getElementById("name_error");
			firstName.addEventListener("blur", nameVerify, true);

			function Validate() {
				if(firstName.value == ""){

					firstName.style.border = "1px solid red";
					firstName_error.textContent = "First Name is required";
					firstName.focus();
					return false;
					
					}
				
			}

			function nameVerify(){

					if(firstName.value !=""){

						firstName.style.border = "1px solid #5E6E66";
						name_error.innerHTML="";
						return true;
						}


				}
			
		</script>
		
		<script type="text/javascript">
		/*	function check()
			{
		        var email = document.getElementById("emailId").value
		        var cEmail = document.getElementById("confirmEmail").value

 				if(email != cEmail)
 				{
 					document.getElementById("confirmEmail").focus()
 				}				
			}	*/
			
// 			Future date disable in date picker for date of birtht

			$(function()
			{
			  $(document).ready(function () {
				  
				  var todaysDate = new Date(); // Gets today's date

			   // Max date attribute is in "YYYY-MM-DD".  Need to format today's date accordingly

			    var year = todaysDate.getFullYear();                        // YYYY
			    var month = ("0" + (todaysDate.getMonth() + 1)).slice(-2);  // MM
			    var day = ("0" + todaysDate.getDate()).slice(-2);           // DD

			    var maxDate = (year +"-"+ month  +"-"+ day); // Results in "MM-DD-YYYY" for today's date 

			    // Now to set the max date value for the calendar to be today's date
			    
			    $('.inspectionDate').attr('max',maxDate);
			    
// 			    var dateTodyValidate = document.getElementById("dob").max = maxDate;
			  });
			});
			
		</script>
		
			        <script type="text/javascript">

				function checkForDuplicateEntry(){
          			<%
          			EmployeeDetailsDao dao2 = new EmployeeDetailsDao();
          			List list = dao2.getAllEmployee();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				EmployeeDetailsHibernate   bean = (EmployeeDetailsHibernate)list.get(z);
          			%>
          			var componentName = "<%=bean.getFirstName()%>";
          			var middleName = "<%=bean.getMiddleName()%>";
          			var lastName = "<%=bean.getLastName()%>";
          			
          			var compName = document.getElementById("firstName").value;
          			var mName = document.getElementById("middleName").value;
          			var lName = document.getElementById("lastName").value;
          			
          			var componentName1 = componentName.toLowerCase();
          			var compName1 = compName.toLowerCase();
          			var middleName1 = middleName.toLowerCase();
          			var mName1 = mName.toLowerCase();
          			var lastName1 = lastName.toLowerCase();
          			var lName1 = lName.toLowerCase();
          			
          			if((componentName1 == compName1 || componentName == compName) && (middleName1 == mName1 || middleName == mName) && (lastName1 == lName1 || lastName == lName)){
          				alert("Employee Name is already exist...Duplicate Not allowed");
          				document.empd.reset(); 
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
          			
</script>
		
</head>
<body onLoad="notifyMe()">

	<div class="container">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Employee Details</h2>
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
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
	<div id="wrqpper">
		<form class="form-horizontal" name="empd" onsubmit="Validate()">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">First Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> 
							<input type="text" id='firstName' name="firstName"  onkeypress="return isAlphabets(event)"
								class="form-control textInput" placeholder="Enter First Name"  />
								<div id="name_error" class="val_error"></div>
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Middle Name :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='middleName' name="middleName" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Middle Name">
						</div>
					</div>
				</div>
				
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Last Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='lastName' name="lastName" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Last Name">
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Date Of Birth :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"></i>
							</span> <input type="date" id='dob' name="dob" class="form-control inspectionDate"
								placeholder="Enter Date Of Birth" max="">

						</div>
					</div>
				</div>
	
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Contact Number :<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='contactNo' maxlength="10" name="contactNo" onclick="checkForDuplicateEntry()" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Contact Number">
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Alternate Contact Number :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='altContactNo'  maxlength="10" name="altContactNo" onkeypress="return isNumber(event)"
								class="form-control"
								placeholder="Enter Alternate Contact Number">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Email :<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> <input type="text" id='emailId' name="emailId" onclick="checkForDuplicateEntry()"
								class="form-control" placeholder="Enter Email Id">
						</div>
					</div>

				<div class="col-sm-2">
						<label class="control-label">Confirmation Email :<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> <input type="text" id='confirmEmail' name="confirmEmail" class="form-control" onpaste="return false" placeholder="Enter Confirmation Email" >
<!-- 								onblur="check()" -->
						</div>
					</div>
					
			<!-- 
					<div class="col-sm-2" align="right">
						<label class="control-label">Address:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-home"></i>
							</span> 
							<textarea id='address' name="address" class="form-control" placeholder="Enter Address" rows="3" cols="15"></textarea>
							<input type="text" id='address' name="address" class="form-control" placeholder="Enter Address">
						</div>
					</div> -->
					
					
				</div>
			
			
<!-- 			
						
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Confirmation Email:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> <input type="text" id='confirmEmail' name="confirmEmail"
								class="form-control" placeholder="Enter Confirmation Email" onblur="check()">
						</div>
					</div>

				</div>
			</div>
			 -->

				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Current Address :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i> 
							</span>
							
							<textarea id="currentAddress" name="currentAddress" class="form-control" placeholder="Enter Current Address" rows="3" cols="15"></textarea>
							
							
						</div>
					</div>
					
				<div class="col-sm-2">
						<label class="control-label">Permanent Address :</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<textarea id='permanentAddress' name="permanentAddress" class="form-control" placeholder="Enter Permanent Address" rows="3" cols="15"></textarea>
						</div>
					</div>

				</div>
	
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Zip code :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i> 
							</span> <input type="text" id='zipCode' name="zipCode" onkeypress="return isNumber(event)" maxlength="6"
								class="form-control" placeholder="Enter Zip Code">
						</div>
					</div>
					
				<div class="col-sm-2">
						<label class="control-label">Aadhaar Number :</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='adharNumber' name="adharNumber" maxlength="12" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Aadhaar Number">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">PAN No :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='panNumber' maxlength="10" name="panNumber"
								class="form-control"
								placeholder="Enter Pan Number">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Highest Education :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-education"></i>
							</span> 
								<input type="text" id='education' name="education" class="form-control" placeholder="Enter Education" onkeypress="return isAlphabets(event)">
						</div>
					</div>
					
				</div>
		
				<div class="row form-group">
				
				<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Technology :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='technology' name="technology" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Technology">
						</div>
					</div>
				
				
					<div class="col-sm-2">
						<label class="control-label">University :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='university' name="university" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter University">
						</div>
					</div>


				</div>
			
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">ID Number :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='idNumber' name="idNumber" class="form-control" placeholder="Enter id Number">
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Designation :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='designation' name="designation" maxlength="25" class="form-control" onkeypress="return isAlphabetsWithSpace(event)" placeholder="Enter Designation">
						</div>
					</div>
				</div>
				
				<div class="row form-group">
				
				<div class="col-sm-2 col-sm-offset-1">
					<label class="control-label">Department :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='department' name="department" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Department">
						</div>
					</div>
				
				
					<div class="col-sm-2">
						<label class="control-label">Date of Joining :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-calendar"></i>
							</span> 
							<input type="date" id='dateOfJoining' name="dateOfJoining" class="form-control" placeholder="Date Of Joining">
						</div>
					</div>
				
			</div>

			<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Previous Experience :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<textarea id='previousExperience' name="previousExperience" class="form-control" placeholder="Enter Previous Experience" rows="2" cols="15"></textarea>
							<!-- <input type="text" id='previousExperience' name="previousExperience" class="form-control" placeholder="Enter Previous Experience"> -->
						</div>
					</div>
					
					
					<div class="col-sm-2">
						<label class="control-label">Previous Company Name :</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='prevCompanyName' name="prevCompanyName" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Previous Company Name">
						</div>
					</div>
				</div>
	
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Reference By :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='referenceBy' name="referenceBy" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Reference By">
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Interview Taken By :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='interviewedBy' name="interviewedBy" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Interviewed By">
						</div>
					</div>
				</div>
				
				<div class="row form-group">
				
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Salary :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="text" id='salary' name="salary" class="form-control" placeholder="Enter Salary" onkeypress="return isNumber(event)">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Place Of Posting :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='placeofposting' name="placeofposting" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Place Of Posting">
						</div>
					</div>
			
				</div>
			
				<div class="row form-group">

					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Comment :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='comment' name="comment" 
								class="form-control" placeholder="Enter Comment">
						</div>
					</div>

				<div class="col-sm-2">
						<label class="control-label">Employee Condition :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='employeecondition' name="employeecondition"
								class="form-control" placeholder="Enter Employee Condition" />
						</div>
					</div>

				</div>
			

				<div class="row form-group">
		

				</div>
		
			
			<div id="popup">
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Salary Description 8.1 :<sup>*</sup></label>
					</div>
					<div class="col-md-8">
						<div class="input-group">
						<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
						</span>
							<textarea id=description1 rows="5" cols="100" class="form-control">If appointed as Executive for General Management you will get INR 8,000 per month salary.</textarea>
							
						</div>
					</div>
			    </div>
			    <div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1">
							<label class="control-label">Salary Description 8.2 :<sup>*</sup></label>
						</div>
						<div class="col-md-8">
						<div class="input-group">
						<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
						</span>
							<textarea id="description2" rows="5" cols="100" class="form-control" >After successful completion of training and depending on the performance remuneration will be discussed and will be sent across as annexure to this appointment letter.</textarea>
							
						</div>
					</div>
					</div>
			    </div>
			    			

				<div align="center">
					<div class="col-md-12">
						<input type="button"  class="btn btn-success btn-lg btnn" value="Save" name="btn" onclick="employeedetails()"> 
						<input type="button"  class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
						<input type="button"  value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="employeeList()">
						<input type="button"  value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="edit()">
					</div>
				</div>
		</form>
		</div>
		</div>
</body>
</html>

<%@include file="commons/newFooter.jsp"%>
