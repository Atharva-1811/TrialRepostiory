/**
 AccessControl.js
 */


//reset
function reset()
{
   document.userDetailsForm.reset();
}

//get User Dtl For Access Control
function getUserDtlForAccessControl()
{
	$("#userName").append($("<input/>").attr("value","").text());
	$("#password").append($("<input/>").attr("value","").text());
//	$("#userType").append($("<input/>").attr("value","").text());
	
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
	params["methodName"] = "getUserDtlForAccessControl";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{			
			document.getElementById("userName").value = v.userName;
			document.getElementById("password").value = v.password;
			//document.getElementById("userType").value = v.userType;
		});
	}).error(function(jqXHR, textStatus, errorThrown)
	{
		if(textStatus==="timeout")
		{
			
		}
	});
}

/*============= Validate Access Control Details Access Control Details Validation ========*/
//validateAccessControlDetails
{


}
function validateAccessControlDetails()
{
	var name = $('#fk_employee_id').val();
	if(name=="" || name==null || name==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });

		//alert("Please Select Name");
		return false;
	}
	var userName = $('#userName').val();
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
	var password = $('#password').val();
	
	var userType = $('#userType').val();
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
	if(userType=="" || userType==null || userType==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select User Type !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Please Enter User Type");
		return false;
	}
	accessControlDetails();
}
/*function validateAccessControlDetails()
{	
	var name = $('#fk_employee_id').val();
	//var name = $('#userNameList').val();
	var userName = $('#userName').val();
	var password = $('#password').val();
	var userType = $('#userType').val();
	
	if(name=="" || name==null || name==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please select First Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });

		//alert("Please Select Name");
		return false;
	}
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(name.match(letterNumber))
	{
		if(userName=="" || userName==null || userName==undefined)
		{
			swal({
			     title: "Alert!",
			     text: "Please select User Name !",
			     icon: 'error',
			     timer: 2500,
			     button:false
			     });
			//alert("Please Enter User Name");
			return false;
		}
		var letterNumber = /^[a-zA-Z,]+$/;
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
				if(userType=="" || userType==null || userType==undefined)
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter User Type !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Please Enter User Type");
					return false;
				}
				var letterNumber = /^[a-zA-Z, ]+$/;
				if(userType.match(letterNumber))
				{
					accessControlDetails();
				}
				else
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter Alphabets Only in User Type !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Enter Alphabets Only in User Type..!!");
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
		     text: "Please Enter Alphabets Only in Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Enter Alphabets Only in Name..!!");
		return false;
	}	
}*/

/*============= Access Control Details Add to Database Access Control Details========*/
function accessControlDetails()
{
	document.userDetailsForm.saveBtn.disabled = true;
	
	/*var input = document.getElementById('fk_employee_id'),
    list = document.getElementById('userNameList'),
    	i,fkRootUserId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootUserId = list.options[i].getAttribute('data-value');
			     }
	 		}*/
	 			
	var name = $('#fk_employee_id').val();
	var userName = $('#userName').val();
	var password = $('#password').val();
	var userType = $('#userType').val();	
	
	var params = {};
	
	params["name"] = name;
	//params["fkRootUserId"] = fkRootUserId;
	params["userName"]= userName;
	params["password"]= password;
	params["userType"]= userType;	
	
	params["methodName"] = "accessControlDetails";
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 		swal({
		     title: "Success!",
		     text: "Access Control Added Successful !",
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

//accessControlList
function accessControlList()
{
	var params= {};

	params["methodName"] = "accessControlList";
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
					.column( 4 )
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
				"scrollY": true,
				columns: [
					      {"data": "srNo" , "width": "5%" ,"defaultContent": ""},
				          {"data": "name" , "width": "5%" ,"defaultContent": ""},
				          {"data": "userName", "width": "5%" ,"defaultContent": ""},
				          {"data": "password" , "width": "5%" ,"defaultContent": ""},
				          {"data": "userType" , "width": "5%" ,"defaultContent": ""},
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

//getAccessControlForEdit
function getAccessControlForEdit()
{
	$("#userName").append($("<input/>").attr("value","").text());
	$("#password").append($("<input/>").attr("value","").text());
	$("#userType").append($("<input/>").attr("value","").text());
	
	
	var params = {};
	
	var input1 = document.getElementById('pk_user_id'),
	list = document.getElementById('userNameList'),
	i,pkACUserId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkACUserId = list.options[i].getAttribute('data-value');
		}
	}
	
	params["pkACUserId"] = pkACUserId;
	params["methodName"] = "getAccessControlDtlForEdit";
	
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
	{
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		$.each(jsonData,function(i,v)
		{
			document.getElementById("userName").value = v.userName;
			document.getElementById("password").value = v.password;
			document.getElementById("userType").value = v.userType;
		});
	}).error(function(jqXHR, textStatus, errorThrown)
	{
		if(textStatus==="timeout")
		{
			
		}
	});
}

//validateUpdateAccessControlDetails
function validateUpdateAccessControlDetails()
{	
	var name = $('#pk_user_id').val();
	//var name = $('#userNameList').val();
	var userName = $('#userName').val();
	var password = $('#password').val();
	var userType = $('#userType').val();
	
	if(name=="" || name==null || name==undefined)
	{
		swal({
		     title: "Alert!",
		     text: "Please Select Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });

		//alert("Please Select Name");
		return false;
	}
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(name.match(letterNumber))
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
		var letterNumber = /^[a-zA-Z,]+$/;
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
				if(userType=="" || userType==null || userType==undefined)
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter User Type !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Please Enter User Type");
					return false;
				}
				var letterNumber = /^[a-zA-Z, ]+$/;
				if(userType.match(letterNumber))
				{
					updateAccessControlDetails();
				}
				else
				{
					swal({
					     title: "Alert!",
					     text: "Please Enter Alphabets Only in User Type !",
					     icon: 'error',
					     timer: 2500,
					     button:false
					     });
					//alert("Enter Alphabets Only in User Type..!!");
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
		     text: "Please Enter Alphabets Only in Name !",
		     icon: 'error',
		     timer: 2500,
		     button:false
		     });
		//alert("Enter Alphabets Only in Name..!!");
		return false;
	}	
}

//updateAccessControlDetails
function updateAccessControlDetails()
{
	document.editAccessControlForm.updateBtn.disabled = true;
	
	var params = {};
	
	var input1 = document.getElementById('pk_user_id'),
	list = document.getElementById('userNameList'),
	i,pkACUserId;

	for (i = 0; i < list.options.length; ++i) {
	if (list.options[i].value === input1.value) {
		pkACUserId = list.options[i].getAttribute('data-value');
		}
	}
	
	$("#userName").append($("<input/>").attr("value","").text());
	$("#password").append($("<input/>").attr("value","").text());
	$("#userType").append($("<input/>").attr("value","").text());
	
	var name = $('#pk_user_id').val();
	var userName = $('#userName').val();
	var password = $('#password').val();
	var userType = $('#userType').val();
	
	params["name"] = name;
	params["pkACUserId"] = pkACUserId;
	params["userName"] = userName;
	params["password"] = password;
	params["userType"] = userType;
	
	params["methodName"] = "updateAccessControlDetails";
 	
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 		swal({
		     title: "Success!",
		     text: "Edit Access Controll Updated Successful !",
		     icon: 'success',
		     timer: 2500,
		    
		     });
 				//alert(data);
 				if(document.editAccessControlForm)
 				{
 					location.reload();
 				}	
 				document.editAccessControlForm.updateBtn.disabled =false;
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
}
