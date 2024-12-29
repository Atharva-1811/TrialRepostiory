<%@page import="org.apache.velocity.runtime.parser.node.GetExecutor"%>
<%@page import="com.embelSoft.bean.ExpenditurePaymentBean"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.dao.ExpenditurePaymentDao"%>


<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
  	
  	  	
  	 <script src="/embelSoft/staticContent/js/employeeDetails.js"></script>
  	
  	 <script>
  	 
	     $(document).ready(function()
	    {
	    	 clientPaymentList();
		}); 
	</script>
	  	
<script type="text/javascript">
	 function Back() {
			 window.location = "CahBankBook.jsp";
			 //data-toggle="tab" data-target = "#settings";
	}

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
		  
			<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
			<script src="sweetalert2.min.js"></script>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<link rel="stylesheet" href="sweetalert2.min.css">	    
			 
			 
			 <link rel="stylesheet" href="/embelSoft/staticContent/css/venderlist.css">
			 
			 	   
					     <style type="text/css">
					      td {
					       color:  black;
					      }
					     </style>
</head>


   <div class="container" style="min-height:300px;">

				<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading">Expenditure Payment List</h2>
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
	ExpenditurePaymentDao dao=new ExpenditurePaymentDao();
		List<ExpenditurePaymentBean> list = dao.getExpenditurePaymentList();	
 %>
	<div id="demo_jui">
	<div class="container">
	<div class="table-responsive">
	   <table class="table table-bordered table-striped table-condensed cf"
			id="list2" class="display" style="border: 1px solid white; border-collapse: collapse; width:100%;">
			<thead>
			<tr>
					<th>Sr No</th>
					<th>Expense Name</th>
	                <th>Service Provider</th>
	                <th>Accountant Name</th>
	                <th>Total Amount</th>
	                <th>Credit</th>	                
	                <th>Debit</th>
					<th>Contact Number</th>					
					<th>Insert Date</th>
	                
				</tr>
			</thead>
			<tbody>
   				<%
   						int k=0;
		            	System.out.println("Size--in JSP===========----------=-============ :"+list.size());
 						for(int i=0;i<list.size();i++)
 						{
 							ExpenditurePaymentBean ep = (ExpenditurePaymentBean)list.get(i);
 							k++;
				%>				
				<tr>
					<td class="align"><%=k %></td>
				    <td class="align"><%=ep.getExpenseName() %></td>
				    <td class="align"><%=ep.getServiceProvider() %></td>
				    <td class="align"><%=ep.getAccountantName() %></td>
				    <td class="align"><%=ep.getTotalAmount() %></td>
				    <td class="align"><%=ep.getExpCredit() %></td>
				    <td class="align"><%=ep.getExpDebit() %></td>
				    <td class="align"><%=ep.getContactNumber() %></td>
				    <td class="align"><%=ep.getInsertDate() %></td>
				    
				    
				  
				</tr>	
				<%
					}
				%>
			</tbody>

		</table>
	</div>
	</div>
	</div>
	<div class="wrapper" align="center">
		<input type="button" style=" font-size: 25" value="Back" id="listBtn" data-toggle="tab" data-target="#settingsl" class="btn btn-primary btn-lg btnn" onclick="Back()" /> 
	</div>
	
	
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