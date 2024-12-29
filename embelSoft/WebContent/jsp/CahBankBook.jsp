<%@page import="com.embelSoft.hibernate.ProductBillingHibernateNew"%>
<%@page import="com.embelSoft.hibernate.ResourceBillingHibernate"%>
<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.hibernate.EmployeeDetailsHibernate"%>
<%@page import="com.embelSoft.dao.EmployeeDetailsDao"%>
<%@page import="com.embelSoft.bean.ExpenditureDetailsBean"%>
<%@page import="com.embelSoft.hibernate.ExpenditureDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ExpenditureDetailsDao"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<%@page import="com.embelSoft.hibernate.PurchaseHibernate"%>

<%@page import="java.util.List"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="/embelSoft/staticContent/css/tabDemo.css">
<script type="text/javascript" src="/embelSoft/staticContent/js/cashbankbook.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<script>
function employeePaymentList()
{
	window.location = "EmployeePaymentList.jsp";
}
</script>
<script>
function vendorPaymentList()
{
	 window.location = "VendorPaymentList.jsp";
}
</script>
<script>
function ClientPaymentList()
{
	window.location = "ClientPaymentList.jsp";
}		
</script>
<script>
function expenditurePaymentList()
{
	window.location = "ExpendirurePaymentList.jsp";
}
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
    if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))
    {
        return false;
    }
    return true;
	}
</script>
<script type="text/javascript">
			function isAlphabetsWithSpace(evt) {
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
	function clearVenderCalculation()
	{
		document.vendor.totalAmount.value="";
		document.vendor.balanceAmount.value="";
		document.vendor.paidAmount.value="";
	}
</script>

<style>
h2.form-name {
    margin-top: 12px;
 	font-size: 25px;
    font-weight: 600;
    text-transform: uppercase;  
}
.leftmanu{
    width: 190px;
    background: #c50000a6;
    color:  white;
	}
label {
	text-align:left;
}
.quo {
	font-weight:600;
	color: red; 
	font-family: digital-clock-font;
}
</style>
</head>
<body>
<div class="container-fluid" > 
<div class="row">
    <div  class="col-md-12">
        <h3>Left Tabs</h3>
        <hr/>
        <div class="col-md-2" align="center">
            <!-- required for floating -->
            <!-- Nav tabs -->
            <ul class="nav nav-tabs">
                <li class="active"><a class="leftmanu" href="#messages" data-toggle="tab" >Employee Payment</a></li>
                 <li><a class="leftmanu" href="#vendor" data-toggle="tab">Vendor Payment</a></li>
                 <li><a class="leftmanu" href="#client" data-toggle="tab">Client Payment</a></li>
                <li><a class="leftmanu" href="#settings" data-toggle="tab">Expenditure Payment</a></li>
            </ul>
            </div>
        <div class="col-md-9">
            <!-- Tab panes -->
    <div class="tab-content">
    	
	<!------------ Employee Payment ---------->
            <div class="tab-pane active" id="messages">
           		<!-- <form class="form-horizontal" method="post" action="" name="emp"> -->
   	    	<div class="container-fluid"> 
   	    	 <div class="row">
			    <div align="center">
			  		<h2 class="form-name">Employee Payment</h2>
			  	</div>
		    	 <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		    </div>
		    </div>
		    <div class="container-fluid">
		    	<div class="row">
		    	<div id="wrqpper">
		    		<form class="form-horizontal" method="post" action="" name="emp">
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
							 <input list="employeeNameList" id="fk_employee_id" class="form-control" onchange="getAllBillsforemployee()">
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
						<div class="col-sm-2">
            				<label class="control-label" for="personName">Total Amount&nbsp;:&nbsp;&nbsp;</label>  
	          			</div>
	          			<div class="col-sm-3">
						 <div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
	           		 	 <input readonly="readonly" id="totalAmounte" name="totalAmount" class="form-control" placeholder="Total Amount">
	           		 </div>
				</div>
           		 <!-- <label class="col-md-2 control-label" for="personName">Accountant Name:</label>  
	          			<div class="col-md-3">
						 <div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
	           		 	 <input id="personName2" name="personName" placeholder="Accountant Name" class="form-control input-md" type="text">
	           		 </div>
				</div> -->
			</div>
			
			
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
           				<label class="control-label" for="personName">Accountant Name&nbsp;:&nbsp;&nbsp;</label>  
	          		</div>
	          			<div class="col-sm-3">
						 <div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
	           		 	 <input id="personName2" name="personName" placeholder="Accountant Name" class="form-control input-md" type="text">
	           		 </div>
				</div>
				<div class="col-sm-2">		
            		<label class="control-label" for="personName">Balance Amount&nbsp;:&nbsp;&nbsp;</label>  
	          	</div>
	          	<div class="col-sm-3">
						 <div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
	           		 	 <input readonly="readonly" id="balanceAmounte" name="balanceAmount" class="form-control" placeholder="Balance Amount">
	           		 </div>
				</div>
           		 
			</div>
			
			
         	  	<div class="row form-group">
         	  		<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label" for="reason2">Month&nbsp;:<sup>*</sup></label>  
	          		</div>
	          			<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">
								 <i class="glyphicon glyphicon-calendar"></i>
								</span>
	           		 			<select class="form-control" id="month">
	           		 			
	           		 				<option selected="selected" value="">--Select Month--</option>
	           		 				<option value="january">January</option>
	           		 				<option value="february">February</option>
	           		 				<option value="march">March</option>
	           		 				<option value="april">April</option>
	           		 				<option value="may">May</option>
	           		 				<option value="june">June</option>
	           		 				<option value="july">July</option>
	           		 				<option value="august">August</option>
	           		 				<option value="september">September</option>
	           		 				<option value="october">October</option>
	           		 				<option value="november">November</option>
	           		 				<option value="december">December</option>
	           		 			
	           		 			
	           		 			</select>
	           		       </div>
				      </div>
					 <div class="col-sm-2">			
						<label class="control-label" for="paymentMode"> Payment Mode&nbsp;:<sup>*</sup></label>  
	           		 </div>
	           		       <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="glyphicon glyphicon-hand-right"></i>
										<!-- <i class="fa fa-rupee" style="font-size:18px"></i> -->
								</span>
	           					<select class="form-control" id="paymentMode2">
<!-- 	           							<option value="" selected="selected">--Select Mode--</option> -->
										<option value="cash" selected="selected">Cash</option>
										<option value="cheque">Cheque</option>
										<option value="card">Card</option>
										<option value="neft">NEFT</option>
								</select>	
	           				</div>
						</div>
			 	</div>
	 <script>
		$(document).ready(function(){
	  		 $("#paymentMode2").change(function(){
	       	$(this).find("option:selected").each(function(){
		       	
	           	if($(this).attr("value")=="cheque"){
	           	$("#cheque_no2").show(); 
	           	$("#neft_acc_no2").hide(); 
	           	$("#card_no2").hide();
	           	}
	          	 else if($(this).attr("value")=="card"){
	          		$("#card_no2").show(); 	
	          		$("#neft_acc_no2").hide(); 
	        		$("#cheque_no2").hide();
	           }
	          	 else if($(this).attr("value")=="neft"){
	           		$("#neft_acc_no2").show(); 	
	           		$("#card_no2").hide(); 
	        		$("#cheque_no2").hide();
	            }
	          	 else if($(this).attr("value")=="cash"){
	            		$("#neft_acc_no2").hide(); 
	            		$("#cheque_no2").hide();
	            		$("#card_no2").hide(); 
	             }
	        	 else if($(this).attr("value")==""){
	            		$("#neft_acc_no2").hide(); 
	            		$("#cheque_no2").hide();
	            		$("#card_no2").hide(); 
	             }
	       });
	   }).change();
		});	
		</script>
		<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1">
				 <label class="control-label" for="paymentMode">Payment Type&nbsp;:&nbsp;&nbsp;</label>  
	           	</div>
	           		<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentType2">
										<option value="credit" selected="selected">Credit</option>
										<option value="debit">Debit</option>
										
								</select>	
	           				</div>
						</div>
						
				  <div class="col-sm-2">
						<label class="control-label">Amount&nbsp;:<sup>*</sup></label>
						</div>
						   <div class="col-sm-3">
						   <div class="input-group">
							 <span class="input-group-addon">
							  <i class="fa fa-rupee" style="font-size:15px; width: 15px"></i>
							
								</span>
           					 <input  id="empPay" name="empPay" class="form-control" onkeypress="return isNumber(event)" placeholder="Enter Amount">
           				  </div>
						</div>
			     </div>
			     
			     
			   <div class="row form-group">
			   	 <div class="col-sm-2 col-sm-offset-1">
					<label class="control-label" for="reason2">Reason&nbsp;:<sup>*</sup></label>  
	          		</div>
	          			<div class="col-sm-3" style="padding-bottom: 15px;">
							<div class="input-group">
								<span class="input-group-addon">
								 <i class="glyphicon glyphicon-user"></i>
								</span>
	           		 	 <input id="reason2" name="reason2" placeholder="Reason" class="form-control input-md" type="text">
	           		       </div>
				      </div>
				      
				      
				      	<div id="cheque_no2">
				      	
				      	<div class="col-md-3 col-md-offset-2 first" style="padding-bottom: 15px;">	
					 		<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck2" placeholder="Name On Cheque" />  
						</div>
						
						
					<div class="col-md-3 col-md-offset-8 first">	
						<input class="form-control" type="text" name="chequeNum" id="chequeNum2" placeholder="Cheque No." />  
					</div>
					
				</div>
				      
				      <div id="card_no2">
							<div class="col-md-3 col-md-offset-2 first">	
								<input class="form-control" type="text" name="cardNum" id="cardNum2" placeholder="Card No." />  
							</div>
						</div>
						
						
							<div id="neft_acc_no2">
							<div class="col-md-3 col-md-offset-2 first" style="padding-bottom: 15px;">	
								<input class="form-control" type="text" name="bankName" id="bankName2" placeholder="Name Of Bank" />  
							</div>
							
							<div class="col-md-3 col-md-offset-8 first">	
								<input class="form-control" type="text" name="accNum" id="accNum2" placeholder="Account No." />  
							</div>
						</div>
						
						
					
			 	</div>
			    
								
        <div align="center">
			<div class="col-md-12">
            <input type="button" id="btn3" name="btn3" class="btn btn-success btn-lg btnn "  onclick="EmployeePaymentValidation()" value="Submit">
		    <input type="reset" id="btn3" class="btn btn-danger btn-lg btnn" name="btn2" value="Cancel">
			<input type="button"  value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="employeePaymentList()">
          </div>
        </div>    
         </form>  
         </div>  	    
 </div>
 </div>
 </div>
 
 
 	<!--------------- Vendor Payment ----------------->
 	
  <div class="tab-pane" id="vendor">
		<!-- <form method="post" action="" name="exp"> -->
		<div class="container-fluid">
			<div class="row">
			    <div align="center">
			  		<h2 class="form-name style_heading">Vendor Payment</h2>
			  	</div>
		     <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		    </div>
		    </div>
		    <div class="container-fluid">
		    <div class="row">
		    <div id="wrqpper">
		    <form class="form-horizontal" method="post" action="" name="exp">
				<div class="row form-group">  
					<div class="col-sm-2 col-sm-offset-1">
           				<label class="control-label" for="employeename">Vendor Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<%
								VendorDetailsDao sdd4 = new VendorDetailsDao();
								List sList5 = sdd4.getAllVendorNames10();
							%>
							<input list="vendorNameList" id="fk_vendor_id" class="form-control" onchange="getTotalAndBalanceAmountByVendorName()">
							<datalist id="vendorNameList">
								<%
									for (int i = 0; i < sList5.size(); i++) {
										VendorDetailsHibernate sup = (VendorDetailsHibernate) sList5.get(i);
								%>

									<option data-value="<%=sup.getPkVendorDetailsId()%>"
									value="<%=sup.getVendorName()%>">
									<%
										}
									%>								
							</datalist>
						</div>
					</div>
					<div class="col-sm-2">
           	 			<label class="control-label" for="totalAmount">Total Amount&nbsp;:&nbsp;&nbsp;</label>  
           			 </div>
           			 <div class="col-sm-3">
						<div class="input-group">
							 <span class="input-group-addon"><i class="fa fa-rupee" style="font-size:15px; width: 15px"></i></span>
             				<input id="totalAmount" name="totalAmount" readonly="readonly" placeholder="Total Amount" class="form-control input-md" type="text" >	
           				 </div>
					</div>
			</div>
<!-- 			
			<div class="row form-group">
					<label class="col-md-2 control-label" for="contactNumber">Bill No:<sup>*</sup></label>  
      			<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>

							<input list="billList_Drop" id="billNo" class="form-control" onchange="getTotalByBillNo()">
							<datalist id="billList_Drop"></datalist>

							
						</div>
					</div>
					
				<label class="col-md-2 control-label" for="expCredit">Bill Amount:<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							 <span class="input-group-addon">
							 <i class="fa fa-rupee" style="font-size:18px;width: 27px"></i>
							
								</span>
             					 <input id="billAmount" readonly="readonly" name="billAmount" placeholder="Bill Amount" class="form-control input-md" type="text"  >
             					 
           				 </div>
					</div>
			</div> -->
				
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
				 	<label class="control-label" for="personName"></label>  
	            </div>
	          		 <div class="col-sm-3">
						<div class="input-group">
							
							
	           			</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label" for="balanceAmount">Balance Amount&nbsp;:<sup>*</sup></label>  
           			 </div>
           			 <div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="fa fa-rupee" style="font-size:15px;width: 15px"></i> </span>
             				<input id="balanceAmount" name="balanceAmount" placeholder="Balance Amount" readonly="readonly" class="form-control input-md" type="text">
           				 </div>
					</div>
			</div>	
			
			
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
				 	<label class="col-sm-3 control-label" for="personName"></label>  
	            </div>
	          		 <div class="col-sm-3">
						<div class="input-group">
							
							
	           			</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label" for="paidAmount">Paid Amount&nbsp;:<sup>*</sup></label>  
           			</div>
           			 <div class="col-sm-3">
						<div class="input-group">
							 <span class="input-group-addon">
							 <i class="fa fa-rupee" style="font-size:15px;width: 15px"></i></span>
             					 <input id="paidAmount" name="paidAmount" placeholder="Paid Amount" onkeypress="return isNumber(event)" class="form-control input-md" type="text">
           				 </div>
					</div>
			</div>			
			
		<div align="center">
            <div class="col-md-12">
            <input type="button" id="save" name="btn4" style="font-size: 25" class="btn btn-success btn-lg btnn "  onclick="vendorPaymentValidation(); return false;" value="Submit">
		    <input type="reset" id="btn2" style="font-size: 25" class="btn btn-danger btn-lg btnn" name="btn4" value="Cancel">
      		<input type="button" style="font-size:25" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="vendorPaymentList()">
     
       <!--     <input type="button" font-size="25" value="List" id="listBtn" class="btn btn-primary btn-lg btn-large button-height-width" onclick="expenditurePaymentList()"> -->
            </div>
        </div> 
     </form>
     </div>
	</div> 
 </div>
 </div>
 
 
 
 
 <!--------------- Client Payment ----------------->
 	
  <div class="tab-pane" id="client">
		<!-- <form method="post" action="" name="exp"> -->
		<div class="container-fluid">
			<div class="row">
			    <div align="center">
			  		<h2 class="form-name style_heading">Client Payment</h2>
			  	</div>
		     <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		    </div>
		</div>    
		<div class="container-fluid">
		<div class="row">
		<div id="wrqpper">
		<form class="form-horizontal" method="post" action="" name="exp">
		<div class="row form-group">
			<div class="col-sm-2 col-sm-offset-1">
           		<label class="control-label" for="employeename">Client Name&nbsp;:<sup>*</sup></label>
			</div>		
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>			
							<%
								ClientEnquiryDao dao = new ClientEnquiryDao();
								List list = dao.getAllClientNames10();								
							%>							
							<input list="clientNameList" id="fk_client_id" class="form-control" onchange="getTotalAmountAndBalanceAmountByClientName()">
							<datalist id="clientNameList">
								<%
									for (int i = 0; i < list.size(); i++) {
										ProductBillingHibernateNew sup = (ProductBillingHibernateNew) list.get(i);
								%>

								<option data-value="<%=sup.getFkClientId() %>"
								value="<%=sup.getClientName()%>">

									<%
										}
									%>
								
							</datalist>
						</div>
					</div>
					<div class="col-sm-2">
           	 			<label class="control-label" for="serviceProvider">Total Amount&nbsp;:&nbsp;&nbsp;</label>  
           			 </div>
           			 <div class="col-sm-3">
						<div class="input-group">
							 <span class="input-group-addon">
							 <i class="fa fa-rupee" style="font-size:15px;width: 15px;"></i>
								</span>
             				<input id="totalAmount2" name="totalAmount" readonly="readonly" placeholder="Total Amount" class="form-control input-md" type="text" >	
           				 </div>
					</div>
			</div>
			
<!-- 			<div class="row form-group">
					<label class="col-md-2 control-label" for="contactNumber">Bill No:<sup>*</sup></label>  
      			<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>

							<input list="billList_Drop2" id="billNo2" class="form-control" onchange="getTotalByBillForClient()">
							<datalist id="billList_Drop2"></datalist>

							
						</div>
					</div>
					
				<label class="col-md-2 control-label" for="expCredit">Bill Amount<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							 <span class="input-group-addon">
							 <i class="fa fa-rupee" style="font-size:18px;width: 27px"></i>
							
								</span>
             					 <input id="billAmount2" readonly="readonly" name="billAmount2" placeholder="Bill Amount" class="form-control input-md" type="text"  >
             					 
           				 </div>
					</div>
			</div> -->
				
			<div class="row form-group">
				 <!-- <label class="col-sm-3 control-label" for="personName"></label>  
	          		 <div class="col-md-3">
						<div class="input-group">
							
							
	           			</div>
					</div>
 -->			
			<div class="col-sm-2 col-sm-offset-6">
				<label class="control-label" for="expDebit">Balance Amount&nbsp;:<sup>*</sup></label>  
           			 </div>
           			 <div class="col-sm-3">
						<div class="input-group">
							 <span class="input-group-addon">
							 <i class="fa fa-rupee" style="font-size:15px;width: 15px"></i>
							
								</span>
             					 <input id="balanceAmount2" name="balanceAmount2" placeholder="Balance Amount"  class="form-control input-md" type="text">
           				 </div>
					</div>
			</div>			
			<div class="row form-group">
				 
			<div class="col-sm-2 col-sm-offset-6">
				<label class="control-label" for="expDebit">Paid Amount&nbsp;:<sup>*</sup></label>  
           	</div>
           			 <div class="col-sm-3">
						<div class="input-group">
							 <span class="input-group-addon">
							 <i class="fa fa-rupee" style="font-size:15px;width: 15px"></i>
							
								</span>
             					 <input id="paidAmount2" name="paidAmount2" placeholder="Paid Amount" onkeypress="return isNumber(event)" class="form-control input-md" type="text">
           				 </div>
					</div>
			</div>	
			
		<div align="center">
            <div class="col-md-12">
            <input type="button" id="save" name="btn4" style="font-size: 25" class="btn btn-success btn-lg btnn "  onclick="clientPaymentValidation(); return false;" value="Submit">
		    <input type="reset" id="btn2" style="font-size: 25" class="btn btn-danger btn-lg btnn" name="btn4" value="Cancel">
		    <input type="button" style="font-size:25" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="ClientPaymentList()">
       <!--     <input type="button" font-size="25" value="List" id="listBtn" class="btn btn-primary btn-lg btn-large button-height-width" onclick="expenditurePaymentList()"> -->
            </div>
        </div> 
    
     </form>
     </div>
	</div>
	</div>
 </div>
 
 
 
 
 
 
       <!------------------   Expenditure Payment ------------>
       <div class="tab-pane" id="settings">
		<!-- <form method="post" action="" name="exp"> -->
		<div class="container-fluid">
			<div class="row">
			    <div align="center">
			  		<h2 class="form-name style_heading">Expenditure Payment</h2>
			  	</div>
		     <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		    </div>
		    </div>
		    	<div class="container-fluid">
		    <div class="row">
		    <div id="wrqpper">
		    <form class="form-horizontal" method="post" action="" name="exp">
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
           			<label class="control-label" for="expenditureName">Expenditure Name&nbsp;:<sup>*</sup></label>  
           	 	</div>      		 
           	 	      		 <div class="col-sm-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
							<%
							ExpenditureDetailsDao exdd = new ExpenditureDetailsDao();
           						List exList =exdd.getAllExpenseName();
							%>
							<input list="exp_drop" id="expenseName" class="form-control">
							<datalist id="exp_drop">
							<%
					           for(int i=0;i<exList.size();i++){
					        	   ExpenditureDetailsHibernate expbean =(ExpenditureDetailsHibernate)exList.get(i);
							%>
							<option data-value="<%=expbean.getPkExpenseId()%>" value="<%=expbean.getExpenseName() %>">
							<%
				      			}
				    		%>
						</datalist>
					</div>
           		</div>
           		<div class="col-sm-2">
           	 		<label class="control-label" for="serviceProvider">Service Provider&nbsp;:<sup>*</sup></label>  
           			</div>
           			 <div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
             				<input id="serviceProvider" name="serviceProvider" placeholder="Service Provider" class="form-control input-md" type="text" >	
           				 </div>
					</div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
					<label class="control-label" for="contactNumber">Contact Number&nbsp;:<sup>*</sup></label>  
           			</div>
           			 <div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
             					 <input id="contactNumber" name="contactNumber" placeholder="Contact Number" onkeypress="return isNumber(event)" maxlength="10" class="form-control input-md" type="text" >
           				 </div>
					</div>
					<div class="col-sm-2">
						<label class="control-label" for="expCredit">Credit Amount&nbsp;:<sup>*</sup></label>  
           			</div>
           			 <div class="col-sm-3">
						<div class="input-group">
							 <span class="input-group-addon">
							 <i class="fa fa-rupee" style="font-size:15px;width: 15px"></i>
								</span>
             					 <input id="expCredit" name="expCredit" placeholder="Credit Amount" class="form-control input-md" onkeypress="return isNumber(event)" type="text">
           				 </div>
					</div>
			</div>
				
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
				 <label class="control-label" for="accountantName">Accountant Name&nbsp;:<sup>*</sup></label>  
				</div>
	          		 <div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
	           		 			<input id="accountantName" name="accountantName" placeholder="Accountant Name" class="form-control input-md" type="text">
	           			</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label" for="expDebit">Debit Amount&nbsp;:<sup>*</sup></label> 
					</div>
           			 <div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="fa fa-rupee" style="font-size:15px;width: 15px"></i> </span>
             				<input id="expDebit" name="expDebit" placeholder="Debit Amount" onkeypress="return isNumber(event)" class="form-control input-md" onkeypress="return isNumber(event)" type="text">
           				 </div>
					</div>
			</div>	

		<div align="center">
            <div class="col-md-12">
            <input type="button" id="save" name="btn4" class="btn btn-success btn-lg btnn "  onclick="expensePaymentValidation(); return false;" value="Submit">
		    <input type="reset" id="btn2" class="btn btn-danger btn-lg btnn" name="btn4" value="Cancel">
           <input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="expenditurePaymentList()">
            </div>
        </div> 
     </form>
     </div>
	</div>
	</div>
	</div>
	
   </div>
  </div> 
 </div>
</div>
        <%@include file="commons/newFooter.jsp" %> 	
</div>
</body>
</html>		