<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.bean.OfferLetterBean"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.dao.OfferLetterDao"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	<script src="/embelSoft/staticContent/js/employeeDetails.js"></script>
  	
  	<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
	<script src="sweetalert2.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="sweetalert2.min.css">
	
	
  	
<script type="text/javascript">
	 function Back() {
			 window.location = "OfferLetter.jsp";
	}
</script>

<script>
$(document).ready(function(){
	 compTypeList();
});
</script>
	<!-- For datatable to pdf,print,excel etc conversion -->
		
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>		
<script type="text/javascript" src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

<!-- For datatable to pdf,print,excel etc conversion to connect offline jars -->
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/jquery-1.12.4.js"></script> 
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/buttons.flash.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/jszip.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/pdfmake.min.js"></script>	
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/vfs_fonts.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/buttons.html5.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/jsForReport/buttons.print.min.js"></script>
<link rel="stylesheet" href="/embelSoft/staticContent/cssForReport/jquery.dataTables.min.css"> 
<link rel="stylesheet" href="/embelSoft/staticContent/cssForReport/buttons.dataTables.min.css">

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">


<link rel="stylesheet" href="/embelSoft/staticContent/css/style2.css">

				
<style type="text/css">
	td {
		color:  black;
	}
</style>
</head>


   <div class="container" style="min-height:300px;">

				<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Employee Offer Letter List</h2>
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

	<div id="date">
		<label id="demo"></label>
		<script>
			var date = new Date();
			document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>
	
	<%
		OfferLetterDao dao=new OfferLetterDao();
		List<OfferLetterBean> list = dao.getOfferLetterList();
	
	%>
	
	<div class="container">
				<div class="table-responsive">
	<div id="dataTab">
		<table class="table table-bordered table-striped table-condensed cf"
				id="list2" class="display"
				style="border: 1px solid white; border-collapse: collapse; width:100%;">
				<thead>
				<tr>
					<th>Sr No</th>
					<th>Employee Name</th>
					<th>Id Number</th>
					<th>Designation</th>
					<th>Salary</th>
	                <th>Date_Of_Joining</th>
	                <th>Place</th>
	                <th>Email Id</th>
	                <th>Description1</th>
	                <th>Description2</th>
	                
				</tr>
			</thead>
			<tbody>
   				<%
   						
		            int k=1;	
					for(int i=0;i<list.size();i++){
						OfferLetterBean sr=(OfferLetterBean)list.get(i);
				%>
				
				<tr>
				    <td class="align"><%=k++ %></td>
				    <td class="align"><%=sr.getEmployeeName() %></td>
				   	<td class="align"><%=sr.getIdNumber() %></td>
				    <td class="align"><%=sr.getDesignation() %></td>
				    <td class="align"><%=sr.getSalary() %></td>
				    <td class="align"><%=sr.getDateOfJoining() %></td>
				    <td class="align"><%=sr.getPlaceOfposting() %></td>
				    <td class="align"><%=sr.getEmail() %></td>
				    <td class="align"><%=sr.getDescription1() %></td>
				    <td class="align"><%=sr.getDescription2() %></td>
				    			    
				    
				</tr>
	
				<%
					}
				%>
			</tbody>
		<tfoot>
		</tfoot>
	</table>
	</div>
	</div>
	</div>
	
	<div class="wrapper" align="center">
		<input type="button" style=" font-size: 25" value="Back" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="Back()" /> 
	</div>
	<script>

function myFunction(id)
{

	
	window.open("CopyExperienceLetterPDF.jsp?id="+id);
	function callback() 
	{
		//alert("hi akshay");
	}
	
}
</script>
<script type="text/javascript">
$(document).ready(function() {
    $('#list2').DataTable( {
        "paging":   true,
        "ordering": false,
        "info":     false
    } );
} );			
</script>
	<%@include file="commons/newFooter.jsp" %>
</div>