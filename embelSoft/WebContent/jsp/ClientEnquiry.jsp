	<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.embelSoft.hibernate.ProductDetailsHibernate"%>
<%@page import="com.embelSoft.dao.ProductDetailsDao"%>
<%@page import="com.embelSoft.hibernate.ClientEnquiryHibernate"%>
<%@page import="com.embelSoft.dao.ClientEnquiryDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<html>
<head>

		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
		<link rel="stylesheet" href="/embelSoft/staticContent/css/jquery-ui.min.css">
		<link rel="stylesheet" href="/embelSoft/staticContent/css/ui.jqgrid.css">
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.min.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui-min.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery-ui.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jqueryUi.js"></script>
		<script type="text/javascript" src="/embelSoft/staticContent/js/jquery.jqgrid.min.js"></script>
    
        <script src="/embelSoft/staticContent/js/clientEnquiry.js"></script>
        <link href="/embelSoft/staticContent/css/StyleValidation.css" rel="stylesheet" type="text/css"/>
 		<script src="sweetalert2.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css">
		
	
        <script type="text/javascript">
          		 function clientEnquiryList()
          		 {
          		 	window.location = "clientEnquiryList.jsp";
          		 }
          		</script> 
        
        
        <script type="text/javascript">
          		 function clientResponseList()
          		 {
          		 	window.location = "clientResponseList.jsp";
          		 }
          		</script> 
          		
          		<script type="text/javascript">
					function editClientEnquiry()
					{
						window.location = "EditClientEnquiry.jsp";

					}

          		</script>
          		  		
          		<script type="text/javascript">
					function quotationPage()
					{
						window.location = "Quotation.jsp";

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
		
		        <script type="text/javascript">

				function checkForDuplicateEntry(){
          			<%
          			ClientEnquiryDao dao2 = new ClientEnquiryDao();
          			List list = dao2.getAllClientNames();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				ClientEnquiryHibernate   bean = (ClientEnquiryHibernate)list.get(z);
          			%>
          			var componentName = "<%=bean.getFirstName()%>";
          			var EmailID = "<%=bean.getEmailId()%>";
          			
          			var compName = document.getElementById("firstName").value;
          			var emailId = document.getElementById("emailId").value;
          			
          			var componentName1 = componentName.toLowerCase();
          			var compName1 = compName.toLowerCase();
          			var EmailID1 = EmailID.toLowerCase();
          			var emailId1 = emailId.toLowerCase();
          			
          			if((componentName1 == compName1 || componentName == compName) && (EmailID1 == emailId1 || EmailID == emailId)){
          				alert("This Client Name with same EmailId is already exist...Duplicate Not allowed");
          				document.clientEnqForm.reset(); 
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			}
          			
</script>
		
	<style>
		h2.form-name {
    		margin-top: 12px;
 			font-size: 25px;
    		font-weight: 600;
    		text-transform: uppercase;  
		}
		.leftmanu
		{
		    width: 190px;
		    background: #c50000a6;
		    color:  white;
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
            <ul class="nav nav-tabs">
                <li class=""><a class="leftmanu" href="#enquiry" data-toggle="tab">Client Details</a></li>
                <li><a class="leftmanu" href="#response" data-toggle="tab">Client Follow Up</a></li>
            </ul>
        </div>
				<div class="col-md-9">
					<!-- Tab panes -->
					<div class="tab-content">
					
					<!---------Client Enquiry ---------->
					
<div class="tab-pane active" id="enquiry">
  <!-- <form class="form-horizontal" method="post" action="" name="clientEnqForm"> -->
   	    <div class="container-fluid">
   	    	 <div class="row">
			    <div align="center">
			  		<h2 class="form-name">Client Details</h2>
			  	</div>
			</div>
		</div>
			  	
		<div class="container-fluid">
	
			<div class="form-group" align="right">
				<div class="col-sm-offset-8 col-md-4 control-label">
					<div id="date">
						<label id="demo1"></label>
						<script>
							   var date = new Date();
							   document.getElementById("demo1").innerHTML = date.toDateString();
							</script>
					</div>
				</div>
			</div>
	
		     <div class="row">
				     <div class="col-md-12">
						  <hr style="border-top-color:#c1b1b1;">
				     </div>	
 	</div>
 <div class="row">
 <div id="wrqpper">
 	<form class="form-horizontal" method="post" action="" name="clientEnqForm">		
				<div class="row form-group">
					<div class="col-sm-2 ">
						<label class="control-label">Client Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='firstName' name="firstName" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter First Name"/>
						</div>
					</div>
					<div class="col-sm-2">
						<label class="control-label">Enquiry Date&nbsp;:</label>
						<%
				SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
				String todayDate1 = simpleDateFormat1.format(new Date());
			%>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="date" id='enquiryDate' name="enquiryDate" value="<%= todayDate1%>" class="form-control" placeholder="Select Enquiry Date" />
						</div>
					</div>
					
				</div>


		<!-- 	<div class="row">
				<div class="form-group">
					<div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Last Name&nbsp;:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='lastName' name="lastName" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Last Name">
						</div>
					</div>

				<div class="col-sm-2">
						<label class="control-label">Middle Name&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='middleName' name="middleName" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Middle Name">
						</div>
					</div>
				</div>
			</div> -->
			
		
				<div class="row form-group">
					<div class="col-sm-2 ">
						<label class="control-label">Contact Number&nbsp;:&nbsp;&nbsp;<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='contactNo' name="contactNo" maxlength="10" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Contact Number">
						</div>
					</div>
					
				<div class="col-sm-2">
						<label class="control-label">Alternate Contact Number&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input type="text" id='alternativeContactNo' name="alternativeContactNo" maxlength="10" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Alternate Contact No">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2 ">
						<label class="control-label">Business Name&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-pencil"></i>
							</span> <input type="text" id='businessName' name="businessName" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Contact Person Name">
						</div>
					</div>

					<div class="col-sm-2">
						<label class="control-label">Business Address&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-home"></i>
							</span>
							<textarea id='businessAddress' name="businessAddress" class="form-control" placeholder="Enter Business Address" rows="3" cols="15"></textarea>
							
                            <!-- <input type="text" id='businessAddress' name="businessAddress" class="form-control" placeholder="Enter Business Address" /> -->
						</div>
					</div>
				</div>
			
				<div class="row form-group">

							
				<div class="col-sm-2 ">
						<label class="control-label">Email&nbsp;:<sup>*</sup></label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-envelope"></i>
							</span> <input type="text" id='emailId' name="emailId"
								class="form-control" placeholder="Enter Email Id">
						</div>
					</div>
									
					<div class="col-sm-2">
						<label class="control-label">GST No&nbsp;:&nbsp;&nbsp;<sup>*</sup></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='gst' name="gst" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Gst No">
						</div>
					</div>
				<%-- <div class="col-sm-2">
						<label class="control-label">Product Name&nbsp;:</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
							<%
								ProductDetailsDao sdd3 = new ProductDetailsDao();
								List sList4 = sdd3.getAllProductNames();
							%>
							<input list="productNameList" id="productName" class="form-control" >
							<datalist id="productNameList">
								<%
									for (int i = 0; i < sList4.size(); i++) {
									ProductDetailsHibernate sup = (ProductDetailsHibernate) sList4.get(i);
								%>

								<option data-value="<%=sup.getPkProductDetailsId()%>"
								value="<%=sup.getProductName()%>">

									<%
										}
									%>
								
							</datalist>
						</div>
					</div> --%>
					
				</div>
			
				<div class="row form-group">
					<div class="col-sm-2">
						<label class="control-label">City&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='city' name="city" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter City">
						</div>
					</div>
					
					<div class="col-sm-2">
						<label class="control-label">State&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='state' name="state" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter State">
						</div>
					</div>
				</div>
			
				<div class="row form-group">
					
					<div class="col-sm-2">
						<label class="control-label">Country&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='country' name="country" onkeypress="return isAlphabets(event)"
								class="form-control" placeholder="Enter Country">
						</div>
					</div>
					
				<div class="col-sm-2">
						<label class="control-label">Zip Code&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='zipcode' name="zipcode" maxlength="6" onkeypress="return isNumber(event)"
								class="form-control" placeholder="Enter Zip Code">
						</div>
					</div>
					
					
				</div>
			
			 <div class="row form-group">
						
					<!-- <div class="col-sm-2 col-sm-offset-1">
						<label class="control-label">Reference By&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span> <input type="text" id='referenceBy' name="referenceBy"
								class="form-control" placeholder="Enter Reference By">
						</div>
					</div> -->

			<!-- <div class="col-sm-2">
						<label class="control-label">GST No&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='gst' name="gst"
								class="form-control" placeholder="Enter Gst No">
						</div>
					</div> -->
					
					
				</div>
			
			
				
			<!-- <div class="row">
				<div class="form-group">

			
			<div class="col-sm-2 col-sm-offset-1">
                 <label class="control-label">Upload PDF File&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon">
							<i class="glyphicon glyphicon-pencil"></i>
							</span>
						  <input type="file" id='uploadFile' name="uploadFile" class="form-control" placeholder="upload File .pdf">
					 	</div>
					 </div>
					<div class="col-sm-2">
						<label class="control-label">Comment&nbsp;:&nbsp;&nbsp;</label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id='comment' name="comment"
								class="form-control" placeholder="Enter Comment">
						</div>
					</div> 
					 
				</div>
			</div> -->
			
	<br>
	<br>
			<div align="center">
				<div class="col-md-12">
					<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="btn" onclick="checkForDuplicateEntry(); return clientEnquiryDetail();"> 
					<input type="button" class="btn btn-danger btn-lg btnn" value="Cancel" onclick="reset()">
					<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="clientEnquiryList()">
					<input type="button" value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="editClientEnquiry()">
					<!-- <input type="button"  value="Edit" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="edit()"> -->
				</div>
			</div>
		</form>
		</div>
		</div>
		</div>
	</div>


	
	  <!----------------Client Response ------------>
       <div class="tab-pane" id="response">
		<!-- <form class="form-horizontal" method="post" action="" name="clientResponseForm"> -->
		<div class="container-fluid">
			<div class="row">
			    <div align="center">
			  		<h2 class="form-name style_heading">Client Follow Up</h2>
			  	</div>
			</div>
		</div>
			  	
		<div class="container-fluid">
			<div class="form-group" align="right">
				<div class="col-sm-offset-8 col-md-4 control-label">
					<div id="date">
						<label id="demo"></label>
						<script>
							   var date = new Date();
							   document.getElementById("demo").innerHTML = date.toDateString();
						</script>
					</div>
				</div>
			</div>
			  	
			  	
		     <div class="row">
				 <div class="col-md-12">
						<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		    
  <div class="row">
  <div id="wrqpper">
  	 <form class="form-horizontal" method="post" action="" name="clientResponseForm">
 		<div class="row form-group">
 			<div class="col-sm-2 ">
				<label class="control-label" for="employeename" style="text-align:  right;">Client Name&nbsp;:<sup>*</sup></label>
			</div>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
	
							<%
								ClientEnquiryDao dao = new ClientEnquiryDao();
								List list1 = dao.getAllClientNames();
								
							%>
							
							<input list="clientNameList" id="fk_client_id" class="form-control" onchange="getClientDetails()">
							<datalist id="clientNameList">
								<%
									for (int i = 0; i < list1.size(); i++) {
										ClientEnquiryHibernate sup = (ClientEnquiryHibernate) list1.get(i);
								%>

								<option data-value="<%=sup.getPkClientEnquiryId() %>"
								value="<%=sup.getFirstName() %>">

									<%
										}
									%>
								
							</datalist>
						</div>
					</div>
		
						<div class="col-sm-2">
							<label class="control-label">Business Name&nbsp;:&nbsp;&nbsp;</label>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-pencil"></i>
								</span> 
							<input type="text" id='businessName1' name="businessName1" class="form-control" placeholder="Enter Business Name" />
							</div>
						</div>
       			</div> 

		
		<div class="row form-group">
			<div class="col-sm-2 ">
				<label class="control-label" for="employeename" style="text-align:  right;">Contact Person Name&nbsp;:&nbsp;&nbsp;</label>
			</div>
						<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>
							 <input type="text" id='contactPersonName' name="contactPersonName" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Contact Person Name" />
						</div>
					</div>



					<div class="col-sm-2">
						<label class="control-label">Product Name&nbsp;:<sub>*</sub></label>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span> 
								<%
							ProductDetailsDao sdd4 = new ProductDetailsDao();
								List sList5 = sdd4.getAllProductNames();
							%>
						<input list="productNameList" id="productName1" name="productName1" onkeypress="return isAlphabetsWithSpace(event)" class="form-control">
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
							<!-- <input type="text" id='productName1' name="productName1" onkeypress="return isAlphabetsWithSpace(event)"
								class="form-control" placeholder="Enter Product Name"> -->
						</div>
					</div>
				
			</div>
			
			
		<div class="row form-group">
			 <div class="col-sm-2">
				<label class="col-sm-3 control-label" style="text-align: right;">Client Response&nbsp;:<sup>*</sup></label>
			</div>
			<div class="col-md-3">
				<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-hand-right"></i>
				</span>
					<select class ="form-control" id="clientResponse" name="clientResponse">
					<!-- 	<option selected="selected">---select---</option> -->
						<option value="">--Select Response--</option>
						<option value="Reject">Reject</option>
						<option value="Approve">Approve</option>
						<option value="Followup">Follow Up</option>
					</select>
			
				</div>			
			</div>
			
			<!-- <div id="followUpDate"> -->
					<div class="col-sm-2">
						<label class="control-label">Follow Up Date&nbsp;:<sup>*</sup></label>
						<%
					  			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					  			String todayDate = simpleDateFormat.format(new Date());
					  		%>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<span class="input-group-addon"> 
							<i class="glyphicon glyphicon-calendar"></i>
							</span>
                            <input type="date" id='clientFollowUpDate' name="clientFollowUpDate" value="<%= todayDate%>" class="form-control" placeholder="Select Enquiry Date" />
						</div>
					</div>
			
			
			<script type="text/javascript">

			$(document).ready(function(){

				$('#clientResponse').change(function(){
					$(this).find("option:selected").each(function(){
						if($(this).attr("value")=="Followup"){
								$('#followUpDate').show();
							}

						else
							{
								$('#followUpDate').hide();
							}
					});
				}).change();
			});
				

			</script>
			</div>
	

					<div class="row form-group">
						<div class="col-sm-2 ">
							<label class="control-label">Response Detail&nbsp;:&nbsp;&nbsp;</label>
						</div>
						<div class="col-md-8">
						<div class="input-group">
						
						<span class="input-group-addon"> <i
								class="glyphicon glyphicon-hand-right"></i>
							</span>
							<textarea id="taskInText" class="form-control" rows="3" cols="100" placeholder="Enter Response Details"></textarea>
						</div>
						</div>
					</div>
	                <br>
	                <br>
					<div class="col-md-12" align="center">
						<!-- <input type="button" class="btn btn-success btn-lg btnn" value="Quotation" name="btn2" onclick="quotationPage()"> -->
						<input type="button" class="btn btn-success btn-lg btnn" value="Save" name="btn2" onclick="ClientResponseDetailsValidation()"> 
						<input type="reset" class="btn btn-danger btn-lg btnn" value="Cancel" name="btn2">
						<input type="button" value="List" id="listBtn" class="btn btn-primary btn-lg btnn" onclick="clientResponseList()">
						<input type="button" class="btn btn-success btn-lg btnn" value="Quotation" name="btn2" onclick="quotationPage()">
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
</div>
</body>
</html>		