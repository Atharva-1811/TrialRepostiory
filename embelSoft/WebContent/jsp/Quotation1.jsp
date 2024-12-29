<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.dao.QuotationDao"%>

<%@page import="com.embelSoft.bean.QuotationBean" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<html>
<head>
		
<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>

<link rel="stylesheet" href="/embelSoft/staticContent/css/shree.css">

<link rel="stylesheet"
	href="/embelSoft/staticContent/css/jquery-ui.min.css">

<link rel="stylesheet"
	href="/embelSoft/staticContent/css/ui.jqgrid.min.css">

<link rel="stylesheet"
	href="/embelSoft/staticContent/y_css/jquery-ui.css">

<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">

<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery.min.js"></script>

<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>

<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery-ui.js"></script>

<script type="text/javascript"
	src="/embelSoft/staticContent/js/jqueryUi.js"></script>

<script type="text/javascript"
	src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
		
        <script src="/embelSoft/staticContent/js/quotation.js"></script>
        
<!--    <script type="text/javascript">

	    	function quatationList()
	    	{
	        	window.location="QuatationList.jsp";			
			}
        </script> 
-->
        
        <script type="text/javascript">

	    	function quatationList()
	    	{
	        	window.location="QuotationReport.jsp";			
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

		<script>
			function resets()
			{
				location.reload(true);
			}
	
		</script>
	
		<script type="text/javascript">
			function clearField()
			{
				document.getElementById("taskInText").value="";
			}
	
		</script>
	
		<script type="text/javascript">
			function clearCalculation()
			{
				document.getElementById("gst1").value="0";
				document.getElementById("gstAmount").value="0";
				document.getElementById("discount").value="0";
				document.getElementById("discountAmount").value="0";
				document.getElementById("grossTotal1").value="";
			}
		</script>
		
<script type="text/javascript">
function pageLoad(){
	$("#VendorDetail").show();
	$("#ClientDetail").hide(); 
}
function getVendorName() {
	$("#VendorDetail").show();
	$("#ClientDetail").hide();
	
}
function getClientName() {
	$("#ClientDetail").show();
	$("#VendorDetail").hide();
	//location.reload();
}
</script>
</head>
		<body onload="pageLoad();<!-- getProductName();getProductNameForCredit();"> -->
<%
		String QuoNo;
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		
		String d1 = dateobj.toString();
		
		String[] d = d1.split(" ");
		
		String year = d[5];
		
		String month = d[1];

		String qoNo = "QO"+"/"+year+"/"+month+"/"+001;
%>
<%
	 QuotationDao poDao = new QuotationDao();
	List quoNo = poDao.getQuotationNo();

	for(int i=0;i<quoNo.size();i++)
	{
		QuotationBean bean = (QuotationBean)quoNo.get(i);
		QuoNo = bean.getQuotationNo();
		String[] qNo = QuoNo.split("/");
		String lNo = qNo[3];
		int lstNo = Integer.parseInt(lNo);
		int lastNo = lstNo + 1;
		qoNo = "QO"+"/"+year+"/"+month+"/"+lastNo;
	}
%>

<body>

	<div class="container-fluid">
		<div class="row header_margin_top">
			<div align="center">
				<h2 class="form-name style_heading" style="margin-top: 80px">Quotation Details</h2>
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
		
		<form class="form-horizontal" name="quotation">
		
		
		<div align="right" style="margin-right: 150px;" id="billno">
			<h3 style="color: red;font-family: digital-clock-font;">
				Quotation No ::
				<%= qoNo%> 
			</h3>
		</div>
		
			<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="center">
						<label class="control-label" for="billType" style="margin-right: -129px;">Type:<sup>*</sup></label>
					</div>
					
					
					<div class="col-sm-4">
						<div class="col-md-4 col-xs-6 ">
							<label class="radio-inline">
							 <input type="radio" name="type" id="vendor" value="vendor" onclick="getVendorName()" style="margin-left: -70px;"/>
							 <h4 style="margin-top: 0px;">Vendor</h4>
							</label>
						</div>
						
						
						<div class="col-md-6 col-xs-6 col-md-ffset-1 ">
							<label class="radio-inline">
							 <input type="radio" name="type" id="client" value="client" onclick="getClientName()" style="margin-left: -70px;"/>
							 <h4 style="margin-top: 0px;">Client</h4>
							</label>
						</div>
						</div>
					 </div>
		
		
		<div id="ClientDetail">
  
   	 	 <form class="form-horizontal" method="post" action="" name="quotation1">
			<fieldset>
		 <div class="row">
				<div class="form-group">
				
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Client Name:<sup>*</sup></label>
					</div>
				<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>

							<input list="clientList_Drop" id="clientName" class="form-control" onchange="getClientDetails()">
							<datalist id="clientList_Drop"></datalist>

							
						</div>
					</div>
	
					 <div class="col-sm-2" align="right">
						<label class="control-label">Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-calendar"></i>
									</span>
								<input type="date" id='quotDate' name="quotDate" class="form-control" placeholder=" Enter Paid By">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Company Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='companyname' name="companyname" class="form-control" placeholder="Enter Company Name">
						</div>
					</div>
					
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Company Address :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							
							<textarea id='companyaddress' name="companyaddress" class="form-control" placeholder="Enter Company Address" rows="3" cols="10"></textarea>
							
							<!--  <input type="text" id='companyaddress' name="companyaddress" class="form-control" placeholder="Enter Company Address"> -->
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">State :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
					 <input type="text" id='state' name="state" class="form-control" placeholder="Enter State Name">
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Zip Code :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='zip' name="zip" class="form-control" maxlength="6" onkeypress="return isNumber(event)" placeholder="Enter Zip Code">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Phone No. :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span>
					 <input type="text" id='phoneno' name="phoneno" maxlength="10" onkeypress="return isNumber(event)" class="form-control" placeholder="Enter Phone No">
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
					   <label class="control-label">Document Attach:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
							<input type="file" id='uploadFile' name="uploadFile" class="form-control" placeholder="upload File .pdf">
						</div>
					 </div>
				</div>
			</div>
	
               <div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
					   <label class="control-label">Description Detail:<sup>*</sup></label>
					</div>
					<div class="col-md-8">
					<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>	
							<textarea id="taskInText" rows="3" cols="50" class="form-control" onchange="getGridForProductDescription();clearCalculation();clearField()" placeholder="Enter Description"></textarea>
						</div>
					</div>
					</div>
				</div>
							  
				  <div class="table-responsive	row col-md-offset-1" style="margin-left: 327px;">
						<table id="list4" ></table>
						<div id="jqGridPager"></div>
				  </div>
			  
		        <div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="subTotal"><h4><b>Sub Total :</b></h4></label>  
			           	 <div class="col-md-2" style=" width: 300px;">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="subTotal1" name="subTotal1"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>	
            		
            	<div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
						<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>Discount :</b></h4></label>  
			           	 <div class="col-md-1" style=" width: 120px;">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="discount" name="discount"  value="0" class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;" onchange="getDiscountAmountTotal()" >
	            			</div>
	            		</div>
	            		
	            		
	            		<div class="col-md-1"  style=" width: 180px;">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="discountAmount" name="discountAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>	
            		
        
    				<div class="input-group">
	     				<input readonly="readonly" id="afterDiscountTotal1" name="afterDiscountTotal1"  class="form-control input-md" type="hidden" style="font-size: 20px;  height: 45px;">
           			</div>
	            		
           		 <div class="row form-group"> </div>

            		
            		
            		<div class="row" style="margin-top:15px;">
						<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>GST :</b></h4></label>  
			           	 <div class="col-md-1" style=" width: 120px;">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="gst1" name="gst1"  value="0" class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;" onchange="getGstAmountTotal()" >
	            			</div>
	            		</div>
	            			 <div class="col-md-1"  style=" width: 180px;">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="gstAmount" name="gstAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>	
              		     	
           		 <div class="row form-group" > </div>
		     		<div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-2" style=" width: 300px;">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              					<input readonly="readonly" id="grossTotal1" name="grossTotal1"  class="form-control input-md" type="text" style="font-size: 20px;  height: 55px;">
	            			</div>
	            		</div>
          				
          				</div>
          				</fieldset>
          				</form>
          				</div>
          
          
          				<!------------------			Code for vendor     	 ------------------>
          
          				
          				
          				<div id="VendorDetail">
  
   	 	 <form class="form-horizontal" method="post" action="" name="quotation2">
			<fieldset>
		 <div class="row">
				<div class="form-group">
				
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Vendor Name:<sup>*</sup></label>
					</div>
				<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>

							<input list="vendorList_Drop" id="vendorName" class="form-control" onchange="getVendorDetails()">
							<datalist id="vendorList_Drop"></datalist>

							
						</div>
					</div>
	
					 <div class="col-sm-2" align="right">
						<label class="control-label">Date:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-calendar"></i>
									</span>
								<input type="date" id='quotDate' name="quotDate" class="form-control" placeholder=" Enter Paid By">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Company Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='companyname' name="companyname" class="form-control" placeholder="Enter Company Name">
						</div>
					</div>
					
					
					<div class="col-sm-2" align="right">
						<label class="control-label">Company Address :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							
							<textarea id='companyaddress' name="companyaddress" class="form-control" placeholder="Enter Company Address" rows="3" cols="10"></textarea>
							
							<!--  <input type="text" id='companyaddress' name="companyaddress" class="form-control" placeholder="Enter Company Address"> -->
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">State :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
					 <input type="text" id='state' name="state" class="form-control" placeholder="Enter State Name">
						</div>
					</div>
					
					<div class="col-sm-2 " align="right">
						<label class="control-label">Zip Code :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='zip' name="zip" class="form-control" maxlength="6" onkeypress="return isNumber(event)" placeholder="Enter Zip Code">
						</div>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1" align="right">
						<label class="control-label">Phone No. :</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span>
					 <input type="text" id='phoneno' name="phoneno" maxlength="10" onkeypress="return isNumber(event)" class="form-control" placeholder="Enter Phone No">
						</div>
					</div>
					
					<div class="col-sm-2" align="right">
					   <label class="control-label">Document Attach:</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
							<input type="file" id='uploadFile' name="uploadFile" class="form-control" placeholder="upload File .pdf">
						</div>
					 </div>
				</div>
			</div>
	
               <div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
					   <label class="control-label">Description Detail:<sup>*</sup></label>
					</div>
					<div class="col-md-8">
					<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>	
							<textarea id="taskInText" rows="3" cols="50" class="form-control" onchange="getGridForProductDescription();clearCalculation();clearField()" placeholder="Enter Description"></textarea>
						</div>
					</div>
					</div>
				</div>
							  
				  <div class="table-responsive	row col-md-offset-1" style="margin-left: 327px;">
						<table id="list4" ></table>
						<div id="jqGridPager"></div>
				  </div>
			  
		        <div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="subTotal"><h4><b>Sub Total :</b></h4></label>  
			           	 <div class="col-md-2" style=" width: 300px;">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="subTotal1" name="subTotal1"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>	
            		
            	<div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
						<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>Discount :</b></h4></label>  
			           	 <div class="col-md-1" style=" width: 120px;">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="discount" name="discount"  value="0" class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;" onchange="getDiscountAmountTotal()" >
	            			</div>
	            		</div>
	            		
	            		
	            		<div class="col-md-1"  style=" width: 180px;">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="discountAmount" name="discountAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>	
            		
        
    				<div class="input-group">
	     				<input readonly="readonly" id="afterDiscountTotal1" name="afterDiscountTotal1"  class="form-control input-md" type="hidden" style="font-size: 20px;  height: 45px;">
           			</div>
	            		
           		 <div class="row form-group"> </div>

            		
            		
            		<div class="row" style="margin-top:15px;">
						<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>GST :</b></h4></label>  
			           	 <div class="col-md-1" style=" width: 120px;">
							<div class="input-group">
								<span class="input-group-addon">
									%
								</span>
	              				<input id="gst1" name="gst1"  value="0" class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;" onchange="getGstAmountTotal()" >
	            			</div>
	            		</div>
	            			 <div class="col-md-1"  style=" width: 180px;">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="gstAmount" name="gstAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>	
              		     	
           		 <div class="row form-group" > </div>
		     		<div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-2" style=" width: 300px;">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              					<input readonly="readonly" id="grossTotal1" name="grossTotal1"  class="form-control input-md" type="text" style="font-size: 20px;  height: 55px;">
	            			</div>
	            		</div>
          				
          				</div>
          				</fieldset>
          				</form>
          				
          
            		</div>
 			</form>
 		
 				</div>
		  
		  		  	<div class="row">
				<div class="form-group">
				</div>
		   </div>
		  
		  <div class="row form-group ">
           <div class="col-md-16 text-center">
	            <input type="button" id="btn1" name="btn1" class="btn btn-success btn-lg btnn "  onclick="QuotationValidation(); return false;" value="Print">
			    <input type="reset" id="btn1" name="btn1" class="btn btn-danger btn-lg btnn "  onclick="resets()" value="Cancel">
			    <input type="button" id="btn1" name="btn1" class="btn btn-primary btn-lg btnn " value="List" onclick="quatationList()">
          </div>
        </div>  
	
</body>
</html><%@include file="commons/newFooter.jsp" %> 