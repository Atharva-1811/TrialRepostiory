/**
 taxDetails.js
 **/

function validateSaveTaxDetails()
{

	var taxType = $('#taxType').val();
	var taxPercentage = $('#taxPercentage').val();
	var CGST = $('#CGST').val();
	var SGST = $('#SGST').val();
	var lastUpdateDate = $('#lastUpdateDate').val();
	
	if(taxType=="" || taxType==null || taxType==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Tax Type..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Enter Tax Type");
		return false;
	}
	if(CGST=="" || CGST==null || CGST==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter CGST..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Enter CGST");
		return false;
	}
	var letterNumber = /^[0-9\.]{1,5}$/;
	if(CGST.match(letterNumber))
	{
		if(SGST=="" || SGST==null || SGST==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter SGST..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Please Enter SGST");
			return false;
		}
		var letterNumber = /^[0-9\.]{1,5}$/;//+$/
		if(SGST.match(letterNumber))
		{
			
		}
		else
		{
			swal({
			     title: "Alert!",
		     	 text: "Enter Digits Only in SGST % ..!",
			     icon: 'error',
			     timer: 2500,
			     button:false
			});
			//alert("Enter Digits Only in SGST % ..!!");
			return false;
		}
	}
	else
	{
		swal({
		     title: "Alert!",
		     text: "Enter Digits Only in CGST % ..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Digits Only in CGST % ..!!");
		return false;
	}
	
	saveTaxDetails();
}


/*============= Tax Details Add to Database User Details========*/
//saveTaxDetails
function saveTaxDetails()
{
	document.userDetailsForm.saveBtn.disabled = true;
	
	var taxType = $('#taxType').val();
	var taxPercentage = $('#taxPercentage').val();
	var CGST = $('#CGST').val();
	var SGST = $('#SGST').val();
	//var IGST = $('#IGST').val();
	//var lastUpdateDate = $('#lastUpdateDate').val();
	
	
	var params = {};
	
	params["taxType"] = taxType;
	params["taxPercentage"] = taxPercentage;
	params["CGST"] = CGST;
	params["SGST"] = SGST;
	//params["IGST"] = IGST;
	//params["lastUpdateDate"] = lastUpdateDate;
	
	
	//params["methodName"] = "saveUserDetails";
	params["methodName"] = "saveTaxDetails";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	    	{
				swal({
				     title: "Success!",
				     text: "Tax Details Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				 });
				//alert(data);
				if(document.userDetailsForm)
				{
					document.userDetailsForm.reset();
				}	
				
				//window.open("OffLetterPdf.jsp");
				document.userDetailsForm.saveBtn.disabled =false;
			}
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	}); 			
}

//get Tax Details List
function getTaxDetailsList()
{
	var params= {};
	
	
	params["methodName"] = "getTaxDetailsList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#list2').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#list2').DataTable( {

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
					$( api.column( 1 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)
					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,
				"scrollY": true,
				"scrollX": true,
				columns: [
					      {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "taxType" , "width": "5%" ,"defaultContent": ""},
				          {"data": "taxPercentage" , "width": "5%" ,"defaultContent": ""},
				          {"data": "CGST" , "width": "5%" ,"defaultContent": ""},
				          {"data": "SGST", "width": "5%" ,"defaultContent": ""},
				          {"data": "lastUpdateDate" , "width": "5%" ,"defaultContent": ""},         
				          ],
					} );
				});
		
		var mydata = catmap;
		$('#list2').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


//getCompTypeListForEdit
function getTaxDetailsForEdit()
{
//	$("#taxType").append($("<input/>").attr("value","").text());
//	$("#taxType").append($("<input/>").attr("value","").text());
	
	$("#taxType").append($("<input/>").attr("value","").text());
	$("#taxPercentage").append($("<input/>").attr("value","").text());
	$("#CGST").append($("<input/>").attr("value","").text());
	$("#SGST").append($("<input/>").attr("value","").text());
	
	var params = {};
	
	var input1 = document.getElementById('pk_tax_details_id'),
	list = document.getElementById('taxTypeList'),
	i,pkTaxDetailsId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkTaxDetailsId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["pkTaxDetailsId"] = pkTaxDetailsId;
	params["methodName"] = "getTaxDetailsForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{			
			document.getElementById("taxType").value = v.taxType;
			document.getElementById("taxPercentage").value = v.taxPercentage;
			document.getElementById("CGST").value = v.CGST;
			document.getElementById("SGST").value = v.SGST;
		});
	}).error(function(jqXHR, textStatus, errorThrown)
	{
		if(textStatus==="timeout")
		{
			
		}
	});
}

function validateUpdateTaxDetails()
{
		
	var taxType = $('#taxType').val();
	var taxPercentage = $('#taxPercentage').val();
	var CGST = $('#CGST').val();
	var SGST = $('#SGST').val();
	
	
	if(taxType=="" || taxType==null || taxType==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Tax Type..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Enter Tax Type");
		return false;
	}
	if(CGST=="" || CGST==null || CGST==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter CGST..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		alert("Please Enter CGST");
		return false;
	}
	var letterNumber = /^[0-9\.]{1,5}$/;
	if(CGST.match(letterNumber))
	{
		if(SGST=="" || SGST==null || SGST==undefined)
		{
			swal({
		     	title: "Alert!",
		    	text: "Please Enter SGST..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Please Enter SGST");
			return false;
		}
		var letterNumber = /^[0-9\.]{1,5}$/;//+$/
		if(SGST.match(letterNumber))
		{
			
		}
		else
		{
			swal({
				title: "Alert!",
		     	text: "Enter Numeric Value Only in SGST %..!",
		     	icon: 'error',
		     	timer: 2500,
		     	button:false
			});
			//alert("Enter Numeric Value Only in SGST % ..!!");
			return false;
		}
	}
	else
	{
		swal({
		     title: "Alert!",
		     text: "Enter Numeric Value Only in CGST %..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Numeric Value Only in CGST % ..!!");
		return false;
	}
	
	updateTaxDetails();
}

//updateTaxDetails
function updateTaxDetails()
{
	document.editTaxDetailsForm.updateBtn.disabled = true;
	
	var params = {};
	
//	var input1 = document.getElementById('pk_user_id'),
//	list = document.getElementById('userNameList'),
//	i,pkUserId;
//
//	for (i = 0; i < list.options.length; ++i) {
//	if (list.options[i].value === input1.value) {
//		pkUserId = list.options[i].getAttribute('data-value');
//		}
//	}
	
		
	var input1 = document.getElementById('pk_tax_details_id'),
	list = document.getElementById('taxTypeList'),
	i,pkTaxDetailsId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkTaxDetailsId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	var taxTypeOldName = $('#pk_tax_details_id').val();
	var taxType = $('#taxType').val();
	var taxPercentage = $('#taxPercentage').val();
	var CGST = $('#CGST').val();
	var SGST = $('#SGST').val();
	//var IGST = $('#IGST').val();
	//var lastUpdateDate = $('#lastUpdateDate').val();
	
	
	params["pkTaxDetailsId"] = pkTaxDetailsId;
	params["taxTypeOldName"] = taxTypeOldName;
	
	params["taxType"] = taxType;
	params["taxPercentage"] = taxPercentage;
	params["CGST"] = CGST;
	params["SGST"] = SGST;
	
	params["methodName"] = "updateTaxDetails";
 	
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
				swal({
				     title: "Success!",
				     text: "Tax Details Updated Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				 });
 				//alert(data);
 				if(document.editTaxDetailsForm)
 				{
 					location.reload();
 				}	
 				document.editTaxDetailsForm.updateBtn.disabled =false;
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
}

//reset
function reset()
{
   document.empd.reset();
}
