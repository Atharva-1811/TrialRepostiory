//Adding expense detail
function expenseDetailsValidation(){
	if(document.expenseDetailsForm.expenseName.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Expense Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Enter Expense Name");
		return false;
	}	
//	var letterNumber = /^[a-zA-Z0-9, ]+$/;
//	if(document.expenseDetails.expenseName.value.match(letterNumber))
//	{
//		
//	}
//	else
//	{
//		alert("Enter Alphabates And Numbers Only in Expense name field..!!");
//		return false;
//	}
	
	expenseDetails();
	
}

function expenseDetails() {

	document.expenseDetailsForm.saveBtn.disabled = true;
	//document.expenseDetails.btn.disabled = true;
	var expenseName = $('#expenseName').val();
	var params = {};

	params["expenseName"] = expenseName;
	params["methodName"] = "saveExpenseDetails";

	$.post('/embelSoft/jsp/utility/controller.jsp', params, function(data) 
			{
		swal({
		     title: "Success!",
		     text: "Expenditure Details Added Successfully !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		});
		//alert(data);
		if(document.expenseDetailsForm)
			{
				location.reload();
			}	
			document.expenseDetailsForm.saveBtn.disabled = false;
		location.reload();
			}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

//expenseList
function expenseList()
{
	var params= {};

	params["methodName"] = "expenseList";
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
					.column( 2 )
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
				/*"scrollY": 100,*/
				"scrollX": true,
				columns: [
					      {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "expenseName" , "width": "5%" ,"defaultContent": ""},
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

function getExpenditureForEdit()
{
	$("#expenditureName").append($("<input/>").attr("value","").text());	
	
	var params = {};
	
	var input1 = document.getElementById('pkExpenseId'),
	list = document.getElementById('expenseNameList'),
	i,pkExpenseId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkExpenseId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["pkExpenseId"] = pkExpenseId;
	params["methodName"] = "getExpenditureForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			document.getElementById("expenditureName").value = v.expenseName;
		});
	}).error(function(jqXHR, textStatus, errorThrown)
	{
		if(textStatus==="timeout")
		{
			
		}
	});
}

//updateExpenditureValidate
function updateExpenditureValidate()
{	
	var expenditureName = $('#expenditureName').val();
		
	if(expenditureName=="" || expenditureName==null || expenditureName==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Expenditure Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Enter Expenditure Name");
		document.getElementById('expenditureName').focus();
		return false;
	}
	var letterNumber = /^[a-zA-Z0-9, ]+$/;
	if(expenditureName.match(letterNumber))
	{
		updateExpenditure();
	}
	else
	{
		swal({
		     title: "Alert!",
		     text: "Enter Alphabets and Numbers Only in Component Type ..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Alphabets and Numbers Only in Component Type ..!!");
		return false;
	}
	
}

//updateExpenditure
function updateExpenditure()
{
	document.editExpenditureForm.updateBtn.disabled = true;
	
	var params= {};
	
	var input1 = document.getElementById('pkExpenseId'),
	list = document.getElementById('expenseNameList'),
	i,pkExpenseId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkExpenseId = list.options[i].getAttribute('data-value');
		}
	}
	
	var expenditureName = $('#expenditureName').val();
	//var componentTypeNew = $('#componentTypeNew').val();
	
	params["pkExpenseId"] = pkExpenseId;
	params["expenditureName"] = expenditureName;
	
	params["methodName"] = "updateExpenditure";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
				swal({
				     title: "Success!",
				     text: "Expenditure Details Updated Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				});
 				//alert(data);
 				if(document.editExpenditureForm)
 				{
 					location.reload();
 				}	
 				document.editExpenditureForm.updateBtn.disabled = false;
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
}


















function reset() {
	document.expenseDetails.reset();
}

function addExpenseForBillingAndGoodsReceive() {

	document.expenseDetails1.btn1.disabled = true;
	var expenseName = $('#expenseNameForBilling').val();
	var params = {};

	params["expenseName"] = expenseName;
	params["methodName"] = "addExpenseDetailsForBilling";

	$.post('/Fertilizer/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		if (document.expenseDetails1) {
			document.expenseDetails1.reset();
		}
		document.expenseDetails1.btn1.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}


function employeePaymentList()
{
	

	var params= {};
	
	params["methodName"] = "getEmployeePaymentList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#employeePaymentList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#employeePaymentList').DataTable( {

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
				        
			          	  {"data": "srNo", "width": "5%" ,"defaultContent": ""},
				          {"data": "employeeName", "width": "5%" ,"defaultContent": ""},
				          {"data": "reason", "width": "5%" ,"defaultContent": ""},
				          {"data": "month" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentType" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "insertDate" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentMode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "accountNumber", "width": "5%" ,"defaultContent": ""},
				          {"data": "checkNumber" , "width": "5%" ,"defaultContent": ""},
				          {"data": "nameOnCheck" , "width": "5%" ,"defaultContent": ""},
				          {"data": "cardNumber", "width": "5%" ,"defaultContent": ""},
				          {"data": "bankName" , "width": "5%" ,"defaultContent": ""},
				          
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Payment Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Payment Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Payment Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#employeePaymentList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

}

function vendorPaymentList()
{
	
	var params= {};
	
	params["methodName"] = "getVendorPaymentList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#vendorPaymentList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		
		$(document).ready(function() {
			$('#vendorPaymentList').DataTable( {

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
			          
						  {"data": "srNo", "width": "2%" ,"defaultContent": ""},
				          {"data": "vendorName", "width": "5%" ,"defaultContent": ""},
				          {"data": "totalAmount", "width": "5%" ,"defaultContent": ""},
				          {"data": "remainingAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paidAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "balanceAmount" , "width": "5%" ,"defaultContent": ""},
					         
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#vendorPaymentList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});


}

function clientPaymentList()
{

	var params= {};
	
	params["methodName"] = "getClientPaymentList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#clientPaymentList').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		
		
		$(document).ready(function() {
			
			$('#clientPaymentList').DataTable( {

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

				},
				
				destroy: true,
				searching: true,
				"scrollY": true,
				"scrollX": true,
				columns: [
				        
					      {"data": "srNo", "width": "2%" ,"defaultContent": ""},
				          {"data": "clientName", "width": "5%" ,"defaultContent": ""},
				          {"data": "totalAmount", "width": "5%" ,"defaultContent": ""},
				          {"data": "remainingAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paidAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "balanceAmount" , "width": "5%" ,"defaultContent": ""},
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Client Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});
		
		
		var mydata = catmap;
		$('#clientPaymentList').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	

}
