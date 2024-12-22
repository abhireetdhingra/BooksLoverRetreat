<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>The Books Lover Retreat:Adminsitration Panel</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<br />
	<br />
	<div align=center>
		<h2>Administrative Dashboard</h2>
		<c:if test="${User!=null}">
			<h2>Edit user</h2>
		</c:if>
		<c:if test="${User==null}">
			<h2>Create Your New User</h2>
		</c:if>
		<hr>

	</div>
	<div class="container">
		<form class="mx-5 py-4" 
		<c:if test="${User!=null}">
			action="update_user"
		</c:if>
		<c:if test="${User==null}">
			action="create_user"
		</c:if>
		 method="post" id="userForm">
		 
		 
		  <c:if test="${User!=null}">
			<div class="row mb-4">
				<label for="Id"
					class="col-sm-2 col-form-label col-form-label-lg text-center">User Id
					</label>
				<div class="col-sm-10 col-form-label-lg">
					<input type="text"  name="userId" value="${User.getUserId()}"  class="form-control col-form-label-lg"
						id="Id">
				</div>
			</div>
			</c:if> 
			<div class="row ">
				<label for="Email"
					class="col-sm-2 col-form-label col-form-label-lg text-center">Email
				</label>
				<div class="col-sm-10 col-form-label-lg">
					<input type="email" name="email" value="${User.getEmail()}" class="form-control" id="email" >
				</div>
			</div>
			
			<div class="row mb-4">
				<div class="col-sm-2"></div>
				<div id="emailHelp" class="col-sm-10 form-text">We'll never
					share your email with anyone else.</div>
			</div>
			<div class="row mb-4">
				<label for="FullName"
					class="col-sm-2 col-form-label col-form-label-lg text-center">Full
					Name</label>
				<div class="col-sm-10">
					<input type="text" name="fullname" value="${User.getFullName()}"  class="form-control col-form-label-lg"
						id="fullName">
				</div>
			</div>
			<div class="row mb-3">
				<label for="Password"
					class="col-sm-2 col-form-label col-form-label-lg text-center">Password</label>
				<div class="col-sm-10">
					<input type="password" name="password" value="${User.getPassword()}"   class="form-control col-form-label-lg"
						id="password"
						placeholder="Make sure the password consists of a mix of alphanumeric characters">
				</div>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-dark">
					<c:if test="${User!=null}">
						Update User
					</c:if>
					<c:if test="${User==null}">
						Create User
					</c:if>
				</button>
				<button type="submit" class="btn btn-danger">Cancel</button>
			</div>

		</form>
	</div>
	<hr>
	<!-- footer -->
	<%@include file="footer.jsp"%>
	<script type="text/javascript" src="../js/dist/jquery.validate.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#userForm').validate({
				rules:{
					email:{
						required:true,
						email:true
						
					},
					
					fullname:{
						required:true
						
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
					fullname:{
						required:"Please enter your name "
					},
					password:{
						required:"Please enter your password"
					}
				}
			})
				
			
		});
	</script>
	
	

</body>
</html>