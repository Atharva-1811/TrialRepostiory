
function userRegister()
{
	var password =$('#password').val();
	var confirmpassword =$('#confirmpassword').val();
	
	if(document.uid.name.value=="")
	{
		alert('please enter Name');
		return false;
	}
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(document.uid.name.value.match(letterNumber))
	{
		if(document.uid.userName.value=="")
		{
			alert('please enter userName');
			return false;
		}
		var letterNumber=/^[a-zA-Z, ]+$/;
		if(document.uid.userName.value.match(letterNumber))
		{
			if(document.uid.password.value=="")
			{
				alert('please enter password');
				return false;
			}
			var letterNumber=/^[a-zA-Z, ]+$/;//To check a password between 6 to 20 characters which contain at least one numeric digit, one uppercase and one lowercase letter
			if(password.match(letterNumber))
			{
				if(confirmpassword=="")
				{
					alert('enter Confirm Password');
					return false;
				}
				var letterNumber=password;
				if(confirmpassword.match(letterNumber))
				{
					usersRegister();
				}
				else
					{
						alert('password not match');
						return false;
					}
			}
			else
				{
					alert('please enter password ');
					return false;
				}
			}
		else
			{
				alert('enter Alphabets Only in userName..!!');
				return false;
			}
		}
	else
		{
			alert('enter Alphabets Only in Name..!!');
			return false;
		}
	
}


function usersRegister()
{
	//document.uid.btn.disabled = true;
	
	var name = $('#name').val();
	var userName = $('#userName').val();
	var password =$('#password').val();
	var confirmpassword =$('#confirmpassword').val();
	
	var params={};
	
	params["name"] = name;
	params["userName"] = userName;
	params["password"] = password;
	params["confirmpassword"] = confirmpassword;
	
	params["methodName"] = "userRegister";
 	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				if(document.uid)
 				{
 					document.uid.reset();
 				}	
 				//document.uid.btn.disabled =false;
 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
}