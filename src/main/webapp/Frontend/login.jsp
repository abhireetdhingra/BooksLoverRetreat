<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>Books Lover Retreat:Online BookStore |Buy Books Online</title>
</head>
<body class="bgcolor">
	<!-- Header -->
	<%@ include file="header.jsp"%>
	<br>
	<%@ include file="Navbar2nd.jsp"%>
	<br>
	<div class="container bg-light">

		<!--Form starts here -->

		<form class="mx-auto pt-3 w-25" id="loginCustomerForm" action="login_customer"
			method="post">
			<!-- Email input -->
			<div align=center>
				<h3 >Log in to your account</h3>
				<hr width="72%">
			</div>
			
			<div class="form-outline mb-4">
				<input type="email" id="customerEmail" class="form-control"
					name="email" /> <label class="form-label" for="customerEmail">Email
					address</label>
			</div>

			<!-- Password input -->
			<div class="form-outline mb-4">
				<input type="password" id="customerPassword" class="form-control"
					name="password" /> <label class="form-label"
					for="customerPassword">Password</label>
			</div>

			<!-- 2 column grid layout for inline styling -->
			<div class="row mb-4">
				<div class="col d-flex justify-content-center">
					<!-- Checkbox -->
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value=""
							id="form2Example31" checked /> <label class="form-check-label"
							for="form2Example31"> Remember me </label>
					</div>
				</div>

				<div class="col">
					<!-- Simple link -->
					<b><a href="#!" class="color">Forgot password?</a></b>
				</div>
			</div>
			<div class="row mb-4">
				<div class="col d-flex justify-content-center">
					<span class="color"> New Customer? <b>Register</b> <a
						data-mdb-target="#registerCustomerModal" data-mdb-toggle="modal"
						href="#">here</a></span>
				</div>
			</div>

			<!-- Submit button -->
			<button type="submit" class="btn btn-block mb-4"
				id="buttonInFrontEnd">Sign in</button>

			<!-- Register buttons -->
			<div class="text-center">
				<p>or sign up with:</p>
				<a href="https://www.facebook.com/" type="button"
					class="btn btn-link btn-floating mx-1"> <i
					class="fab fa-facebook-f color"></i>
				</a> <a href="https://www.gmail.com/" type="button"
					class="btn btn-link btn-floating mx-1"> <i
					class="fab fa-google color"></i>
				</a> <a href="https://twitter.com/i/flow/login" type="button"
					class="btn btn-link btn-floating mx-1"> <i
					class="fab fa-twitter color"></i>
				</a> <a href="https://github.com/" type="button"
					class="btn btn-link btn-floating mx-1"> <i
					class="fab fa-github color"></i>
				</a>
			</div>

		</form>

		<!-- Form ends here -->
	</div>

	<br>
	<!-- Footer -->
	<%@ include file="footer.jsp"%>
	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
	<script type="text/javascript" src="js/dist/jquery.validate.min.js"></script>

	<script>
		$(document).ready(function() {
			$('#loginCustomerForm').validate({
				rules : {
					email : {
						required : true,
						email : true

					},
					password : {
						required : true
					}
				},
				messages : {
					email : {
						required : "Email is required",
						email : "Please enter a valid email"
					},

					password : {
						required : "Please enter your password"
					}
				}
			})
		})
	</script>
</body>
</html>