<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.dao.PurchaseOrderReceivedDao"%>
<%@page import="com.embelSoft.bean.PurchaseOrderReceivedBean"%>
<%@page import="com.embelSoft.hibernate.PurchaseOrderReceivedHibernate"%>
<%@page import="com.embelSoft.dao.ProductDetailsDao"%>
<%@page import="com.embelSoft.hibernate.ProductDetailsHibernate"%>

<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<html>
<head>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>

<link rel="stylesheet" href="/embelSoft/staticContent/css/shree.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">

<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript"	src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
		     
<script src="/embelSoft/staticContent/js/purchaseOrderDetails.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
                 
<script type="text/javascript">

	function purchaseOrderList()
    	{
			//window.location = "PurchaseOrderReceiveList.jsp";
    		window.location = "PurchaseOrderReceivedList.jsp";
        }
      
</script> 
<script>
	function resets()
	{
		location.reload(true);
	}
</script>
<script>
	function lettersonly(input) 
	{
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
	function clearFiled()
	{
		document.getElementById("productname").value="";
	}
</script>

<style>
	.quo {
		font-weight:600;
		color: red; 
		font-family: digital-clock-font;
	}
</style>

</head>

	<%
String Hr;
SimpleDateFormat simpleformat = new SimpleDateFormat(" dd MM yyyy");

// displaying month in MMMM format
simpleformat = new SimpleDateFormat("MM yyyy");
String strMonth= simpleformat.format(new Date());
System.out.println("Month in MMMM format = "+strMonth);

String d1123 = strMonth.toString();	
String[] d = d1123.split(" ");
String year = d[1];
String month = d[0];
String HrBill = "RO"+"/"+month+"/"+year+"/"+"1";		
%>
<%
PurchaseOrderReceivedDao RBDao = new PurchaseOrderReceivedDao();
List bill = RBDao.getROCreateBill();

for(int i=0;i<bill.size();i++)
{
	PurchaseOrderReceivedHibernate bean = (PurchaseOrderReceivedHibernate)bill.get(i);
	
	Hr = bean.getBillNo();	//Jun/2020/22
	
	String[] HrBil = Hr.split("/");
	
	String lNo1 = HrBil[0];
	String lNo2 = HrBil[1];
	String lNo3 = HrBil[2];
	String lNo = HrBil[3];
	System.out.println("lNo1=="+lNo1+"=="+lNo2+"---"+lNo3+"====="+lNo);
	
	int lstNo = Integer.parseInt(lNo);		
	int LastNo = lstNo + 1;
	
	HrBill = "RO"+"/"+month+"/"+year+"/"+LastNo;
	
	System.out.println("IN All Billing proframa Billing Stop 1");
}
%>


<body>
<div class="container">
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading">Received PO</h2>
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
		<div class="form-group" align="right"></div>
	</div>
	<div align="right" id="RoBill">
		<h4 class="quo">Bill No :: <%= HrBill%></h4>
	</div>
	<div class="row">
		<div class="col-sm-offset-1 col-md-10" align="right">
			<hr style="border-top-color: #c1b1b1;">
		</div>
	</div>
	<div id="wrqpper">
		<form class="form-horizontal" name="product">
	<!-- 	<div class="form-group">
			<div class="col-sm-2 col-sm-offset-1" align="center">
				<label class="control-label" for="billType">Type&nbsp;:<sup style="color: red;">*</sup></label>
			</div>
			<div class="col-sm-4" >
				<div class="col-md-4 col-xs-6 ">
					<label class="radio-inline">
						<input type="radio" name="type" id="vendor" value="vendor" onclick="clearPurchaseOrderDetailas();getVendorName()" style=" margin-left: -70px;"/>
						<h4 style="margin-top: 0px;">Vendor</h4>
					</label>
				</div>
				<div class="col-md-6 col-xs-6 col-md-ffset-1 ">
					<label class="radio-inline">
						<input type="radio" name="type" id="client" value="client" onclick="clearPurchaseOrderDetailas();getClientName()" style="margin-left: -59px;"/>
						<h4 style="margin-top: 0px;">Client</h4>
					</label>
				</div>
			</div>						
		</div>	 --> 
		
		
		
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
					<label class="control-label" for="employeename">Vendor Name&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"><i	class="glyphicon glyphicon-user"></i></span>
							<%
								VendorDetailsDao sdd3 = new VendorDetailsDao();
								List sList4 = sdd3.getAllVendorNames();
							%>
						<input list="vendorNameList" id="fk_vendor_id" class="form-control" onchange="getPOBillNo()" placeholder="Select Vender Name">
						<datalist id="vendorNameList">
							<%
								for (int i = 0; i < sList4.size(); i++) {
								VendorDetailsHibernate sup = (VendorDetailsHibernate) sList4.get(i);
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
					<label class="control-label">Po No.&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-hand-right"></i>
						</span>
						<select  id='billno' name="billno" class="form-control" placeholder="Select PO No"  onchange="getPODate();getGridForRecivePO();clearCalculation();clearFiled()"></select> 
						<!-- <input type="text" id='billno' name="billno" class="form-control" placeholder="Enter Bill No."> -->
					</div>
				</div>
			</div>
		
		<!-- <div class="row">
			<div class="form-group">
				<div class="col-sm-2 col-sm-offset-1">
					<label class="control-label">Vendor Name&nbsp;:<sup>*</sup></label>
				</div>
					
				<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon"> <i class="glyphicon glyphicon-user"></i></span>
						<input list="vendorList_Drop" id="vendorName" class="form-control" placeholder="Select Vender Name">
							<datalist id="vendorList_Drop"></datalist>
						</div>
				</div>
				<div class="col-sm-2">
					<label class="control-label">Bill/Challan No.&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-hand-right"></i>
						</span> 
						<input type="text" id='billno' name="billno" class="form-control" placeholder="Enter Bill No.">
					</div>
				</div>
			</div>
		</div> -->
		
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
					<label class="control-label">Purchase Order Date&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="glyphicon glyphicon-calendar"></i>
						</span>
						<input type="date" id='purchasedate' name="purchasedate" class="form-control" placeholder="select date">
					</div>
				</div>
				<div class="col-sm-2">
						<label class="control-label">Payment Due Date&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-calendar"></i>
						</span>
					 	<input type="date" id='expectpaymentdate' name="expectpaymentdate" class="form-control" placeholder="select date">
					</div>
				</div>
			</div>
		
			<div class="row form-group">
				<div class="col-sm-2 col-sm-offset-1">
					<label class="control-label">Product Name :<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon"> <i	class="glyphicon glyphicon-pencil"></i></span>
						
						
							<%
								ProductDetailsDao sdd4 = new ProductDetailsDao();
								List sList5 = sdd4.getAllProductNames();
							%>
						<input list="productNameList" id="productName" name="productName" class="form-control" onchange="getGridForRecivePO();clearCalculation();clearFiled()">
						<datalist id="productNameList">
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
						
						
						<!-- <select  id='productName' name="productName" class="form-control" onchange="getGridForRecivePO();clearCalculation();clearFiled()" placeholder="Enter Product Name"></select> -->
						
						<!-- <textarea rows="1" cols="10" id='productName' name="productName" onchange="getGridForRecivePO();clearCalculation();clearFiled()" class="form-control" placeholder="Enter Product Name"></textarea> -->
					</div>
				</div>
			</div>
		
		<div class="row form-group">
			<div class="table-responsive row" style="padding-top: 20px; padding-bottom: 15px; margin-left: 0px;">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
			</div>
		</div>
		
		<!-- 	<div class="form-group">
				<div class="col-md-2 col-sm-offset-1" align="right">
					<label class="control-label">Product Name&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-md-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-hand-right"></i>
						</span>
						<textarea rows="1" cols="25" id='productname' class="form-control" placeholder="Enter Product Name"  onchange="getGridForProductInRecive();clearCalculation();clearFiled()"></textarea>
					</div>
				</div>				
			</div>
			<div class="table-responsive	row col-md-offset-1" style="margin-left: 20px;">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
		 	</div> -->
	        <div class="row form-group"> </div>
		    <div class="row form-group">
				<div class="col-sm-2 col-md-offset-6">
					<label class="control-label"  for="totalSubTotal"><h4><b>Total SubTotal&nbsp;:&nbsp;&nbsp;</b></h4></label>
			    </div>
			    <div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-rupee" style="font-size:18px"></i>
						</span>
	              		<input readonly="readonly" id="totalSubTotal" name="totalSubTotal"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;" placeholder="Total SubTotal">
	            	</div>
	            </div>
           	</div>
           	
           	<div class="row form-group"> </div>
		    <div class="row form-group" style="margin-top:15px;">
		    	<div class="col-sm-2 col-md-offset-6">
		    		<label class="control-label"  for="totalTaxAmount"><h4><b>Total Tax Amount&nbsp;:&nbsp;&nbsp;</b></h4></label>
			    </div>
			    <div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-rupee" style="font-size:18px"></i>
						</span>
	              		<input readonly="readonly" id="totalTaxAmount" name="totalTaxAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;" placeholder="Total Tax Amount">
	            	</div>
	            </div>
           	</div>
           	
	 		<!--  <div class="row form-group"> </div>
		     <div class="row" style="margin-top:15px;">
				<label class="col-md-2 col-md-offset-6 control-label"  for="gst"><h4><b>GST&nbsp;:&nbsp;&nbsp;</b></h4></label>  
				<div class="col-md-1" style=" width: 120px;">
					<div class="input-group">
						<span class="input-group-addon">%</span>
	              		<input id="gst1" name="gst1" value="0" placeholder="gst"  class="form-control input-md" type="text" onkeypress="return isNumber(event)" style="font-size: 20px;  height: 35px;" onchange="getGstAmountTotal()" >
	            	</div>
				</div>
				<div class="col-md-2" style=" width: 180px;">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-rupee" style="font-size:18px"></i>
						</span>
	              		<input readonly="readonly" id="gstAmount" name="gstAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            	</div>
	            </div>            		
            </div>  -->
       <!--      		
            		 <div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="gstAmount"><h4><b>Gst Amount :</b></h4></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="gstAmount" name="gstAmount"  class="form-control input-md" type="text" style="font-size: 25px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>	
            		 -->
            		     		
            <div class="row form-group"> </div>
		    <div class="row form-group" style="margin-top:15px;">
		    	<div class="col-sm-2 col-md-offset-6">
		    		<label class="control-label"  for="grossTotal"><h4><b>Gross Total&nbsp;:&nbsp;&nbsp;</b></h4></label>  
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-rupee" style="font-size:18px"></i>
						</span>
	              		<input readonly="readonly" id="grossTotal" name="grossTotal"  class="form-control input-md" type="text" style="font-size: 20px;  height: 55px;" placeholder="Gross Total">
	            	</div>
	            </div>
            </div>
		
		<div align="center">
			<div class="col-md-12">
				<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="btn" onclick="receivedPOValidation()"> 
				<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="resets()" onclick="reset()">
				<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="purchaseOrderList()">
			</div>
		</div>
	</form>
	</div>
</div>
</body>
<script type="text/javascript">
	function clearCalculation()
	{
		document.product.gst1.value="0";
		document.product.gstAmount.value="0";
	}
</script>
</html>
<%@include file="commons/newFooter.jsp"%>
		   	