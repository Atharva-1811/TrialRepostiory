
<%@page import="java.util.*"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat" %>

<%@page import="com.embelSoft.dao.ResourceBillingDao" %>
<%@page import="com.embelSoft.bean.ResourceBillingBean" %>

<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>

<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate" %>
<%@page import="com.embelSoft.dao.ClientEnquiryDao" %>

<%@page import="com.embelSoft.dao.ProductBillingDao" %>
<%@page import="com.embelSoft.bean.ProductBillingBeanNew" %>


<!-- Quotation start 0 -->

<%@page import="com.embelSoft.hibernate.ProductDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ProductDetailsDao"%>
<%@page import="com.embelSoft.dao.QuotationDao"%>
<%@page import="com.embelSoft.bean.QuotationBean" %>
<%@page import="com.embelSoft.bean.ClientQuotationBean" %>
<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>


<!-- Quotation end 1 -->

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<link rel="stylesheet" href="/embelSoft/staticContent/css/shree.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>

<script src="/embelSoft/staticContent/js/billing.js"></script>

<!-- Quotation start 1 -->

<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>

<link rel="stylesheet" href="/embelSoft/staticContent/css/shree.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet" href="/embelSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">

<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
		
<script src="/embelSoft/staticContent/js/quotation.js"></script>
<script src="/embelSoft/staticContent/js/productDetails.js"></script>



<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<!-- Quotation end 1 -->


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
<!-- for Quotation -->
<script type="text/javascript">ClientQuotationReport
function venderQuotationReport()
{
	window.location="QuotationReport.jsp";
}
function ClientQuotationReport()
{
	window.location="ClientQuotationReport.jsp";
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
function clearProductCalculation()
{
	document.productBilling.totalSubTotalProduct.value="";
	document.productBilling.totalTaxAmountProduct.value="";
	document.productBilling.grossTotalProduct.value="";
}
</script>
<script type="text/javascript">
function clearField()
{
	document.resourceBilling.productResourceName.value="";
}
</script>
<script>
function resourceBillingList()
{
	window.location="ResourceBillingListNew1.jsp";
}
</script>

<script>
function resets()
{
	location.reload(true);
}	

function resets2() {
	  document.getElementById("clientQuotation").reset();
	}
</script>

<!-- for Hr Billing -->

<script>
function clearVenderCalculation()
{
	document.productBilling.venderTotalSubTotal.value="";
	document.productBilling.venderTotalTaxAmountProduct.value="";
	document.productBilling.venderGrossTotalProduct.value="";
}
function clearClientCalculation()
{
	document.productBilling.clientTotalSubTotal.value="";
	document.productBilling.clientTotalTaxAmountProduct.value="";
	document.productBilling.clientGrossTotalProduct.value="";
}
</script>
<!--<script type="text/javascript">
 function clearField()
{
	document.resourceBilling.productResourceName.value="";
	document.productBilling.productName.value="";
}
</script> -->
<script>
function resourceBillingList()
{
	window.location="ResourceBillingListNew1.jsp";
}
</script>
<script type="text/javascript">
function productBillingList()
{
	window.location="ProductBillingListNew1.jsp";
}
</script>

<script>		
	function numbersonly(input) {
		var regex = /[^0-9 .]/gi;
		input.value = input.value.replace(regex, "");
	}
</script>

</head>
<body>
<%
 if (session.getAttribute("user") != null) 
{ 
%>
<div class="container-fluid" > 
<div class="row">
<div  class="col-md-12">
	<h3>Left Tabs</h3>
 	<hr/>
	<div class="col-md-2" align="center">
 		<ul class="nav nav-tabs">
			<li class=""><a class="leftmanu" href="#VenderQuotation" data-toggle="tab">Vendor Quotation</a></li>
 			<li><a class="leftmanu" href="#ClientQuotation" data-toggle="tab">Client Quotation</a></li>
		</ul>
	</div>

<!-- Tab panes -->	
<div class="col-md-9">
<div class="tab-content">
<!------------ HR / Resource Billing Java code---------->
<!------------ HR / Resource Bill No calculation---------->

<%
	//vender Quotation number
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

<!------------ HR / Vendor Billing HTML code---------->
<div class="tab-pane active" id="VenderQuotation">
<!-- <form class="form-horizontal" method="post" action="" name="quotation"> -->
	<div class="container-fluid">
	<div class="row">
		<div align="center">
			<h2 class="form-name">Vendor Quotation</h2>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color:#c1b1b1;">
			</div>
		</div>
	</div>	
	</div>
	<div class="container-fluid">
	<div align="right" id="billno">
<!-- 		<label class="col-md-3 control-label" for="billNo">Bill No ::</label> -->
<%-- 		<input type="text" id='billNo' placeholder="<%= HrBill%>" style="color: red;font-family: digital-clock-font;"> --%>
		<h4 class="quo">Quotation No ::<%= qoNo%></h4>
	</div>	
	
	<div class="row">
	<div id="wrqpper">
		<form class="form-horizontal" method="post" action="" name="quotation">
			<div class="row form-group"></div>
	
				<input type="hidden" id="vendor" name="vendor" value="vendor">
	
			<div class="row form-group"></div>
			
				<div class="row form-group">
				
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Vendor Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<%				    	
							VendorDetailsDao udd = new VendorDetailsDao();
							List uList4 = udd.getVenderNamesListForQuotation();
							%>
							<!-- <input list="vendorList_Drop" id="vendorName" class="form-control" onchange="getVendor_ClietDetails()">
							<datalist id="vendorList_Drop">
							
							</datalist> -->
<!-- 							<input list="userNameList" id="fk_employee_id" class="form-control" onchange="getUserDtlForAccessControl()" placeholder="Select Name"> -->
							<input list="vendorList_Drop" id="vendorName" class="form-control" onchange="getVendorDetails()" placeholder="Select Name">
							<datalist id="vendorList_Drop">
							<%
								for (int i = 0; i < uList4.size(); i++) {
									VendorDetailsHibernate hibernate = (VendorDetailsHibernate) uList4.get(i);
							%>
							<option data-value="<%=hibernate.getPkVendorDetailsId()%>" value="<%=hibernate.getVendorName()%>">									
							<%
								}
							%>
						</datalist>							
						</div>
					</div>
	
					 <div class="col-sm-2">
						<label class="control-label">Date :<sup>*</sup></label>
						<%
					  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					  			String todayDate = simpleDateFormat.format(new Date());
					  	%>
					</div>
					<div class="col-sm-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								<input type="date" id='quotDate' name="quotDate" value="<%= todayDate%>" class="form-control" placeholder=" Enter Paid By">
							</div>
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Company Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i> </span>
						 <input type="text" id='vendorCompanyName' name="vendorCompanyName" class="form-control" placeholder="Company Name">
						</div>
					</div>
					
					
					<div class="col-sm-2">
						<label class="control-label">Company Address&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i	class="glyphicon glyphicon-hand-right"></i> </span>							
							<textarea id='venderCompanyAddress' name="venderCompanyAddress" class="form-control" placeholder="Company Address" rows=1" cols="10"></textarea>							
							<!--  <input type="text" id='companyaddress' name="companyaddress" class="form-control" placeholder="Enter Company Address"> -->
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">State&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i></span>
					 		<input type="text" id='state' name="state" class="form-control" placeholder="State Name">
						</div>
					</div>
					
					<div class="col-sm-2 ">
						<label class="control-label">Zip Code&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i> </span>
						 <input type="text" id='zip' name="zip" class="form-control" maxlength="6" onkeypress="return isNumber(event)" placeholder="Zip Code">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Phone No.&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span>
					 <input type="text" id='phoneno' name="phoneno" maxlength="10" onkeypress="return isNumber(event)" class="form-control" placeholder="Phone No">
						</div>
					</div>
					
					<div class="col-sm-2">
					   <label class="control-label">Document Attach&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-pencil"></i> </span>
							<input type="file" id='uploadFile' name="uploadFile" class="form-control" placeholder="upload File .pdf">
						</div>
					 </div>
				</div>
		
				<div class="row form-group">
				
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Product Name :<sup>*</sup></label>
					</div>
				<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-pencil"></i></span>
							
										<%
							ProductDetailsDao sdd4 = new ProductDetailsDao();
								List sList5 = sdd4.getAllProductNames();
							%>
						<input list="productResourceNameList" id="productResourceName" name="productResourceName" class="form-control" onchange="venderQuotaionGrid();clearVenderCalculation()">
						<datalist id="productResourceNameList">
							<%
								for (int i = 0; i < sList5.size(); i++) {
									ProductDetailsHibernate sup2 = (ProductDetailsHibernate) sList5.get(i);
							%>
							<option data-value="<%=sup2.getPkProductDetailsId()%>"
								value="<%=sup2.getProductName()%>">
							<%
								}
							%>
						</datalist>
							<!-- <textarea id='productResourceName' name="productResourceName" class="form-control" placeholder="Product Name" onchange="venderQuotaionGrid();clearVenderCalculation()" rows="1" cols="2"></textarea> -->
						</div>
					</div>
	
					<div class="col-sm-2">
						<label class="control-label">Features&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-home"></i></span>							
							<textarea rows="1" cols="15" id='features' name="features" class="form-control" placeholder="Features"></textarea>
						</div>
					</div>
				</div>
			
	
			
              <!--  <div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
					   <label class="control-label">Product Name :<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
					<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-pencil"></i></span>
							<textarea id='productResourceName' name="productResourceName" class="form-control" placeholder="Enter Product Name" onchange="venderQuotaionGrid()" rows="1" cols="2"></textarea>  -->
<!-- 							<textarea id="taskInText" rows="1" cols="50" class="form-control" onchange="getGridForProductDescription();clearCalculation();clearField()" placeholder="Enter Description"></textarea> -->
					<!-- 	</div>
					</div>
					</div>
				</div> -->
				<div class="row form-group">
				<div class="table-responsive row" style="padding-top: 20px; padding-bottom: 15px; margin-left: 0px;">			
					<table id="jqgrid" ></table>
					<div id="jqGridPager"></div>
				</div>
			    </div> 
				 <!--  <div class="table-responsive	row col-md-offset-1" style="margin-left: 327px;">
						<table id="list4" ></table>
						<div id="jqGridPager"></div>
				  </div> -->
			  
		        <div class="row form-group"> </div>
		      		<div class="row form-group" style="margin-top:15px;">
		      			<div class="col-sm-2 col-md-offset-6">
						 	<label class="control-label"  for="venderTotalSubTotal"><h4><b>Total Sub Total&nbsp;:&nbsp;&nbsp;</b></h4></label>  
			         	</div> 	 
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
	              				<input readonly="readonly" id="venderTotalSubTotal" name="venderTotalSubTotal"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>
            	
            	<div class="row form-group"> </div>
		      		<div class="row form-group" style="margin-top:15px;">
		      			 <div class="col-sm-2 col-md-offset-6">
							<label class="control-label"  for="venderTotalTaxAmount"><h4><b>Total Tax Amount&nbsp;:&nbsp;&nbsp;</b></h4></label>  
			           	 </div>
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
	              				<input readonly="readonly" id="venderTotalTaxAmount" name="venderTotalTaxAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>
            		
            <!-- 	<div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
						<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>Discount&nbsp;:&nbsp;&nbsp;</b></h4></label>  
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
						<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>GST&nbsp;:&nbsp;&nbsp;</b></h4></label>  
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
            		</div>	 -->
              		     	
           		 <div class="row form-group" > </div>
		     		<div class="row form-group" style="margin-top:15px;">
		     			<div class="col-sm-2 col-md-offset-6">
							<label class="control-label"  for="grossTotal"><h4><b>Gross Total&nbsp;:&nbsp;&nbsp;</b></h4></label>  
			           	 </div>
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-rupee" style="font-size:18px"></i> </span>
	              					<input readonly="readonly" id="venderGrossTotal" name="venderGrossTotal"  class="form-control input-md" type="text" style="font-size: 20px;  height: 55px;">
	            			</div>
	            		</div>         
            		</div>
			  
		<div align="center">
			<div class="col-md-12">
	            <input type="button" id="btn1" name="btn1" class="btn btn-success btn-lg btnn "  onclick="venderQuotationValidation(); return false;" value="Print">
			    <input type="reset" id="btn1" name="btn1" class="btn btn-danger btn-lg btnn "  onclick="resets()" value="Cancel">
			    <input type="button" id="btn1" name="btn1" class="btn btn-primary btn-lg btnn " value="Report" onclick="venderQuotationReport()">
			</div>
		</div>
</form>
</div>
</div>
</div>
</div>

<!------------------ Client Quotation Java code ------------>

<%
	//client Quotation number
		String clientQuoNo;
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj2 = new Date();
		
		String d2 = dateobj2.toString();
		
		String[] dArr = d2.split(" ");
		
		String year1 = dArr[5];
		
		String month1 = dArr[1];

		String clientQoNo = "QO"+"/"+year1+"/"+month1+"/"+001;
%>
<%
	QuotationDao clientPoDao = new QuotationDao();
	List quoNoList = clientPoDao.getClientQuotationNo();

	for(int i=0;i<quoNoList.size();i++)
	{
		ClientQuotationBean bean = (ClientQuotationBean)quoNoList.get(i);
		clientQuoNo = bean.getQuotationNo();
		String[] qNo = clientQuoNo.split("/");
		String lNo = qNo[3];
		int lstNo = Integer.parseInt(lNo);
		int lastNo = lstNo + 1;
		clientQoNo = "QO"+"/"+year+"/"+month+"/"+lastNo;
	}
%>

<!------------------ Client Quotation ------------>

<div class="tab-pane" id="ClientQuotation">
<!-- <form method="post" action="" name="clientQuotation"> -->
	<div class="container-fluid">
	<div class="row">
	<div align="center">
		<h2 class="form-name">Client Quotation</h2>
	</div>
	<div class="row">
		<div class="col-sm-offset-1 col-md-10">
			<hr style="border-top-color:#c1b1b1;">
		</div>
	</div>
	</div>
	</div>
    <div class="container-fluid">
	<div align="right" id="billno">
		<h4 class="quo">Quotation No ::<%= clientQoNo%></h4>
	</div>
	
   <div class="row">
   	 <div id="wrqpper">
   		<form class="form-horizontal" method="post" action="" name="clientQuotation">
			<div class="row form-group"></div>
	
			<input type="hidden" id="client" name="client" value="client">
	
			<div class="row form-group"></div>
			
				<div class="row form-group">				
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Client Name&nbsp;:<sup>*</sup></label>
					</div>
				<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<!-- 	<input list="clientList_Drop" id="vendorName" class="form-control" onchange="getVendor_ClietDetails()">
							<datalist id="clientList_Drop">
							
							</datalist> -->
							<%				    	
							ClientEnquiryDao dao = new ClientEnquiryDao();
							List clientList = dao.getClientNameForQuotation();
							%>
							<!-- <input list="vendorList_Drop" id="vendorName" class="form-control" onchange="getVendor_ClietDetails()">
							<datalist id="vendorList_Drop">
							
							</datalist> -->
							<input list="clientList_Drop" id="clientName" class="form-control" onchange="getClientDetails()" placeholder="Select Name">
							<datalist id="clientList_Drop">
							<%
								for (int i = 0; i < clientList.size(); i++) {
									ClientEnquiryHibernate hibernate = (ClientEnquiryHibernate) clientList.get(i);
							%>
							<option data-value="<%=hibernate.getPkClientEnquiryId()%>" value="<%=hibernate.getFirstName()%> ">									
							<%
								}
							%>
						</datalist>
						</div>
					</div>
	
					 <div class="col-sm-2">
						<label class="control-label">Date :<sup>*</sup></label>
						<%
					  			SimpleDateFormat simpleDateFormatC = new SimpleDateFormat("yyyy-MM-dd");
					  			String todayDateC = simpleDateFormatC.format(new Date());
					  	%>
					</div>
					<div class="col-sm-3">
						<div class="selectContainer">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
								<input type="date" id='clientQuotDate' name="clientQuotDate" value="<%= todayDateC%>" class="form-control" placeholder=" Select Date">
							</div>
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Company Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i> </span>
						 <input type="text" id='clientCompanyName' name="clientCompanyName" class="form-control" placeholder="Company Name">
						</div>
					</div>
					
					
					<div class="col-sm-2">
						<label class="control-label">Company Address&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i> </span>
							
							<textarea id='clientCompanyAddress' name="clientCompanyAddress" class="form-control" placeholder="Company Address" rows="1" cols="10"></textarea>
							
							<!--  <input type="text" id='companyaddress' name="companyaddress" class="form-control" placeholder="Enter Company Address"> -->
						</div>
					</div>
				</div>
		
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">State&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i> </span>
					 <input type="text" id='clientState' name="clientState" class="form-control" placeholder="State Name">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Zip Code&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i> </span>
						 <input type="text" id='clientZip' name="clientZip" class="form-control" maxlength="6" onkeypress="return isNumber(event)" placeholder="Enter Zip Code">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Phone No.&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-phone"></i> </span>
					 <input type="text" id='clientPhoneno' name="clientPhoneno" maxlength="10" onkeypress="return isNumber(event)" class="form-control" placeholder="Enter Phone No">
						</div>
					</div>
					
					<div class="col-sm-2">
					   <label class="control-label">Document Attach&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-pencil"></i> </span>
							<input type="file" id='clientUploadFile' name="clientUploadFile" class="form-control" placeholder="upload File .pdf">
						</div>
					 </div>
				</div>


				<div class="row form-group">
				
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label" for="employeename">Product Name&nbsp;:<sup>*</sup></label>
					</div>
				<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-pencil"></i></span>
							<%
								ProductDetailsDao dao2 = new ProductDetailsDao();
								List productList = dao2.getAllProductNames();
							%>
<!-- 							<input list="productNameList" id="fk_product_id" class="form-control" onchange="getProductListForQuotation()"> -->
<!-- 							<datalist id="productNameList"> -->
							<input list="productNameList" id="fk_product_id" class="form-control" placeholder="Select Product Name" onchange="clientQuotaionGrid();clearClientCalculation()">
							<datalist id="productNameList">
								<%
									for (int i = 0; i < productList.size(); i++) {
									ProductDetailsHibernate sup = (ProductDetailsHibernate) productList.get(i);
								%>
								<option data-value="<%=sup.getPkProductDetailsId()%>" value="<%=sup.getProductName()%>">
									<%
										}
									%>								
							</datalist>

							
						</div>
					</div>
	
					<div class="col-sm-2">
						<label class="control-label">Features&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-home"></i></span>
							<textarea rows="1" cols="15" id='clientFeatures' name="clientFeatures" class="form-control" placeholder="Enter Features"></textarea>
						</div>
					</div>
				</div>			
			
			
             <!--   <div class="row">
				<div class="form-group">
					<div class="col-md-2 col-sm-offset-1" align="right">
					   <label class="control-label">Description Detail&nbsp;:<sup>*</sup></label>
					</div>
					
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-pencil"></i></span>
							<textarea id='productName' name="productName" class="form-control" placeholder="Product Name" onchange="clientQuotaionGrid()" rows="1" cols="2"></textarea>
						</div>
					</div>
					
					<div class="col-md-8">
					<div class="input-group">
							<span class="input-group-addon"> <i class="glyphicon glyphicon-hand-right"></i></span>	
							<textarea id="taskInText" rows="3" cols="50" class="form-control" onchange="getGridForProductDescription();clearCalculation();clearField()" placeholder="Enter Description"></textarea>
						</div>
					</div> 
				</div>
			</div>  -->
		
			<div class="row form-group">
				<div class="table-responsive row" style="padding-top: 20px; padding-bottom: 15px; margin-left: 0px;">			
					<table id="productGrid" ></table>
					<div id="jqGridPager1"></div>
				</div>
			</div>
				<!--   <div class="table-responsive	row col-md-offset-1" style="margin-left: 327px;">
						<table id="list4" ></table>
						<div id="jqGridPager"></div>
				  </div> -->
			  
		        <div class="row form-group"> </div>
		      		<div class="row form-group" style="margin-top:15px;">
		      			<div class="col-sm-2 col-md-offset-6">
							<label class="control-label"  for="subTotal"><h4><b>Total Sub Total&nbsp;:&nbsp;&nbsp;</b></h4></label>  
			           	 </div>
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
	              				<input readonly="readonly" id="clientTotalSubTotal" name="clientTotalSubTotal"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>
            	
            	<div class="row form-group"> </div>
		      		<div class="row form-group" style="margin-top:15px;">
		      			<div class="col-sm-2 col-md-offset-6">
							<label class="control-label"  for="subTotal"><h4><b>Total Tax Amount&nbsp;:&nbsp;&nbsp;</b></h4></label>  
			           	</div>
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
	              				<input readonly="readonly" id="clientTotalTaxAmount" name="clientTotalTaxAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>	
            		
            <!-- 	<div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
						<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>Discount&nbsp;:&nbsp;&nbsp;</b></h4></label>  
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
						<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>GST&nbsp;:&nbsp;&nbsp;</b></h4></label>  
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
								<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
	              				<input readonly="readonly" id="gstAmount" name="gstAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>	 -->
              		     	
           		 <div class="row form-group" > </div>
		     		<div class="row form-group" style="margin-top:15px;">
		     			<div class="col-sm-2 col-md-offset-6">
							<label class="control-label"  for="grossTotal"><h4><b>Gross Total&nbsp;:&nbsp;&nbsp;</b></h4></label>  
			           	 </div>
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-rupee" style="font-size:18px"></i></span>
	              					<input readonly="readonly" id="clientGrossTotal" name="clientGrossTotal"  class="form-control input-md" type="text" style="font-size: 20px;  height: 55px;">
	            			</div>
	            		</div>         
            		</div>
		
		  
		<div align="center">
			<div class="col-md-12">
	            <input type="button" id="btn1" name="btn1" class="btn btn-success btn-lg btnn "  onclick="clientQuotationValidation(); return false;" value="Print">
			    <input type="reset" id="btn1" name="btn1" class="btn btn-danger btn-lg btnn "  onclick="resets2()" value="Cancel">
			    <input type="button" id="btn1" name="btn1" class="btn btn-primary btn-lg btnn " value="Report" onclick="ClientQuotationReport()">
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
</div>
<%
}
%>
</body>
</html>
<%@include file="commons/newFooter.jsp" %>


