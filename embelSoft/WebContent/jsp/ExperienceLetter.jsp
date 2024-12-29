<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

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
       
        <script src="/embelSoft/staticContent/js/offerLetter.js"></script>
    	<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
		<script src="sweetalert2.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css">
    	
       <!--  
       	 <script type="text/javascript">
          		 function offerLetterP()
          		 {
          		 window.location = "OfferLetterPdf.jsp";
          		 }
          		</script>  -->
          		
          		
          		<script type="text/javascript">
					function experienceLetterList()
					{
						window.location = "ExperienceLetterList.jsp";		
					}

          		</script>
        </head>
<body>

	<div class="container">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Employee Experience Letter</h2>
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
	<form class="form-horizontal" name="experienceLetterForm">
				<div class="row form-group">
					<div class="col-md-2 col-sm-offset-1">
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
							 <input list="employeeNameList" id="fk_employee_id" class="form-control" onchange="getEmployeeDetailasforExperience()">
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
					 
					 <div class="col-sm-2">
						<label class="control-label">Designation&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-hand-right"></i>
								</span>
								<input type="text" id='designation' name="designation" class="form-control" placeholder="Enter Designation">
							</div>
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
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
					
					<div class="col-sm-2">
						<label class="control-label">Date Of Leaving&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<input type="date" id='dateOfLeaving' name="dateOfLeaving" class="form-control" placeholder="Enter Place Of Posting">
						</div>
					</div>
				</div>
			
			<br>
			<br>
				<div align="center">
					<div class="col-md-12">
						<input type="button" class="btn btn-success btn-lg btnn" value="Print" name="btn" onclick="experienceLetterDetailsvalidation()"> 
						<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
						<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="experienceLetterList()">
				<!-- 	<input type="button" style="height: 65px; width: 225; font-size: 25" value="Print" id="listBtn" class="btn btn-primary btn-lg" onclick="offerLetterP()"> -->
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

<%@include file="commons/newFooter.jsp"%>