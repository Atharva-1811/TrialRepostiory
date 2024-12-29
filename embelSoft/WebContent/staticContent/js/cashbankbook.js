/*
 * Name : Sonal Bharti Date : 1/06/2018 Method Name : EmployeeValidation()
 * Reason : Employee Details Validation in cashBook
 */

function EmployeePaymentValidation() {

	var employeeName= $('#fk_employee_id').val();
	var month = $('#month').val();
	var paymentMode = $('#paymentMode2').val();
	var empCreditAmt = $("#empPay").val();
	var empAccName = $("#personName2").val();
	var empPaymentReason = $("#reason2").val();
	var paymentType2 = $("#paymentType2").val();
	

	/*if (employeeName != null && employeeName != "") 
	{*/
	
	if(document.emp.fk_employee_id.value !="")
	{
	  if (month != null && month != "") 
	  {
		if (paymentMode != null && paymentMode != "") 
		{
		var creditAmtRegExp = /^[0-9]+([.][0-9]+)?$/;
		if (empCreditAmt != null && empCreditAmt != "" && empCreditAmt != " ") 
		{
			if (empCreditAmt.match(creditAmtRegExp)) 
			{
				if (Number(empCreditAmt) > 0) 
				{
					if (empPaymentReason != "" && empPaymentReason != " " && empPaymentReason != null) 
					{
						if (paymentType2 != "selected2" && paymentType2 != "" && paymentType2 != " " && paymentType2 != "selected") 
						{
							employeePayment();
						} else
						{
							swal({
							     title: "Alert!",
							     text: "Select Payment Type Credti or debit..!",
							     icon: 'error',
							     timer: 2500,
							     button:false
							});
							//alert("Select Payment Type Credti or debit");
						}
					} 
					else 
					{
						swal({
							     title: "Alert!",
							     text: "Enter Payment Reason..!",
							     icon: 'error',
							     timer: 2500,
							     button:false
							});
						//alert("Enter Payment Reason.");
					}
				} 
				else
				{
					swal({
							     title: "Alert!",
							     text: "Credit Amount should be grater than 1..!",
							     icon: 'error',
							     timer: 2500,
							     button:false
							});
					//alert("Credit Amount should be grater than 1");
				}
			} 
			else 
			{
				swal({
							     title: "Alert!",
							     text: "Please Enter valid Credit Amount..!",
							     icon: 'error',
							     timer: 2500,
							     button:false
							});
				//alert("Please Enter valid Credit Amount");
			}
		} 
		else 
		{
			swal({
							     title: "Alert!",
							     text: "Please Enter Credit Amount..!",
							     icon: 'error',
							     timer: 2500,
							     button:false
							});
			//alert("Please Enter Credit Amount");
		}
	  }
		else 
		{
			swal({
							     title: "Alert!",
							     text: "Please Select Payment Mode..!",
							     icon: 'error',
							     timer: 2500,
							     button:false
							});
			//alert("Please Select Payment Mode");
		}
	  }
	  else
		  {
			swal({
							     title: "Alert!",
							     text: "Please Select Month..!",
							     icon: 'error',
							     timer: 2500,
							     button:false
							});
		  	//alert("Please Select Month");
		  }
	  }
	else 
	{
		swal({
							     title: "Alert!",
							     text: "Please Select Employee Name..!",
							     icon: 'error',
							     timer: 2500,
							     button:false
							});
			//alert("Please Select Employee Name");
						
/*			$.getScript('/embelSoft/staticContent/js/bootbox.min.js', function(){
				
				var msg="Please Select Employee Name";
				var dialog = bootbox.dialog({
				//title: "Embel Technologies Says :",
			    message: '<p class="text-center">'+msg.fontcolor("red").fontsize(5)+'</p>',
			    closeButton: false
			});

				setTimeout(function() {
				dialog.modal('hide');
			}, 1500);
			
			return false;
			
			});
		*/
	}
	  
}

//Adding Employee Payment
function employeePayment(){

	document.getElementById("btn3").disabled = true;

	var employeeName= $('#fk_employee_id').val();
	
	//alert("hi this is employee"+employeeName);
	
	var empPay= $('#empPay').val();
	var personName= $('#personName2').val();
	var reason= $('#reason2').val();
	var paymentMode = $('#paymentMode2').val();
	var chequeNum = $('#chequeNum2').val();
	var nameOnCheck = $('#nameOnCheck2').val();
	var bankName = $('#bankName2').val();
	var cardNum = $('#cardNum2').val();
	var accNum = $('#accNum2').val();
	var paymentType = $('#paymentType2').val();
	var totalAmounte =$('#totalAmounte').val();
	var balanceAmounte = $('#balanceAmounte').val();
	
	var month = $('#month').val();
	
	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	var params= {};

	params["fk_employee_id"] = fkEmployeeid;
	params["employeeName"] = employeeName;
	params ["empPay"] = empPay;
	params ["personName"] = personName;
	params ["reason"] = reason;
	params ["paymentMode"] = paymentMode;
	params ["chequeNum"] = chequeNum;
	params ["nameOnCheck"] = nameOnCheck;
	params ["bankName"] = bankName;
	params ["cardNum"] = cardNum;
	params ["accNum"] = accNum;
	params ["paymentType"] = paymentType;
	params["totalAmounte"] = totalAmounte;
	params["balanceAmounte"] = balanceAmounte;

	params ["month"] = month;
	
	params["methodName"] = "regEmpCashBook";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data) 
			{
		swal({
							     title: "Success!",
							     text: "Employee Payment Details Added Successfully !",
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

//Expenditure validation
function expensePaymentValidation() {

	var expenseName = $("#expenseName").val();
	var serviceProvider = $("#serviceProvider").val();
	var contactNumber = $("#contactNumber").val();
	var expCredit = $("#expCredit").val();
	var expDebit = $("#expDebit").val();
	var accountantName = $("#accountantName").val();
	
		
	if(expenseName=="" || expenseName==null || expenseName==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Expense Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please select Expense Name");
		return false;
	}
	if(serviceProvider=="" || serviceProvider==null || serviceProvider==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Service Provider Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Enter Service Provider Name");
		return false;
	}
	if(contactNumber=="" || contactNumber==null || contactNumber==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter 10 Digit Contact Number..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please 10 Digit Enter Contact Number");
		return false;
	}
	var letterNumber = /^[0-9]{10}$/;
	if(contactNumber.match(letterNumber))
	{
		if(expCredit=="" || expCredit==null || expCredit==undefined)
		{
			swal({
		     title: "Alert!",
		     text: "Please Enter Credit Amount..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
			//alert("Please Enter Credit Amount.");
			return false;
		}
		var letterNumber = /^[0-9\.]+$/;//+$/
		if(expCredit.match(letterNumber))
		{
			if(accountantName=="" || accountantName==null || accountantName==undefined)
			{
				swal({
		     title: "Alert!",
		     text: "Please Enter Accountant Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
				//alert("Please Enter Accountant Name.");
				return false;
			}
			var letterNumber = /^[a-zA-Z, ]+$/;
			if(accountantName.match(letterNumber))
			{
				if(expDebit=="" || expDebit==null || expDebit==undefined)
				{
					swal({
		     title: "Alert!",
		     text: "Please Enter Debit Amount..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
					//alert("Please Enter Debit Amount.");
					return false;
				}
				var letterNumber = /^[0-9\.]+$/;//+$/
				if(expDebit.match(letterNumber))
				{
					
				}
				else
				{
					swal({
		     title: "Alert!",
		     text: "Please Enter Number in Debit Amount..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
					//alert("Please Enter Number in Debit Amount ..!!");
					return false;
				}
			}
			else
			{
				swal({
		     title: "Alert!",
		     text: "Please Enter Only Letters in Accountant Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
				//alert("Please Enter only letters in accountant name ..!!");
				return false;
			}
		}
		else
		{
			swal({
		     title: "Alert!",
		     text: "Please Enter Number in Credit Amount..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
			//alert("Please Enter Number in Credit Amount ..!!");
			return false;
		}
	}
	else
	{
		swal({
		     title: "Alert!",
		     text: "Contact Number Must be 10 Digit Number..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Contact Nuumber Must be 10 digit number...!!!");
		return false;
	}
	
	
	
	
	

//	if (expenseName != null && expenseName != "" && expenseName != " ") 
//	{
//		if (serviceProvider != null && serviceProvider != "" && serviceProvider != " ") 
//		{
//			if (contactNumber != null && contactNumber != "" && contactNumber != " ") 
//			{
//				var phoneno = /^\d{10}$/;
//				if (contactNumber.match(phoneno)) 
//				{
//					var amount = /[0-9]$/;
//					if(expCredit.match(amount))
//					{
//						if(expDebit.match(amount))
//						{
//							
//						}
//						else
//						{
//							alert("Please Enter Number in Debit Amount");
//						}
//					}
//					else
//					{
//						alert("Please Enter Number in Credit Amount");
//					}
//				}
//				else 
//				{
//					alert("Contact No Must be 10 digit.");
//				}
//			} 
//			else 
//			{
//				alert("Enter Contact Number");
//			}
//		} 
//		else 
//		{
//			alert("Enter Service Provider");
//		}
//	} 
//	else 
//	{
//		alert("please Select Expenditure Name");
//	}
	
	addExpense();
	
}

/********************Adding Expenditure Payment****************/

function addExpense(){

	//document.exp.btn4.disabled = true;
	var serviceProvider = $('#serviceProvider').val();
	var expCredit = $('#expCredit').val();
	var expDebit = $('#expDebit').val();
	var contactNumber = $('#contactNumber').val();
	var accountantName = $('#accountantName').val();
	
	var input = document.getElementById('expenseName'),
	list = document.getElementById('exp_drop'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootexpId = list.options[i].getAttribute('data-value');
		}
	}
	var params= {};

	params ["expenseName"] = fkRootexpId;
	params ["serviceProvider"] = serviceProvider;
	params ["expCredit"] = expCredit;
	params ["expDebit"] = expDebit;
	params ["contactNumber"] = contactNumber;
	params ["accountantName"] = accountantName;
	params["methodName"] = "regExpenseCashBook";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
	    swal({
							     title: "Success!",
							     text: "Expenditure Payment Details Added Successfully !",
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

//////////////////////Reports///////////////////////////

//************ Employee Payment Report **************//*
//****** Between Two dates **********//*

function getTeacherPaymentDetailsBetTwoDaysValidation()
{
	var employeeName= $('#fk_employee_id').val();
	var startDate = $("#fisDate").val();
	var endDate = $("#endDate").val();
	
	if(employeeName=="" || employeeName==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Employee Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Employee Name");
		$("#fk_employee_id").focus();
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
		$("#fisDate").focus();
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
		$("#endDate").focus();
		return false;
	}
	
	getTeacherPaymentDetailsBetTwoDays();
	
}



function getTeacherPaymentDetailsBetTwoDays()
{
	var params= {};
	var employeeName= $('#fk_employee_id').val();
	var startDate = $("#fisDate").val();
	var endDate = $("#endDate").val();

	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["employeeName"]= employeeName;
	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getTeacherPaymentReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#empBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+employeeName+"\n From "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}

		$(document).ready(function() {
			$('#empBetweenTwoDates').DataTable( {

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
					 	  {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "employeeName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "insertDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentType", "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentMode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "accountantName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "accountNumber" , "width": "5%" ,"defaultContent": ""},
				          {"data": "bankName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "reason" , "width": "5%" ,"defaultContent": ""},
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
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#empBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}

//++++++++++++++++++++++++++++++++++++++

//************ Employee Payment Report **************//*
//****** Between  dates Only **********//*

function getPaymentDetailsBetDaysValidation()
{
	var startDate = $("#fisDate2").val();
	var endDate = $("#endDate2").val();
	
	if(startDate=="" || startDate==null)
	{
		alert("Please select start date");
		return false;
	}
	
	if(endDate=="" || endDate==null)
	{
		alert("Please select end date");
		return false;
	}
	
	getPaymentDetailsBetDays();
	
}



function getPaymentDetailsBetDays()
{
	var params= {};
	var startDate = $("#fisDate2").val();
	var endDate = $("#endDate2").val();
	
	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getPaymentReportBetweenDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#BetweenDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#BetweenDates').DataTable( {

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
				/*"scrollY": true,*/
				"scrollX": true,
				columns: [
					      {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "employeeName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "insertDate", "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentType", "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentMode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paymentAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "accountantName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "accountNumber" , "width": "5%" ,"defaultContent": ""},
				          {"data": "bankName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "reason" , "width": "5%" ,"defaultContent": ""},
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true },
				                     { extend: 'excelHtml5', footer: true },
				                     { extend: 'csvHtml5', footer: true },
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );
		var mydata = catmap;
		$('#BetweenDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

	
}




//************ Expense Payment Report **************//*
//************ Between Two Dates *************//*
//Expense Payment Report By Name And Dates with validation
function getExpensePaymentDetailsBetTwoDaysValidation()
{
	var expenseName = $("#expenseName").val();
	var startDate = $("#fisDate34").val();
	var endDate = $("#endDate34").val();
	
	if(expenseName=="" || expenseName==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Expenditure Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Expenditure Name");
		$("#expenseName").focus();
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
		$("#fisDate34").focus();
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
		$("#endDate34").focus();
		return false;
	}
	getExpensePaymentDetailsBetTwoDays();	
}

//Expense Payment Report By Name And Dates
function getExpensePaymentDetailsBetTwoDays()
{
	var params= {};
	var expenseName= $('#expenseName').val();
	var startDate = $("#fisDate34").val();
	var endDate = $("#endDate34").val();
	
	var input = document.getElementById('expenseName'),
	list = document.getElementById('exp_drop'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootexpId = list.options[i].getAttribute('data-value');
		}
	}
	
	
	params["fkRootexpId"]= fkRootexpId; 
	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	params["methodName"] = "getExpenditurePaymentReportBetweenTwoDates";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#expenseBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+expenseName+" \nFrom "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		

		$(document).ready(function() {
			$('#expenseBetweenTwoDates').DataTable( {

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
					.column( 3 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 3 ).footer() ).html(

							parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);	

					// Total over this page
					pageTotal1 = api
					.column( 4 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 4 ).footer() ).html(

							parseFloat(pageTotal1).toFixed(2)

					);
					console.log( pageTotal);
					var creditAmt =  parseFloat(pageTotal).toFixed(2);
					var debitAmt =  parseFloat(pageTotal1).toFixed(2);
					var remainAmt = +creditAmt - +debitAmt;

					// Update footer
					$( api.column( 5 ).footer() ).html(

							parseFloat(remainAmt).toFixed(2)

					);
				},
				destroy: true,
				searching: true,
				/*"scrollY": true,*/
				"scrollX": true,
				columns: [

						  {"data": "srNo", "width": "5%" ,"defaultContent": ""},
					      {"data": "expenseName", "width": "5%" ,"defaultContent": ""},
					      {"data": "serviceProvider", "width": "5%" ,"defaultContent": ""},
				          {"data": "accountantName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "expCredit" , "width": "5%" ,"defaultContent": ""},
				          {"data": "expDebit" , "width": "5%" ,"defaultContent": ""},
				          {"data": "insertDate" , "width": "5%" ,"defaultContent": ""}, 
				          
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Expenditure Payment Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Expenditure Payment Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Expenditure Payment Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Expenditure Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );

		var mydata = catmap;
		$('#expenseBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}



//************ Between Two Dates *************//*
//Expense Payment Report By Dates validation

function getExpensePaymentDetailsBetDaysValidation()
{
	var startDate = $("#fisDate43").val();
	var endDate = $("#endDate43").val();
	
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
		$("#fisDate43").focus();
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
		$("#endDate43").focus();
		return false;
	}
	getExpensePaymentDetailsBetDays();	
}

//Expense Payment Report By Dates

function getExpensePaymentDetailsBetDays(){
	var params= {};
	
	var startDate2 = $("#fisDate43").val();
	var endDate2 = $("#endDate43").val();
	

	params["fisDate"]= startDate2;
	params["endDate"]= endDate2;
	
	params["methodName"] = "getExpenditurePaymentReportBetweenDates";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#expenseBetweenDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for Dates \nFrom "+startDate2+" To "+endDate2+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function() {
			$('#expenseBetweenDates').DataTable( {

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
					.column( 3 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 3 ).footer() ).html(

							parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);	

					// Total over this page
					pageTotal1 = api
					.column( 4 )
					.data()
					.reduce( function (a, b) {
						return intVal(a) + intVal(b);
					}, 0 );

					// Update footer
					$( api.column( 4 ).footer() ).html(

							parseFloat(pageTotal1).toFixed(2)

					);
					console.log( pageTotal);
					var creditAmt =  parseFloat(pageTotal).toFixed(2);
					var debitAmt =  parseFloat(pageTotal1).toFixed(2);
					var remainAmt = +creditAmt - +debitAmt;

					// Update footer
					$( api.column( 5 ).footer() ).html(

							parseFloat(remainAmt).toFixed(2)

					);
				},
				destroy: true,
				searching: true,
				/*"scrollY": true,*/
				"scrollX": true,
				columns: [

						  {"data": "srNo", "width": "5%" ,"defaultContent": ""},
					      {"data": "expenseName", "width": "5%" ,"defaultContent": ""},
					      {"data": "serviceProvider", "width": "5%" ,"defaultContent": ""},
				          {"data": "accountantName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "expCredit" , "width": "5%" ,"defaultContent": ""},
				          {"data": "expDebit" , "width": "5%" ,"defaultContent": ""},
				          {"data": "insertDate" , "width": "5%" ,"defaultContent": ""}, 
				          
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Expenditure Payment Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Expenditure Payment Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Expenditure Payment Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Expenditure Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );

		var mydata = catmap;
		$('#expenseBetweenDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


// get Total And Balance Amount By VendorName

//function getTotalAndBalanceAmountByVendorName()
//{
//	
//	$("#totalAmount").append($("<input/>").attr("value","").text());
//	$("#balanceAmount").append($("<input/>").attr("value","").text());
//
//	var params= {};
//	
//	
//	var input1 = document.getElementById('fk_vendor_id'), list = document
//	.getElementById('vendorNameList'), i, fkClientId;
//
//    for (i = 0; i < list.options.length; ++i) 
//    {
//    	if (list.options[i].value === input1.value) 
//    	{
//    		fkVendorId = list.options[i].getAttribute('data-value');
//		}
//	}
//    
//	var vendorName = $('#fk_vendor_id').val();
//	
//	params["fkVendorId"] = fkVendorId;
//	params["vendorName"] = vendorName;
//	
//	params["methodName"] = "getTotalAndBalanceAmountByVendorName";
//	
//	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
//			{ var count = 1;
//				var total=0;
//
//			var jsonData = $.parseJSON(data);
//			$.each(jsonData,function(i,v)
//					{
//						
//						document.getElementById("balanceAmount").value = v.balanceStatus; 
//						total = +total+ +v.grossTotal;
//						count++;
//						
//					});
//				document.getElementById("totalAmount").value = total;
//			}).error(function(jqXHR, textStatus, errorThrown){
//				if(textStatus==="timeout") {
//
//				}
//			});
//	
//}

function getTotalAndBalanceAmountByVendorName()
{
	
	$("#totalAmount").append($("<input/>").attr("value","").text());
	$("#balanceAmount").append($("<input/>").attr("value","").text());
	//$("#paidAmount").append($("<input/>").attr("value","").text());

	var params= {};
	
	
	var input1 = document.getElementById('fk_vendor_id'), list = document
	.getElementById('vendorNameList'), i, fkClientId;

    for (i = 0; i < list.options.length; ++i) 
    {
    	if (list.options[i].value === input1.value) 
    	{
    		fkVendorId = list.options[i].getAttribute('data-value');
		}
	}
    
	var vendorName = $('#fk_vendor_id').val();
	
	params["fkVendorId"] = fkVendorId;
	params["vendorName"] = vendorName;
	
	params["methodName"] = "getTotalAndBalanceAmountByVendorName";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
			{ var count = 1;
				var total=0.0;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
						
						document.getElementById("balanceAmount").value = v.balanceStatus; 
						total = +total+ +v.grossTotal;
						count++;
						
					});
				document.getElementById("totalAmount").value = total;
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
	
}

// get Amount By Bill No FOR Vendor
function getTotalByBillNo()
{
	var billNo = $('#billNo').val();
	
	$("#billAmount").append($("<input/>").attr("value","").text());
	
	var params={};
	
	params["billNo"] = billNo;
	params["methodName"] = "getTotalAmountByBillNo";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{

			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			$.each(jsonData,function(i,v)
					{
					document.getElementById("billAmount").value = v.billAmount;
					document.getElementById("balanceAmount").value = v.balanceStatus;
					
					
					});
		}).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
			}
		});
	
}

// validation FOR Vendor Payment Details 
function vendorPaymentValidation()
{
	var vendorName = $('#fk_vendor_id').val();
//	var billNoV = $('#billNo').val();
	var paidAmount = $('#paidAmount').val();
	
	if(vendorName=="" || vendorName==null)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Vendor Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Vendor Name");
		return false;
	}
/*	
	if(billNoV=="" || billNoV==null)
	{
		alert("Please Select Bill No");
		return false;
	}*/
	
	if(paidAmount=="" || paidAmount==null)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Paid Amount..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Enter Paid Amount");
		return false;
	}
	
	var balanceAmount =parseInt( $('#balanceAmount').val());
	var paidAmount = parseInt($('#paidAmount').val());

	if(balanceAmount < paidAmount || paidAmount==null)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Paid Amount less than Or equal to Balance Amount..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert('Please enter paid amount less than Or equal to Balance Amount...');
		return false;
	}
	
	vendorPaymentDetailas();
}


// Add Vendor Payment Details
function vendorPaymentDetailas()
{
	var input1 = document.getElementById('fk_vendor_id'), list = document
	.getElementById('vendorNameList'), i, fkClientId;

    for (i = 0; i < list.options.length; ++i) {
    	
    	if (list.options[i].value === input1.value) {
        	fkVendorId = list.options[i].getAttribute('data-value');
        }
    
    }
    
    var vendorName = $('#fk_vendor_id').val();
    var totalAmount = $('#totalAmount').val();
  /*  var billNo = $('#billNo').val();
    var billAmount = $('#billAmount').val();
  */
    var balanceAmount = $('#balanceAmount').val();
    var paidAmount = $('#paidAmount').val();
    
    
    var params={};
    
    params["fkVendorId"] = fkVendorId;
    params["vendorName"] = vendorName;
    params["totalAmount"] = totalAmount;
 /*   params["billNo"] = billNo;
    params["billAmount"] = billAmount;
 */   params["balanceAmount"] = balanceAmount;
    params["paidAmount"] = paidAmount;
    
    params["methodName"] = "vendorPaymentDetails";
    
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		swal({
							     title: "Success!",
							     text: "Vendor Payment Details Added Successfully !",
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


// Get Total Amount And Bill No By Client ID FOR Client
function getTotalAmountAndBalanceAmountByClientName()
{
	
	$("#totalAmount2").append($("<input/>").attr("value","").text());
	$("#balanceAmount2").append($("<input/>").attr("value","").text());
	
	var params= {};
	
	var input1 = document.getElementById('fk_client_id'), list = document
	.getElementById('clientNameList'), i, fkClientId2;

    for (i = 0; i < list.options.length; ++i)
    {
	    if (list.options[i].value === input1.value) 
	    {
	    	fkClientId2 = list.options[i].getAttribute('data-value');
	    }
    }
    
    var clientName = $('#fk_client_id').val();
    
    params["fkClientId2"] = fkClientId2;
    params["clientName"] = clientName;
    
    params["methodName"] = "getTotalAmountAndBalanceAmountByClientName";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)	
			{ var count = 1;
				var total=0;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
						document.getElementById("balanceAmount2").value = v.balanceStatus; 
						document.getElementById("totalAmount2").value = v.grossTotal;
						total = +total+ +v.grossTotal;
						count++;	
						
					});
			//document.getElementById("totalAmount2").value = total;
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
	
}

// Get Amount By Bill No For Client
function getTotalByBillForClient()
{
	
	var billNo2 = $('#billNo2').val();
	
	$("#billAmount2").append($("<input/>").attr("value","").text());
	

	var params={};
	
	params["billNo2"] = billNo2;
	params["methodName"] = "getTotalAmountByBillNoForClient";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
		{

			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			$.each(jsonData,function(i,v)
					{
	
					document.getElementById("billAmount2").value = v.billAmount;
					document.getElementById("balanceAmount2").value = v.balanceStatus;
					
					
					});
		}).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
			}
		});
	
}

//validation For Client Payment Details
function clientPaymentValidation()
{
	
	var clientName = $('#fk_client_id').val();
	//var billNoC = $('#billNo2').val();
	var paidAmount2 = $('#paidAmount2').val();
	
	if(clientName=="" || clientName==null)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Client Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Select Client Name");
		return false;
	}
	
/*	if(billNoC=="" || billNoC==null)
	{
		alert("Please Select Bill No");
		return false;
	}
	*/
	if(paidAmount2=="" || paidAmount2==null)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Paid Amount..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Please Enter Paid Amount");
		return false;
	}
	

	var balanceAmount2 = parseInt($('#balanceAmount2').val());
	var paidAmount2 = parseInt($('#paidAmount2').val());
	var  totalAmount2 = parseInt($('#totalAmount2').val());
	
	if(totalAmount2 < balanceAmount2)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Balance Amount less than Or equal to total Amount..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert('Please enter paid amount less than Or equal to Balance Amount...');
		return false;
	}
		
	if(balanceAmount2 < paidAmount2)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter Paid Amount less than Or equal to Balance Amount..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert('Please enter paid amount less than Or equal to Balance Amount...');
		return false;
	}
	
	clientPaymentDetailas();
}

// Add Client Payment Details
function clientPaymentDetailas()
{
	var input1 = document.getElementById('fk_client_id'), list = document
	.getElementById('clientNameList'), i, fkClientId2;

    for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input1.value) {
    	fkClientId2 = list.options[i].getAttribute('data-value');
    }
    }
    
    
    var clientName = $('#fk_client_id').val();
    var totalAmount2 = $('#totalAmount2').val();
 //   var billNo2 = $('#billNo2').val();
  //  var billAmount2 = $('#billAmount2').val();
    var balanceAmount2 = $('#balanceAmount2').val();
    var paidAmount2 = $('#paidAmount2').val();
    
    	
    var params={};
    
    params["fkClientId2"] = fkClientId2;
    params["clientName"] = clientName;
    params["totalAmount2"] = totalAmount2;
 //   params["billNo2"] = billNo2;
 //  params["billAmount2"] = billAmount2;
    params["balanceAmount2"] = balanceAmount2;
    params["paidAmount2"] = paidAmount2;
    
    params["methodName"] = "clientPaymentDetails";
    
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
				swal({
							     title: "Success!",
							     text: "Client Payment Details Added Successfully !",
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

//Vendor Payment Report By Name And Dates with validation
function getVendorPaymentDetailsByNameValidation()
{
	var vendorName = $("#vendorName").val();
	var startDate = $("#fisDate14").val();
	var endDate = $("#endDate14").val();
	
	if(vendorName=="" || vendorName==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Vendor Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Vendor Name");
		$("#vendorName").focus();
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
		$("#fisDate14").focus();
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
		$("#endDate14").focus();
		return false;
	}
	getVendorPaymentDetailsByName();	
}

// Vendor Payment Report By Name And Dates
function getVendorPaymentDetailsByName()
{
	var params= {};
	
	var vendorName = $("#vendorName").val();
	var startDate = $("#fisDate14").val();
	var endDate = $("#endDate14").val();
	
	var input = document.getElementById('vendorName'),
	list = document.getElementById('ven_drop'),
	i,fkRootexpId;
	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input.value) 
		{
			fkVendorPaymentId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkVendorPaymentId"]= fkVendorPaymentId; 
	params["vendorName"]= vendorName; 
	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getVendorPaymentReportBetweenTwoDatesAndName";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#vendorBetweenTwoDates').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+vendorName+"\n From "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		$(document).ready(function()
		{
			$('#vendorBetweenTwoDates').DataTable({
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

				},
				destroy: true,
				searching: true,
				/*"scrollY": true,*/
				"scrollX": true,
				columns: [

						  {"data": "srNo", "width": "5%" ,"defaultContent": ""},
					      {"data": "vendorName", "width": "5%" ,"defaultContent": ""},
					      {"data": "totalAmount", "width": "5%" ,"defaultContent": ""},
					      {"data": "remainingAmount", "width": "5%" ,"defaultContent": ""},
				          {"data": "paidAmount" , "width": "5%" ,"defaultContent": ""}, 
				          {"data": "balanceAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "date" , "width": "5%" ,"defaultContent": ""},
					             
				          ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Payment Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Payment Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Payment Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );

		var mydata = catmap;
		$('#vendorBetweenTwoDates').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}


//Vendor Payment Report By Date Validation
function getVendorPaymentDetailsBetDaysValidation()
{
	var startDate = $("#fisDate24").val();
	var endDate = $("#endDate24").val();
	
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
		$("#fisDate24").focus();
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
		$("#endDate24").focus();
		return false;
	}
	
	getVendorPaymentDetailsBetDays()
	
}

//Vendor Payment Report By Date
function getVendorPaymentDetailsBetDays()
{
	var params= {};

	var startDate = $("#fisDate24").val();
	var endDate = $("#endDate24").val();
	
	params["fisDate"]= startDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getVendorPaymentReportBetweenTwoDates";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear Table
		$('#vendorBetweenTwoDate').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for Dates \nFrom "+startDate+" To "+endDate+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}
		
		
		$(document).ready(function()
		{
			$('#vendorBetweenTwoDate').DataTable( {

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

				},
				destroy: true,
				searching: true,
				/*"scrollY": true,*/
				"scrollX": true,
				columns: [

							  {"data": "srNo", "width": "5%" ,"defaultContent": ""},
						      {"data": "vendorName", "width": "5%" ,"defaultContent": ""},
						      {"data": "totalAmount", "width": "5%" ,"defaultContent": ""},
						      {"data": "remainingAmount" , "width": "5%" ,"defaultContent": ""},
					          {"data": "paidAmount" , "width": "5%" ,"defaultContent": ""}, 
					          {"data": "balanceAmount" , "width": "5%" ,"defaultContent": ""},
						      {"data": "date" , "width": "5%" ,"defaultContent": ""},
					          
					      ],
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Payment Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Payment Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Payment Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Vendor Payment Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );

		var mydata = catmap;
		$('#vendorBetweenTwoDate').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	
	
}


//Client Payment Report Date And NameWise Validation
function getClientPaymentDetailsByNameValidation()
{
	var vendorName = $("#clientName").val();
	var startDate = $("#fisDate4").val();
	var endDate = $("#endDate4").val();
	
	if(vendorName=="" || vendorName==null) 
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Client Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Client Name");
		$("#clientName").focus();
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

//Client Payment Report Date And NameWise
function getClientPaymentDetailsByName()
{

	var clientName = $("#clientName").val();
	var fisDate4 = $("#fisDate4").val();
	var endDate4 = $("#endDate4").val();
	
	var input1 = document.getElementById('clientName'), list = document
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
	params["clientName"] = clientName;
	params["fisDate4"] = fisDate4;
	params["endDate4"] = endDate4;
	
	params["methodName"] = "getClientPaymentReportBetweenTwoDatesAndName";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#clientBetweenTwoDatesAndName').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+clientName+" \nFrom "+fisDate4+" To "+endDate4+"..!",
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
				/*"scrollY": true,*/
				"scrollX": true,
				columns: [
				        
					      {"data": "srNo", "width": "2%" ,"defaultContent": ""},
				          {"data": "clientName", "width": "5%" ,"defaultContent": ""},
				          {"data": "totalAmount", "width": "5%" ,"defaultContent": ""},
				          {"data": "remainingAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paidAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "balanceAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "date" , "width": "5%" ,"defaultContent": ""},
				          
				          ],
				          
				          
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Client Payment Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Client Payment Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Client Payment Report";
				                    	 }},
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
		$('#clientBetweenTwoDatesAndName').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


//Client Payment Report Date Wise Validation
function getClientPaymentDetailsByDateValidation()
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
	getClientPaymentDetailsByDate();	
}

//Client Payment Report Date Wise
function getClientPaymentDetailsByDate()
{
	var fisDate42 = $("#fisDate42").val();
	var endDate42 = $("#endDate42").val();
	
	var params= {};
	
	params["fisDate42"] = fisDate42;
	params["endDate42"] = endDate42;
	
	params["methodName"] = "getClientPaymentReportBetweenTwoDates";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#clientBetweenTwoDate').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
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
				/*"scrollY": true,*/
				"scrollX": true,
				columns: [
				        
					      {"data": "srNo", "width": "2%" ,"defaultContent": ""},
				          {"data": "clientName", "width": "5%" ,"defaultContent": ""},
				          {"data": "totalAmount", "width": "5%" ,"defaultContent": ""},
				          {"data": "remainingAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "paidAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "balanceAmount" , "width": "5%" ,"defaultContent": ""},
				          {"data": "date" , "width": "5%" ,"defaultContent": ""},
					        
				          
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Client Payment Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Client Payment Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Client Payment Report";
				                    	 }},
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
		$('#clientBetweenTwoDate').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
	

}



function getAllBillsforemployee(){
	
	var input = document.getElementById('fk_employee_id'),
     list = document.getElementById('employeeNameList'),
     i,fk_employee_id;

	for (i = 0; i < list.options.length; ++i) 
	{
     if (list.options[i].value === input.value) 
     {
    	 fk_employee_id = list.options[i].getAttribute('data-value');
     }
    }
	
	//var fk_teacher_id = $("#fk_teacher_id").val();
	//var billNo = $("#billNo").val();
	$("#totalAmounte").empty();
	$("#totalAmounte").append($("<input/>").attr("value","").text());
	$("#balanceAmounte").append($("<input/>").attr("value","").text());
	var params= {};
	params["methodName"] = "getTotalAmtByBillNoEmployee";
	//params["billNo"]= billNo;
	params["fk_teacher_id"]= fk_employee_id;
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
					//document.getElementById("totalAmount").value = v.grossTotal;
					document.getElementById("totalAmounte").value = v.total
					;
			
			
					//document.getElementById("balanceAmounte").value = v.balanceAmount;
			
				});
			})
			getRemainingAllBillsforemployee()
}

function getRemainingAllBillsforemployee()
{
	
	var input = document.getElementById('fk_employee_id'),
     list = document.getElementById('employeeNameList'),
     i,fk_employee_id;

	for (i = 0; i < list.options.length; ++i) 
	{
     if (list.options[i].value === input.value) 
     {
    	 fk_employee_id = list.options[i].getAttribute('data-value');
     }
    }
	
	//var fk_teacher_id = $("#fk_teacher_id").val();
	//var billNo = $("#billNo").val();
	$("#balanceAmounte").empty();
	//$("#totalAmounte").append($("<input/>").attr("value","").text());
	$("#balanceAmounte").append($("<input/>").attr("value","").text());
	var params= {};
	params["methodName"] = "getRemainingAllBillsforemployee";
	//params["billNo"]= billNo;
	params["fk_teacher_id"]= fk_employee_id;
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		var jsonData = $.parseJSON(data);
		//var jsonData = jsonData.list;
		$.each(jsonData,function(i,v)
				{
					//document.getElementById("totalAmount").value = v.grossTotal;
					//document.getElementById("totalAmounte").value = v.total;
			
			
					document.getElementById("balanceAmounte").value = v.balanceamount;
			
				});
			})
			
}
