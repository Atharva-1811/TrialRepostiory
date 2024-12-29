<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="com.embelSoft.hibernate.UserDetailasHibernate"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>

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
      
        <script src="/embelSoft/staticContent/js/employeeDetails.js"></script>
  		<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
 		<script src="sweetalert2.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css">

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
						function Back()
						{

							window.location = "EmployeeDetails.jsp";
							
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
		
          		
</head>
<body>

	<div class="container">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Edit Employee Details</h2>
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

		<form class="form-horizontal" name="empd">
				
				<div class="row form-group">
      				 <div class="col-sm-2 col-sm-offset-1">
      				 	<label class="control-label" for="employeename">Employee Name&nbsp;:<sup>*</sup></label>  
          			</div>	
          				<div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
						    <%
						    EmployeeDetailsDao sdd3 = new EmployeeDetailsDao();
							List sList4 = sdd3.getAllMainEmployee();
							 %>
							 <input list="employeeNameList" id="fk_employee_id" class="form-control" onchange="getEmployeeDetailasForEdit()">
								<datalist id="employeeNameList">
								 <%
									for (int i = 0; i < sList4.size(); i++) {
									EmployeeDetailsHibernate sup = (EmployeeDetailsHibernate) sList4.get(i);
								 %>

								<option data-value="<%=sup.getPkEmpId()%>"
									value="<%=sup.getFirstName()%> <%=sup.getLastName()%>">
									
									<%
										}
									%>
								</datalist>
							</div>
						</div>
				</div>
		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">First Name&nbsp;:<sup>*</sup></label>
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
						<label class="control-label">Middle Name&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Last Name&nbsp;:<sup>*</sup></label>
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
						<label class="control-label">Date Of Birth&nbsp;:<sup>*</sup></label>
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
						<label class="control-label">Contact Number&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='contactNo' maxlength="10" name="contactNo" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Contact Number">
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Alternate Contact Number&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Email&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> <input type="text" id='emailId' name="emailId"
								class="form-control" placeholder="Enter Email Id">
						</div>
					</div>



				<div class="col-sm-2">
						<label class="control-label">Confirmation Email&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> <input type="text" id='confirmEmail' name="confirmEmail"
								class="form-control" placeholder="Enter Confirmation Email" >
<!-- 								onblur="check()" -->
						</div>
					</div>
				
					
					
			<!-- 
					<div class="col-sm-2">
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
					<div class="col-sm-2 col-sm-offset-1">
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
						<label class="control-label">Current Address&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Permanent Address&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Zip code&nbsp;:<sup>*</sup></label>
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
						<label class="control-label">Aadhaar Number&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">PAN No&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Highest Education&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='education' name="education"
								class="form-control" placeholder="Enter Education">
						</div>
					</div>
					
					
				</div>
			
				<div class="row form-group">
				
				<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Technology&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">University&nbsp;:&nbsp;&nbsp;</label>
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
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">ID Number&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Designation&nbsp;:<sup>*</sup></label>
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
					<label class="control-label">Department&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Date of Joining&nbsp;:<sup>*</sup></label>
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
						<label class="control-label">Previous Experience&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Previous Company Name&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Reference By&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Interview Taken By&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Salary&nbsp;:<sup>*</sup></label>
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
						<label class="control-label">Place Of Posting&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Comment&nbsp;:&nbsp;&nbsp;</label>
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
						<label class="control-label">Employee Condition&nbsp;:&nbsp;&nbsp;</label>
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
			
	


			<div align="center">
				<div class="col-md-12">
					<input type="button"  class="btn btn-success btn-lg btnn " value="Update" name="btn" onclick="validationUpdateEmployeeDetails()"> 
					<input type="button"  class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button"  value="Back" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="Back()" />
				</div>
			</div>
		</form>
	</div>
	</div>	
</body>
</html>

<%@include file="commons/newFooter.jsp"%>
