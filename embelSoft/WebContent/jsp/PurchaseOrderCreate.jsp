<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.dao.PurchaseOrderDao" %>
<%@page import="com.embelSoft.bean.PurchaseOrderCreateBean" %>

<%@page import="com.embelSoft.dao.ProductDetailsDao" %>
<%@page import="com.embelSoft.hibernate.ProductDetailsHibernate" %>

<%@page import="com.embelSoft.dao.ResourceBillingDao" %>
<%@page import="com.embelSoft.bean.ResourceBillingBean" %>

<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>

<html>
<head>

<link rel="stylesheet" href="/embelSoft/staticContent/css/shree.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet"	href="/embelSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">

<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>	
		
<script src="/embelSoft/staticContent/js/purchaseOrderDetails.js"></script>

<link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
<script src="sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">	
	
<script>
	function PurchaseOrderCreateReport()
	{
		window.location="purchaseOrderListNew.jsp";
	}
	
	function editPurchaseOrderCreateReport()
	{
		window.location="PurchaseOrderEdit.jsp";
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
	function clearCalculation()
	{
		document.po.gst.value="";
		document.po.vat.value="";
		document.po.grossTotal.value="";			
	}
</script>
<script type="text/javascript">
	function clearFiled()
	{
		document.getElementById("productdescription").value="";
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
	    String PoBill;

		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		
		String d1 = dateobj.toString();
		
		System.out.println("FULL DATE  !!!!!!!!!!!!!!!!!  ::  "+d1);
		
		String[] d = d1.split(" ");
		
		String year = d[5];
		
		String month = d[1];
		
/* 		String yr = year[2]+""+year[3];
		
		int yr1 = Integer.parseInt(yr);
		int yr2 = yr1+1;
 		
		String year2 = yr1+"-"+yr2;
*/		
		String poNo = "PO"+"/"+year+"/"+month+"/"+001;
		
	/* Long PoBill = 1L;
	//out.println(HrBill); */
	
%>
<%
	PurchaseOrderDao poDao = new PurchaseOrderDao();
	List bill = poDao.getPOCreateBill();

	for(int i=0;i<bill.size();i++)
	{
		PurchaseOrderCreateBean bean = (PurchaseOrderCreateBean)bill.get(i);
		PoBill = bean.getBillNo();
		System.out.println("IN JSP PoBill :- "+PoBill);
		
		String[] billNo = PoBill.split("/");
		
		int ltNo =Integer.parseInt(billNo[3]);
		System.out.println("IN JSP ltNo :- "+ltNo);
		int lastNo = ltNo+1;
		System.out.println("IN JSP lastNo :- "+lastNo);
		
		poNo = "PO"+"/"+year+"/"+month+"/"+lastNo;
		System.out.println("IN JSP poNo :- "+poNo);
		
	}	 
%>
<body>
<!-- <div class="container"> -->
<div class="container">
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading">Purchase Order</h2>
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
	
	<!--  <div class="row">
		<div class="form-group" align="right">
		
		</div>
	</div> -->
	
	
	
	<%-- <div class="row">
	
	<div align="right" id="billno">
		<h4 class="quo">Bill No :: <%= poNo%></h4>
	</div>   
	
	</div> --%>
	
	<div class="row">
		<div class="col-sm-offset-1 col-md-10" align="right">
				<hr style="border-top-color: #c1b1b1;">
		</div>
	</div>
	
	
	
	</div>
	
	
	
	
	
	
	<div class="container">
	
	
	<div align="right" id="billno">
		<h4 class="quo">Bill No :: <%= poNo%></h4>
	</div> 
	
	
	
	
	 <div class="row"> 
	
<div id="wrqpper">
	<form class="form-horizontal" action=""  name="po">
	
	
		<div class="row">
			<div class="form-group">
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
						<input list="vendorNameList" id="fk_vendor_id" class="form-control" onchange="getVendorDetails()">
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
					<label class="control-label">Vendor Company Name&nbsp;:<sup>*</sup></label>
				</div>
				<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right "></i>
							</span> 
							<input type="text" id='vendorcompanyname' name="vendorcompanyname" class="form-control" placeholder="Vendor Company Name">
						</div>
				</div>
			</div>
		</div>

			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Contact No&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span>
						 <input type="text" id='contactno' name="contactno" class="form-control" maxlength="10" onkeypress="return isNumber(event)" placeholder="Enter Contact No">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Vendor Address&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-home"></i>
							</span>
					 <input type="text" id='streetaddress' name="streetaddress" class="form-control" placeholder="Enter Vendor Address">
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Company Address&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<textarea rows="2" cols="10", id='companyAddress' name="companyAddress" class="form-control" placeholder="Enter Company Address"></textarea>
						 <!-- <input type="text" id='companyAddress' name="companyAddress" class="form-control" placeholder="Enter Company Address"> -->
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">GST/TIN Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
					 <input type="text" id='gstinNumber' name="gstinNumber" class="form-control" placeholder="Enter GSTIN Number">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">PAN No&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='panNumber' name="panNumber" class="form-control" placeholder="Enter Pan Number">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">CIN Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
					 <input type="text" id='cinNumber' name="cinNumber" class="form-control" placeholder="Enter CIN Number">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">State&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right "></i>
							</span>
						 <input type="text" id='city' name="city" onkeypress="return isAlphabetsWithSpace(event)" class="form-control" placeholder="Enter City">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">Zip Code&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
					 <input type="text" id='zipcode' name="zipcode"	class="form-control" maxlength="6" onkeypress="return isNumber(event)" placeholder="Enter Zip Code">
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Phone&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"><i	class="glyphicon glyphicon-phone-alt"></i></span>
						 <input type="text" id='phone' name="phone"	class="form-control" maxlength="10" placeholder="Enter Phone Number" onkeypress="return isNumber(event)">
						</div>
					</div>
				
				
			
					<div class="col-sm-2">
						<label class="control-label">Fax&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
						 <input type="text" id='fax' name="fax"	class="form-control" placeholder="Enter Fax Number">
						</div>
					</div>
				</div>
				
		   </div>
		   
	 	<div class="row">
			<div class="form-group">
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
						<input list="productNameList" id="productName" name="productName" class="form-control" onchange="getPurchaseGrid()">
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
					</div>
				</div>
			</div>
		</div> 
		
		<div class="row form-group">
			<div class="table-responsive row" style="padding-top: 20px; padding-bottom: 15px; margin-left:0px;"">
				<table id="jqgrid" ></table>
				<div id="jqGridPager"></div>
			</div>		
		</div>
		   
		 <!-- 	<div class="row">
				 <div class="form-group">
					<div class="col-md-2 col-sm-offset-1">
						<label class="control-label">Product Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-8">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<textarea rows="2" cols="40" id='productdescription' class="form-control" placeholder="Enter Product Name" onchange="getGridForProduct();clearCalculation();clearFiled()"></textarea>
						</div>
					</div>
		   </div>   -->
		   
		   
		   
		     
		   
		  
		    <!-- <div class="table-responsive	row col-md-offset-1" style="margin-left: 0px;">
				<table id="product_grid" ></table>
				<div id="jqGridPager"></div>
		  </div>  -->
		  
		  
		
		  
		  
		  
		  
		  
		  
		  		  <div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
		      		<div class="col-sm-2 col-md-offset-6">
						<label class="control-label"  for="totalSubTotal"><h4><b>Total Sub Total&nbsp;:&nbsp;&nbsp;</b></h4></label>  
			        </div>   	 
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="totalSubTotal" name="totalSubTotal"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>
            		
            		<div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
		      		<div class="col-sm-2 col-md-offset-6">
						<label class="control-label"  for="totalTaxAmount"><h4><b>Total Tax Amount&nbsp;:&nbsp;&nbsp;</b></h4></label>  
			       	</div>    	 
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="totalTaxAmount" name="totalTaxAmount"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
            		</div>
            		
            		<!-- <div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>GST&nbsp;:<sup>*</sup></b></h4></label>  
			           	 <div class="col-md-1" style=" width: 120px;">
							<div class="input-group">
							<span class="input-group-addon">
									%
								</span>
	              				<input id="gst" name="gst" value="0" placeholder="gst"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;"  onchange="getVatTotal()">
	            			</div>
	            		</div>
	            		
	            		
	            		<div class="col-md-2" style=" width: 180px;">
							<div class="input-group">
							<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="vat" name="vat"  class="form-control input-md" type="text" style="font-size: 20px;  height: 35px;">
	            			</div>
	            		</div>
	            		
            		</div> -->
		  
<!-- 		  
			  <div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
					<label class="col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gst Amount:</b></h4></label>  
			           	 <div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="vat" name="vat"  class="form-control input-md" type="text" style="font-size: 20px;  height: 40px;">
	            			</div>
	            		</div>
            		</div> -->
		  
		  
		        <div class="row form-group"> </div>
		      		<div class="row" style="margin-top:15px;">
		      		<div class="col-sm-2 col-md-offset-6">
						<label class="control-label"  for="grossTotal"><h4><b>Gross Total&nbsp;:&nbsp;&nbsp;</b></h4></label>  
			       	</div>
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">
									 <i class="fa fa-rupee" style="font-size:18px"></i>
								</span>
	              				<input readonly="readonly" id="grossTotal" name="grossTotal"  class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
            		</div>	
            		
            		
		<!-- </div> -->
		   
		   
		   
		   
		   
		   
		   
		   
		   <!-- <div class="row form-group"></div>
		   <div class="row form-group"></div>
		   <div class="row form-group"></div> -->
			<!-- <div class="container" align="center"> -->
			
			<br>
			<br>
			
			<div align="center">
				<!-- <div class="col-md-10"> -->
				<div class="col-md-12">
					<input type="button" class="btn btn-success btn-lg btnn" value="Print" name="btn" onclick="purchaseOrderCreateValidation()"> 
					<input type="button" class="btn btn-danger btn-lg btnn" onclick="resets()" value="Cancel" onclick="reset()">
					<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="PurchaseOrderCreateReport()">
					<input type="button" class="btn btn-primary btn-lg btnn" value="Edit" onclick="editPurchaseOrderCreateReport()">
				</div>
			</div>
	</form>
	</div>
	
	
	
	</div> 
	
	
	
	
</div>

</body>
<script type="text/javascript">

	function afterCalculation()
	{
		

		alert("subTotal" +subTotal);
		vatValue = (gst)*(subTotal)/100;
		
		document.getElementById('vat').value=vatValue;
		
		
		var grossTotal = +subTotal + +vatValue;
		
		document.getElementById('grossTotal').value=grossTotal;
		
	}

</script>
</html>

<%@include file="commons/newFooter.jsp"%>
		   	