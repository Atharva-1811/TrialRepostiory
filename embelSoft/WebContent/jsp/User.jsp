<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>User Details Page</title>



<script src="/embelSoft/staticContent/js/jquery-1.12.3.min.js"></script>

<script src="/embelSoft/staticContent/js/userDetailas.js"></script>
<!-- Bootstrap Core CSS -->



<link href="/embelSoft/staticContent/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/embelSoft/staticContent/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/embelSoft/staticContent/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/embelSoft/staticContent/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- jQuery -->
<script src="/embelSoft/staticContent/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/embelSoft/staticContent/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/embelSoft/staticContent/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/embelSoft/staticContent/js/sb-admin-2.js"></script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">User Detailas</h3>
					</div>
					<div class="panel-body">
						<form name="uid">
							<div>
							
								<div class="form-group">
									<label><span class="glyphicon glyphicon-user"></span>Name:</label>
									<input class="form-control" placeholder="Name" name="name"
										id="name" type="text" autofocus>
								</div>
							
							
								<div class="form-group">
									<label><span class="glyphicon glyphicon-user"></span>Username:</label>
									<input class="form-control" placeholder="Username" name="userName"
										id="userName" type="text" autofocus>
								</div>
								<div class="form-group">
									<label><span class="glyphicon glyphicon-eye-open"></span>Password:</label>
									<input class="form-control" placeholder="Password" name="password"
										id="password" type="password" value="">
								</div>

								<div class="form-group">
									<label><span class="glyphicon glyphicon-eye-open"></span>Confirm Password:</label>
									<input class="form-control" placeholder="Confirm Password" name="confirmpassword"
										id="confirmpassword" type="password" value="">
								</div>
								
								<!-- Change this to a button or input when using this as a form -->
							
								<div class="wrapper">
									<button type="button" onclick="userRegister()"
										class="btn btn-md btn-lg btn-success">
										<span class="glyphicon glyphicon-ok-circle"></span>Submit
									</button>
									<button type="reset" class="btn btn-md btn-lg btn-danger">
										<span class="glyphicon glyphicon-remove-circle"></span> Reset
									</button>
								</div>
								
							</div>
						</form>
					</div>
				</div>
				<center>
				
				Already Register: <a href="login.jsp">Login</a>
				</center>
			</div>
		</div>
	</div>
</body>
</html>