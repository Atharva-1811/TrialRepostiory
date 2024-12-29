<!-- TaxDetails.jsp -->
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="com.embelSoft.hibernate.UserDetailasHibernate"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@page import="com.embelSoft.dao.ClientResponseDao"%>

<%@page import="com.embelSoft.dao.TaxDetailsDao"%>
<%@page import="com.embelSoft.hibernate.TaxDetailsHibernate"%>

<%@page import="com.embelSoft.bean.ClientResponseDetailsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>

<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat" %>

<html>
	
<head>

<!-- ComponentCategory Bulk Upload by Namrata -->

<meta charset="utf-8">

<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>

<script src="/embelSoft/staticContent/js/compoentCategorydetails.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<script type="text/javascript">
function getCompoenentCategoryDetailList()
{
	window.location = "CompoenentCategoryDetailList.jsp";
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
<body>
<!------------ Current Date calculation---------->
<%
String Hr;
SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
Date dateobj = new Date();

String d1 = dateobj.toString();	
String[] d = d1.split(" ");

String year = d[5];
String month = d[1];

String HrBill = month+"/"+year+"/"+"1";		
%>
<div class="container">
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading">Component Category Bulk Upload</h2>
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
	<div class="container">
	<div id="wrqpper">
		
		<form class="form-horizontal" id='myform' name="myform" enctype="multipart/form-data"> <!--  enctype="multipart/form-data" -->		
 		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Select File :<sup>*</sup></label>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
							
<!-- 			<input type="file" onchange="this.form.filename.value = this.value" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"> -->
   						
   						<input type="file" name="filename" id="filename" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" class="form-control">
														 
							<!-- <input id="files" type="file"/> --> <!-- accept="image/*"  -->
						</div>
					</div>
				</div>
				<div class="row form-group">
						<div class="row form-group">
						<div class="col-lg-4 col-sm-offset-3">
						To download Template of Excel file<a href="../staticContent/fakepath/Compoenet Category detail Report.xlsx" >&nbsp;&nbsp;&nbsp;Click Here..</a>
						</div>
					</div>
				</div>
				
				<div id="loader" style="display: none;" class="container text-center">
  				<b>Loading...</b>&nbsp;&nbsp;&nbsp;<i class="fa fa-refresh fa-3x fa-spin"></i>
				</div>

				<br>
				<br>


			<div align="center">
				<div class="col-md-12">
				
				<input type="submit"  class="btn btn-success btn-lg btnn" id="btn" value="Save" name="saveBtn" onclick="uploadFile()">
					<input type="button"  class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button"  value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="getCompoenentCategoryDetailList()">
					</div>
			</div>
		</form>
		</div>
		</div>
</div>

<script type="text/javascript">
$(document).on("click", ".download", function() {
        var id = $(this).data('id'); //get id
        var selector = $(this);
        //window.location = _OBJECT_URL;
        console.log("CLICKED");
        console.log("id " + id);
})
</script>

<%@include file="commons/newFooter.jsp"%>
</body>
</html>