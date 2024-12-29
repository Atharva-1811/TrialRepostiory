function vendorDetailValidation()
{
	
			if(document.vendorForm.vendorName.value == "")
			{
				swal({
		     		title: "Alert!",
		     		text: "Enter Vendor Name !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
				//alert("Enter Vendor Name.");
				return false;
			}
			
	
		/*	if ( document.vendorForm.contactNo.value == "" )
			 {
				swal({
		     		title: "Alert!",
		     		text: "Please Enter Contact Number !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
			 //alert("Please Enter Contact Number");
			       return false;
				 }*/
			 		
		/*	var letterNumber = /^[0-9]{10}$/;
  			 if(document.vendorForm.contactNo.value.match(letterNumber))
  				 {
  				if(document.vendorForm.address.value == "")
  				{
					swal({
		     		title: "Alert!",
		     		text: "Please Enter Address !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
  					return false;
  				}
  				 }
  			 else{
					swal({
		     		title: "Alert!",
		     		text: "Enter 10 digit Numbers Only in Contact Number !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
  				 
  				 //alert("Enter 10 digit Numbers Only in Contact Number..!!");
			       return false;
  				 }				 
			*/
			
			if(document.vendorForm.companyName.value == "")
			{
				swal({
		     		title: "Alert!",
		     		text: "Please Enter Company  Name !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
				//alert("Please Enter Company  Name.");
				return false;
			}
			
			if(document.vendorForm.companyAddress.value == "")
			{
				swal({
		     		title: "Alert!",
		     		text: "Please Enter Company Address !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
				//alert("Please Enter Company Address.");
				return false;
			}
			
			
			if(document.vendorForm.companyNumber.value == "")
			{
				swal({
		     		title: "Alert!",
		     		text: "Please Enter Company Number !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
				//alert("Please Enter Company Number.");
				return false;
			}
			
			var letterNumber = /^[0-9]{10}$/;
 			 if(document.vendorForm.companyNumber.value.match(letterNumber))
 				 {
 				if(document.vendorForm.contactPersonName.value == "")
 				{
					swal({
		     		title: "Alert!",
		     		text: "Please Enter Contact Person Name !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
 					//alert("Please Enter Contact Person Name.");
 					return false;
 				}
 				 }
 			 else{
 				 swal({
		     		title: "Alert!",
		     		text: "Enter 10 digit Numbers Only in Company Number !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
 				 //alert("Enter 10 digit Numbers Only in Company Number..!!");
			       return false;
 				 }	
			
			
			var letterNumber = /^[a-zA-Z0-9/,/ /@/]+$/;
  			 if(document.vendorForm.contactPersonName.value.match(letterNumber))
  			 {
  						 
  					if ( document.vendorForm.emailId.value == "" )
				    {
						swal({
		     		title: "Alert!",
		     		text: "Please Enter Email Id !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
				  	       //alert("Please Enter Email Id");
				  	       return false;
				    }
	   				 var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  	        	 if(document.vendorForm.emailId.value.match(letterNumber) || document.vendorForm.emailId.value == null ||  document.vendorForm.emailId.value == "")
	  	        	 {
	 	   				  
	        				   	//vendorDetails();
	        			   }
				else
				{
					swal({
		     		title: "Alert!",
		     		text: "Enter a Valid Email Adress !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
					//alert("Enter a Valid Email Adress..!!");
					return false;
				}
 	 		}
  			else
			{
				swal({
		     		title: "Alert!",
		     		text: "Enter Alphabets Only in Contact Person Name !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
				//alert("Enter Alphabets Only in Contact Person Name..!!")
				return false;
			}
			
  			vendorDetails();
						
}	



function vendorDetails(){
		
	
	//document.vendorForm.btn.disabled = true;

				var vendorName = $('#vendorName').val();
				var enquiryDate = $('#enquiryDate').val();
				var contactNo  = $('#contactNo').val();
				if(contactNo=="" || contactNo==null || contactNo==undefined || contactNo==" ")
					{
					contactNo="0";
					}
				
				var address = $('#address').val();
				if(address=="" || address==null || address==undefined || address==" ")
				{
					address="N/A";
				}
				
				var emailId = $('#emailId').val();
				var zipCode = $('#zipCode').val();
				var country = $('#country').val();
				var state = $('#state').val();
				var PANNum = $('#PANNum').val();
				var CIMNo = $('#CIMNo').val();
				var gstInNo = $('#gstInNo').val();
				
				var alternateContactNo = $('#alternateContactNumber').val();
				var contactPersonName = $('#contactPersonName').val();
				var companyName = $('#companyName').val();
				var emengencyContactNo = $('#emergenctContactNumber').val();
				var companyAddress = $('#companyAddress').val();
				//var permanentAddress = $('#permanentAddress').val();
				var companyNumber = $('#companyNumber').val();
				
				
				var params = {};
				
				params["alternateContactNo"] = alternateContactNo;
				params["contactPersonName"] = contactPersonName;
				params["companyName"] = companyName;
				params["emengencyContactNo"] = emengencyContactNo;
				params["companyAddress"] = companyAddress;
				//params["permanentAddress"] = permanentAddress;
				params["companyNumber"] = companyNumber;
				
				
				params["vendorName"] = vendorName;
				params["enquiryDate"] = enquiryDate;
				params["contactNo"] =contactNo;
				params["address"] = address;
				params["emailId"] = emailId;
				params["zipCode"] =zipCode;
				params["country"] =country;
				params["state"] = state;
				params["PANNum"] =PANNum;
				params["CIMNo"] =CIMNo;
				params["gstInNo"] = gstInNo;
				
				params["methodName"] = "vendorDetailsM";
			 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			 			{
					swal({
		     			title: "Success!",
		    	 		text: "Vendor Details Added Successfully !",
		     			icon: 'success',
		     			timer: 2500,
		     			button:false
		     		});
			 		//alert(data);
			 		location.reload();
	 			}
	 	
	 	    	).error(function(jqXHR, textStatus, errorThrown){
	 	    		if(textStatus==="timeout") {
	 	    			$(loaderObj).hide();
	 	    			$(loaderObj).find('#errorDiv').show();
	 	    		}
	 	    	})
	}


//////////////////////Reports///////////////////////////

//**** Client Enquiry Report *****//
//** Between Two dates ***//

function getClientDetailsBetTwoDays(){
	var params= {};
	var clientName= $('#fk_client_id').val();
	var fisDate = $("#fisDate").val();
	var endDate = $("#endDate").val();

	var input1 = document.getElementById('fk_client_id'),
	list = document.getElementById('clientNameList'),
	i,fkClientId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkClientId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["clientName"]= clientName;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getClientReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#clientBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#clientBetweenTwoDates').DataTable( {

				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};

					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
					  {"data": "firstName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "middleName", "width": "5%" ,"defaultContent": ""},
			          {"data": "lastName", "width": "5%" ,"defaultContent": ""},
			          {"data": "enquiryDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "contactNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "address", "width": "5%" ,"defaultContent": ""},
			          {"data": "emailId" , "width": "5%" ,"defaultContent": ""},
			          {"data": "comment" , "width": "5%" ,"defaultContent": ""},
			          {"data": "referenceBy" , "width": "5%" ,"defaultContent": ""},
			          
			        
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Double Date Wise Client Enquiry Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#clientBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


function vendorList()
{
	var params= {};

	params["methodName"] = "getAllVendorList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#list').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			
			$('#list').DataTable( {

				"bPaginate": false,

				
				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

				"footerCallback": function ( row, data, start, end, display ) {
					var api = this.api(), data;

					// Remove the formatting to get integer data for summation
					var intVal = function ( i ) {
						return typeof i === 'string' ?
								i.replace(/[\$,]/g, '')*1 :
									typeof i === 'number' ?
											i : 0;
					};

					// Total over this page
					pageTotal = api
					.column( 5 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollY": 300,
				"scrollX": true,
				columns: [
					
					      {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "enquiryDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "contactNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "emailId" , "width": "5%" ,"defaultContent": ""},
				         // {"data": "address", "width": "5%" ,"defaultContent": ""},
				          {"data": "companyAddress", "width": "5%" ,"defaultContent": ""},
				          {"data": "state" , "width": "5%" ,"defaultContent": ""},
				          {"data": "country" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zipCode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "PANNum" , "width": "5%" ,"defaultContent": ""},
				          {"data": "CIMNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "gstInNo", "width": "5%" ,"defaultContent": ""},
				       
				          /*   { 
		                        "orderable": false,
		                        "data": 'pkVendorDetailsId',
		                        "render": function (data, type, row, meta) {
		                            return '<button class="btn btn-danger" style="height:40px;width:100px;padding:3px;color:black;font-size:18px" id='+data+' onclick="getVendorListDelete(this)">Delete</button>'
		                        }
		                        
				          } */
				          
				          ],				          
					} );
				});

		var mydata = catmap;
		$('#list').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			
			});
}


// get Vendor Details for Edit
function getVendorListForEdit()
{
	
	$("#vendorName").append($("<input/>").attr("value","").text());
	$("#enquiryDate").append($("<input/>").attr("value","").text());
	$("#contactNo").append($("<input/>").attr("value","").text());
	$("#address").append($("<input/>").attr("value","").text());
	$("#alternateContactNumber").append($("<input/>").attr("value","").text());
	$("#emergenctContactNumber").append($("<input/>").attr("value","").text());
	$("#companyName").append($("<input/>").attr("value","").text());
	$("#companyAddress").append($("<input/>").attr("value","").text());
	$("#contactPersonName").append($("<input/>").attr("value","").text());
	$("#companyNumber").append($("<input/>").attr("value","").text());
	$("#zipCode").append($("<input/>").attr("value","").text());
	$("#emailId").append($("<input/>").attr("value","").text());
	$("#country").append($("<input/>").attr("value","").text());
	$("#state").append($("<input/>").attr("value","").text());
	$("#PANNum").append($("<input/>").attr("value","").text());
	$("#CIMNo").append($("<input/>").attr("value","").text());
	$("#gstInNo").append($("<input/>").attr("value","").text());
	$("#permanentAddress").append($("<input/>").attr("value","").text());
	
	
	
	var params= {};
	
	var input1 = document.getElementById('fk_vendor_id'),
	list = document.getElementById('vendorNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fk_vendor_id"] = fkEmployeeid;
	params["methodName"] = "getVendorDetailsForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
			
			
				  document.getElementById("vendorName").value = v.vendorName;
				  document.getElementById("enquiryDate").value = v.enquiryDate;
			      document.getElementById("contactNo").value = v.contactNo;
			      document.getElementById("address").value = v.address;
			      document.getElementById("alternateContactNumber").value = v.alternateContactNo;
			      document.getElementById("emergenctContactNumber").value = v.emergencyContactNo;
			      document.getElementById("companyName").value = v.companyName;
			      document.getElementById("companyAddress").value = v.companyAddress;
			      document.getElementById("contactPersonName").value = v.contactPersonName;
			      document.getElementById("companyNumber").value = v.companyNumber;
			      document.getElementById("zipCode").value = v.zipCode;
			      document.getElementById("emailId").value = v.emailId;
			      document.getElementById("country").value = v.country;
			      document.getElementById("state").value = v.state;
			      document.getElementById("PANNum").value = v.PANNum;
			      document.getElementById("CIMNo").value = v.CIMNo;
			      document.getElementById("gstInNo").value = v.gstInNo;
			      document.getElementById("permanentAddress").value = v.permanentAddress;
			     
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}

function validationUpdateVendorDetail()
{
	
	var vendorName = $('#fk_vendor_id').val();
	var vendorNewName = $('#vendorName').val();
	var enquiryDate = $('#enquiryDate').val();
	var contactNo  = $('#contactNo').val();
	var address = $('#address').val();
	var emailId = $('#emailId').val();
	var PANNum = $('#PANNum').val();
	var contactPersonName = $('#contactPersonName').val();
	var companyName = $('#companyName').val();
	var companyAddress = $('#companyAddress').val();
	var companyNumber = $('#companyNumber').val();

	if(vendorName=="" || vendorName==null || vendorName==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please select vendor name for update record",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please select vendor name for update record');
		return false;
	}
	if(vendorNewName=="" || vendorNewName==null || vendorNewName==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter vendor new name",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter vendor new name');
		return false;
	}
	if(enquiryDate=="" || enquiryDate==null || enquiryDate==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please select enquiry date",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please select enquiry date');
		return false;
	}
	
	/*if(contactNo=="" || contactNo==null || contactNo==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter contact Number",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter contact Number');
		return false;
	}
	if(address=="" || address==null || address==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter address",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter address');
		return false;
	}*/
	if(emailId=="" || emailId==null || emailId==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter email id",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter emailId');
		return false;
	}
	/*if(PANNum=="" || PANNum==null || PANNum==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter PAN Number",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter PAN Number');
		return false;
	}*/
	if(contactPersonName=="" || contactPersonName==null || contactPersonName==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter contact person name",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter contact person name');
		return false;
	}
	if(companyName=="" || companyName==null || companyName==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter company name",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter company name');
		return false;
	}
	if(companyAddress=="" || companyAddress==null || companyAddress==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter company address",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter company address');
		return false;
	}
	if(companyNumber=="" || companyNumber==null || companyNumber==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter company number",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter company number');
		return false;
	}
	
	updateVendorDetail();
	
}

// update Vendor Details
function updateVendorDetail()
{
	
	var params= {};
	
	var input1 = document.getElementById('fk_vendor_id'),
	list = document.getElementById('vendorNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkVendorid = list.options[i].getAttribute('data-value');
		}
	}
	
	var vendorName = $('#fk_vendor_id').val();
	var vendorNewName = $('#vendorName').val();
	var enquiryDate = $('#enquiryDate').val();
	var contactNo  = $('#contactNo').val();
	var address = $('#address').val();
	var emailId = $('#emailId').val();
	var zipCode = $('#zipCode').val();
	var country = $('#country').val();
	var state = $('#state').val();
	var PANNum = $('#PANNum').val();
	var CIMNo = $('#CIMNo').val();
	var gstInNo = $('#gstInNo').val();
	var alternateContactNo = $('#alternateContactNumber').val();
	var contactPersonName = $('#contactPersonName').val();
	var companyName = $('#companyName').val();
	var emengencyContactNo = $('#emergenctContactNumber').val();
	var companyAddress = $('#companyAddress').val();
	//var permanentAddress = $('#permanentAddress').val();
	var companyNumber = $('#companyNumber').val();
	

	
	params["vendorName"] = vendorName;
	
	params["vendorNewName"] = vendorNewName;
	params["fkVendorid"] = fkVendorid;
	params["enquiryDate"] = enquiryDate;
	params["contactNo"] =contactNo;
	params["address"] = address;
	params["emailId"] = emailId;
	params["zipCode"] =zipCode;
	params["country"] =country;
	params["state"] = state;
	params["PANNum"] =PANNum;
	params["CIMNo"] =CIMNo;
	params["gstInNo"] = gstInNo;
	params["alternateContactNo"] = alternateContactNo;
	params["contactPersonName"] = contactPersonName;
	params["companyName"] = companyName;
	params["emengencyContactNo"] = emengencyContactNo;
	params["companyAddress"] = companyAddress;
	//params["permanentAddress"] = permanentAddress;
	params["companyNumber"] = companyNumber;
	
	params["methodName"] = "updateVendorDetails";
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
 		swal({
		     title: "Success!",
		     text: "Vendor Details Updated Successfully !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     
		}
 		);
		//alert(data);
 		location.reload();
		

 			}).error(function(jqXHR, textStatus, errorThrown){
 		if(textStatus==="timeout") {
 			$(loaderObj).hide();
 			$(loaderObj).find('#errorDiv').show();
 		}
 	})
}

function getVendorListDelete(data)

{
		var params= {};
			
		var  abc = data.id;
		var pkId = +abc;
		
			     	params["pkTempId"] = pkId;
							
					params["methodName"] = "getDeleteVendorList";
					
					$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
					    	{
						alert(data);
						location.reload();
							}
					    	).error(function(jqXHR, textStatus, errorThrown){
					    		if(textStatus==="timeout") {
					    			$(loaderObj).hide();
					    			$(loaderObj).find('#errorDiv').show(); 
					    		}
					    	});
	}