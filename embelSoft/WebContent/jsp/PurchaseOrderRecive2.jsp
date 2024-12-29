<%@page import="com.embelSoft.hibernate.VendorDetailsHibernate"%>
<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.VendorDetailsDao"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>

<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	
	<link href="/staticContent/css/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
	<link href="/staticContent/css/ui.jqgrid.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
	<link href="/staticContent/css/ui.jqgrid.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>
	<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
	<link rel="stylesheet" href="/embelSoft/staticContent/css/tabDemo.css">
	<link href="/staticContent/css/ui.jqgrid.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
	<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
	
	 <script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-3.1.0.min.js"></script>
	
	 <script type="text/javascript" src="/staticContent/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
	

		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/cupertino/jquery-ui.css" type="text/css"/>
		<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
		<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.min.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
		<link href="/staticContent/css/ui.jqgrid.min.css" rel="stylesheet" type="text/css"/>
        
         <script src="/embelSoft/staticContent/js/purchaseOrderDetails.js"></script>
         
         <script type="text/javascript">

     
     
     
         <script src="/embelSoft/staticContent/js/purchaseOrderDetails.js"></script>

<body>
<div class="container-fluid" > 
<div class="row" style="min-height:300px;">
    <div  class="col-md-12">
        <h3>Left Tabs</h3>
        <hr/>
        <div class="col-md-2">
            <ul class="nav nav-tabs">
                <li class=""><a href="#messages" data-toggle="tab">Vendor Purchase Recivce</a></li>
                <li><a href="#settings" data-toggle="tab">Client Purchase Recivce</a></li>
            </ul>
        </div>
				<div class="col-xs-9">
					<!-- Tab panes -->
					<div class="tab-content">



						<!------------ Vendor Purchase Recivce ---------->
<div class="tab-pane active" id="messages">
  <form class="form-horizontal" method="post" action="" name="vendor">
   	    	 <div class="row">
			    <div align="center">
			  		<h2 class="form-name style_heading">Vendor Purchase Recivce</h2>
			  	</div>
		     <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		    </div>


				<div class="row">
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Type:</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user "></i>
								</span>
							<input type="text" id='type' name="type" class="form-control" value="Vendor" readonly="readonly" />
							</div>
						</div>


						
					</div>
				</div>

				<div class="row form-group">
					<label class="col-md-3 control-label" for="employeename">Vendor Name<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
							<%
							VendorDetailsDao sdd3 = new VendorDetailsDao();
							List sList4 = sdd3.getAllVendorNames();
							%>
							<input list="vendorNameList" id="fk_vendor_id" class="form-control">
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
				
						<div class="col-sm-2" align="right">
							<label class="control-label">Bill/Challan No.<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span> 
							<input type="text" id='billnumber' name="billnumber" class="form-control" placeholder="Enter Enquiry Bill Number" />
							</div>
						</div>
					</div>
				
				<div class="row">
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Purchase Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
							<input type="date" id='purchasedate' name=purchasedate class="form-control">
							</div>
						</div>


						<div class="col-sm-2" align="right">
							<label class="control-label">Expect Payment Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
						 <input type="date" id='expectpaymentdate' name="expectpaymentdate" class="form-control" />
							</div>
							
						</div>
						
					</div>
				</div>
				
				
				<div class="row">
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Product Name:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-pencil "></i>	
								</span>
							<input type="text" id='productname' name="productname" class="form-control" onchange="getGridForProduct()" />
							</div>
						</div>


						
					</div>
				</div>
								
			 <div class="table-responsive	row col-md-offset-1">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
		 	 </div>

      
          		<div class="row form-group">
					<label class="col-md-offset-8 col-md-1 control-label"  for="grossTotal1"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal1" name="grossTotal1" placeholder="Gross Total" class="form-control input-md"  type="text" style="font-size: 25px;  height: 55px;" >
	            			</div>
	            		</div>
            	</div>
	     <div class="row form-group ">
  		<div class="container" align="center">
				<input type="button" style="height: 65px; width: 225; font-size: 25" class="btn btn-success btn-lg" value="Save" name="btn" onclick="purchaseOrderDetailasValidation()"> 
				<input type="button" style="height: 65px; width: 225; font-size: 25" class="btn btn-danger btn-lg" value="Cancel" onclick="reset()">
				<input type="button" style="height: 65px; width: 225; font-size: 25" value="List" id="listBtn" class="btn btn-primary btn-lg" onclick="purchaseOrderList()">
			</div>
        </div>  
        </form>
        
	   
 </div>


     <!------------------ Client Purchase Recivce ------------>
<div class="tab-pane" id="settings">
  <form class="form-horizontal" method="post" action="" name="client">
   	    	 <div class="row">
			    <div align="center">
			  		<h2 class="form-name style_heading">Client	 Purchase Recivce</h2>
			  	</div>
		     <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		    </div>


				<div class="row">
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Type:</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user "></i>
								</span>
							<input type="text" id='type' name="type" class="form-control" value="Client" readonly="readonly" />
							</div>
						</div>

				</div>
				</div>

				<div class="row form-group">
					<label class="col-md-3 control-label" for="employeename">Client Name<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
							<%
								ClientEnquiryDao ced3 = new ClientEnquiryDao();
								List listt = ced3.getAllClientName();
							%>
							<input list="clientNameList" id="fk_client_id" class="form-control">
							<datalist id="clientNameList">
								<%
									for (int i = 0; i < listt.size(); i++) {
										ClientEnquiryHibernate cep = (ClientEnquiryHibernate) listt.get(i);
								%>

								<option data-value="<%=cep.getPkClientEnquiryId() %>"
								value="<%=cep.getFirstName() %>">

									<%
										}
									%>
								
							</datalist>
						</div>
					</div>
				
						<div class="col-sm-2" align="right">
							<label class="control-label">Bill/Challan No.<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span> 
							<input type="text" id='billnumber' name="billnumber" class="form-control" placeholder="Enter Enquiry Bill Number" />
							</div>
						</div>
					</div>
				
				<div class="row">
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Purchase Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
							<input type="date" id='purchasedate' name=purchasedate class="form-control">
							</div>
						</div>


						<div class="col-sm-2" align="right">
							<label class="control-label">Expect Payment Date:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-calendar"></i>
								</span>
						 <input type="date" id='expectpaymentdate' name="expectpaymentdate" class="form-control" />
							</div>
							
						</div>
						
					</div>
				</div>
				
				
				<div class="row">
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-1" align="right">
							<label class="control-label">Product Name:<sup>*</sup></label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-pencil "></i>	
								</span>
							<input type="text" id='productname' name="productname" class="form-control" onchange="getGridForProduct()" />
							</div>
						</div>

					</div>
				</div>
								
			 <div class="table-responsive	row col-md-offset-1">
				<table id="list4" ></table>
				<div id="jqGridPager"></div>
		  	</div>

      
          		<div class="row form-group">
					<label class="col-md-offset-8 col-md-1 control-label"  for="grossTotal1"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal1" name="grossTotal1" placeholder="Gross Total" class="form-control input-md"  type="text" style="font-size: 25px;  height: 55px;" >
	            			</div>
	            		</div>
            	</div>
	     <div class="row form-group ">
        		<div class="container" align="center">
				<input type="button" style="height: 65px; width: 225; font-size: 25" class="btn btn-success btn-lg" value="Save" name="btn" onclick="purchaseOrderDetailasValidation()"> 
				<input type="button" style="height: 65px; width: 225; font-size: 25" class="btn btn-danger btn-lg" value="Cancel" onclick="reset()">
				<input type="button" style="height: 65px; width: 225; font-size: 25" value="List" id="listBtn" class="btn btn-primary btn-lg" onclick="purchaseOrderList()">
			</div>
        </div>  
        </form>
        
	   
 </div>

   </div>
  </div> 
 </div>
</div>
        <%@include file="commons/newFooter.jsp" %> 	
</div>
</body>
</html>		