<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>Administration Page</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<br />
	<br />
	<div align=center>
		<h2>Admin Login</h2>
		<hr width="72%">
	</div>

	
	<c:if test="${message!=null}">
		<!-- if message is not equal to null only then it should show on page -->
		<div align=center>
			<h4 class="text-muted">
				<i>${message}</i>
			</h4>
		</div>
	</c:if>
	
	<!-- Login form starts here -->
	<form class="w-25 mx-auto mt-5" id="loginForm" action="login" method="post">
		<!-- Email input -->
		<div class="form-outline mb-4">
			<input type="email" id="form2Example1" class="form-control" name="email"/> <label
				class="form-label" for="form2Example1">Email address</label>
		</div>

		<!-- Password input -->
		<div class="form-outline mb-4">
			<input type="password" id="form2Example2" class="form-control" name="password"/> <label
				class="form-label" for="form2Example2">Password</label>
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
				<b><a href="#!" class="link-dark">Forgot password?</a></b>
			</div>
		</div>

		<!-- Submit button -->
		<button type="submit" class="btn btn-dark btn-block mb-4">Sign
			in</button>

		<!-- Register buttons -->
		<div class="text-center">
			<p>or sign up with:</p>
			<a  href="https://www.facebook.com/"type="button" class="btn btn-link btn-floating mx-1">
				<i class="fab fa-facebook-f" style="color: black"></i>
			</a>

			<a href="https://www.gmail.com/" type="button" class="btn btn-link btn-floating mx-1">
				<i class="fab fa-google" style="color: black"></i>
			</a>

			<a href="https://twitter.com/i/flow/login" type="button" class="btn btn-link btn-floating mx-1">
				<i class="fab fa-twitter" style="color: black"></i>
			</a>

			<a  href="https://github.com/" type="button" class="btn btn-link btn-floating mx-1">
				<i class="fab fa-github" style="color: black"></i>
			</a>
		</div>
	</form>

	<!-- footer -->
	<div align=center>
		<hr width="72%">
		<%@include file="footer.jsp"%>
	</div>
	
<script type="text/javascript" src="../js/dist/jquery.validate.min.js"></script>
 <!-- MDB -->
<script type="text/javascript" src="../js/MdbJsFiles/mdb.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#loginForm').validate({
				rules:{
					email:{
						required:true,
						email:true
						
					},
					
					password:{
						required:true
					}
				},
				messages:{
					email:{
						required:"Email is required",
						email:"Please enter a valid email"
					},
					
					password:{
						required:"Please enter your password"
					}
				}
			})
				
			
		});
	</script>
	
</body>