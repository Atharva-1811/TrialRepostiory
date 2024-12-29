<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<title>Login Page</title>

<!-- Bootstrap Core CSS -->
<link href="/embelSoft/staticContent/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/embelSoft/staticContent/css/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/embelSoft/staticContent/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/embelSoft/staticContent/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="/embelSoft/staticContent/js/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/embelSoft/staticContent/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="/embelSoft/staticContent/js/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/embelSoft/staticContent/js/sb-admin-2.js"></script>

<script src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script src="/embelSoft/staticContent/js/logout.js"></script>
<script type="text/javascript" src="/embelSoft/staticContent/js/enterTab.js"></script>


<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  

<!-- <script src="sweetalert2.min.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <link rel="stylesheet" href="sweetalert2.min.css"> -->	
<!--===============================================================================================-->

<style type="text/css">

.loader {
  border: 16px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
  margin : 20% 20% 20% 45%;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}


.form-control{
    height: 5px;
    /* font-size:8px; */
    } 
    
    
    
      #confirm {
            display: none;
            background-color: #91FF00;
            border: 1px solid #aaa;
            position: fixed;
            width: 250px;
            left: 50%;
            margin-left: -100px;
            padding: 6px 8px 8px;
            box-sizing: border-box;
            text-align: center;
         }
         #confirm button {
            background-color: #48E5DA;
            display: inline-block;
            border-radius: 5px;
            border: 1px solid #aaa;
            padding: 5px;
            text-align: center;
            width: 80px;
            cursor: pointer;
         }
         #confirm .message {
            text-align: left;
         }
</style>

<script>
         function functionAlert(msg, myYes) {
            var confirmBox = $("#confirm");
            confirmBox.find(".message").text(msg);
            confirmBox.find(".yes").unbind().click(function() {
               confirmBox.hide();
            });
            confirmBox.find(".yes").click(myYes);
            confirmBox.show();
         }
         
         function showAddComponentCategoryBox() {
        		console.log("Its Me");
        		  $("#addComponentCategoryBox").modal("show");
        		}
</script>
      
	
<%@page import="java.lang.String" %>

<%
String FailRongLogin = (String) session.getAttribute("FailRongLogin");
System.out.println("JSP Login :-"+FailRongLogin);
%>

</head>
<!-- onload="InitialConnection()" -->
<body onload="InitialConnection()">

	<div class="container-login100">
			<div class="wrap-login100">
			<!-- <div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default"> -->
					<!-- <div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div> -->
					<div class="login100-form-title" style="background-image: url(/embelSoft/staticContent/img/bg-01.jpg);">
					<span class="login100-form-title-1">
						Sign In
					</span>
				</div>
					<!-- <div class="panel-body"> -->
						<form action="Login" method="post" name="userLogin" class="login100-form validate-form">
								<!-- <div class="col-md-6 col-md-offset-3 form-group">
									<label><span class="glyphicon glyphicon-user"></span>Username :</label>
									<input class="form-control" placeholder="Username" name="uname"
										id="uname" type="text" autofocus style="height: 30px">
								</div>
								<div class="col-md-6 col-md-offset-3 form-group">
									<label><span class="glyphicon glyphicon-eye-open"></span>Password :</label>
									<input class="form-control" placeholder="Password" name="pass"
										id="pass" type="password" value="" style="height: 30px">
								</div> -->
                          <div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">Username</span>
						<input class="input100" type="text" name="uname" id="uname" placeholder="Enter username">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" id="pass" name="pass" placeholder="Enter password">
						<span class="focus-input100"></span>
						
					</div>

				<div id="addComponentCategoryBox" class="modal fade" role="dialog">
					<div class="loader"></div>
				</div>

				<!-- Change this to a button or input when using this as a form -->
							
								<div class="container-login100-form-btn">
								<br>
							<br>
							
									<button type="button" onclick="validatelogin(); " id="loginBtn" name="loginBtn"
										class="login100-form-btn">
										<span class="glyphicon glyphicon-ok-circle"></span> Login
									</button>
									<button type="reset" class="login100-form-btn" id="resetBtn" name="resetBtn">
										<span class="glyphicon glyphicon-remove-circle"></span> Reset
									</button>
								</div>
							<!-- </div> -->
						</form>
					</div>
				 </div> 
				
				<!-- <center>
				New User? <a href="User.jsp">Click Here</a>
				</center> -->				
			<!-- </div> -->
		<!-- </div>
	</div> -->	
</body>
</html>