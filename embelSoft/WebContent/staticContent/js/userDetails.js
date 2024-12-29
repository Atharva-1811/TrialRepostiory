//userDetails.js


/*============= Validate User Details User Details Validation ========*/
function validateSaveUserDetails()
{
	var firstName = $('#firstName').val();
	var lastName = $('#lastName').val();
	var contactNo = $('#contactNo').val();
	var address = $('#address').val();
	var city = $('#city').val();
	var pincode = $('#pincode').val();
	var emailId = $('#emailId').val();
	var userName = $('#userName').val();
	var password = $('#password').val();
	var rePassword = $('#rePassword').val();
	var panNumber = $('#panNumber').val();
	
	if(firstName=="" || firstName==null || firstName==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter First Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });

		//alert("Please Enter First Name");
		return false;
	}
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(firstName.match(letterNumber))
	{
		if(lastName=="" || lastName==null || lastName==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Last Name !",
			     icon: 'error',
			     timer: 2500,
			     button:false
			     });
			//alert("Please Enter Last Name");
			return false;
		}
		var letterNumber = /^[a-zA-Z, ]+$/;
		if(lastName.match(letterNumber))
		{
			if(contactNo=="" || contactNo==null || contactNo==undefined)
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
			}
			var letterNumber = /^[0-9]{10}$/;
			if(contactNo.match(letterNumber))
			{
				if(address=="" || address==null || address==undefined)
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter Address !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Please Enter Address");
					return false;
				}
				if(city=="" || city==null || city==undefined)
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter City !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Please Enter City");
					return false;
				}
				var letterNumber = /^[a-zA-Z, ]+$/;
				if(city.match(letterNumber))
				{
					if(pincode=="" || pincode==null || pincode==undefined)
					{
						swal({
						     title: "Alert!",
						     text: "Please Enter Pincode !",
						     icon: 'error',
						     timer: 2500,
						     button:false
						     });
						//alert("Please Enter Pincode");
						return false;
					}
					var letterNumber = /^[0-9]{6}$/;
					if(pincode.match(letterNumber))
					{
						if(emailId=="" || emailId==null || emailId==undefined)
						{
							swal({
							     title: "Alert!",
							     text: "Please Enter Email Id !",
							     icon: 'error',
							     timer: 2500,
							     button:false
							     });
							//alert("Please Enter Pincode");
							return false;
						}
						var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
						if(emailId.match(letterNumber))
						{
							if(userName=="" || userName==null || userName==undefined)
							{
								swal({
								     title: "Alert!",
								     text: "Please Enter User Name !",
								     icon: 'error',
								     timer: 2500,
								     button:false
								     });
			   
								//alert("Please Enter User Name");
								return false;
							}
							var letterNumber = /^[a-zA-Z]+$/;
							if(userName.match(letterNumber))
							{
								if(password=="" || password==null || password==undefined)
								{
									swal({
									     title: "Alert!",
									     text: "Please Enter Password !",
									     icon: 'error',
									     timer: 2500,
									     button:false
									     });
									//alert("Please Enter Password");
									return false;
								}
								var letterNumber = /^[a-zA-Z0-9@$%^&*!_]+$/;
								if(password.match(letterNumber))
								{
									if(rePassword=="" || rePassword==null || rePassword==undefined)
									{
										swal({
										     title: "Alert!",
										     text: "Please Enter Re-Password !",
										     icon: 'error',
										     timer: 2500,
										     button:false
										     });
										//alert("Please Enter Re Password");
										return false;
									}
									var letterNumber = /^[a-zA-Z0-9@$%^&*!_]+$/;
									if(rePassword.match(letterNumber))
									{
										if(rePassword !== password)
										{
											swal({
											     title: "Alert!",
											     text: "Please Enter Re Password and Password should be same !",
											     icon: 'error',
											     timer: 2500,
											     button:false
											     });
											//alert("Please Enter Re Password and Password should be same");
											return false;
										}
										if(panNumber=="" || panNumber==null || panNumber==undefined)
										{
											swal({
											     title: "Alert!",
											     text: "Please Enter Pan Number !",
											     icon: 'error',
											     timer: 2500,
											     button:false
											     });
											//alert("Please Enter Pan Number");
											return false;
										}
										var letterNumber = /^[a-zA-Z0-9]+$/;
										if(panNumber.match(letterNumber))
										{
											saveUserDetails();
										}
										else
										{
											swal({
											     title: "Alert!",
											     text: "Please Enter Alphabets and Digits Only in Pan Number !",
											     icon: 'error',
											     timer: 2500,
											     button:false
											     });
											//alert("Enter Alphabets and Digits Only in Pan Number..!!");
											return false;
										}
									}
									else
									{
										swal({
										     title: "Alert!",
										     text: "Please Enter Alphabets, Digits and Special Characters Only in Re Password !",
										     icon: 'error',
										     timer: 2500,
										     button:false
										     });
										//alert("Enter Alphabets, Digits and Special Characters Only in Re Password..!!");
										return false;
									}
								}
								else
								{
									swal({
									     title: "Alert!",
									     text: "Please Enter Alphabets, Digits and Special Characters Only in Password !",
									     icon: 'error',
									     timer: 2500,
									     button:false
									     });
									//alert("Enter Alphabets, Digits and Special Characters Only in Password..!!");
									return false;
								}
							}
							else
							{
								swal({
								     title: "Alert!",
								     text: "Please Enter Alphabets Only in User Name !",
								     icon: 'error',
								     timer: 2500,
								     button:false
								     });
								//alert("Enter Alphabets Only in User Name..!!");
								return false;
							}
						}
						else
						{
							swal({
							     title: "Alert!",
							     text: "Please Enter a Valid Email Adress Only in Email Id !",
							     icon: 'error',
							     timer: 2500,
							     button:false
							     });
							//alert("Enter a Valid Email Adress Only in Email Id..!!");
							return false;
						}
					}
					else
					{
						swal({
						     title: "Alert!",
						     text: "Please Enter 6 Digits Number Only in Pincode !",
						     icon: 'error',
						     timer: 2500,
						     button:false
						     });
						//alert("Enter 6 Digits Number Only in Pincode..!!");
						return false;
					}
				}
				else
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter Alphabets Only in City !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Enter Alphabets Only in City..!!");
					return false;
				}
			}
			else
			{
				swal({
				     title: "Alert!",
				     text: "Please Enter 10 Digits Number Only in Contact Number !",
				     icon: 'error',
				     timer: 2500,
				     button:false
				     });
				//alert("Enter 10 Digits Number Only in Contact Number..!!");
				return false;
			}
		}
		else
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Alphabets Only in Last Name !",
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
		     text: "Please Enter Alphabets Only in First Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Enter Alphabets Only in First Name..!!");
		return false;
	}
}

/*============= User Details Add to Database User Details========*/
//saveUserDetails
function saveUserDetails()
{
	document.userDetailsForm.saveBtn.disabled = true;
	
	var firstName = $('#firstName').val();
	var lastName = $('#lastName').val();
	var contactNo = $('#contactNo').val();
	var address = $('#address').val();
	var city = $('#city').val();
	var pincode = $('#pincode').val();
	var emailId = $('#emailId').val();
	var userName = $('#userName').val();
	var password = $('#password').val();
	var rePassword = $('#rePassword').val();
	var panNumber = $('#panNumber').val();
	
	
	var params = {};
	
	params["firstName"] = firstName;
	params["lastName"] = lastName;
	params["contactNo"] = contactNo;
	params["address"] = address;
	params["city"] = city;
	params["pincode"]= pincode;
	params["emailId"]= emailId;
	params["userName"]= userName;
	params["password"]= password;
	params["rePassword"]= rePassword;
	params["panNumber"]= panNumber;
	
	params["methodName"] = "saveUserDetails";
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 		swal({
		     title: "Success!",
		     text: "User Details Added Successful !",
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

//userDetailsList
function userDetailsList()
{
	var params= {};

	params["methodName"] = "getAllUserDetailsList";
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
					.column( 11 )
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
				"scrollX": true,
				columns: [
					      {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "firstName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "lastName", "width": "5%" ,"defaultContent": ""},
				          {"data": "contactNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "address" , "width": "5%" ,"defaultContent": ""},
				          {"data": "city" , "width": "5%" ,"defaultContent": ""},
				          {"data": "pincode" , "width": "5%" ,"defaultContent": ""},
				          {"data": "emailId", "width": "5%" ,"defaultContent": ""},
				          {"data": "userName" , "width": "5%" ,"defaultContent": ""},
				          {"data": "password" , "width": "5%" ,"defaultContent": ""},
				          {"data": "rePassword", "width": "5%" ,"defaultContent": ""},
				          {"data": "panNumber", "width": "5%" ,"defaultContent": ""},			          
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
function getUserDetailasForEdit()
{
	$("#firstName").append($("<input/>").attr("value","").text());
	$("#lastName").append($("<input/>").attr("value","").text());
	$("#contactNo").append($("<input/>").attr("value","").text());
	$("#address").append($("<input/>").attr("value","").text());
	$("#city").append($("<input/>").attr("value","").text());
	$("#pincode").append($("<input/>").attr("value","").text());
	$("#emailId").append($("<input/>").attr("value","").text());
	$("#userName").append($("<input/>").attr("value","").text());
	$("#password").append($("<input/>").attr("value","").text());
	$("#rePassword").append($("<input/>").attr("value","").text());
	$("#panNumber").append($("<input/>").attr("value","").text());
	
	
	var params = {};
	
	var input1 = document.getElementById('pk_user_id'),
	list = document.getElementById('userNameList'),
	i,pkUserId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkUserId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["pkUserId"] = pkUserId;
	params["methodName"] = "getUserDetailForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{			
			document.getElementById("firstName").value = v.firstName;
			document.getElementById("lastName").value = v.lastName;
			document.getElementById("contactNo").value = v.contactNo;
			document.getElementById("address").value = v.address;
			document.getElementById("city").value = v.city;
			document.getElementById("pincode").value = v.pincode;
			document.getElementById("emailId").value = v.emailId;
			document.getElementById("userName").value = v.userName;
			document.getElementById("password").value = v.password;
			document.getElementById("rePassword").value = v.rePassword;
			document.getElementById("panNumber").value = v.panNumber;
		});
	}).error(function(jqXHR, textStatus, errorThrown)
	{
		if(textStatus==="timeout")
		{
			
		}
	});
}

//validateUpdateUserDetails
function validateUpdateUserDetails()
{
	var firstName = $('#firstName').val();
	var lastName = $('#lastName').val();
	var contactNo = $('#contactNo').val();
	var address = $('#address').val();
	var city = $('#city').val();
	var pincode = $('#pincode').val();
	var emailId = $('#emailId').val();
	var userName = $('#userName').val();
	var password = $('#password').val();
	var rePassword = $('#rePassword').val();
	var panNumber = $('#panNumber').val();
	
	if(firstName=="" || firstName==null || firstName==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Enter First Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });

		//alert("Please Enter First Name");
		return false;
	}
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(firstName.match(letterNumber))
	{
		if(lastName=="" || lastName==null || lastName==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Last Name !",
			     icon: 'error',
			     timer: 2500,
			     button:false
			     });
			//alert("Please Enter Last Name");
			return false;
		}
		var letterNumber = /^[a-zA-Z, ]+$/;
		if(lastName.match(letterNumber))
		{
			if(contactNo=="" || contactNo==null || contactNo==undefined)
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
			}
			var letterNumber = /^[0-9]{10}$/;
			if(contactNo.match(letterNumber))
			{
				if(address=="" || address==null || address==undefined)
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter Address !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Please Enter Address");
					return false;
				}
				if(city=="" || city==null || city==undefined)
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter City !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Please Enter City");
					return false;
				}
				var letterNumber = /^[a-zA-Z, ]+$/;
				if(city.match(letterNumber))
				{
					if(pincode=="" || pincode==null || pincode==undefined)
					{
						swal({
						     title: "Alert!",
						     text: "Please Enter Pincode !",
						     icon: 'error',
						     timer: 2500,
						     button:false
						     });
						//alert("Please Enter Pincode");
						return false;
					}
					var letterNumber = /^[0-9]{6}$/;
					if(pincode.match(letterNumber))
					{
						if(emailId=="" || emailId==null || emailId==undefined)
						{
							swal({
							     title: "Alert!",
							     text: "Please Enter Pincode !",
							     icon: 'error',
							     timer: 2500,
							     button:false
							     });
							//alert("Please Enter Pincode");
							return false;
						}
						var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
						if(emailId.match(letterNumber))
						{
							if(userName=="" || userName==null || userName==undefined)
							{
								swal({
								     title: "Alert!",
								     text: "Please Enter User Name !",
								     icon: 'error',
								     timer: 2500,
								     button:false
								     });
								//alert("Please Enter User Name");
								return false;
							}
							var letterNumber = /^[a-zA-Z]+$/;
							if(userName.match(letterNumber))
							{
								if(password=="" || password==null || password==undefined)
								{
									swal({
									     title: "Alert!",
									     text: "Please Enter Password !",
									     icon: 'error',
									     timer: 2500,
									     button:false
									     });
									//alert("Please Enter Password");
									return false;
								}
								var letterNumber = /^[a-zA-Z0-9@$%^&*!_]+$/;
								if(password.match(letterNumber))
								{
									if(rePassword=="" || rePassword==null || rePassword==undefined)
									{
										swal({
										     title: "Alert!",
										     text: "Please Enter Re-Password !",
										     icon: 'error',
										     timer: 2500,
										     button:false
										     });
										//alert("Please Enter Re Password");
										return false;
									}
									var letterNumber = /^[a-zA-Z0-9@$%^&*!_]+$/;
									if(rePassword.match(letterNumber))
									{
										if(rePassword !== password)
										{
											swal({
											     title: "Alert!",
											     text: "Please Enter Re Password and Password should be same !",
											     icon: 'error',
											     timer: 2500,
											     button:false
											     });
											//alert("Please Enter Re Password and Password should be same");
											return false;
										}
										if(panNumber=="" || panNumber==null || panNumber==undefined)
										{
											swal({
											     title: "Alert!",
											     text: "Please Enter Pan Number !",
											     icon: 'error',
											     timer: 2500,
											     button:false
											     });
											//alert("Please Enter Pan Number");
											return false;
										}
										var letterNumber = /^[a-zA-Z0-9]+$/;
										if(panNumber.match(letterNumber))
										{
											updateUserDetails();
										}
										else
										{
											swal({
											     title: "Alert!",
											     text: "Please Enter Alphabets and Digits Only in Pan Number !",
											     icon: 'error',
											     timer: 2500,
											     button:false
											     });
											//alert("Enter Alphabets and Digits Only in Pan Number..!!");
											return false;
										}
									}
									else
									{
										swal({
										     title: "Alert!",
										     text: "Please Enter Alphabets, Digits and Special Characters Only in Re Password !",
										     icon: 'error',
										     timer: 2500,
										     button:false
										     });
										//alert("Enter Alphabets, Digits and Special Characters Only in Re Password..!!");
										return false;
									}
								}
								else
								{
									swal({
									     title: "Alert!",
									     text: "Please Enter Alphabets, Digits and Special Characters Only in Password !",
									     icon: 'error',
									     timer: 2500,
									     button:false
									     });
									//alert("Enter Alphabets, Digits and Special Characters Only in Password..!!");
									return false;
								}
							}
							else
							{
								swal({
								     title: "Alert!",
								     text: "Please Enter Alphabets Only in User Name !",
								     icon: 'error',
								     timer: 2500,
								     button:false
								     });
								//alert("Enter Alphabets Only in User Name..!!");
								return false;
							}
						}
						else
						{
							swal({
							     title: "Alert!",
							     text: "Please Enter a Valid Email Adress Only in Email Id !",
							     icon: 'error',
							     timer: 2500,
							     button:false
							     });
							//alert("Enter a Valid Email Adress Only in Email Id..!!");
							return false;
						}
					}
					else
					{
						swal({
						     title: "Alert!",
						     text: "Please Enter 6 Digits Number Only in Pincode!",
						     icon: 'error',
						     timer: 2500,
						     button:false
						     });
						//alert("Enter 6 Digits Number Only in Pincode..!!");
						return false;
					}
				}
				else
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter Alphabets Only in City !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Enter Alphabets Only in City..!!");
					return false;
				}
			}
			else
			{
				swal({
				     title: "Alert!",
				     text: "Please Enter 10 Digits Number Only in Contact Number !",
				     icon: 'error',
				     timer: 2500,
				     button:false
				     });
				//alert("Enter 10 Digits Number Only in Contact Number..!!");
				return false;
			}
		}
		else
		{
			swal({
			     title: "Alert!",
			     text: "Please Enter Alphabets Only in Last Name !",
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
		     text: "Please Enter Alphabets Only in First Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Enter Alphabets Only in First Name..!!");
		return false;
	}
}

//updateUserDetails
function updateUserDetails()
{
	document.editUserDetailsForm.updateBtn.disabled = true;
	
	var params = {};
	
	var input1 = document.getElementById('pk_user_id'),
	list = document.getElementById('userNameList'),
	i,pkUserId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkUserId = list.options[i].getAttribute('data-value');
		}
	}
	
	var fullName = $('#pk_user_id').val();
	var firstName = $('#firstName').val();
	var lastName = $('#lastName').val();
	var contactNo = $('#contactNo').val();
	var address  = $('#address').val();
	var city = $('#city').val();
	var pincode = $('#pincode').val();
	var emailId = $('#emailId').val();
	var userName  = $('#userName').val();
	var password = $('#password').val();
	var rePassword = $('#rePassword').val();
	var panNumber = $('#panNumber').val();
	
	params["fullName"] = fullName;
	params["pkUserId"] = pkUserId;	
	params["firstName"] = firstName;
	params["lastName"] = lastName;	
	params["contactNo"] = contactNo;
	params["address"] = address;
	params["city"] = city;
	params["pincode"] = pincode;
	params["emailId"] = emailId;
	params["userName"] = userName;
	params["password"] = password;
	params["rePassword"] = rePassword;
	params["panNumber"] = panNumber;
	
	params["methodName"] = "updateUserDetails";
 	
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 		swal({
		     title: "Success!",
		     text: "Edit User Details Updated Successful !",
		     icon: 'success',
		     timer: 2500,
		     });
 				//alert(data);
 				if(document.editUserDetailsForm)
 				{
 					location.reload();
 				}	
 				document.editUserDetailsForm.updateBtn.disabled =false;
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
