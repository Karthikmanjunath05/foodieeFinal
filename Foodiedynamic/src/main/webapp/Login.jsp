<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="https://kit.fontawesome.com/64e1bb2e91.js" crossorigin="anonymous"></script>
<title>Login</title>

<!-- Font Icon -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- Main css -->
<link rel="stylesheet" href="styles.css">
</head>
<body>
	<input type = "hidden" id="status" value="<%= request.getAttribute("status") %>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/signin-image.jpg" alt="sing up image">
						</figure>
						
					</div>

					<div class="signin-form">
						<h2 class="form-title">Login Here!</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="email" name="username" id="username"
									placeholder="Your e-mail id" required="required"/>
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="password"
									placeholder="Password" required="required" />
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Sign in" />
							</div>
							<div class= "form-group">
							<p class ="signup-image-link">Don't have an account yet?</p>
							<a href="registration.jsp" class="signup-image-link">Create an
							account</a>
							</div>
						</form>
						 <!-- 
						<div class= "loginicons">
						<p>or sign up with:</p>
   							 <button type="button" class="btn btn-link btn-floating mx-1 ">
     							 <i class="fab fa-facebook-f"></i>
  							  </button>

   							 <button type="button" class="btn btn-link btn-floating mx-2">
     							 <i class="fab fa-google"></i>
   							 </button>

   							 <button type="button" class="btn btn-link btn-floating mx-1">
     							 <i class="fab fa-twitter"></i>
   							 </button>

   							 <button type="button" class="btn btn-link btn-floating mx-1">
  								   <i class="fab fa-github"></i>
  							  </button>
 						 
						</div> -->
						
					</div>
				</div>
			</div>
		</section>

	</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	
	<script type = "text/javascript">
	var status = document.getElementById("status").value;
	if(status == "failed"){
		swal("sorry","Wrong Username or Password","error");
	}
	</script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
