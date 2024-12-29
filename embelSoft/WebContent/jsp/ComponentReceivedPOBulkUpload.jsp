<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.embelSoft.utility.HibernateUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>

<%@page import="java.util.Date" %>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat" %>

<html>

<!-- Component Stocks Bulk Upload by Namrata -->
	
<head>
  <meta charset="utf-8">
  <script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
  <link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
  <link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
  <script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
  <script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
  <script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
  <script src="/embelSoft/staticContent/js/ComponentDetails.js"></script>
  <script src="/embelSoft/staticContent/js/bulckUpload.js"></script>
  <link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
  <script src="sweetalert2.min.js"></script>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
  
  <link rel="stylesheet" href="sweetalert2.min.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript">
    function componentReceivedPOList() {
      window.location = "ComponentReceivedPOList.jsp";
    } 
  </script> 
  <script type="text/javascript">
    //Future date disable in date picker for date of birtht
    $(function() {
      $(document).ready(function () {
        var todaysDate = new Date(); // Gets today's date
        // Max date attribute is in "YYYY-MM-DD".  Need to format today's date accordingly
        var year = todaysDate.getFullYear();                        // YYYY
        var month = ("0" + (todaysDate.getMonth() + 1)).slice(-2);  // MM
        var day = ("0" + todaysDate.getDate()).slice(-2);           // DD
        var maxDate = (year +"-"+ month  +"-"+ day); // Results in "MM-DD-YYYY" for today's date 
        // Now to set the max date value for the calendar to be today's date
        $('.inspectionDate').attr('max',maxDate);
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
			<h2 class="form-name style_heading">COMPONENT RECEIVED BULK UPLOAD</h2>
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
		
		<form class="form-horizontal" id='myform1' name="myform1" enctype="multipart/form-data"> <!--  enctype="multipart/form-data" -->		
 		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Select File :<sup>*</sup></label>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i></span>
							
<!-- 			<input type="file" onchange="this.form.filename.value = this.value" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"> -->
   						
   						<!-- <input type="file" name="filename1" id="filename1" accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel" class="form-control"> -->
							<input type="file" name="filename1" id="filename1" accept=".xls,.xlsx" class="form-control">							 
							<!-- <input id="files" type="file"/> --> <!-- accept="image/*"  -->
						</div>
					</div>
				</div>
				<div class="row form-group">
						<div class="row form-group">
						<div class="col-lg-4 col-sm-offset-3">
						To download Template of Excel file<a href="../staticContent/fakepath/Component Received PO Report.xlsx">&nbsp;&nbsp;&nbsp;Click Here..</a>
						</div>
					</div>
				</div>
				
				<div id="loader1" style="display: none;" class="container text-center">
  				<b>Loading...</b>&nbsp;&nbsp;&nbsp;<i class="fa fa-refresh fa-3x fa-spin"></i>
				</div>

				<br>
				<br>


			<div align="center">
				<div class="col-md-12">
				
				<input type="submit"  class="btn btn-success btn-lg btnn" id="btn1" value="Save" name="saveBtn" onclick="convertExcelToJson()">
					<input type="button"  class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button"  value="List" id="listBtn1" class="btn btn-primary btn-lg btnn" onclick="componentReceivedPOList()">
					</div>
			</div>
		</form>
		
<div class="container">
    <!-- Add a container for the jqGrid -->
    <div id="grid-container">
        <table id="list4"></table>
        <div id="pager"></div>
    </div>
</div>
		</div>
		</div>
</div>


<%@include file="commons/newFooter.jsp"%>
</body>
</html>