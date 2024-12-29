/**
 * 
 */


function getTaxDetailsForProductDetails()
{
	$("#taxPercentage").append($("<input/>").attr("value","").text());
	$("#CGST").append($("<input/>").attr("value","").text());
	$("#SGST").append($("<input/>").attr("value","").text());
	
	var params= {};
	var employeeName= $('#fk_employee_id').val();
	
	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('userNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkEmployeeid"] = fkEmployeeid;
	params["employeeName"] = employeeName;
	params["methodName"] = "getTaxDetailsForProductDetails";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
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

function validateProductDetails()
{
	var productName = $('#productName').val();
	var fk_employee_id = $('#fk_employee_id').val();
	
	if(productName=="" || productName==null || productName==undefined)
	{
		swal({
			title: "Alert!",
		    text: "Please Select Product Name..!",
		    icon: 'error',
		    timer: 2500,
		    button:false
    });
		//alert("Please Select Product Name");
		return false;
	}
	
	if(fk_employee_id=="" || fk_employee_id==null || fk_employee_id==undefined)
	{
		swal({
			title: "Alert!",
		    text: "Please Select Tax Type..!",
		    icon: 'error',
		    timer: 2500,
		    button:false
    });
		//alert("Please Select Product Name");
		return false;
	}
	
	productDetails();
}

function productDetails(){
	
	//document.vendorForm.btn.disabled = true;
	
	var productName = $('#productName').val();
	var productCost = $('#productCost').val();
	var description = $('#description').val();
	var features = $('#features').val();
	var taxType = $('#fk_employee_id').val();
	var taxPercentage = $('#taxPercentage').val();
	var CGST = $('#CGST').val();
	var SGST = $('#SGST').val();
	var hsnsac = $('#hsnsac').val();
				
				var params = {};
				
				
				var input1 = document.getElementById('fk_employee_id'),
				list = document.getElementById('userNameList'),
				i,fkEmployeeid;
				
				for (i = 0; i < list.options.length; ++i) {
				if (list.options[i].value === input1.value) {
					fkEmployeeid = list.options[i].getAttribute('data-value');
					}
				}
				
				params["productName"] = productName;			
				params["productCost"] = productCost;
				params["description"] =description;
				params["features"] = features;
				params["fkEmployeeid"] = fkEmployeeid;
				params["taxType"] = taxType;
				params["taxPercentage"] = taxPercentage;
				params["CGST"] = CGST;
				params["SGST"] = SGST;
				params["hsnsac"] = hsnsac;
				params["methodName"] = "saveProductDetails";
			 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			 			{
					swal({
		    			title: "Success!",
		     			text: "Product Details Added Successfully !",
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


//get Product Details for Edit
function getProductListForEdit()
{
	
	$("#productName").append($("<input/>").attr("value","").text());
	
	$("#cost").append($("<input/>").attr("value","").text());
	$("#description").append($("<input/>").attr("value","").text());
	$("#features").append($("<input/>").attr("value","").text());
	$("#hsnsac").append($("<input/>").attr("value","").text());
	var params= {};
	
	var input1 = document.getElementById('fk_product_id'),
	list = document.getElementById('productNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fk_product_id"] = fkEmployeeid;
	params["methodName"] = "getProductDetailsForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
				  document.getElementById("productName").value = v.productName;
				  document.getElementById("hsnsac").value = v.hsnsac;
				  //document.getElementById("enquiryDate").value = v.enquiryDate;
			      document.getElementById("cost").value = v.productCost;
			      document.getElementById("description").value = v.description;
			      document.getElementById("features").value = v.features;
			      document.getElementById("fkTaxTypeId").value = v.fkTaxTypeId;
			      document.getElementById("fk_employee_id").value = v.taxType;
			      document.getElementById("taxPercentage").value = v.taxPercentage;
			      document.getElementById("CGST").value = v.CGST;
			      document.getElementById("SGST").value = v.SGST;
			      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}


//get Product Details for Edit
function getProductListForQuotation()
{
	
	
	$("#features").append($("<input/>").attr("value","").text());
	
	
	
	
	var params= {};
	
	var input1 = document.getElementById('fk_product_id'),
	list = document.getElementById('productNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fk_product_id"] = fkEmployeeid;
	params["methodName"] = "getProductDetailsForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
			
			
				 
			      document.getElementById("features").value = v.features;
			      
			     
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}


//get features Details for quotation
function getFeatures()
{
	
	//$("#productName").append($("<input/>").attr("value","").text());
	//$("#clientName").append($("<input/>").attr("value","").text());
	//$("#enquiryDate").append($("<input/>").attr("value","").text());
	//$("#cost").append($("<input/>").attr("value","").text());
	//$("#description").append($("<input/>").attr("value","").text());
	$("#features").append($("<input/>").attr("value","").text());
	
	
	
	
	var params= {};
	
	var input1 = document.getElementById('fk_product_id'),
	list = document.getElementById('productNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fk_product_id"] = fkEmployeeid;
	params["methodName"] = "getProductListForQuotation";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{
			
			
				  //document.getElementById("productName").value = v.productName;
				 // document.getElementById("clientName").value = v.clientName;
				 // document.getElementById("enquiryDate").value = v.enquiryDate;
			      //document.getElementById("cost").value = v.cost;
			     // document.getElementById("description").value = v.description;
			      document.getElementById("features").value = v.features;
			      
			     
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}

//update Product Details

function validateupdateProductDetails()
{
	var fk_product_id = $('#fk_product_id').val();
	
	if(fk_product_id=="" || fk_product_id==null || fk_product_id==undefined)
	{
		swal({
			title: "Alert!",
		    text: "Please Select Product Name..!",
		    icon: 'error',
		    timer: 2500,
		    button:false
    });
		//alert("Please Select Product Name");
		return false;
	}
	
	updateProductDetails();
}
function updateProductDetails()
{
	
	var params= {};
	
	var input1 = document.getElementById('fk_product_id'),
	list = document.getElementById('productNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkProductid = list.options[i].getAttribute('data-value');
		}
	}
	
	var productName = $('#fk_product_id').val();
	var productNewName = $('#productName').val();
	var hsnsac = $('#hsnsac').val();
	//var clientName  = $('#clientName').val();
	var cost = $('#cost').val();
	var description = $('#description').val();
	var features = $('#features').val();
	var taxType = $('#fk_employee_id').val();
	var taxPercentage = $('#taxPercentage').val();
	var CGST = $('#CGST').val();
	var SGST = $('#SGST').val();
	
	
	var input2 = document.getElementById('fk_employee_id'),
	list2 = document.getElementById('userNameList'),
	i,fkTaxTypeId;
	
	for (i = 0; i < list2.options.length; ++i) {
	if (list2.options[i].value === input2.value) {
		fkTaxTypeId = list2.options[i].getAttribute('data-value');
		}
	}
	
	params["productName"] = productName;
	
	params["productNewName"] = productNewName;
	params["fkProductid"] = fkProductid;
	params["hsnsac"] = hsnsac;
	params["cost"] = cost;
	params["description"] = description;
	params["features"] = features;
	//params["clientName"] = clientName;
	params["fkTaxTypeId"] = fkTaxTypeId;
	params["taxType"] = taxType;
	params["taxPercentage"] = taxPercentage;
	params["CGST"] = CGST;
	params["SGST"] = SGST;
	
	
	params["methodName"] = "updateProductDetails";
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
 		swal({
		     title: "Success!",
		     text: "Product Details Updated Successfully !",
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


function productList()
{
	var params= {};

	params["methodName"] = "getAllProductList";
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
					$( api.column( 9 ).footer() ).html(

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
				          {"data": "productName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "productCost" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          {"data": "hsnsac", "width": "5%" ,"defaultContent": ""},
				          {"data": "features", "width": "5%" ,"defaultContent": ""},
				          {"data": "taxType", "width": "5%" ,"defaultContent": ""},
				          {"data": "taxPercentage" , "width": "5%" ,"defaultContent": ""},
				          {"data": "CGST", "width": "5%" ,"defaultContent": ""},
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