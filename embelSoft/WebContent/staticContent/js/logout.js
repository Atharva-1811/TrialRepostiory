/*logout.js*/


//user loging and logout coding

//login
function validatelogin()
{
	var uname = $('#uname').val();
	
	if(uname=="" || uname==null || uname==undefined)
	{
		swal({
			title:"Alert!",
		    text: "Please Enter Username..!",
		    icon: 'error',
		    timer: 2500,
		    button:false
    });
		//alert("Please Select Product Name");
		return false;
	}
	
	var pass = $('#pass').val();
	if(pass=="" || pass==null || pass==undefined)
	{
		swal({
			title:"Alert!",
		    text: "Please Enter Password..!",
		    icon: 'error',
		    timer: 2500,
		    button:false
    });
		//alert("Please Select Product Name");
		return false;
	}
   
	login();
}
function login()
{
	document.userLogin.loginBtn.disabled = true;
	
	var uname = $("#uname").val();
	var pass = $("#pass").val();
	var params = {};

	params["uname"] = uname;
	params["pass"] = pass;
	params["methodName"] = "loginNew";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{   
			//document.userLogin.loginBtn.disabled = false;
		
		if(data=="\r\n\r\n\r\n\r\n\r\n\r\n\r\n") {
			swal({
				title:"Error!",
			    text: "Invalid Credentials..!",
			    icon: 'error',
			    timer: 2500,
			    button:true
				});
			document.userLogin.loginBtn.disabled = false;
			//location.reload();
		}	
		else {
			swal({
			title:"Success!",
		    text: "Login Successfully..!",
		    icon: 'success',
		    timer: 2500,
		    button:true
			});
			window.location.replace("/embelSoft/jsp/Index.jsp");
			}
	}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

//Logout
function Logout(){
	var params = {};
	params["methodName"] = "logout";

	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{ 
		/*swal({
			title:"Success!",
		    text: "Logged Out Successfully..!",
		    icon: 'success',
		    timer: 2500,
		    button:true
    });*/ 
		alert("logged Out Successfully!!!");
		
		window.location.replace("/embelSoft/jsp/login.jsp");
			}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

function InitialConnection(){
	

	
	var uname = "admin";
	var pass = "admin";
	var params = {};

	params["uname"] = uname;
	params["pass"] = pass;
	params["methodName"] = "restartConnection";
	$.post('/embelSoft/jsp/utility/controller.jsp',params,function(data)
			{   
			//document.userLogin.loginBtn.disabled = false;
	}
	);
	
}





