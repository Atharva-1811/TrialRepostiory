/**
 ComponentDetails.js
 */

/*Component Type validation Start from here*/

//compTypesDetailsValidate
function compTypesDetailsValidate()
{
	var componentType = $('#componentType').val();
	var addingDate = $('#addingDate').val();
	
	if(componentType=="" || componentType==null || componentType==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Component Type !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Component Type");
		return false;
	}
	
	compTypeDetails();
}

//componentDetails
function compTypeDetails()
{	
	//document.componentTypeDetailsForm.saveBtn.disabled = true;
	
	var componentType = $('#componentType').val();
	
	var params = {};
	
	params["componentType"] = componentType;
	
	params["methodName"] = "saveCompTypesDetails";
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
 		swal({
		     title: "Success!",
		     text: "Component Category Details Added Successful !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     });
 		//alert(data);
 		//location.reload();
 		document.getElementById("componentType").value = "";
		}

 	).error(function(jqXHR, textStatus, errorThrown){
 		if(textStatus==="timeout") {
 			$(loaderObj).hide();
 			$(loaderObj).find('#errorDiv').show();
 		}
 	})
}

//compTypeList
function compTypeList()
{
	var params= {};

	params["methodName"] = "getCompTypeList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#list2').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#list2').DataTable( {

				"bPaginate": true,

				
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
					.column( 2 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 2 ).footer() ).html(

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
				          {"data": "componentType" , "width": "5%" ,"defaultContent": ""},
				          {"data": "lastUpdateDate", "width": "5%" ,"defaultContent": ""},
				          
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
function getCompTypeListForEdit()
{
	
	$("#componentTypeName").append($("<input/>").attr("value","").text());	
	
	var params= {};
	
	var input1 = document.getElementById('componentType'),
	list = document.getElementById('componentTypeList'),
	i,pkCompTypeId;
	
	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkCompTypeId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["pkCompTypeId"] = pkCompTypeId;
	params["methodName"] = "getAllCompTypeForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{			
				  document.getElementById("componentTypeName").value = v.componentType;
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}


//getCompTypeListForEdit
function getComponentSubCategoryListForEdit()
{
	
	$("#componentSubcategory").append($("<input/>").attr("value","").text());	
	
	var params= {};
	
	var input1 = document.getElementById('componentSubcategory'),
	list = document.getElementById('componentSubcategoryList'),
	i,pkCompTypeId;
	
	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkCompTypeId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["pkCompTypeId"] = pkCompTypeId;
	params["methodName"] = "getSubcategoyForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
				
				{			
				  document.getElementById("componentTypeName").value = v.componentType;
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}

//validateComponentDetails
function updateCompTypeDetailsValidate()
{	
	var componentTypeName = $('#componentTypeName').val();
		
	if(componentTypeName=="" || componentTypeName==null || componentTypeName==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Component Type Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Component Type Name");
		document.getElementById('componentTypeName').focus();
		return false;
	}
	var letterNumber = /^[a-zA-Z0-9, ]+$/;
	if(componentTypeName.match(letterNumber))
	{
		updateCompTypeDetails();
	}
	else
	{
		swal({
		     title: "Alert!",
		     text: "Enter Alphabets and Numbers Only in Component Type !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Enter Alphabets and Numbers Only in Component Type ..!!");
		return false;
	}
	
}
//Update component subcategory



//updateCompTypeDetails
function updateCompTypeDetails()
{
	document.editComponentTypeForm.updateBtn.disabled = true;
	
	var params= {};
	
	var input1 = document.getElementById('componentType'),
	list = document.getElementById('componentTypeList'),
	i,pkCompTypeId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkCompTypeId = list.options[i].getAttribute('data-value');
		}
	}
	
	var componentTypeName = $('#componentTypeName').val();
	//var componentTypeNew = $('#componentTypeNew').val();
	
	params["pkCompTypeId"] = pkCompTypeId;
	params["componentTypeName"] = componentTypeName;
	//params["componentTypeNew"] = componentTypeNew;	
	
	params["methodName"] = "updateCompType";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
		swal({
		     title: "Success!",
		     text: "Please Component Type Updated Successful !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     });
 				//alert(data);
 				if(document.editComponentTypeForm)
 				{
 					location.reload();
 				}	
 				document.editComponentTypeForm.updateBtn.disabled = false;
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
	
	
 	/*$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 			{
 		alert(data);*/
 		
 		//return toJson("Data Update Successfully");
 		
 		/*var msg="Please Enter Valid MRP";
		var dialog = bootbox.dialog({
    					
    				    message: '<p class="text-center">'+msg.fontcolor("red").fontsize(5)+'</p>',
    				    closeButton: false
    				});
    				
    				setTimeout(function() {
    					dialog.modal('hide');
    				}, 1500);*/
 		
 		/*location.reload();
		}).error(function(jqXHR, textStatus, errorThrown){
 		if(textStatus==="timeout") {
 			$(loaderObj).hide();
 			$(loaderObj).find('#errorDiv').show();*/
 						
 			
// 			var msg="Please Enter Valid MRP";
//			var dialog = bootbox.dialog({
//        					
//        				    message: '<p class="text-center">'+msg.fontcolor("red").fontsize(5)+'</p>',
//        				    closeButton: false
//        				});
//        				
//        				setTimeout(function() {
//        					dialog.modal('hide');
//        				}, 1500);
 				
 		/*}
 	})*/
}

function updateSubcategoryDetailsValidate()
{	
	var componentTypeName = $('#componentCategory').val();
		
	if(componentTypeName=="" || componentTypeName==null || componentTypeName==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Component Type Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		
		document.getElementById('componentTypeName').focus();
		return false;
	}
	var letterNumber = /^[a-zA-Z0-9, ]+$/;
	if(componentTypeName.match(letterNumber))
	{
		updateSubCategoryDetails();
	}
	else
	{
		swal({
		     title: "Alert!",
		     text: "Enter Alphabets and Numbers Only in Component Type !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		
		return false;
	}
	
}


function updateSubCategoryDetails()
{
	document.editComponentTypeForm.updateBtn.disabled = true;
	
	var params= {};
	
	var input1 = document.getElementById('componentSubcategory'),
	list = document.getElementById('componentSubcategory'),
	i,pkSubCompTypeId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkSubCompTypeId = list.options[i].getAttribute('value');
		}
	}
	
	var updatedSubCategory = $('#updatedSubCategory').val();
	
	params["pkSubCompTypeId"] = pkSubCompTypeId;
	params["updatedSubCategory"] = updatedSubCategory;
	
	params["methodName"] = "updateComponentSubCategory";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
		swal({
		     title: "Success!",
		     text: "Please Component Type Updated Successful !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     });
 				//alert(data);
 				if(document.editComponentTypeForm)
 				{
 					location.reload();
 				}	
 				document.editComponentTypeForm.updateBtn.disabled = false;
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
}


// validateComponentDetails
function validateComponentDetails()
{
	var componentName = $('#componentName').val();
	var addingDate = $('#addingDate').val();
	
	if(componentName=="" || componentName==null || componentName==undefined)
	{
		alert("Please Enter Component Name");
		return false;
	}
	var letterNumber = /^[a-zA-Z0-9, ]+$/;
	if(componentName.match(letterNumber))
	{
		
		if(addingDate=="" || addingDate==null || addingDate==undefined)
		{
			alert("Please Enter Date");
			return false;
		}
		componentDetails();
	}
	else
	{
		alert("Enter Alphabets and Numbers Only in Component Name..!!");
		return false;
	}
}

/*Component validation Start from here*/

// componentDetails
function componentDetails()
{	
	//document.vendorForm.btn.disabled = true;
	
	var componentName = $('#componentName').val();
	var addingDate = $('#addingDate').val();
	var description = $('#description').val();
	var features = $('#features').val();
		
	var params = {};
	
	params["componentName"] = componentName;
	params["addingDate"] = addingDate;
	params["description"] = description;
	params["features"] = features;
	
	params["methodName"] = "componentDetails";
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
 	})
}




//reset
function reset()
{
	document.componentDetailsForm.reset();
}

//componentDtlList
function componentDtlList()
{
	var params= {};

	params["methodName"] = "getAllComponentDtlList";
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
					$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,			      
				columns: [
					      {"data": "SrNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "componentCategory" , "width": "5%" ,"defaultContent": ""},
				          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
				          {"data": "manufractureName", "width": "5%" ,"defaultContent": ""},
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          {"data": "unit", "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPriceWithCustomduty", "width": "5%" ,"defaultContent": ""},
				         				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Details List";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Details List";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Details List";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Details List";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
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




//componentReceivedPOList
function componentReceivedPOList()
{
	var params= {};

	params["methodName"] = "componentReceivedPOList";//
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchaseOrderCreatelist').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#purchaseOrderCreatelist').DataTable({

				"bPaginate": true,
				
				fnRowCallback : function(nRow, aData, iDisplayIndex){
					$("th:first", nRow).html(iDisplayIndex +1);
					return nRow;
				},

//				"footerCallback": function ( row, data, start, end, display ) {
//					var api = this.api(), data;
//
//					// Remove the formatting to get integer data for summation
//					var intVal = function ( i ) {
//						return typeof i === 'string' ?
//								i.replace(/[\$,]/g, '')*1 :
//									typeof i === 'number' ?
//											i : 0;
//					};

//					// Total over this page
//					pageTotal = api
//					.column( 24 )
//					.data()
//					.reduce( function (a, b) {
//						return intVal(a) + intVal(b);
//					}, 0 );
//
//					// Update footer
//					$( api.column( 21 ).footer() ).html(
//
//							''+' '+parseFloat(pageTotal).toFixed(2)
//
//					);
//					console.log( pageTotal);
//				},

				destroy: true,
				searching: true,
				"scrollX": true,
				"scrollY": 300,
				columns: [
					
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "componentType", "width": "5%" ,"defaultContent": ""},
				          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
				          {"data": "compValue" , "width": "5%" ,"defaultContent": ""},				          
				          {"data": "partName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "compPackage" , "width": "5%" ,"defaultContent": ""},
				          {"data": "tolerance" , "width": "5%" ,"defaultContent": ""},
				          {"data": "unit" , "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity", "width": "5%" ,"defaultContent": ""},
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "GST" , "width": "5%" ,"defaultContent": ""},
				          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
//				          {"data": "taxAmount", "width": "5%" ,"defaultContent": ""},
//				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
//				          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
//				          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "billChallanNo", "width": "5%" ,"defaultContent": ""},
						  {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "purchaseOrderDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
				         				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Received PO Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Received PO Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Received PO Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Received PO Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		var mydata = catmap;
		$('#purchaseOrderCreatelist').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

//componentReceivedPOReport
function componentReceivedPOReport()
{
	var params= {};

	params["methodName"] = "componentReceivedPOReport";//
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#purchaseOrderCreatelist').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#purchaseOrderCreatelist').DataTable({

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
					.column( 24 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 21 ).footer() ).html(

							''+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);
				},

				destroy: true,
				searching: true,			      
				columns: [
					
						  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "billChallanNo", "width": "5%" ,"defaultContent": ""},
						  {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "purchaseOrderDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
				          {"data": "componentType", "width": "5%" ,"defaultContent": ""},
				          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
				          {"data": "compValue" , "width": "5%" ,"defaultContent": ""},				          
				          {"data": "partName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "description", "width": "5%" ,"defaultContent": ""},
				          {"data": "type", "width": "5%" ,"defaultContent": ""},
				          {"data": "compPackage" , "width": "5%" ,"defaultContent": ""},
				          {"data": "tolerance" , "width": "5%" ,"defaultContent": ""},
				          {"data": "unit" , "width": "5%" ,"defaultContent": ""},
				          {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
				          {"data": "quantity", "width": "5%" ,"defaultContent": ""},
				          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "GST" , "width": "5%" ,"defaultContent": ""},
				          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
				          {"data": "taxAmount", "width": "5%" ,"defaultContent": ""},
				          {"data": "total" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
				          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				         				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Received PO Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Received PO Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Received PO Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Received PO Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		var mydata = catmap;
		$('#purchaseOrderCreatelist').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

function GetCompoentNameagainestCategory1() {
	
	var componentType = $('#componentType').val();
	
	var input1 = document.getElementById('componentType'), 
	list = document.getElementById('componentNameList'),
		   i, pkcompoentNameid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
	pkcompoentNameid = list.options[i].getAttribute('data-value');
		}
	}
	
	var input2 = document.getElementById('subCategory'), 
	list2 = document.getElementById('subCategoryList'),
		   i, pkcompoentSubcategoryId;

	for (i = 0; i < list2.options.length; ++i) {
	if (list2.options[i].value === input2.value) {
	pkcompoentSubcategoryId = list2.options[i].getAttribute('data-value');
		}
	}

	$("#componentName_id1").empty();
	$("#componentName_id1").append($("<option></option>").attr("value","").text("Select Component Name"));
	var params = {};
	
	params["componentType"] = pkcompoentNameid;
	params["pkcompoentSubcategoryId"] = pkcompoentSubcategoryId;
	
	params["methodName"] = "GetCompoentnametoselect11";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,
		function(data)
		{
		//alert(data);
		var count = 1;
		
		var jsonData = $.parseJSON(data);
		//var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			
			$("#componentName_id1").append($("<option></option>").attr("value", v.pkComponentCategoryDetailsId+","+v.componentName+","+v.componentValue+","+v.packages+","+v.tovRating));
			count++;
			 
				});
			}).error(function(jqXHR, textStatus, errorThrown){
	 			if(textStatus==="timeout") {

				}
			});
 	    	
}
//componentReceivedPODetailsValidation
function componentReceivedPODetailsValidation() {

	var vendorName = $('#fk_employee_id').val();
	var billChalanNo = $('#billno').val();
	var purchaseOrderDate = $('#purchasedate').val();
	var expectPaymentDate = $('#expectPaymentDate').val();
	

	if (vendorName == "" || vendorName == null || vendorName == undefined) {
		swal({
		     title: "Alert!",
		     text: "Please Select Vendor Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Vendor Name");
		document.getElementById("fk_employee_id").focus();
		return false;
	}
	var letterNumber = /^[a-zA-Z, ]+$/;
	if (vendorName.match(letterNumber)) {
		if (billChalanNo == "" || billChalanNo == null
				|| billChalanNo == undefined) 
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Bill / Challan No !",
			     icon: 'error',
			     timer: 2500,
			     button:false
			     });
			//alert("Please Enter Bill / Challan No");
			document.getElementById("billno").focus();
			return false;
		}
		var letterNumber = /^[a-zA-Z0-9,]+$/;
		if (billChalanNo.match(letterNumber)) {
			if (purchaseOrderDate == "" || purchaseOrderDate == null
					|| purchaseOrderDate == undefined) {
				swal({
				     title: "Alert!",
				     text: "Please Select Purchase Order Date !",
				     icon: 'error',
				     timer: 2500,
				     button:false
				     });
				//alert("Please Select Purchase Order Date");
				document.getElementById("purchasedate").focus();
				return false;
			}
			if (expectPaymentDate == "" || expectPaymentDate == null
					|| expectPaymentDate == undefined) {
				swal({
				     title: "Alert!",
				     text: "Please Select Expect Payment Order Date !",
				     icon: 'error',
				     timer: 2500,
				     button:false
				     });
				//alert("Please Select Expect Payment Order Date");
				document.getElementById("expectPaymentDate").focus();
				return false;
			}
			/*
			 * var letterNumber = /^[a-zA-Z0-9,]+$/;
			 * if(billChalanNo.match(letterNumber)) {
			 *  } else { alert("Enter Alphabets and Digits Only in Bill / Chalan
			 * No..!!"); return false; }
			 */
		} else {
			swal({
			     title: "Alert!",
			     text: "Enter Alphabets and Digits Only in Bill / Chalan No !",
			     icon: 'error',
			     timer: 2500,
			     button:false
			     });
			//alert("Enter Alphabets and Digits Only in Bill / Chalan No..!!");
			document.getElementById("billno").focus();
			return false;
		}
	} else {
		swal({
		     title: "Alert!",
		     text: "Enter Alphabets and Only in Vendor Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Enter Alphabets and Only in Vendor Name..!!");
		document.getElementById("fk_employee_id").focus();
		return false;
	}

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');

	if (count <= 0) {
		swal({
		     title: "Alert!",
		     text: "Please Select Component Type !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please Select Component Type !!!. . .');
		document.getElementById("componentType").focus();
		return false;
	}

	var allRowsInGrid = $('#list4').getGridParam('data');// to get all rows of grid
	var AllRows = JSON.stringify(allRowsInGrid);

	for (var i = 0; i < count; i++) {

		var quantity = allRowsInGrid[i].quantity;
		var subTotal = allRowsInGrid[i].subTotal;
		var GST = allRowsInGrid[i].GST;
		var IGST = allRowsInGrid[i].IGST;
		var taxAmount = allRowsInGrid[i].taxAmount;
		var total = allRowsInGrid[i].total;

	}
	
	var totalSubTotal = $('#totalSubTotal').val();
	var totalTaxAmount = $('#totalTaxAmount').val();
	var grossTotal = $('#grossTotal').val();
	
	if (totalSubTotal == "" || totalSubTotal == null || totalSubTotal == undefined) {
		swal({
		     title: "Alert!",
		     text: "Please Enter Total Sub Total !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Total Sub Total");
		document.getElementById("grossTotal").focus();
		return false;
	}	
	if (totalTaxAmount == "" || totalTaxAmount == null || totalTaxAmount == undefined) {
		swal({
		     title: "Alert!",
		     text: "Please Enter Total Tax Amount !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Total Tax Amount");
		document.getElementById("grossTotal").focus();
		return false;
	}	
	if (grossTotal == "" || grossTotal == null || grossTotal == undefined) {
		swal({
		     title: "Alert!",
		     text: "Please Enter Gross Total !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter Gross Total");
		document.getElementById("grossTotal").focus();
		return false;
	}

	componentReceivedPODetails();

}

// componentReceivedPODetails
function componentReceivedPODetails() {

	var params = {};

	var input1 = document.getElementById('fk_employee_id'), list = document.getElementById('venderNameList'), i, fk_vendor_id;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_vendor_id = list.options[i].getAttribute('data-value');
		}
	}

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');// to get all rows of grid
	var AllRows = JSON.stringify(allRowsInGrid);

	for (var i = 0; i < count; i++) {
		var componentCategory = allRowsInGrid[i].componentCategory;
		params["componentCategory" + i] = componentCategory;

		var fkCompTypeId = allRowsInGrid[i].fkCompTypeId;
		params["fkCompTypeId" + i] = fkCompTypeId;

		var componentName = allRowsInGrid[i].componentName;
		params["componentName" + i] = componentName;

		
		var pkComponentCategoryDetailsId = allRowsInGrid[i].pkComponentCategoryDetailsId;
		params["pkComponentCategoryDetailsId" + i] = pkComponentCategoryDetailsId;
		
		
		var componentValue = allRowsInGrid[i].componentValue;
		params["componentValue" + i] = componentValue;

		var partNumber = allRowsInGrid[i].partNumber;
		params["partNumber" + i] = partNumber;

		var manufractureName = allRowsInGrid[i].manufractureName;
		params["manufractureName" + i] = manufractureName;

		var description = allRowsInGrid[i].description;
		params["description" + i] = description;

		var componentType = allRowsInGrid[i].componentType;
		params["componentType" + i] = componentType;

		var packages = allRowsInGrid[i].packages;
		params["packages" + i] = packages;
		
		var tovRating = allRowsInGrid[i].tovRating;
		params["tovRating" + i] = tovRating;
		
		var unit = allRowsInGrid[i].unit;
		params["unit" + i] = unit;

		var unitPriceWithCustomduty = allRowsInGrid[i].unitPriceWithCustomduty;
		params["unitPriceWithCustomduty" + i] = unitPriceWithCustomduty;

		var quantity = allRowsInGrid[i].quantity;
		params["quantity" + i] = quantity;
		
		var subTotal = allRowsInGrid[i].subTotal;
		params["subTotal" + i] = subTotal;
		
		var GST = allRowsInGrid[i].GST;
		params["GST" + i] = GST;

		var IGST = allRowsInGrid[i].IGST;
		params["IGST" + i] = IGST;

		var taxAmount = allRowsInGrid[i].taxAmount;
		params["taxAmount" + i] = taxAmount;
		
		var total = allRowsInGrid[i].total;
		params["total" + i] = total;

	}

	var vendorName = $('#fk_employee_id').val();
	var billChalanNo = $('#billno').val();
	var purchaseOrderDate = $('#purchasedate').val();
	var expectPaymentDate = $('#expectPaymentDate').val();
	var totalSubTotal = $('#totalSubTotal').val();
	var totalTaxAmount = $('#totalTaxAmount').val();
	var grossTotal = $('#grossTotal').val();

	params["vendorId"] = fk_vendor_id;
	params["vendorName"] = vendorName;
	params["billChalanNo"] = billChalanNo;
	params["purchaseOrderDate"] = purchaseOrderDate;
	params["expectPaymentDate"] = expectPaymentDate;
	params["totalSubTotal"] = totalSubTotal;
	params["totalTaxAmount"] = totalTaxAmount;
	params["grossTotal"] = grossTotal;

	params["count"] = count;

	params["methodName"] = "saveComponentReceivedPODetails";
	
	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) {

		swal({
		     title: "Success!",
		     text: "Component Received added Successful !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     });
		//alert(data);
		location.reload();
	}

	).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	})

}



/******** Component Received PO validation ********/

//getGridForComponentTypeInRecive
function getGridForComponentTypeInRecive() {

	if (document.CompReceivedPO.componentType.value == ""
			|| document.CompReceivedPO.componentType.value == null) {
		alert('Please Enter Component Type');
		document.getElementById("componentName_id").value ="";
		return false;
	}
	getGridAsForCompTypeForCompReceivedPO();
}

//get Grid of Component Good Receive
function getGridAsForCompTypeForCompReceivedPO() {
	var params = {};
	var count = 0;
	var newrow;
	var rowId;


	
	var componentName1 = $('#componentName_id').val();

/*	$("#componentName_id option:selected").each(function() {
		   selectedVal = componentName1.text();
		});*/
	
	var splitText = componentName1.split(",");
	
	var fkCompoentid = splitText[0];
	var componentName = splitText[1];
	
	params["fkCompoentid"] = fkCompoentid;
	params["componentName"] = componentName;
	
	params["methodName"] = "getGridAsForCompTypeForCompReceivedPO";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);

		// $("#list4").jqGrid("clearGridData",true).trigger("reloadGrid");

		$.each(jsonData,function(i, v)
		{
			count = jQuery("#list4").jqGrid('getGridParam', 'records');
			var rowdata = $("#list4").jqGrid('getGridParam', 'data');
			var ids = jQuery("#list4").jqGrid('getDataIDs');
			var prodName, com, packing, unit;
			for (var j = 0; j < count; j++)
			{
				prodName = rowdata[j].componentName;

				var rowId = ids[j];
				var rowData = jQuery('#list4').jqGrid('getRowData',rowId);
				
				if (prodName == v.componentName) 
				{
			    	newrow=false;
					alert("Component Name Already Inserted !!!");
					var grid = jQuery("#list4");
				    grid.trigger("reloadGrid");
				}	else
				{
					newrow = true;
				}
				
			}
			
			if (newrow == true) {
				// $("#list4").addRowData(i,jsonData[i]);
				$("#list4").addRowData(count,jsonData.offer);
			}

			$("#list4").jqGrid({
				datatype : "local",
				
				colNames : ['Comp. Type','Comp. Id','Comp. Name','Comp. NameId','Comp. Value','Part Name','Unit','UnitPrice','QTY','Total ExGST','GST%','IGST%','TAX AMT','Total','Mfg. Name','Description','Type','Package','TO/VA'],
				colModel : [
					{
						name : 'componentCategory',
						width : 42,
						editable : false
					},
					{
						name : 'fkCompTypeId',
						width : 20,
						editable : false,
						hidden : true
					},
					{
						name : 'componentName',
						width : 42,
						editable : true
					},
					{
						name : 'pkComponentCategoryDetailsId',
						width : 20,
						editable : false,
						hidden : true
					},
					{
						name : 'componentValue',
						width : 42,
						editable : false
					},
					{
						name : 'partNumber',
						width : 42,
						editable : false
					},
					
					{
						name : 'unit',
						width : 30,
						editable : false,
						hidden: true
					},
					{
						name : 'unitPriceWithCustomduty',
						width : 30,
						editable : true
					},
					{
						name : 'quantity',
						width : 28,
						editable : true
					},
					{	name:'subTotal',
				    	 width:30,
				    	 editable: false
					},
					{	name:'GST',
				    	 width:22,
				    	 editable: true
					},
					{	name:'IGST',
				    	 width:24,
				    	 editable: true
					},
					{	name:'taxAmount',
				    	 width:35,
				    	 editable: false
					},
					{
						name : 'total',
						width : 40,
					},
					{
						name : 'manufractureName',
						width : 42,
						editable : false
					},
					{
						name : 'description',
						width : 42,
						editable : false
					},
					{
						name : 'componentType',
						width : 40,
						editable : false
					},
					{
						name : 'packages',
						width : 42,
						editable : false
					},
					{
						name : 'tovRating',
						width : 40,
						editable : false
					}
				],
				
				sortorder : 'desc',
				loadonce : false,
				viewrecords : true,
				width : 1850,
				// height: 350,
				shrinkToFit : true,
				rowheight : 300,
				hoverrows : true,
				rownumbers : true,
				rowNum : 10,
				'cellEdit' : true,
				afterSaveCell : function grossTotal() {
					
					/* Calculation of total after editing quantity */
					
					// $(this).trigger('reloadGrid');
					var rowId = $("#list4").jqGrid('getGridParam','selrow');				
					var rowData = jQuery("#list4").getRowData(rowId);
					var quantity = rowData['quantity'];
					var unitPrice = rowData['unitPriceWithCustomduty'];
					
					/* 	Calculation of subTotal to after editing quantity*/	        		        	
		        	var subTotal = (quantity * unitPrice);
		        	//var gridSubTotalcal = gridSubTotalcal2.toFixed(2);
		        	$("#list4").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
		        	
		        	/* 	Calculation of GSTAmount and IGSTAmount after editing GST and IGST*/
              	var GST = rowData['GST'];
              	var IGST = rowData['IGST'];
		        	var GSTAmount = (subTotal * GST) / 100;
		        	var IGSTAmount = (subTotal * IGST) / 100;
		        	var taxAmount = (GSTAmount + IGSTAmount);
		        	$("#list4").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));

					/* Calculation of Total after editing quantity */
					var total = (subTotal + taxAmount);
					$("#list4").jqGrid( "setCell", rowId, "total", total);
					
					var totalSubTotal = 0;
          		var totalTaxAmount = 0;
					var Total = 0;
					var count = jQuery("#list4").jqGrid('getGridParam','records');
					var allRowsInGrid1 = $('#list4').getGridParam('data');
					var AllRows = JSON.stringify(allRowsInGrid1);
					for (var k = 0; k < count; k++) {
						
						var totalSubTotal1 = allRowsInGrid1[k].subTotal;
		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
		        		
		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
						
						var Total1 = allRowsInGrid1[k].total;
						if (Total1 != null) {
							Total = Total + Total1;
						}
					}
					document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
		        	document.getElementById("totalTaxAmount").value = totalTaxAmount.toFixed(2);
					document.getElementById("grossTotal").value = Total.toFixed(2);
				},
				
				pager : "#jqGridPager",

			});
			
			// $("#list4").addRowData(i+1,jsonData[i]);
			if (count == 0 || count == null) {
				// $("#list4").addRowData(i,jsonData[i]);
				$("#list4").addRowData(0,
						jsonData.offer);
			}
			
			$('#list4').navGrid('#jqGridPager',
					{
						edit : true,
						add : false,
						del : true,
						search : true,
						refresh : true,
						view : true,
						position : "left",
						cloneToTop : false
					},
					
					{
						editCaption : "The Edit Dialog",

						afterSubmit : function() {

							var grid = $("#list4"), intervalId = setInterval(function() {
								
								grid.trigger(
										"reloadGrid",
										[ {
											current : true
										} ]);															
									}, 500);
						},

						recreateForm : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfterEdit : true,

						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},
					
					{
						closeAfterAdd : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},
					
					{
						closeAfterdel : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						recreateForm : true,

						reloadAftersubmit : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						},
						afterComplete : function() {
							var rowId = $("#list4").jqGrid('getGridParam','selrow');
							var rowData = jQuery("#list4").getRowData(rowId);
							var quantity = rowData['quantity'];
							var buyPrice = rowData['buyPrice'];
							
							var tota = quantity * buyPrice;
							$("#list4").jqGrid("setCell", rowId, "total", tota);
							
							var totalSubTotal = 0;
		            		var totalTaxAmount = 0;
							var Total = 0;
							var count = jQuery("#list4").jqGrid('getGridParam','records');
							var allRowsInGrid1 = $('#list4').getGridParam('data');
							var AllRows = JSON.stringify(allRowsInGrid1);
							for (var k = 0; k < count; k++) {
								
								var totalSubTotal1 = allRowsInGrid1[k].subTotal;
				        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
				        		
				        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
				        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
								
								var Total1 = allRowsInGrid1[k].total;
								Total = +Total+ +Total1;
							}
							document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
		 		        	document.getElementById("totalTaxAmount").value = totalTaxAmount.toFixed(2);
							document.getElementById("grossTotal").value = Total.toFixed(2);
						}
					});
		});
	})
	document.getElementById("componentName_id").value ="";
	
}

function vendorname()
{
	var VendorName = $("#VendorName").val();
	var startDate = $("#fisDate4").val();
	var endDate = $("#endDate4").val();
	
	if(VendorName=="" || VendorName==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Vendor Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Vendor Name");
		$("#VendorName").focus();
		return false;
	}
	if(startDate=="" || startDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Start Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select start Date");
		$("#fisDate4").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select End Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select end Date");
		$("#endDate4").focus();
		return false;
	}
	getClientPaymentDetailsByName();	
}


function getClientPaymentDetailsByName()
{

	var VendorName = $("#VendorName").val();
	var fisDate4 = $("#fisDate4").val();
	var endDate4 = $("#endDate4").val();
	
	var input1 = document.getElementById('VendorName'), list = document
	.getElementById('cli_drop'), i, fkClientId2;
    for (i = 0; i < list.options.length; ++i)
    {
	    if (list.options[i].value === input1.value) 
	    {
	    	fkClientId2 = list.options[i].getAttribute('data-value');
	    }
    }
	
  	var params= {};
	
	params["fkClientId2"] = fkClientId2;
	params["VendorName"] = VendorName;
	params["fisDate4"] = fisDate4;
	params["endDate4"] = endDate4;
	
	params["methodName"] = "getCompoentRecivedReportbyVendorName";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#clientBetweenTwoDatesAndName').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap=="" || catmap<=0 || catmap==null) 
		{
			swal({
			     title: "Warning!",
			     text: "No data Available for "+VendorName+" \nFrom "+fisDate4+" To "+endDate4+"..!",
			     icon: 'warning',
			     timer: 2500,
			     button:false
			     });
			return false;
		}
		
		$(document).ready(function() {
			
			$('#clientBetweenTwoDatesAndName').DataTable( {

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
				"scrollX": true,
				columns: [
				        

					  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "billChallanNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "purchaseOrderDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
			          {"data": "componentType", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "compValue" , "width": "5%" ,"defaultContent": ""},				          
			          {"data": "partName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "description", "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "compPackage" , "width": "5%" ,"defaultContent": ""},
			          {"data": "tolerance" , "width": "5%" ,"defaultContent": ""},
			          {"data": "unit" , "width": "5%" ,"defaultContent": ""},
			          {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity", "width": "5%" ,"defaultContent": ""},
			          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "GST" , "width": "5%" ,"defaultContent": ""},
			          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
			          {"data": "taxAmount", "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          ],
				          
				          
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});		
		var mydata = catmap;
		$('#clientBetweenTwoDatesAndName').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

function getCompoentCategoryBetTwoDaysvalidation()
{
	var CompoenentCategory= $('#componentCategory_id').val();
	//alert(CompoenentCategory);
	var startDate = $("#fisDate7").val();
	//alert(startDate);
	var endDate = $("#endDate7").val();
	
	if(CompoenentCategory=="" || CompoenentCategory==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please  Select Component Category !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Compoenet Category");
		$("#componentCategory_id").focus();
		return false;
	}
	if(startDate=="" || startDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Start Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select start Date");
		$("#fisDate7").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select End Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select end Date");
		$("#endDate7").focus();
		return false;
	}
	
	getCompoentCategoryBetTwoDays();
}

function getCompoentCategoryBetTwoDays () 
{
	var params= {};
	var CompoentCategory= $('#componentCategory_id').val();
	var fisDate = $("#fisDate7").val();
	var endDate = $("#endDate7").val();

	var input1 = document.getElementById('componentCategory_id'),
	list = document.getElementById('compoentCategorylist'),
	i,fkCompenetId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkCompenetId = list.options[i].getAttribute('data-value');
		}
	}
	params["fkCompenetId"]= fkCompenetId;
	params["CompoentCategory"]= CompoentCategory;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getCompoentCategoryForCompoenetReciveReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#categoryBetweenTwoDatesAndName').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap=="" || catmap<=0 || catmap==null) 
		{
			swal({
			     title: "Warning!",
			     text: "No data Available for "+CompoentCategory+" \nFrom "+fisDate+" To "+endDate+"..!",
			     icon: 'warning',
			     timer: 2500,
			     button:false
			     });
			return false;
		}

		$(document).ready(function() {
			$('#categoryBetweenTwoDatesAndName').DataTable( {

				"bPaginate": true,

				
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
					

					  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "billChallanNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "purchaseOrderDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
			          {"data": "componentType", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "compValue" , "width": "5%" ,"defaultContent": ""},				          
			          {"data": "partName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "description", "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "compPackage" , "width": "5%" ,"defaultContent": ""},
			          {"data": "tolerance" , "width": "5%" ,"defaultContent": ""},
			          {"data": "unit" , "width": "5%" ,"defaultContent": ""},
			          {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity", "width": "5%" ,"defaultContent": ""},
			          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "GST" , "width": "5%" ,"defaultContent": ""},
			          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
			          {"data": "taxAmount", "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          
				          
				          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#categoryBetweenTwoDatesAndName').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}



function ok()
{
	var startDate = $("#fisDate42").val();
	var endDate = $("#endDate42").val();
	
	if(startDate=="" || startDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Start Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select start Date");
		$("#fisDate42").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select End Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select end Date");
		$("#endDate42").focus();
		return false;
	}
	getCompoentDetailsByDate();	
}

//Client Payment Report Date Wise
function getCompoentDetailsByDate()
{
	var fisDate42 = $("#fisDate42").val();
	var endDate42 = $("#endDate42").val();
	
	var params= {};
	
	params["fisDate42"] = fisDate42;
	params["endDate42"] = endDate42;
	
	params["methodName"] = "getCompoentReciveReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#clientBetweenTwoDate').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap=="" || catmap<=0 || catmap==null) 
		{
			swal({
			     title: "Warning!",
			     text: "No data Available for Dates \nFrom "+fisDate42+" To "+endDate42+"..!",
			     icon: 'warning',
			     timer: 2500,
			     button:false
			     });
			return false;
		}
		
		$(document).ready(function() {
			
			$('#clientBetweenTwoDate').DataTable( {

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
				"scrollX": true,
				columns: [
				        

					  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "billChallanNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "purchaseOrderDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
			          {"data": "componentType", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "compValue" , "width": "5%" ,"defaultContent": ""},				          
			          {"data": "partName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "description", "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "compPackage" , "width": "5%" ,"defaultContent": ""},
			          {"data": "tolerance" , "width": "5%" ,"defaultContent": ""},
			          {"data": "unit" , "width": "5%" ,"defaultContent": ""},
			          {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity", "width": "5%" ,"defaultContent": ""},
			          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "GST" , "width": "5%" ,"defaultContent": ""},
			          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
			          {"data": "taxAmount", "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Compoenet Recived Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});
		
		
		var mydata = catmap;
		$('#clientBetweenTwoDate').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	

}




function GetCompoentNameagainestCategory() {

	//$("#componentType").append($("<input/>").attr("value","").text());
	
	var componentType = $('#componentType').val();
	
	var input1 = document.getElementById('componentType'), 
	list = document.getElementById('componentNameList'),
		   i, pkcompoentNameid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
	pkcompoentNameid = list.options[i].getAttribute('data-value');
		}
	}

	$("#componentName_id").empty();
	$("#componentName_id").append($("<option></option>").attr("value","").text("Select Component Name"));
	var params = {};
	
	params["componentType"] = pkcompoentNameid;
	
	params["methodName"] = "GetCompoentnametoselectReport1";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,
		function(data)
		{
		//alert(data);
		var count = 1;
		
		var jsonData = $.parseJSON(data);
		//var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			
			$("#componentName_id").append(
					$("<option></option>").attr("value", count).text(v.pkComponentCategoryDetailsId+","+v.componentName));
			count++;
			 
			
			//$("#compoentCategoryNamelist").append($("<option></option>").attr("value",count).text(v.pkComponentCategoryDetailsId+","+v.componentName)); 
			//count++;
			
			//$("#componentName_id").append($("<option></option>").attr("value", count).text(v.componentName));
			//count++;
			//document.getElementById("componentName_id").value = v.componentName;
			
				});
			}).error(function(jqXHR, textStatus, errorThrown){
	 			if(textStatus==="timeout") {

				}
			});
 	    	
}
function compoentstockreport1()
{
	var CompoenentCategory= $('#componentType').val();
	var ComponentName_id= $('#componentName_id').val();
	//alert(CompoenentCategory);
	var startDate = $("#fisDate10").val();
	//alert(startDate);
	var endDate = $("#endDate10").val();
	//alert(endDate);
	if(CompoenentCategory=="" || CompoenentCategory==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please  Select Component Category !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Compoenet Category");
		$("#componentType").focus();
		return false;
	}
	if(ComponentName_id=="" || CompoenentCategory==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please  Select Component Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Compoenet Category");
		$("#componentName_id").focus();
		return false;
	}
	if(startDate=="" || startDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please  Select Start Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select start Date");
		$("#fisDate10").focus();
		return false;
	}
	if(endDate=="" || endDate==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please  Select End Date !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select end Date");
		$("#endDate10").focus();
		return false;
	}
	
	getCompoentCategoryBetTwoDays1();
}

function getCompoentCategoryBetTwoDays1 () 
{
	var params= {};
	var componentType= $('#componentType').val();
	
	//alert(componentType);
	
	var fisDate = $("#fisDate10").val();
	var endDate = $("#endDate10").val();

	var input1 = document.getElementById('componentType'),
	list = document.getElementById('componentNameList'),
	i,fkCompenetId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkCompenetId = list.options[i].getAttribute('data-value');
		}
	}
	
	var componentName1 = $('#componentName_id').val();

	$("#componentName_id option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var fkCompoentid = splitText[0];
	
	$("#componentName_id option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var componentName = splitText[1];
	
	params["fkCompoentid"] = fkCompoentid;
	params["componentName"] = componentName;
	
	params["fkCompenetId"]= fkCompenetId;
	params["componentType"]= componentType;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getCompoentCategoryForstockreciveBetweenTwoDatesandname";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#categoryBetweenTwoDatesAndName1').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap=="" || catmap<=0 || catmap==null) 
		{
			swal({
			     title: "Warning!",
			     text: "No data Available for \nComponent Name: "+componentName+",\nFrom "+fisDate+" To "+endDate+"..!",
			     icon: 'warning',
			     timer: 2500,
			     button:false
			     });
			return false;
		}

		$(document).ready(function() {
			$('#categoryBetweenTwoDatesAndName1').DataTable( {

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
				"scrollX": true,
				columns: [
					

					{"data": "srNo" , "width": "5%" ,"defaultContent": ""},
			          {"data": "billChallanNo", "width": "5%" ,"defaultContent": ""},
					  {"data": "vendorName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "purchaseOrderDate", "width": "5%" ,"defaultContent": ""},
			          {"data": "expectPaymentDate" , "width": "5%" ,"defaultContent": ""},
			          {"data": "componentType", "width": "5%" ,"defaultContent": ""},
			          {"data": "componentName", "width": "5%" ,"defaultContent": ""},
			          {"data": "compValue" , "width": "5%" ,"defaultContent": ""},				          
			          {"data": "partName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "manufacturarName" , "width": "5%" ,"defaultContent": ""},
			          {"data": "description", "width": "5%" ,"defaultContent": ""},
			          {"data": "type", "width": "5%" ,"defaultContent": ""},
			          {"data": "compPackage" , "width": "5%" ,"defaultContent": ""},
			          {"data": "tolerance" , "width": "5%" ,"defaultContent": ""},
			          {"data": "unit" , "width": "5%" ,"defaultContent": ""},
			          {"data": "unitPrice", "width": "5%" ,"defaultContent": ""},
			          {"data": "quantity", "width": "5%" ,"defaultContent": ""},
			          {"data": "subTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "GST" , "width": "5%" ,"defaultContent": ""},
			          {"data": "IGST", "width": "5%" ,"defaultContent": ""},
			          {"data": "taxAmount", "width": "5%" ,"defaultContent": ""},
			          {"data": "total" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalTaxAmount" , "width": "5%" ,"defaultContent": ""},
			          {"data": "totalSubTotal" , "width": "5%" ,"defaultContent": ""},
			          {"data": "grossTotal" , "width": "5%" ,"defaultContent": ""},
				          
				          
			          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Recived Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Recived Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Recived Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Component Recived Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#categoryBetweenTwoDatesAndName1').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


//direct ajax call to StockBulkUploadController servlet
//Component Stocks Bulk Upload by Namrata
function uploadCompStockFile() {
	
	event.preventDefault();
	//var f = new FormData(this);
	var f = new FormData(document.getElementById("myform1"));
	console.log(f);
	
	$("#loader1").show();
	
	$.ajax({
		type: "POST",
	    url: "../com/embel/controller/StockBulkUploadController",
	    async: true,
	    //data: $("#myform").serialize(),
	    data: f,
	    contentType: false,
	    processData: false,
	
	success: function (data, textStatus, jqXHR) {
		$("#loader1").hide();
		
		var splitText = data.split('{').join('').split('"').join('').split('[').join(' [').split('],').join(']\n').split('}').join('');
		alert(splitText);
		location.reload();
		},
		
	error: function (jqXHR, textStatus, errorThrown) {
		$("#loader1").hide();
		
		alert('Error! Try again');
		location.reload();
		}

	});
	
}
function showAddComponentCategoryBox() {
	console.log("Its Me");
	  $("#addComponentCategoryBox").modal("show");
	}

function getComponentSubcategory() {

	var componentType = $('#componentType').val();	
	var input1 = document.getElementById('componentType'), 
	list = document.getElementById('componentNameList'),
		   i, pkcompoentNameid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
	pkcompoentNameid = list.options[i].getAttribute('data-value');
		}
	}

	$("#subCategoryList").empty();
	$("#subCategoryList").append($("<option></option>").attr("value","").text("Select SubCategory Name"));
	var params = {};
	
	params["categoryId"] = pkcompoentNameid;
	
	params["methodName"] = "getComponentList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,
		function(data)
		{
		
		var count = 1;
		var jsonData = $.parseJSON(data);
		
		$.each(jsonData,function(i,v)
		{
			
			$("#subCategoryList").append($("<option></option>").attr("value",v.componentSubCategory).attr("data-value", v.pksubCategoryId));
			count++;
			 
				});
			}).error(function(jqXHR, textStatus, errorThrown){
	 			if(textStatus==="timeout") {

				}
			});    	
}

function getComponentDetailsV() {

	if (document.CompBilling.componentType.value == ""
			|| document.CompBilling.componentType.value == null) {
		alert('Please Enter Component Type');
		document.getElementById("componentName_id").value ="";
		return false;
	}
	getComponentDetails();
}

function getComponentDetails() {
	var params = {};
	var count = 0;
	var newrow;
	var rowId;
	
	var componentName1 = $('#componentName_id').val();
	var splitText = componentName1.split(",");
	
	var fkCompoentid = splitText[0];
	var componentName = splitText[1];
	
	params["fkCompoentid"] = fkCompoentid;
	params["componentName"] = componentName;
	
	params["methodName"] = "getGridAsForCompTypeForCompReceivedPO";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		
		$.each(jsonData,function(i, v)
		{
			count = jQuery("#list4").jqGrid('getGridParam', 'records');
			var rowdata = $("#list4").jqGrid('getGridParam', 'data');
			var ids = jQuery("#list4").jqGrid('getDataIDs');
			var prodName, com, packing, unit;
			for (var j = 0; j < count; j++)
			{
				prodName = rowdata[j].productName;

				var rowId = ids[j];
				var rowData = jQuery('#list4').jqGrid('getRowData',rowId);
				
				newrow = true;
			}
			
			if (newrow == true) {
				// $("#list4").addRowData(i,jsonData[i]);
				$("#list4").addRowData(count,jsonData.offer);
			}

			$("#list4").jqGrid({
				datatype : "local",
				
				colNames : ['Comp. Type','Comp. Id','Comp. Name','Comp. NameId','Comp. Value','Part Name','Unit','UnitPrice','QTY','Total ExGST','GST%','IGST%','TAX AMT','Total','Mfg. Name','Description','Type','Package','TO/VA'],
				colModel : [
					{
						name : 'componentCategory',
						width : 42,
						editable : false
					},
					{
						name : 'fkCompTypeId',
						width : 20,
						editable : false,
						hidden : true
					},
					{
						name : 'componentName',
						width : 42,
						editable : true
					},
					{
						name : 'pkComponentCategoryDetailsId',
						width : 20,
						editable : false,
						hidden : true
					},
					{
						name : 'componentValue',
						width : 42,
						editable : false
					},
					{
						name : 'partNumber',
						width : 42,
						editable : false
					},
					
					{
						name : 'unit',
						width : 30,
						editable : false,
						hidden: true
					},
					{
						name : 'unitPriceWithCustomduty',
						width : 30,
						editable : true
					},
					{
						name : 'quantity',
						width : 28,
						editable : true
					},
					{	name:'subTotal',
				    	 width:30,
				    	 editable: false
					},
					{	name:'GST',
				    	 width:22,
				    	 editable: true
					},
					{	name:'IGST',
				    	 width:24,
				    	 editable: true
					},
					{	name:'taxAmount',
				    	 width:35,
				    	 editable: false
					},
					{
						name : 'total',
						width : 40,
					},
					{
						name : 'manufractureName',
						width : 42,
						editable : false
					},
					{
						name : 'description',
						width : 42,
						editable : false
					},
					{
						name : 'componentType',
						width : 40,
						editable : false
					},
					{
						name : 'packages',
						width : 42,
						editable : false
					},
					{
						name : 'tovRating',
						width : 40,
						editable : false
					}
				],
				
				sortorder : 'desc',
				loadonce : false,
				viewrecords : true,
				width : 1850,
				// height: 350,
				shrinkToFit : true,
				rowheight : 300,
				hoverrows : true,
				rownumbers : true,
				rowNum : 10,
				'cellEdit' : true,
				afterSaveCell : function grossTotal() {
					
					/* Calculation of total after editing quantity */
					
					var rowId = $("#list4").jqGrid('getGridParam','selrow');				
					var rowData = jQuery("#list4").getRowData(rowId);
					var quantity = rowData['quantity'];
					var unitPrice = rowData['unitPriceWithCustomduty'];									       		        	
		        	var subTotal = (quantity * unitPrice);
		        	
		        	$("#list4").jqGrid("setCell", rowId, "subTotal", subTotal.toFixed(2));
		        			     
              	var GST = rowData['GST'];
              	var IGST = rowData['IGST'];
		        	var GSTAmount = (subTotal * GST) / 100;
		        	var IGSTAmount = (subTotal * IGST) / 100;
		        	var taxAmount = (GSTAmount + IGSTAmount);
		        	$("#list4").jqGrid("setCell", rowId, "taxAmount", taxAmount.toFixed(2));

					/* Calculation of Total after editing quantity */
					var total = (subTotal + taxAmount);
					$("#list4").jqGrid( "setCell", rowId, "total", total);
					
					var totalSubTotal = 0;
          		var totalTaxAmount = 0;
					var Total = 0;
					var count = jQuery("#list4").jqGrid('getGridParam','records');
					var allRowsInGrid1 = $('#list4').getGridParam('data');
					var AllRows = JSON.stringify(allRowsInGrid1);
					for (var k = 0; k < count; k++) {
						
						var totalSubTotal1 = allRowsInGrid1[k].subTotal;
		        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
		        		
		        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
		        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
						
						var Total1 = allRowsInGrid1[k].total;
						if (Total1 != null) {
							Total = Total + Total1;
						}
					}
					document.getElementById("totalSubTotalProduct").value = totalSubTotal;
		        	document.getElementById("totalTaxAmountProduct").value = totalTaxAmount;
					document.getElementById("grossTotalProduct").value = Total;
				},
				
				pager : "#jqGridPager",

			});
			
			
			if (count == 0 || count == null) {
				
				$("#list4").addRowData(0,
						jsonData.offer);
			}
			
			$('#list4').navGrid('#jqGridPager',
					{
						edit : true,
						add : false,
						del : true,
						search : true,
						refresh : true,
						view : true,
						position : "left",
						cloneToTop : false
					},
					
					{
						editCaption : "The Edit Dialog",

						afterSubmit : function() {

							var grid = $("#list4"), intervalId = setInterval(function() {
								
								grid.trigger(
										"reloadGrid",
										[ {
											current : true
										} ]);															
									}, 500);
						},

						recreateForm : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfterEdit : true,

						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},
					
					{
						closeAfterAdd : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},
					
					{
						closeAfterdel : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						recreateForm : true,

						reloadAftersubmit : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						},
						afterComplete : function() {
							var rowId = $("#list4").jqGrid('getGridParam','selrow');
							var rowData = jQuery("#list4").getRowData(rowId);
							var quantity = rowData['quantity'];
							var buyPrice = rowData['buyPrice'];
							
							var tota = quantity * buyPrice;
							$("#list4").jqGrid("setCell", rowId, "total", tota);
							
							var totalSubTotal = 0;
		            		var totalTaxAmount = 0;
							var Total = 0;
							var count = jQuery("#list4").jqGrid('getGridParam','records');
							var allRowsInGrid1 = $('#list4').getGridParam('data');
							var AllRows = JSON.stringify(allRowsInGrid1);
							for (var k = 0; k < count; k++) {
								
								var totalSubTotal1 = allRowsInGrid1[k].subTotal;
				        		totalSubTotal = +totalSubTotal + +totalSubTotal1;
				        		
				        		var totalTaxAmount1 = allRowsInGrid1[k].taxAmount;
				        		totalTaxAmount = +totalTaxAmount + +totalTaxAmount1;
								
								var Total1 = allRowsInGrid1[k].total;
								Total = +Total+ +Total1;
							}
							document.getElementById("totalSubTotal").value = totalSubTotal.toFixed(2);
		 		        	document.getElementById("totalTaxAmount").value = totalTaxAmount.toFixed(2);
							document.getElementById("grossTotal").value = Total.toFixed(2);
						}
					});
		});
	})
	document.getElementById("componentName_id").value ="";
	
}

