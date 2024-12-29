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
          		 function employeeLeaveList()
          		 {
          		 	window.location = "employeeLeaveList.jsp";
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
		<style>
			.to {
				margin-left: 65vh;
				margin-top: -5px;
			}
			@media ( max-width : 1200px) {
				.to {
					margin-left: 73vh !important;
				}
			}
			@media ( max-width : 992px) {
				.to {
					margin-left: 60vh !important;
				}
			}
			@media ( max-width : 580px) {
				.to {
					margin-left: 45vh !important;
				}
			}
			@media ( max-width : 480px) {
				.to {
					margin-left: 37vh !important;
				}
			}
			@media ( max-width : 430px) {
				.to {
					margin-left: 34vh !important;
				}
			}
		</style>
          		
</head>
<body>

	<div class="container">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Employee Leave Approval</h2>
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
		<form class="form-horizontal" name="empd">
			
				<div class="row form-group">
      				 <div class="col-sm-2 col-sm-offset-1">
      				 	<label class="control-label" for="employeename">Employee Name&nbsp;:<sup>*</sup></label>  
          				</div>
          				<div class="col-sm-3">
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
									value="<%=sup.getFirstName()%>  <%=sup.getLastName()%>">
									
									<%
										}
									%>
								</datalist>
							</div>
						</div>

				</div>
			
					<div class="row form-group">
					
						<div class="col-sm-2 col-sm-offset-1">
							<label class="control-label">Date&nbsp;:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> 
								<i class="glyphicon glyphicon-calendar"></i>
								</span>
								<input type="date" id='leaveDateFrom' name="leaveDateFrom" class="form-control">
							</div>
						</div>

						<div class="col-sm-2">
							<label class="control-label">Leave Type&nbsp;:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
								
							 <select class="form-control" id="type">
	           		 			
	           		 				<option selected="selected" value="">--Select Type--</option>
	           		 				<option value="sick">Sick</option>
	           		 				<option value="casual">Casual</option>
	           		 				<option value="paid">Paid</option>
	           		 			
	           		 			</select>
							</div>
						</div>

						
					</div>
				
					<div class="row form-group">
						<h4 class="to">TO</h4>
						<div class="col-sm-3 col-sm-offset-3" style="padding-top: 8px;">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
						 <input type="date" id='leaveDateTo' name="leaveDateTo" class="form-control" />
							</div>
						</div>
					</div>
		
					<div class="row form-group">
						<div class="col-sm-2 col-sm-offset-1">
							<label class="control-label">Description&nbsp;:&nbsp;&nbsp;</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> 
								<i class="glyphicon glyphicon-hand-right"></i>
								</span>
								<textarea id='description' name="description" class="form-control" placeholder="enter description" onchange="getHrBillingGrid();clearHrCalculation();clearField()" rows="2" cols="10"></textarea>
							</div>
						</div>

						<div class="col-sm-2">
							<label class="control-label">Approved By&nbsp;:&nbsp;&nbsp;</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>
								
									<input id="approvedBy" name="approvedBy" type="text" class="form-control" placeholder="Approved by">
							</div>
						</div>
					</div>
						


			<div align="center">
				<div class="col-md-12">
					<input type="button"  class="btn btn-success btn-lg btnn " value="Submit" name="btn" onclick="validationEmployeeLeaveDetails()"> 
					<input type="button"  class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button"  value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="employeeLeaveList()">
				</div>
			</div>	
		</form>
		</div>
	</div>
</body>
</html>

<%@include file="commons/newFooter.jsp"%>
