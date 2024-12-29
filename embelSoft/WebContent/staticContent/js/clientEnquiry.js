function clientEnquiryDetail(){
	gst=$('#gst').val();

	//alert(gst);
	if(document.clientEnqForm.firstName.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter First Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Enter First Name.");

		return false;
	}	
	var letterNumber = /^[a-zA-Z0-9_\.\-\@]+$/;
	/*if(document.clientEnqForm.firstName.value.match(letterNumber))*/
	{

		/*if(document.clientEnqForm.lastName.value == "")
			{
				alert("Enter Last Name.");

				return false;
			}*/	
		/*var letterNumber = /^[a-zA-Z, ]+$/;
			if(document.clientEnqForm.lastName.value.match(letterNumber))
			{*/
		if ( document.clientEnqForm.enquiryDate.value == "" )
		{  
			swal({
				title: "Alert!",
				text: "Please Select Date of Enquiry..!",
				icon: 'error',
				timer: 2500,
				button:false
			});   
			//alert("Please Select Date of Enquiry");
			return false;
		}

		if(document.clientEnqForm.businessName.value == "")
		{
			swal({
				title: "Alert!",
				text: "Enter Contact Person Name..!",
				icon: 'error',
				timer: 2500,
				button:false
			});
			//alert("Enter Business Name.");
			return false;
		}

		if(document.clientEnqForm.businessAddress.value == "")
		{
			swal({
				title: "Alert!",
				text: "Enter Business Address..!",
				icon: 'error',
				timer: 2500,
				button:false
			});
			//alert("Enter Business Address.");

			return false;
		}

		/* if ( document.clientEnqForm.contactNo.value == "" )
       			 {
		  	       alert("Please Enter Contact Number");
		  	       return false;
       			 }
	       			 var letterNumber = /^[0-9]{10}$/;
	       			 if(document.clientEnqForm.contactNo.value.match(letterNumber))
	       			 {

	       				if(document.clientEnqForm.address.value == "")
	       				{
	       					alert("Please Enter Client Address.");
	       					return false;
	       				}	

	       				if(document.clientEnqForm.city.value == "")
	       				{
	       					alert("Please Enter City.");
	       					return false;
	       				}	
	       				var letterNumber = /^[a-zA-Z, ]+$/;
						if(document.clientEnqForm.city.value.match(letterNumber))
						{
		 */
		/*if(document.clientEnqForm.productName.value == "")
							{
								alert("Enter Product Name.");

								return false;
							}*/
		if(document.clientEnqForm.emailId.value == "")
		{
			swal({
				title: "Alert!",
				text: "Enter Email Id..!",
				icon: 'error',
				timer: 2500,
				button:false
			});
			//alert("Enter Email Id.");

			return false;
		}	
		var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(document.clientEnqForm.emailId.value.match(letterNumber) || document.clientEnqForm.emailId.value == null ||  document.clientEnqForm.emailId.value == "")
		{
			clientEnquiryDetails();
		}

		else
		{
			swal({
				title: "Alert!",
				text: "Enter a Valid Email Address..!",
				icon: 'error',
				timer: 2500,
				button:false
			});
			//alert("Enter a Valid Email Address..!!");
			return false;
		}
	}

	/*else
						{
							alert("Enter Alphabets Only in City..!!");
							return false;
						}
					}

       			 else
				 {
					alert("Enter 10 digit Numbers Only in Contact Number..!!");
					return false;
					}	
				}*/
	/*else
				{
					alert("Enter Alphabets Only in Last Name..!!");
					return false;
				}
			}*/


	/*		else
		{
			swal({
				title: "Alert!",
				text: "Enter Alphabets Only in First Name..!",
				icon: 'error',
				timer: 2500,
				button:false
			});
			//alert("Enter Alphabets Only in First Name..!!");
			return true;
		}*/
}	


//Adding Client Enquiry Details
function clientEnquiryDetails(){

	//document.clientEnqForm.btn.disabled = true;

	var firstName = $('#firstName').val();
	//var middleName = $('#middleName').val();
	//var lastName = $('#lastName').val();
	var enquiryDate = $('#enquiryDate').val();
	var contactNo  = $('#contactNo').val();

	var emailId = $('#emailId').val();
	//var comment = $('#comment').val();
	//var referenceBy = $('#referenceBy').val();
	//var uploadFile = $('#uploadFile').val();

	var businessName = $('#businessName').val();
	var businessAddress = $('#businessAddress').val();
	var alternativeContactNo = $('#alternativeContactNo').val();
	//var productName = $('#productName').val();

	var city = $('#city').val();
	var state = $('#state').val();
	var zipcode = $('#zipcode').val();
	var country = $('#country').val();

	gst=$('#gst').val();

	/*	if(lastName==undefined || lastName== null || lastName == "" ){
					lastName="N/A";
				}


				if(productName==undefined || productName== null || productName == "" ){
					productName="N/A";
				}*/
	//alert(gst);
	var params = {};

	params["businessName"] = businessName;
	params["businessAddress"] = businessAddress;
	params["alternativeContactNo"] = alternativeContactNo;
	//params["productName"] = productName;

	params["city"] = city;
	params["state"] = state;
	params["zipcode"] = zipcode;
	params["country"] = country;

	params["gst"] = gst;
	params["firstName"] = firstName;
	//params["middleName"] =middleName;
	//params["lastName"] =lastName;
	params["enquiryDate"] = enquiryDate;
	params["contactNo"] =contactNo;

	params["emailId"] = emailId;
	//params["comment"] =comment;
	//params["referenceBy"] =referenceBy;
	//params["uploadFile"] = uploadFile;

	params["methodName"] = "clientEnquiryDetails";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		swal({
			title: "Success!",
			text: "Client Enquiry Added Successfully !",
			icon: 'success',
			timer: 2500,
			button:false
		});
		//alert(data);
		if(document.clientEnqForm)
		{
			document.clientEnqForm.reset();
		}	
		document.clientEnqForm.btn.disabled =false;
			}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

function reset()
{
	document.clientEnqForm.reset();	

}


function ClientResponseDetailsValidation()
{

	if(document.clientResponseForm.fk_client_id.value == "")
	{
		swal({
			title: "Alert!",
			text: "Please Select Client Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Select Client Name.");
		return false;
	}	

	if(document.clientResponseForm.productName1.value == "")
	{
		swal({
			title: "Alert!",
			text: "Please Enter Product Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Enter Product Name.");
		return false;
	}	

	var letterNumber = /^[a-zA-Z, ]+$/;
	if(document.clientResponseForm.productName1.value.match(letterNumber))
	{

		if(document.clientResponseForm.clientResponse.value == "")
		{
			swal({
				title: "Alert!",
				text: "Please Select Client Response..!",
				icon: 'error',
				timer: 2500,
				button:false
			});
			//alert("Please Select Client Response.");
			return false;
		}

		if(document.clientResponseForm.clientResponse.value == "Followup")
		{
			if(document.clientResponseForm.clientFollowUpDate.value == "")
			{
				swal({
					title: "Alert!",
					text: "Please Select Client Follow Up Date..!",
					icon: 'error',
					timer: 2500,
					button:false
				});
				//alert("Please Select Client Follow Up Date.");
				return false;
			}
		}
		ClientResponseDetails();
	}
	else{
		swal({
			title: "Alert!",
			text: "Enter Alphabates Only in Product Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Enter Alphabates Only in Product Name..!!");
		return false;
	}
}

//Adding Client Response
function ClientResponseDetails() {

	/* document.exp.btn.disabled = true; */

	var clientName = $('#fk_client_id').val();

	var businessName1 = $('#businessName1').val();
	var contactPersonName =$('#contactPersonName').val();
	var productName1 = $('#productName1').val();

	var clientResponse =$('#clientResponse').val();

	var clientFollowUpDate = $('#clientFollowUpDate').val();
	var taskInText = $('#taskInText').val();;

	var input1 = document.getElementById('fk_client_id'), list = document
	.getElementById('clientNameList'), i, fkClientId;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClientId = list.options[i].getAttribute('data-value');
		}
	}

	var params = {};

	params["fkClientId"] = fkClientId;
	params["clientName"] = clientName;

	params["businessName"] = businessName1;
	params["contactPersonName"] = contactPersonName;
	params["productName"] = productName1;
	params["clientResponse"] = clientResponse;

	params["clientFollowUpDate"] = clientFollowUpDate;
	params["taskInText"] = taskInText;

	params["methodName"] = "ClientResponseInfo";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) {
		swal({
			title: "Success!",
			text: "Client Follow up Added Successfully !",
			icon: 'success',
			timer: 2500,
			button:false
		});
		alert(data);
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});


}


//////////////////////Reports///////////////////////////
//Validation
function getClientDetailsBetTwoDaysValidation()
{
	var clientName= $('#fk_client_id').val();
	var fisDate = $("#fisDate").val();
	var endDate = $("#endDate").val();

	if(clientName=="" || clientName==null)
	{
		swal({
			title: "Select!",
			text: "Please Select Client Name !",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Select Client Name");
		return false;
	}

	if(fisDate=="" || fisDate==null)
	{
		swal({
			title: "Select!",
			text: "Please Select Start Date !",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Select Start Date");
		return false;
	}

	if(endDate=="" || endDate==null)
	{
		swal({
			title: "Select!",
			text: "Please Select End Date !",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Select End Date");
		return false;
	}

	getClientDetailsBetTwoDays();
}


//************ Client Enquiry Report **************//*
//****** Between Two dates **********//*

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
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+clientName+" \nFrom "+fisDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}

		$(document).ready(function() {
			$('#clientBetweenTwoDates').DataTable( {

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
//					pageTotal = api
//					.column( 5 )
//					.data()
//					.reduce( function (a, b) {
//						return intVal(a) + intVal(b);
//					}, 0 );
//
//					// Update footer
//					$( api.column( 5 ).footer() ).html(
//
//							'Rs'+' '+parseFloat(pageTotal).toFixed(2)
//
//					);
//					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollY": true,
				"scrollX": true,
				columns: [

					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
					{"data": "firstName" , "width": "5%" ,"defaultContent": ""},
					//{"data": "middleName", "width": "5%" ,"defaultContent": ""},
					//{"data": "lastName", "width": "5%" ,"defaultContent": ""},
					{"data": "enquiryDate", "width": "5%" ,"defaultContent": ""},
					{"data": "contactNo" , "width": "5%" ,"defaultContent": ""},
					{"data": "emailId" , "width": "5%" ,"defaultContent": ""},
					//{"data": "comment" , "width": "5%" ,"defaultContent": ""},
					//{"data": "referenceBy" , "width": "5%" ,"defaultContent": ""},

					],
					dom : 'Bfrtip',
					buttons : [ 
						{ extend: 'copyHtml5', footer: true,
							title : function() {
								return "Client Enquiry Report";
							}},
							{ extend: 'excelHtml5', footer: true,
								title : function() {
									return "Client Enquiry Report";
								}},
								{ extend: 'csvHtml5', footer: true,
									title : function() {
										return "Client Enquiry Report";
									}},
									{ extend : 'pdfHtml5', footer: true,
										title : function() {
											return "Client Enquiry Report";
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



function clientList()
{

	var params= {};

	params["methodName"] = "getAllClientList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{

		$('#clientList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#clientList').DataTable( {

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
					{"data": "srNo" , "width": "1%" ,"defaultContent": ""},
					{"data": "firstName" , "width": "5%" ,"defaultContent": ""},
					{"data": "enquiryDate", "width": "5%" ,"defaultContent": ""},
					{"data": "businessName", "width": "5%" ,"defaultContent": ""},
					{"data": "contactNo" , "width": "5%" ,"defaultContent": ""},
					{"data": "emailId" , "width": "5%" ,"defaultContent": ""},
					{"data": "businessAddress" , "width": "5%" ,"defaultContent": ""},			          
					{"data": "GstNo" , "width": "5%" ,"defaultContent": ""},


					],
			} );
		});


		var mydata = catmap;
		$('#clientList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}

			});

}


//Client response details List
function clientResponseList()
{

	var params= {};

	params["methodName"] = "getAllClientResponseList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{

		$('#clientResponseList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#clientResponseList').DataTable( {

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
				
				"scrollY": true,
				"scrollX": true,
				columns: [

					{"data": "srNo" , "width": "1%" ,"defaultContent": ""},	
					{"data": "clientName" , "width": "5%" ,"defaultContent": ""},
					{"data": "businessName", "width": "5%" ,"defaultContent": ""},
					{"data": "contactPersonName", "width": "5%" ,"defaultContent": ""},
					{"data": "productName", "width": "5%" ,"defaultContent": ""},
					{"data": "clientResponse" , "width": "5%" ,"defaultContent": ""},
					{"data": "clientFollowUpDate" , "width": "5%" ,"defaultContent": ""},
					{"data": "ResponseDetailas" , "width": "5%" ,"defaultContent": ""},
					
					{
						"orderable":false,
						"data":'pk_client_response_id',
						"width": "5%",
						"render":function(data,type,row,meta) {
							return '<select id='+data+' name="clientResponseList" onchange="getUpdateResponse(this)" style="height:20px; width:150px; padding:1px; color:black; font-size:12;">'+
							'<option value="">--Select Response--</option>'+
							'<option value="Reject">Reject</option>'+
							'<option value="Approve">Approve</option>'+
							'<option value="Negotiation">Negotiation</option>'+
							'<option value="Followup">Follow Up</option>'+
							'</select>'
						}
						
					},
					

					],
			} );
		});


		var mydata = catmap;
		$('#clientResponseList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

function getUpdateResponse(data) {
	
	var params = {};
	
	abc = data.id;
	pkid = +abc;
	
	//var e = document.getElementById("clientResponseList1");
	var updtresponse = data.options[data.selectedIndex].text;
	
	
	params["pkid"] = pkid;
	params["updtresponse"] = updtresponse;
	
	params["methodName"] = "updateClientEnquiryResponseDetails";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		swal({
			title: "Success!",
			text: "Client Enquiry Response Updated Successfully !",
			icon: 'success',
			timer: 3000,
			button:false
		});
		
		location.reload();

	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
	
}


function getClientDetailsForEdit()
{
	$("#firstName").append($("<input/>").attr("value","").text());
	//$("#middleName").append($("<input/>").attr("value","").text());
	//$("#lastName").append($("<input/>").attr("value","").text());
	$("#enquiryDate").append($("<input/>").attr("value","").text());
	$("#businessName").append($("<input/>").attr("value","").text());
	$("#businessAddress").append($("<input/>").attr("value","").text());
	$("#contactNo").append($("<input/>").attr("value","").text());
	//$("#address").append($("<input/>").attr("value","").text());
	$("#city").append($("<input/>").attr("value","").text());
	$("#state").append($("<input/>").attr("value","").text());
	$("#zipcode").append($("<input/>").attr("value","").text());
	$("#country").append($("<input/>").attr("value","").text());
	$("#alternativeContactNo").append($("<input/>").attr("value","").text());
	//$("#productName").append($("<input/>").attr("value","").text());
	$("#emailId").append($("<input/>").attr("value","").text());
	//$("#comment").append($("<input/>").attr("value","").text());
	//$("#referenceBy").append($("<input/>").attr("value","").text());
	$("#gst").append($("<input/>").attr("value","").text());
	var params= {};
	//var clientName= $('#fk_client_id').val();

	var input1 = document.getElementById('fk_client_id'),
	list = document.getElementById('clientNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClientid = list.options[i].getAttribute('data-value');
		}
	}

	params["fkClientid"] = fkClientid;

	params["methodName"] = "getClientDetailsForEdit";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$.each(jsonData,function(i,v)

				{

			document.getElementById("firstName").value = v.firstName;
			//  document.getElementById("middleName").value = v.middleName;
			// document.getElementById("lastName").value = v.lastName;
			document.getElementById("enquiryDate").value = v.enquiryDate;

			document.getElementById("businessName").value = v.businessName;
			document.getElementById("businessAddress").value = v.businessAddress;
			document.getElementById("contactNo").value = v.contactNo;
			// document.getElementById("address").value = v.address;

			document.getElementById("city").value = v.city;
			document.getElementById("state").value = v.state;
			document.getElementById("zipcode").value = v.zipCode;
			document.getElementById("country").value = v.country;
			document.getElementById("alternativeContactNo").value = v.alternateContactNo;

			// document.getElementById("productName").value = v.productName;
			document.getElementById("emailId").value = v.emailId;
			//document.getElementById("comment").value = v.comment;
			//document.getElementById("referenceBy").value = v.referenceBy;
			document.getElementById("gst").value = v.GstNo;

				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});


}

function validationUpdateClientEnquiryDetails()
{
	var clientFullName = $('#fk_client_id').val();
	var firstName = $('#firstName').val();
	//var lastName = $('#lastName').val();
	var enquiryDate = $('#enquiryDate').val();
	var businessName = $('#businessName').val();
	var businessAddress = $('#businessAddress').val();
	var emailId = $('#emailId').val();
	//var productName = $('#productName').val();
	var gst = $('#gst').val();
	if(clientFullName=="" || clientFullName==null || clientFullName==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please select client name for update record..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please select client name for update record');
		return false;
	}
	if(firstName=="" || firstName==null || firstName==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter first name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter first name');
		return fasle;
	}
	/*if(lastName=="" || lastName==null || lastName==undefined)
	{
		alert('Please enter first name');
		return fasle;
	}*/
	if(enquiryDate=="" || enquiryDate==null || enquiryDate==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please select enquiry date..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please select enquiry date');
		return fasle;
	}
	if(businessName=="" || businessName==null || businessName==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter business name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter business name');
		return fasle;
	}
	if(businessAddress=="" || businessAddress==null || businessAddress==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter business address..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter business address');
		return fasle;
	}
	if(emailId=="" || emailId==null || emailId==undefined)
	{
		swal({
			title: "Alert!",
			text: "Please enter emailId..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert('Please enter emailId');
		return fasle;
	}
	/*if(productName=="" || productName==null || productName==undefined)
	{
		alert('Please enter product name');
		return fasle;
	}*/
	updateClientEnquiryDetail();

}

function updateClientEnquiryDetail()
{
	var input1 = document.getElementById('fk_client_id'),
	list = document.getElementById('clientNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkClientid = list.options[i].getAttribute('data-value');
		}
	}

	var clientFullName = $('#fk_client_id').val();
	var firstName = $('#firstName').val();
	//var middleName = $('#middleName').val();
	//var lastName = $('#lastName').val();
	var enquiryDate = $('#enquiryDate').val();
	var contactNo  = $('#contactNo').val();
	var address = $('#address').val();
	var emailId = $('#emailId').val();
	//var comment = $('#comment').val();
	//var referenceBy = $('#referenceBy').val();
	//var uploadFile = $('#uploadFile').val();

	var businessName = $('#businessName').val();
	var businessAddress = $('#businessAddress').val();
	var alternativeContactNo = $('#alternativeContactNo').val();
	//var productName = $('#productName').val();

	var city = $('#city').val();
	var state = $('#state').val();
	var zipcode = $('#zipcode').val();
	var country = $('#country').val();
	var gst = $('#gst').val();

	var params = {};

	params["fkClientid"] = fkClientid;

	params["clientFullName"] = clientFullName;
	params["businessName"] = businessName;
	params["businessAddress"] = businessAddress;
	params["alternativeContactNo"] = alternativeContactNo;
	//params["productName"] = productName;
	params["city"] = city;
	params["state"] = state;
	params["zipcode"] = zipcode;
	params["country"] = country;
	params["firstName"] = firstName;
	//params["middleName"] =middleName;
	//params["lastName"] =lastName;
	params["enquiryDate"] = enquiryDate;
	params["contactNo"] =contactNo;
	params["address"] = address;
	params["emailId"] = emailId;
	//params["comment"] =comment;
	//params["referenceBy"] =referenceBy;
	//params["uploadFile"] = uploadFile;
	params["gst"] = gst;
	params["methodName"] = "updateClientEnquiryDetails";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		swal({
			title: "Success!",
			text: "Client Enquiry Updated Successfully !",
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
	});

}

function getClientDetails()
{

	$("#businessName1").append($("<input/>").attr("value","").text());
	//$("#contactPersonName").append($("<input/>").attr("value","").text());

	var params= {};
	//var clientName= $('#fk_client_id').val();

	var input1 = document.getElementById('fk_client_id'),
	list = document.getElementById('clientNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkClientid = list.options[i].getAttribute('data-value');
		}
	}

	params["fkClientid"] = fkClientid;

	params["methodName"] = "getClientDetailsForEdit";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$.each(jsonData,function(i,v)

				{

			document.getElementById("businessName1").value = v.businessName;
			//document.getElementById("contactPersonName").value = v.productName;

				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});




}

function clientResponseFollowUpValidation()
{
	var fisDate4 = $('#fisDate4').val();
	var endDate4 = $('#endDate4').val();

	if(fisDate4=="")
	{
		swal({
			title: "Select!",
			text: "Please Select First Date !",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Select First Date");
		return false;
	}	

	if(endDate4=="")
	{
		swal({
			title: "Select!",
			text: "Please Select End Date !",
			icon: 'error',
			timer: 2500,
			button:false
		});
		//alert("Please Select Last Date");
		return false;
	}

	clientResponseFollowUp();
}




//Repost For ClientFollowUp
function clientResponseFollowUp()
{

	var params= {};

	var fisDate4 = $('#fisDate4').val();
	var endDate4 = $('#endDate4').val();

	params["firstDate"] = fisDate4;
	params["lastDate"] = endDate4;

	params["methodName"] = "getClientResponseFollowUpReport";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{

		$('#clientResponseFollowUp').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
			swal({
	     title: "Warning!",
	     text: "No data Available for Dates \nFrom "+fisDate4+" To "+endDate4+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
			});
			return false;
		}

		$(document).ready(function() {
			$('#clientResponseFollowUp').DataTable( {

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

					/*// Total over this page
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
					console.log( pageTotal);*/
				},

				destroy: true,
				searching: true,
				"scrollY": true,
				"scrollX": true,
				
				columns: [

					{"data": "srNo" , "width": "1%" ,"defaultContent": ""},	
					{"data": "clientName" , "width": "5%" ,"defaultContent": ""},
					{"data": "businessName", "width": "5%" ,"defaultContent": ""},
					{"data": "contactPersonName", "width": "5%" ,"defaultContent": ""},
					{"data": "productName", "width": "5%" ,"defaultContent": ""},
					{"data": "clientResponse" , "width": "5%" ,"defaultContent": ""},
					{"data": "clientFollowUpDate" , "width": "5%" ,"defaultContent": ""},
					{"data": "ResponseDetailas" , "width": "5%" ,"defaultContent": ""},

					],

					dom : 'Bfrtip',
					buttons : [ 
						{ extend: 'copyHtml5', footer: true,
							title : function() {
								return "Client Follow Up Report";
							}},
							{ extend: 'excelHtml5', footer: true,
								title : function() {
									return "Client Follow Up Report";
								}},
								{ extend: 'csvHtml5', footer: true,
									title : function() {
										return "Client Follow Up Report";
									}},
									{ extend : 'pdfHtml5', footer: true,
										title : function() {
											return "Client Follow Up Report";
										},
										orientation : 'landscape',
										pageSize : 'LEGAL',
										titleAttr : 'PDF' 
									}]
			} );
		});


		var mydata = catmap;
		$('#clientResponseFollowUp').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}





//Get for today Client response details List
function todayClientResponseList()
{

	var params= {};

	params["methodName"] = "getAllClientResponseListForToday";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{

		$('#todayClientResponseList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#todayClientResponseList').DataTable( {

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
				columns: [

					{"data": "srNo" , "width": "1%" ,"defaultContent": ""},	
					{"data": "clientName" , "width": "5%" ,"defaultContent": ""},
					{"data": "businessName", "width": "5%" ,"defaultContent": ""},
					{"data": "clientFollowUpDate" , "width": "5%" ,"defaultContent": ""},
					{"data": "productName", "width": "5%" ,"defaultContent": ""},
					{"data": "ResponseDetailas" , "width": "5%" ,"defaultContent": ""},

					],

					dom : 'Bfrtip',
					buttons : [ 
						{ extend: 'copyHtml5', footer: true },
						{ extend: 'excelHtml5', footer: true },
						{ extend: 'csvHtml5', footer: true },
						{ extend : 'pdfHtml5', footer: true,
							title : function() {
								return "Client Response";
							},
							orientation : 'landscape',
							pageSize : 'LEGAL',
							titleAttr : 'PDF' 
						}]
			} );
		});


		var mydata = catmap;
		$('#todayClientResponseList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}




function enquiryFormDetailValidation(){

	if(document.enqForm.prsnName.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter First Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}	

	if ( document.enqForm.enquiryDate.value == "" )
	{  
		swal({
			title: "Alert!",
			text: "Please Select Date of Enquiry..!",
			icon: 'error',
			timer: 2500,
			button:false
		});   
		return false;
	}


	if(document.enqForm.businessName.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter Business Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		return false;
	}

	if(document.enqForm.businessAddress.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter Business Address..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}


	if(document.enqForm.emailId.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter Email Id..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}	
	var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if(document.enqForm.emailId.value.match(letterNumber) || document.enqForm.emailId.value == null ||  document.enqForm.emailId.value == "")
	{
		//
	}
	else
	{
		swal({
			title: "Alert!",
			text: "Enter a Valid Email Address..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		return false;
	}
	
	if(document.enqForm.enqrdFor.value == "")
	{
		swal({
			title: "Alert!",
			text: "Select Option For Enquiry..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}
	
	if(document.enqForm.description.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter Description About Your Enquiry..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}

	enquiryFormDetail();

}	


//Adding Client Enquiry Details

function enquiryFormDetail(){

	var prsnName = $('#prsnName').val();
	var enquiryDate = $('#enquiryDate').val();
	var contactNo  = $('#contactNo').val();
	var alternativeContactNo = $('#alternativeContactNo').val();
	var businessName = $('#businessName').val();
	var businessAddress = $('#businessAddress').val();
	var emailId = $('#emailId').val();
	var enqrdFor = $('#enqrdFor').val();
	var description = $('#description').val();

	var params = {};
	
	params["prsnName"] = prsnName;
	params["enquiryDate"] = enquiryDate;
	params["contactNo"] =contactNo;
	params["alternativeContactNo"] = alternativeContactNo;
	params["businessName"] = businessName;
	params["businessAddress"] = businessAddress;
	params["emailId"] = emailId;
	params["enqrdFor"] = enqrdFor;
	params["description"] = description;


	params["methodName"] = "enquiryFormDetails";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		swal({
			title: "Success!",
			text: "Enquiry Detail Added Successfully !",
			icon: 'success',
			timer: 2500,
			button:false
		});

		resetEnqForm();	
		document.enqForm.btn.disabled =false;
			}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}


function enquiryFormList()
{

	var params= {};

	var firstDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	
	params["firstDate"] = firstDate;
	params["endDate"] = endDate;
	params["methodName"] = "getAllEnquiryList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{

		$('#enquiryList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#enquiryList').DataTable( {

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
				"scrollY": true,
				"scrollX": true,
				columns: [
					
					{"data": "srNo" , "width": "1%" ,"defaultContent": ""},
					{"data": "prsnName" , "width": "5%" ,"defaultContent": ""},
					{"data": "enquiryDate", "width": "5%" ,"defaultContent": ""},
					{"data": "businessName", "width": "5%" ,"defaultContent": ""},
					{"data": "businessAddress", "width": "5%" ,"defaultContent": ""},
					{"data": "contactNo" , "width": "5%" ,"defaultContent": ""},
					{"data": "emailId" , "width": "5%" ,"defaultContent": ""},
					{"data": "enqrdFor" , "width": "5%" ,"defaultContent": ""},			          
					{"data": "description" , "width": "5%" ,"defaultContent": ""},


					],
			} );
		});


		var mydata = catmap;
		$('#enquiryList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}

			});

}

function enquiryFormListForDateWise() {

	var params= {};

	var firstDate = $('#fisDate').val();
	var endDate = $('#endDate').val();
	
	if(firstDate == ""|| firstDate== undefined)
	{
		swal({
			title: "Alert!",
			text: "Please Select the Start Date..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}	

	if(endDate == ""||endDate== undefined)
	{
		swal({
			title: "Alert!",
			text: "Please Select the End Date..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}	
	
	params["firstDate"] = firstDate;
	params["endDate"] = endDate;
	params["methodName"] = "getAllEnquiryListDateWise";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{

		$('#enquiryList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#enquiryList').DataTable( {

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
				"scrollY": true,
				"scrollX": true,
				columns: [
					
					{"data": "srNo" , "width": "1%" ,"defaultContent": ""},
					{"data": "prsnName" , "width": "5%" ,"defaultContent": ""},
					{"data": "enquiryDate", "width": "5%" ,"defaultContent": ""},
					{"data": "businessName", "width": "5%" ,"defaultContent": ""},
					{"data": "businessAddress", "width": "5%" ,"defaultContent": ""},
					{"data": "contactNo" , "width": "5%" ,"defaultContent": ""},
					{"data": "emailId" , "width": "5%" ,"defaultContent": ""},
					{"data": "enqrdFor" , "width": "5%" ,"defaultContent": ""},			          
					{"data": "description" , "width": "5%" ,"defaultContent": ""},


					],
			} );
		});

		var mydata = catmap;
		$('#enquiryList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}

			});

}


//get Person Details for Edit EnquiryForm

function fetchPersonInfo() {
	
		$("#prsnName").append($("<input/>").attr("value","").text());
		$("#enquiryDate").append($("<input/>").attr("value","").text());
		$("#contactNo").append($("<input/>").attr("value","").text());
		$("#alternativeContactNo").append($("<input/>").attr("value","").text());
		$("#businessName").append($("<input/>").attr("value","").text());
		$("#businessAddress").append($("<input/>").attr("value","").text());
		$("#emailId").append($("<input/>").attr("value","").text());
		$("#enqrdFor").append($("<input/>").attr("value","").text());
		$("#description").append($("<input/>").attr("value","").text());
		$("#pkid").append($("<input/>").attr("value","").text());
		
		var params= {};
		
		var input1 = document.getElementById('prsnName'),
		list = document.getElementById('prsnNameList'),
		i,fkprsnid;

		for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkprsnid = list.options[i].getAttribute('data-value');
			}
		}
		
		params["fkprsnid"] = fkprsnid;
		
		params["methodName"] = "fetchPersonInfo";
		
		$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
			
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			
			$.each(jsonData,function(i,v)
					
					{
				
				
					  document.getElementById("prsnName").value = v.prsnName;
					  document.getElementById("enquiryDate").value = v.strEnquiryDate;
				      document.getElementById("contactNo").value = v.contactNo;
				      document.getElementById("alternativeContactNo").value = v.alternativeContactNo;
				      document.getElementById("businessName").value = v.businessName;
				      document.getElementById("businessAddress").value = v.businessAddress;
				      document.getElementById("emailId").value = v.emailId;
				      document.getElementById("enqrdFor").value = v.enqrdFor;
				      document.getElementById("description").value = v.description;
				      document.getElementById("pkid").value = v.pkEnquiryFormId;
				      
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
	
}


function updateEnquiryFormValidation(){

	if(document.editEnqForm.prsnName.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter First Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}	

	if ( document.editEnqForm.enquiryDate.value == "" )
	{  
		swal({
			title: "Alert!",
			text: "Please Select Date of Enquiry..!",
			icon: 'error',
			timer: 2500,
			button:false
		});   
		return false;
	}


	if(document.editEnqForm.businessName.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter Business Name..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		return false;
	}

	if(document.editEnqForm.businessAddress.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter Business Address..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}


	if(document.editEnqForm.emailId.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter Email Id..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}	
	var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if(document.editEnqForm.emailId.value.match(letterNumber) || document.editEnqForm.emailId.value == null ||  document.editEnqForm.emailId.value == "")
	{
		//
	}
	else
	{
		swal({
			title: "Alert!",
			text: "Enter a Valid Email Address..!",
			icon: 'error',
			timer: 2500,
			button:false
		});
		return false;
	}
	
	if(document.editEnqForm.enqrdFor.value == "")
	{
		swal({
			title: "Alert!",
			text: "Select Option For Enquiry..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}
	
	if(document.editEnqForm.description.value == "")
	{
		swal({
			title: "Alert!",
			text: "Enter Description About Your Enquiry..!",
			icon: 'error',
			timer: 2500,
			button:false
		});

		return false;
	}

	updateEnquiryFormDetail();

}	


//Adding Client Enquiry Details

function updateEnquiryFormDetail(){
	
	document.editEnqForm.btn.disabled =true;

	var prsnName = $('#prsnName').val();
	var enquiryDate = $('#enquiryDate').val();
	var contactNo  = $('#contactNo').val();
	var alternativeContactNo = $('#alternativeContactNo').val();
	var businessName = $('#businessName').val();
	var businessAddress = $('#businessAddress').val();
	var emailId = $('#emailId').val();
	var enqrdFor = $('#enqrdFor').val();
	var description = $('#description').val();
	var pkid = $('#pkid').val();

	var params = {};
	
	params["prsnName"] = prsnName;
	params["enquiryDate"] = enquiryDate;
	params["contactNo"] =contactNo;
	params["alternativeContactNo"] = alternativeContactNo;
	params["businessName"] = businessName;
	params["businessAddress"] = businessAddress;
	params["emailId"] = emailId;
	params["enqrdFor"] = enqrdFor;
	params["description"] = description;
	params["pkid"] = pkid;


	params["methodName"] = "updateEnquiryFormDetails";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		swal({
			title: "Success!",
			text: "Enquiry Detail Updated Successfully !",
			icon: 'success',
			timer: 2500,
			button:false
		});

		reseteditEnqForm();	
		document.editEnqForm.btn.disabled =false;
			}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}






