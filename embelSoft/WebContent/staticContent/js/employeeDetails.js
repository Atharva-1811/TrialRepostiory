function employeedetails(){
	
	if(document.empd.firstName.value == "")
	{
		swal({
		     title: "Alert!",
		     text: "Enter Employee First Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("Enter Employee First Name.");
		return false;
		
		
			/*$.getScript('/embelSoft/staticContent/js/bootbox.min.js', function() 
			{
		
			//alert("HIIIII");
	
			var msg="Please Enter First Name";
			var dialog = bootbox.dialog({
				//title: "Embel Technologies Says :",
			    message: '<p class="text-center">'+msg.fontcolor("red").fontsize(5)+'<img src="/embelSoft/staticContent/img/s1.jpg" height="50" width="50"/></p>',
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
	
	//EmailId & confirmEmail Validation
	//document.getElementById("emailId").value
	var emailId = document.empd.emailId.value;
	var confirmEmail = document.empd.confirmEmail.value;
	if(confirmEmail != emailId)
	{ 
		swal({
		     		title: "Alert!",
					text: "Email id and confirmation email id should be same !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
		//alert('Email id and confirmation email id should be same.');
		document.getElementById("confirmEmail").focus();
		return false;
	}
	
	// Validate Date	
	var dateString = document.empd.dob.value;
    var myDate = new Date(dateString);
    var today = new Date();
    if ( myDate > today ) {
     	swal({
		     		title: "Alert!",
					text: "You cannot enter a date in the future !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
    	//alert('You cannot enter a date in the future!.');
//         $('#dob').after('<p>You cannot enter a date in the future!.</p>');
    	document.getElementById("dob").focus();
        return false;
    }
	  
	  
	
	  var letterNumber = /^[a-zA-Z, ]+$/;
	  if(document.empd.firstName.value.match(letterNumber))
		{
		   if(document.empd.lastName.value == "")
			{
				swal({
		     		title: "Alert!",
					text: "Enter Employee Last Name !",
		     		icon: 'error',
		     		timer: 2500,
		     		button:false
		     	});
				//alert("Enter Employee Last Name.");
				return false;
			}	
			var letterNumber = /^[a-zA-Z, ]+$/;
			if(document.empd.lastName.value.match(letterNumber))
			{
				if ( document.empd.dob.value == "" )
			    {
			         swal({
						title: "Alert!",
		     			text: "Please Select Date of Birth",
		     			icon: 'error',
						timer: 2500,
		     			button:false
		     		});
			  	      //alert("Please Select Date Birth");
			          return false;
			    }
				
				if( document.empd.contactNo.value == "" )
	   			 {
						swal({
							title: "Alert!",
		     				text: "Please Enter Contact Number",
		     				icon: 'error',
							timer: 2500,
		     				button:false
		     			});	
				   	    //alert("Please Enter Contact Number");
			  	        return false;
	   			 }
   			 
	   			 var letterNumber = /^[0-9]{10}$/;
	   			 if(document.empd.contactNo.value.match(letterNumber))
	   			 {

    				if ( document.empd.emailId.value == "" )
				    {
						swal({
							title: "Alert!",
		     				text: "Please Enter Email Id",
		     				icon: 'error',
							timer: 2500,
		     				button:false
		     			});	
				          //alert("Please Enter Email Id");
				          return false;
				    }
					var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  	        	 if(document.empd.emailId.value.match(letterNumber) || document.empd.emailId.value == null ||  document.empd.emailId.value == "")
	  	        	 {
	  	        		/*if(document.empd.address.value == "")
	        				{
	        					alert("Please Enter Employee Address.");
	        					return false;
	        				}
	        				
   	        				var letterNumber = /^[a-zA-Z0-9, ]+$/;
   	        				if(document.empd.address.value.match(letterNumber))
   	        				{*/
   	        				   if ( document.empd.confirmEmail.value == "" )
	   	     				   {
									swal({
										title: "Alert!",
		     							text: "Please Enter Confirmation Email Id",
		     							icon: 'error',
										timer: 2500,
		     							button:false
		     						});			
	   	     				         //alert("Please Enter Confirmation Email Id");
	   	     				         return false;
	   	     				   }
	   	     				   var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	   	     	  	           if(document.empd.confirmEmail.value.match(letterNumber) || document.empd.confirmEmail.value == null ||  document.empd.confirmEmail.value == "")
	   	     	  	           {
	   	     	  	        	if ( document.empd.zipCode.value == "" )
							    {
									swal({
										title: "Alert!",
		     							text: "Please Enter Zip Code",
		     							icon: 'error',
										timer: 2500,
		     							button:false
		     						});									         
							  	      //alert("Please Enter Zip Code");
							          return false;
							    }
								var letterNumber = /^[0-9]{6}$/;
								if(document.empd.zipCode.value.match(letterNumber))
								{
								 
									/*if ( document.empd.adharNumber.value == "" )
		  	        			    {
						  	          alert("Please Enter Adhar Number");
						  	          return false;
		  	        			    }
			        				  
			        				 var letterNumber = /^[0-9]{12}$/;
		  	        			     if(document.empd.adharNumber.value.match(letterNumber))
		  	        			     {
	  	        					   if ( document.empd.panNumber.value == "" )
	  		   	        			   {
	  						  	          alert("Please Enter Pan Number");
	  						  	          return false;
	  		   	        			   } 
	  	  	        				   var letterNumber =  /^([a-zA-Z0-9]{10})?$/;
	  		   	        			   if(document.empd.panNumber.value.match(letterNumber))
	  	  	        				    { */
		  		   	        				
		  		   	        				if(document.empd.education.value == "")
				   	        				{
												swal({
													title: "Alert!",
		     										text: "Please Enter Employee Highest Education",
		     										icon: 'error',
													timer: 2500,
		     										button:false
		     									});
				   	        					//alert("Please Enter Employee  Highest Education.");
				   	        					return false;
				   	        				}
				   	        				  var letterNumber = /^[a-zA-Z, ]+$/;
	  	        		 
						   						if(document.empd.designation.value == "")
												{
													swal({
														title: "Alert!",
		     											text: "Enter Designation",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     										});
													//alert("Enter Designation.");
													return false;
												}
												var letterNumber = /^[a-zA-Z ]+$/;
											    if(document.empd.designation.value.match(letterNumber))
											    {
				   			
				   	        					  if( document.empd.dateOfJoining.value == "" )
												  {
												      swal({
														title: "Alert!",
		     											text: "Please Select Date of Joining",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});  
											  	      //alert("Please Select Date of Joining");
											          return false;
											       }
					   	        					  
					   	        					if ( document.empd.salary.value == "" )
					   			   	        		 {
					   						         	swal({
														title: "Alert!",
		     											text: "Please Enter Salary",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});  
					   						  	       //alert("Please Enter Salary");
					   						          return false;
					   			   	        		 }
					   			   	        		 var letterNumber = /^[0-9]+$/;
					   			   	        		 if(document.empd.salary.value.match(letterNumber))
					   			   	        		 {
					   			   	        			
					   			   	        			 if( document.empd.description1.value == "" )
													    {
															swal({
														title: "Alert!",
		     											text: "Please Enter Description 8.1",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});
					   			   	        				 //alert("Please Enyter Description 8.1");
					   			   	        				 return false;
													    }
					   			   	        			 
					   			   	        			 if( document.empd.description2.value == "" )
													    {
																swal({
														title: "Alert!",
		     											text: "Please Enter Description 8.2",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});
						   			   	        			//alert("Please Enyter Description 8.2");
					   			   	        				 return false;
					   			   	        				 
													    }
					   			   	        			 
						   			   	        	
															empDetails();
					   			   	        		  
					   			   	        		 }
									
										
	   			   	        		 
				   			   	        		 else
				   								{
															swal({
														title: "Alert!",
		     											text: "Enter Numbers Only in Salary..!",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});
				   									//alert("Enter Numbers Only in Salary..!!");
				   									return false;
				   								}
				   							}
			        				
	   	        						else
											{
												swal({
														title: "Alert!",
		     											text: "Enter Alphabets Only in Designation..!",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});
												//alert("Enter Alphabets Only in Designation..!!");
												return false;
											}
										    
										}
	   	        	
	  		   	        			   
		   	        			/*else
								{
									alert("Please Enter Valid Pan Number..");
									return false;
								}	
			        			}		     
		  	        			     
  	        				else
  							{
  								alert("Enter 12 digit Numbers Only in Adhar Number..!!");
  								return false;
  							}	
  						}*/
								
						else
						{
							swal({
														title: "Alert!",
		     											text: "Enter 6 Digit Numbers Only in Zip Code..!",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});
							//alert("Enter 6 Digit Numbers Only in Zip Code..!!");
							return false;
						}
					}
//	   	     	  	 else if(email != cEmail)
//	 				{
//	 		        	alert('Email id and confirm email id should be same');
//	 		    		return false;
//	 				}
   	     	         else
   	  				{
						swal({
														title: "Alert!",
		     											text: "Enter a Valid Confirm Email Address..!",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});
   	  					//alert("Enter a Valid Confirm Email Adress..!!");
   	  					return false;
   	  				}
   	  			}
	  	        	 
        				
				/*else
				{
					alert("Enter Alphabates Only in Address..!!");
					return false;
				}	
			 }*/
    			
	  	        	 
        	 else
				{
					swal({
														title: "Alert!",
		     											text: "Enter a Valid Email Address..!",
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
		     											text: "Enter 10 digit Numbers Only in Contact Number..!",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});
				//alert("Enter 10 digit Numbers Only in Contact Number..!!");
				return false;
				}	
			}
														
		else
			{
				swal({
														title: "Alert!",
		     											text: "Enter Alphabets Only in Last Name..!",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});
				//alert("Enter Alphabets Only in Last Name..!!");
				return false;
			}
		}

	
	else
		{
			swal({
														title: "Alert!",
		     											text: "Enter Alphabets Only in First Name..!",
		     											icon: 'error',
														timer: 2500,
		     											button:false
		     											});
			//alert("Enter Alphabets Only in First Name..!!");
			return false;
		}
	  
	  
	}	


			
//Add Employee Details
function empDetails(){
		
	document.empd.btn.disabled = true;

				var firstName = $('#firstName').val();
				var middleName = $('#middleName').val();
				var lastName = $('#lastName').val();
				var dob = $('#dob').val();
				var idNumber = $('#idNumber').val();
				var designation = $('#designation').val();
				var contactNo  = $('#contactNo').val();
				var altContactNo  = $('#altContactNo').val();
				var emailId = $('#emailId').val();
			//	var address = $('#address').val();
				var education = $('#education').val();
				var technology = $('#technology').val();
				var previousExperience = $('#previousExperience').val();
				var salary = $('#salary').val();
				var referenceBy = $('#referenceBy').val();
				var interviewedBy = $('#interviewedBy').val();
				var dateOfJoining = $('#dateOfJoining').val();
				var prevCompanyName = $('#prevCompanyName').val();
				var zipCode = $('#zipCode').val();
				var confirmEmail = $('#confirmEmail').val();
				var comment = $('#comment').val();
				var employeecondition = $('#employeecondition').val();
				var adharNumber = $('#adharNumber').val();
				var panNumber = $('#panNumber').val();
				var department =$('#department').val();
				var placeofposting =$('#placeofposting').val();
				var university =$('#university').val();
				var description1 =$('#description1').val();
				var description2 =$('#description2').val();
				
				var currentAddress =$('#currentAddress').val();
				var permanentAddress =$('#permanentAddress').val();
						
				var params = {};
				
				params["firstName"] = firstName;
				params["middleName"] =middleName;
				params["lastName"] =lastName;
				params["dob"] = dob;
				params["idNumber"] =idNumber;
				params["designation"] =designation;
				params["contactNo"] =contactNo;
				params["altContactNo"] =altContactNo;
				params["emailId"] = emailId;
			//	params["address"] = address;
				params["education"] = education;
				params["technology"] = technology;
				params["previousExperience"] =previousExperience;
				params["salary"] =salary;
				params["referenceBy"] =referenceBy;
				params["interviewedBy"] =interviewedBy;
				params["dateOfJoining"] =dateOfJoining;
				params["prevCompanyName"] =prevCompanyName;
				params["zipCode"] = zipCode;
				params["confirmEmail"] =confirmEmail;
				params["comment"] =comment;
				params["employeecondition"] =employeecondition;
				params["adharNumber"] =adharNumber;
				params["panNumber"] =panNumber;
				params["department"]=department;
				params["placeofposting"]=placeofposting;
				params["university"]=university;
				params["description1"]=description1;
				params["description2"]=description2;
				
				params["currentAddress"]=currentAddress;
				params["permanentAddress"]=permanentAddress;
				
				params["methodName"] = "empDetails";
			 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			 	    	{
							swal({
							     title: "Success!",
							     text: "Employee Details Added Successfully !",
							     icon: 'success',
							     timer: 2500,
							     button:false
							 });
			 				//alert(data);
			 				if(document.empd)
			 				{
			 					document.empd.reset();
			 				}	
			 				
			 				window.open("OffLetterPdf.jsp");
			 				document.empd.btn.disabled =false;
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
   document.empd.reset();	

}


/********* Edit Employee Details ************//*
function getEmployeeDetails(){
	var params= {};
	
	var input = document.getElementById('employee'),
     list = document.getElementById('emp_drop'),
     	i,fkRootEmpId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootEmpId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	$("#firstName").append($("<input/>").attr("value","").text());
	$("#middleName").append($("<input/>").attr("value","").text());
	$("#lastName").append($("<input/>").attr("value","").text());
	$("#joiningDate").append($("<input/>").attr("value","").text());
	$("#emailId").append($("<input/>").attr("value","").text());
	$("#salary").append($("<input/>").attr("value","").text());
	$("#contactNo").append($("<input/>").attr("value","").text());
	$("#address").append($("<input/>").attr("value","").text());
	$("#zipCode").append($("<input/>").attr("value","").text());
	
	
	params["EmpId"]= fkRootEmpId;
	
	
	params["methodName"] = "getEmployeeDetailsToEdit";
	
	$.post('/Shop/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				  document.getElementById("firstName").value = v.firstName;
			      document.getElementById("middleName").value = v.middleName;
			      document.getElementById("lastName").value = v.lastName;
			      document.getElementById("joiningDate").value = v.joiningDate;
			      document.getElementById("emailId").value = v.email;
			      document.getElementById("salary").value = v.salary;
			      document.getElementById("contactNo").value = v.contactNo;
			      document.getElementById("address").value = v.addresst;
			      document.getElementById("zipCode").value = v.zipCode;
			   
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}*/

/*============= Update employee detail ========*/
function editEmployee(){
	
	if(document.empd1.firstName.value == "")
	{
		alert("Enter Employee First Name.");
		return false;
	}	
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(document.empd1.firstName.value.match(letterNumber))
	{
		if(document.empd1.middleName.value == "")
		{
			alert("Enter Employee Middle Name.");
			return false;
		}	
		var letterNumber = /^[a-zA-Z, ]+$/;
		if(document.empd1.middleName.value.match(letterNumber))
		{
			if(document.empd1.lastName.value == "")
			{
				alert("Enter Employee Last Name.");
				return false;
			}	
			var letterNumber = /^[a-zA-Z, ]+$/;
			if(document.empd1.lastName.value.match(letterNumber))
			{
				
				
				var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  	        	 if(document.empd1.emailId.value.match(letterNumber) || document.empd1.emailId.value == null ||  document.empd1.emailId.value == "")
  	        	 {
	   	        	 
	   	        		 if ( document.empd1.salary.value == "" )
	   	        		 {
				         
				  	       alert("Please Enter Salary.");
				          return false;
	   	        		 }
	   	        		 var letterNumber = /^[0-9]+$/;
	   	        		 if(document.empd1.salary.value.match(letterNumber))
	   	        		 {
	   	        			 if ( document.empd1.contactNo.value == "" )
	   	        			 {
					  	       alert("Please Enter Contact Number");
					  	       return false;
	   	        			 }
	   	        			 var letterNumber = /^[0-9]{10}$/;
	   	        			 if(document.empd1.contactNo.value.match(letterNumber))
	   	        			 {
	   	        				if(document.empd1.address.value == "")
	   	        				{
	   	        					alert("Please Enter Employee Address.");
	   	        					return false;
	   	        				}	
	   	        				var letterNumber = /^[a-zA-Z0-9, ]+$/;
	   	        				if(document.empd1.address.value.match(letterNumber))
	   	        				{
	   	        					if ( document.empd1.zipCode.value == "" )
								    {
								         
								  	      alert("Please Enter Zip Code");
								          return false;
								    }
									var letterNumber = /^[0-9]{6}$/;
									if(document.empd1.zipCode.value.match(letterNumber))
									{
										updateEmployeeDetails();
										}
									else
										{
												alert("Enter 6 digit Numbers Only in zip code..!!");
												return false;
											}
										}
									
	   	        				else
									{
										alert("Enter Alphabates Only in address..!!");
										return false;
									}	
								}
										
	   	        			 else
								{
									alert("Enter 10 digit Numbers Only in contact number..!!");
									return false;
									}	
								}
										
	   	        		 else
							{
								alert("Enter Numbers Only in salary..!!");
								return false;
							}
						}
										
	   	        	 else
						{
							alert("Enter a Valid email adress..!!");
							return false;
						}
					}
																
			else
				{
					alert("Enter Alphabets Only in last name..!!");
					return false;
				}
			}
																
		else
			{
				alert("Enter Alphabets Only in middle name..!!");
				return false;
			}
		}
												
	else
		{
			alert("Enter Alphabets Only in first name..!!");
			return false;
		}
	
}
function updateEmployeeDetails(){
	
	document.empd1.btn.disabled = true;
	
	var input = document.getElementById('employee'),
    list = document.getElementById('emp_drop'),
    	i,fkRootEmpId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootEmpId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	//var customerId = document.getElementById("customerId").value;
	
	var firstName = $('#firstName').val();
	var middleName = $('#middleName').val();
	var lastName = $('#lastName').val();				
	var joiningDate = $('#newJoiningDate').val();
	var emailId = $('#emailId').val();
	var salary = $('#salary').val();
	var contactNo = $('#contactNo').val();
	var address = $('#address').val();
	var zipCode = $('#zipCode').val();
	var oldJoiningDate = $('#joiningDate').val();

	
	
	var params = {};
	
	params["EmployeeId"] = fkRootEmpId;
	params["firstName"] = firstName;	
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["joiningDate"] = joiningDate;
	params["emailId"] =emailId;
	params["salary"] = salary;
	params["contactNo"] = contactNo;
	params["address"] = address;
	params["zipCode"] = zipCode;
	params["oldJoiningDate"] = oldJoiningDate;
	
	
	params["methodName"] = "updateEmployeeDetails";

	$.post('/Shop/jsp/utility/controller.jsp',params,function(data){
			alert(data);
				if(document.empd1)
				{
					document.empd1.reset();
				}	
				document.empd1.btn.disabled =false;
			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		
 	    		/*alert("Data Added Successfully..");
 	    		location.reload();
 				document.ccd.btn.disabled =false;*/
 	    		
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
}	


// Validation for Employee  Report
function getEmployeeDetailsReportValidation()
{
	var employeeName= $('#fk_employee_id').val();
	
	if(employeeName=="")
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Employee Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Select Employee Name");
		
		document.getElementById("fk_employee_id").focus();
		return false;
	}
	getEmployeeDetailsReport();
}

//************ Employee Report **************//*

function getEmployeeDetailsReport()
{
	var params= {};
	var employeeName= $('#fk_employee_id').val();
	
	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) 
	{
	if (list.options[i].value === input1.value) 
		{
			fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkEmployeeid"]= fkEmployeeid;
	params["employeeName"]= employeeName;
	params["methodName"] = "getEmployeeReport";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#empDetails').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
				{
			swal({
			     title: "Warning!",
			     text: "No data Available for "+employeeName+"..!",
			     icon: 'warning',
			     timer: 2500,
			     button:false
			 });
			return false;
			}

		$(document).ready(function() {
			$('#empDetails').DataTable( {

				"bPaginate": false,
				//"scrollX": true,

				
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

	/*				// Total over this page
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
				"scrollX": true,
				columns: [
					          {"data": "firstName" , "width": "5%" ,"defaultContent": ""},
					          {"data": "middleName", "width": "5%" ,"defaultContent": ""},
					          {"data": "lastName", "width": "5%" ,"defaultContent": ""},
					          {"data": "dob", "width": "5%" ,"defaultContent": ""},
					          {"data": "idNumber" , "width": "5%" ,"defaultContent": ""},
					          {"data": "designation" , "width": "5%" ,"defaultContent": ""},
					          {"data": "contactNo" , "width": "5%" ,"defaultContent": ""},
					          {"data": "altContactNo" , "width": "5%" ,"defaultContent": ""},
					          {"data": "emailId" , "width": "5%" ,"defaultContent": ""},
					          
					          {"data": "currentAddress", "width": "5%" ,"defaultContent": ""},
					          
					          {"data": "education", "width": "5%" ,"defaultContent": ""},
					          {"data": "technology" , "width": "5%" ,"defaultContent": ""},
					          {"data": "previousExperience" , "width": "5%" ,"defaultContent": ""},
					          {"data": "salary" , "width": "5%" ,"defaultContent": ""},
					          {"data": "referenceBy" , "width": "5%" ,"defaultContent": ""},
					          {"data": "interviewedBy" , "width": "5%" ,"defaultContent": ""},
					          {"data": "dateOfJoining", "width": "5%" ,"defaultContent": ""},
					          {"data": "prevCompanyName" , "width": "5%" ,"defaultContent": ""},
					          {"data": "zipCode" , "width": "5%" ,"defaultContent": ""},
					          {"data": "confirmEmail" , "width": "5%" ,"defaultContent": ""},
					          {"data": "comment" , "width": "5%" ,"defaultContent": ""},
					          {"data": "employeeCondition" , "width": "5%" ,"defaultContent": ""},
					          {"data": "adharNo" , "width": "5%" ,"defaultContent": ""},
					          {"data": "panNumber" , "width": "5%" ,"defaultContent": ""},
					          {"data": "department" , "width": "5%" ,"defaultContent": ""},
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Details Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Details Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Details Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Details Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );

		
		var mydata = catmap;
		$('#empDetails').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


// List Of employee 
function employeeList()
{
	var params= {};

	params["methodName"] = "getAllEmployeeList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#empDetails').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;


		$(document).ready(function() {
			$('#empDetails').DataTable( {
				
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

				/*	// Total over this page
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
				"scrollX": true,
				columns: [
						  {"data": "srNo" , "width": "3%" ,"defaultContent": ""},	
				          {"data": "firstName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "middleName", "width": "5%" ,"defaultContent": ""},
				          {"data": "lastName", "width": "5%" ,"defaultContent": ""},
				          {"data": "dob", "width": "15%" ,"defaultContent": ""},
				          {"data": "idNumber" , "width": "5%" ,"defaultContent": ""},
				          {"data": "designation" , "width": "5%" ,"defaultContent": ""},
				          {"data": "contactNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "altContactNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "emailId" , "width": "5%" ,"defaultContent": ""},
				          {"data": "confirmEmail" , "width": "5%" ,"defaultContent": ""},
				          {"data": "currentAddress", "width": "5%" ,"defaultContent": ""},
				          {"data": "permenentAddress", "width": "5%" ,"defaultContent": ""},
				          {"data": "education", "width": "5%" ,"defaultContent": ""},
				          {"data": "technology" , "width": "5%" ,"defaultContent": ""},
				          {"data": "previousExperience" , "width": "5%" ,"defaultContent": ""},
				          {"data": "salary" , "width": "5%" ,"defaultContent": ""},
				          {"data": "referenceBy" , "width": "5%" ,"defaultContent": ""},
				          
				          {"data": "interviewedBy" , "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfJoining", "width": "5%" ,"defaultContent": ""},
				          {"data": "prevCompanyName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zipCode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "comment" , "width": "5%" ,"defaultContent": ""},
				          {"data": "employeeCondition" , "width": "5%" ,"defaultContent": ""},
				          {"data": "adharNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "panNumber" , "width": "5%" ,"defaultContent": ""},
				          {"data": "department" , "width": "5%" ,"defaultContent": ""},
				          
				          
				          ],
				          
					} );
				});

		
		var mydata = catmap;
		$('#empDetails').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

}

//edit Employee Detailas
function getEmployeeDetailasForEdit()
{
	
	
	$("#firstName").append($("<input/>").attr("value","").text());
	$("#middleName").append($("<input/>").attr("value","").text());
	$("#lastName").append($("<input/>").attr("value","").text());
	$("#dob").append($("<input/>").attr("value","").text());
	$("#contactNo").append($("<input/>").attr("value","").text());
	$("#altContactNo").append($("<input/>").attr("value","").text());
	$("#emailId").append($("<input/>").attr("value","").text());
	$("#confirmEmail").append($("<input/>").attr("value","").text());
	$("#currentAddress").append($("<input/>").attr("value","").text());
	$("#permanentAddress").append($("<input/>").attr("value","").text());
	$("#zipCode").append($("<input/>").attr("value","").text());
	$("#adharNumber").append($("<input/>").attr("value","").text());
	$("#panNumber").append($("<input/>").attr("value","").text());
	$("#education").append($("<input/>").attr("value","").text());
	$("#technology").append($("<input/>").attr("value","").text());
	$("#university").append($("<input/>").attr("value","").text());
	$("#idNumber").append($("<input/>").attr("value","").text());
	$("#designation").append($("<input/>").attr("value","").text());
	$("#department").append($("<input/>").attr("value","").text());
	$("#dateOfJoining").append($("<input/>").attr("value","").text());
	$("#previousExperience").append($("<input/>").attr("value","").text());
	$("#prevCompanyName").append($("<input/>").attr("value","").text());
	$("#referenceBy").append($("<input/>").attr("value","").text());
	$("#interviewedBy").append($("<input/>").attr("value","").text());
	$("#salary").append($("<input/>").attr("value","").text());
	$("#placeofposting").append($("<input/>").attr("value","").text());
	$("#comment").append($("<input/>").attr("value","").text());
	$("#employeecondition").append($("<input/>").attr("value","").text());
	
	
	var params= {};
	var employeeName= $('#fk_employee_id').val();
	
	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkEmployeeid"] = fkEmployeeid;
	params["employeeName"] = employeeName;
	params["methodName"] = "getEmployeeDetailsForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
				
				  document.getElementById("firstName").value = v.firstName;
			      document.getElementById("middleName").value = v.middleName;
			      document.getElementById("lastName").value = v.lastName;
			      document.getElementById("dob").value = v.dob;
			      document.getElementById("contactNo").value = v.contactNo;
			      document.getElementById("altContactNo").value = v.altContactNo;
			      document.getElementById("emailId").value = v.emailId;
			      document.getElementById("confirmEmail").value = v.confirmEmail;
			      document.getElementById("currentAddress").value = v.currentAddress;
			      document.getElementById("permanentAddress").value = v.permenentAddress;
			      document.getElementById("zipCode").value = v.zipCode;
			      document.getElementById("adharNumber").value = v.adharNo;
			      document.getElementById("panNumber").value = v.panNumber;
			      document.getElementById("education").value = v.education;
			      document.getElementById("technology").value = v.technology;
			      document.getElementById("university").value = v.university;
			      document.getElementById("idNumber").value = v.idNumber;
			      document.getElementById("designation").value = v.designation;   
			      document.getElementById("department").value = v.department;
			      document.getElementById("dateOfJoining").value = v.dateOfJoining;
			      document.getElementById("previousExperience").value = v.previousExperience;    
			      document.getElementById("prevCompanyName").value = v.prevCompanyName;
			      document.getElementById("referenceBy").value = v.referenceBy;
			      document.getElementById("interviewedBy").value = v.interviewedBy;
			      document.getElementById("salary").value = v.salary;
			      document.getElementById("placeofposting").value = v.placeOfPosting;
			      document.getElementById("comment").value = v.comment;
			      document.getElementById("employeecondition").value = v.employeeCondition;
			      
			  
			});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}

function validationUpdateEmployeeDetails()
{
	var employeeNameFullName= $('#fk_employee_id').val();
	var firstName= $('#firstName').val();
	var lastName= $('#lastName').val();
	var dob= $('#dob').val();
	var contactNo= $('#contactNo').val();
	var emailId= $('#emailId').val();
	var confirmEmail= $('#confirmEmail').val();
	var zipCode= $('#zipCode').val();
	var education= $('#education').val();
	var designation= $('#designation').val();
	var dateOfJoining= $('#dateOfJoining').val();
	var salary= $('#salary').val();

	
	if(employeeNameFullName=="" || employeeNameFullName==null || employeeNameFullName==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please select employee name for update record !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please select employee name for update record');
		return false;
	}
	if(firstName=="" || firstName==null || firstName==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please enter first name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please enter first name');
		return false;
	}
	if(lastName=="" || lastName==null || lastName==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please enter last name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please enter last name');
		return false;
	}
	if(dob=="" || dob==null || dob==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please select date of birth !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please select date of birth');
		return false;
	}
	
	// Validate Date	
	var dateString = document.empd.dob.value;
    var myDate = new Date(dateString);
    var today = new Date();
    if ( myDate > today ) {
     	swal({
		     title: "Alert!",
		     text: "You cannot enter a date in the future",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
    	//alert('You cannot enter a date in the future!.');
//         $('#dob').after('<p>You cannot enter a date in the future!.</p>');
    	document.getElementById("dob").focus();
        return false;
    }
		
	if(contactNo=="" || contactNo==null || contactNo==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please enter contact No",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please enter contact No');
		return false;
	}
	
	if(emailId=="" || emailId==null || emailId==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please enter emailId",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please enter emailId');
		return false;
	}
	if(confirmEmail=="" || confirmEmail==null || confirmEmail==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please enter confirmation email id",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please enter confirmation email id');
		
		return false;
	}
	if(confirmEmail != emailId)
	{
		swal({
		     title: "Alert!",
		     text: "Email id and confirmation email id should be same",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Email id and confirmation email id should be same.');
		document.getElementById("confirmEmail").focus();
		return false;
	}
	if(zipCode=="" || zipCode==null || zipCode==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please enter zip code",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please enter zip code');
		return false;
	}
	if(education=="" || education==null || education==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please enter education",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please enter education');
		return false;
	}
	if(designation=="" || designation==null || designation==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please enter designation",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please enter designation');
		return false;
	}
	if(dateOfJoining=="" || dateOfJoining==null || dateOfJoining==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please select date of joining",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please select date of joining');
		return false;
	}
	if(salary=="" || salary==null || salary==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please enter salary",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert('Please enter salary');
		return false;
	}

	updateEmployeeDetailas();
	
}




//update Employee Details
function updateEmployeeDetailas()
{
	var params= {};
	
	
	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	var employeeNameFullName= $('#fk_employee_id').val();
	
	var firstName= $('#firstName').val();
	var middleName= $('#middleName').val();
	var lastName= $('#lastName').val();
	var dob= $('#dob').val();
	var contactNo= $('#contactNo').val();
	var altContactNo= $('#altContactNo').val();
	var emailId= $('#emailId').val();
	var confirmEmail= $('#confirmEmail').val();
	var currentAddress= $('#currentAddress').val();
	var permanentAddress= $('#permanentAddress').val();
	var zipCode= $('#zipCode').val();
	var adharNumber= $('#adharNumber').val();
	var panNumber= $('#panNumber').val();
	var technology= $('#technology').val();
	var education= $('#education').val();
	var university= $('#university').val();
	var idNumber= $('#idNumber').val();
	var designation= $('#designation').val();
	var department= $('#department').val();
	var dateOfJoining= $('#dateOfJoining').val();
	var previousExperience= $('#previousExperience').val();
	var prevCompanyName= $('#prevCompanyName').val();
	var referenceBy= $('#referenceBy').val();
	var interviewedBy= $('#interviewedBy').val();
	var salary= $('#salary').val();
	var placeofposting= $('#placeofposting').val();
	var comment= $('#comment').val();
	var employeecondition= $('#employeecondition').val();
	
	
	
	params["fkEmployeeid"] = fkEmployeeid;
	
	params["employeeNameFullName"] = employeeNameFullName;
	params["firstName"] = firstName;
	params["middleName"] =middleName;
	params["lastName"] =lastName;
	params["dob"] = dob;
	params["contactNo"] =contactNo;
	params["altContactNo"] =altContactNo;
	params["emailId"] = emailId;
	params["confirmEmail"] =confirmEmail;
	params["currentAddress"] = currentAddress;
	params["permanentAddress"] = permanentAddress;
	params["zipCode"] = zipCode;
	params["adharNumber"] =adharNumber;
	params["panNumber"] =panNumber;
	params["education"] = education;
	params["technology"] = technology;
	params["university"] =university;
	params["idNumber"] =idNumber;
	params["designation"] =designation;
	params["department"]=department;
	params["dateOfJoining"] =dateOfJoining;
	params["previousExperience"] =previousExperience;
	params["prevCompanyName"] =prevCompanyName;
	params["referenceBy"] =referenceBy;
	params["interviewedBy"] =interviewedBy;
	params["salary"] =salary;
	params["placeofposting"]=placeofposting;
	params["comment"] =comment;
	params["employeecondition"] =employeecondition;
	
	params["methodName"] = "updateEmployeeDetails";
	
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
				swal({
		     title: "Success!",
		     text: "Employee Details Updated Successfully !",
		     icon: 'success',
		     timer: 2500,
		     button:false
		     });
 				//alert(data);
 				if(document.empd)
 				{
 					location.reload();
 				}	
 				document.empd.btn.disabled =false;
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
 			
 	}

/*function reset()
{
	document.empd.reset();	
	location.reload();
}*/



//Validation for Previous Employee  Report
function getExEmployeeDetailsReportValidation()
{
	var employeeName= $('#fk_employee_id').val();
	
	if(employeeName=="")
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
	getExEmployeeDetailsReport();
}

//************ Previous Employee Report **************//*

function getExEmployeeDetailsReport()
{
	var params= {};
	var employeeName= $('#fk_employee_id').val();
	
	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) 
	{
	if (list.options[i].value === input1.value) 
		{
			fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	params["fkEmployeeid"]= fkEmployeeid;
	params["employeeName"]= employeeName;
	params["methodName"] = "getExEmployeeReport";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		//To clear table
		$('#exEmpDetails').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+employeeName+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}

		$(document).ready(function() {
			$('#exEmpDetails').DataTable( {

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
				          {"data": "firstName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "middleName", "width": "5%" ,"defaultContent": ""},
				          {"data": "lastName", "width": "5%" ,"defaultContent": ""},
				          {"data": "dob", "width": "5%" ,"defaultContent": ""},
				          {"data": "idNumber" , "width": "5%" ,"defaultContent": ""},
				          {"data": "designation" , "width": "5%" ,"defaultContent": ""},
				          {"data": "contactNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "altContactNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "emailId" , "width": "5%" ,"defaultContent": ""},
				          {"data": "address", "width": "5%" ,"defaultContent": ""},
				          {"data": "education", "width": "5%" ,"defaultContent": ""},
				          {"data": "technology" , "width": "5%" ,"defaultContent": ""},
				          {"data": "previousExperience" , "width": "5%" ,"defaultContent": ""},
				          {"data": "salary" , "width": "5%" ,"defaultContent": ""},
				          {"data": "referenceBy" , "width": "5%" ,"defaultContent": ""},
				          {"data": "interviewedBy" , "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfJoining", "width": "5%" ,"defaultContent": ""},
				          {"data": "dateOfLiving", "width": "5%" ,"defaultContent": ""},
				          {"data": "prevCompanyName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "zipCode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "confirmEmail" , "width": "5%" ,"defaultContent": ""},
				          {"data": "comment" , "width": "5%" ,"defaultContent": ""},
				          {"data": "employeeCondition" , "width": "5%" ,"defaultContent": ""},
				          {"data": "adharNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "panNumber" , "width": "5%" ,"defaultContent": ""},
				          {"data": "department" , "width": "5%" ,"defaultContent": ""},
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Previous Employee Details Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Previous Employee Details Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Previous Employee Details Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Previous Employee Details Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     } ]
			} );
		} );

		
		var mydata = catmap;
		$('#exEmpDetails').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});
}


function validationEmployeeLeaveDetails()
{
	var employeeName= $('#fk_employee_id').val();
	var leaveDateFrom= $('#leaveDateFrom').val();
	var type= $('#type').val();
	var leaveDateTo= $('#leaveDateTo').val();
	
	
	if(employeeName=="" || employeeName==null)
	{	
		swal({
		     title: "Alert!",
		     text: "Please Select Employee Name..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("please Select Employee Name");
		return flase;
	}
	
	if(leaveDateFrom=="" || leaveDateFrom==null)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Leave Date From!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("please Select LeaveDateFrom");
		return flase;
	}
	
	if(type=="" || type==null)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Type..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("please Select Type");
		return flase;
	}
	
	
	if(leaveDateTo=="" || leaveDateTo==null)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select LeaveDate To..!",
		     icon: 'error',
		     timer: 2500,
		     button:false
		});
		//alert("please Select LeaveDate To");
		return flase;
	}
	
	
	employeeLeaveDetails();
}

function employeeLeaveDetails()
{
	var params= {};
	var employeeName= $('#fk_employee_id').val();
	
	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
			fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	var leaveDateFrom= $('#leaveDateFrom').val();
	var type= $('#type').val();
	var leaveDateTo= $('#leaveDateTo').val();
	var description= $('#description').val();
	var approvedBy= $('#approvedBy').val();

	
	if(description=="" || description==null)
	{
		description="N/A";
	}
	
	
	if(approvedBy=="" || approvedBy==null)
	{
		approvedBy="N/A";
	}
	
	params["fkEmployeeid"] = fkEmployeeid;
	params["employeeName"] = employeeName;
	params["leaveDateFrom"] = leaveDateFrom;
	params["type"] = type;
	params["leaveDateTo"] = leaveDateTo;
	params["description"] = description;
	params["approvedBy"] = approvedBy;
	
	
	params["methodName"] = "employeeLeaveDetails";
	
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				swal({
				     title: "Success!",
				     text: "Employee Leave Added Successfully !",
				     icon: 'success',
				     timer: 2500,
				     button:false
				 });
				//alert(data);
 				if(document.empd)
 				{
 					document.empd.reset();
 				}	
 				document.empd.btn.disabled =false;
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
document.empd.reset();	

}

//List Of Employee Leave Details 
function employeeLeaveList()
{
	var params= {};

	params["methodName"] = "getAllEmployeeLeaveList";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#empLeaveDetails').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			$('#empLeaveDetails').DataTable( {
				
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
			/*		$( api.column( 5 ).footer() ).html(

							'Rs'+' '+parseFloat(pageTotal).toFixed(2)

					);
					console.log( pageTotal);*/
					
				},

				destroy: true,
				searching: true,
				"scrollX": true,
				columns: [
				          {"data": "employeeName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "leaveDateFrom", "width": "5%" ,"defaultContent": ""},
				          {"data": "leaveDateTo", "width": "5%" ,"defaultContent": ""},
				          {"data": "Type", "width": "5%" ,"defaultContent": ""},
				          {"data": "description" , "width": "5%" ,"defaultContent": ""},
				          {"data": "approvedBy" , "width": "5%" ,"defaultContent": ""},			         
				          ],
					} );
				});
		
		var mydata = catmap;
		$('#empLeaveDetails').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

}

// Validation Report Of Employee Leave Details 
function employeeLeaveReportValidation()
{
	var employeeName= $('#fk_employee_id').val();

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
	employeeLeaveReport();
}


//Report Of Employee Leave Details 
function employeeLeaveReport()
{
	var params= {};
	
	var employeeName= $('#fk_employee_id').val();

	
	var input1 = document.getElementById('fk_employee_id'),
	list = document.getElementById('employeeNameList'),
	i,fkEmployeeid;

	for (i = 0; i < list.options.length; ++i) 
	{
		if (list.options[i].value === input1.value) 
		{
		fkEmployeeid = list.options[i].getAttribute('data-value');
		}
	}
	
	
	params["fkEmployeeid"] = fkEmployeeid;
	params["employeeName"] = employeeName;
	

	params["methodName"] = "getAllEmployeeLeaveReport";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#empLeaveDetails').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if(catmap<=0 || catmap==null)
		{
		swal({
	     title: "Warning!",
	     text: "No data Available for "+employeeName+"..!",
	     icon: 'warning',
	     timer: 2500,
	     button:false
		});
		return false;
		}

		$(document).ready(function() {
			$('#empLeaveDetails').DataTable( {
				
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
				"scrollX": true,
				columns: [
				          {"data": "employeeName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "leaveDateFrom", "width": "5%" ,"defaultContent": ""},
				          {"data": "leaveDateTo", "width": "5%" ,"defaultContent": ""},
				          {"data": "Type", "width": "5%" ,"defaultContent": ""},
				          {"data": "description" , "width": "5%" ,"defaultContent": ""},
				          {"data": "approvedBy" , "width": "5%" ,"defaultContent": ""},
				         
				          ],
				          
				          dom : 'Bfrtip',
				          buttons : [ 
				                     { extend: 'copyHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Leave Details Report";
				                    	 }},
				                     { extend: 'excelHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Leave Details Report";
				                    	 }},
				                     { extend: 'csvHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Leave Details Report";
				                    	 }},
				                     { extend : 'pdfHtml5', footer: true,
				                    	 title : function() {
				                    		 return "Employee Leave Details Report";
				                    	 },
				                    	 orientation : 'landscape',
				                    	 pageSize : 'LEGAL',
				                    	 titleAttr : 'PDF' 
				                     }]
					} );
				});

		
		var mydata = catmap;
		$('#empLeaveDetails').dataTable().fnAddData(mydata);
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {
					$(loaderObj).hide();
					$(loaderObj).find('#errorDiv').show();
				}
			});

}





