<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>BookStore Administration:Book Management</title>
</head>
<body>

	<%@ include file="header.jsp"%>
	<div align=center class="mt-1">
		<c:if test="${Customer!=null}">
			<h3>Edit Customer</h3>
		</c:if>
		<c:if test="${Customer==null}">
			<h3>Create New Customer</h3>
		</c:if>

		<hr width="72%">
	</div>
	<!-- *********************************** -->

	<!-- Message space to show on form if any! -->
	<c:if test="${message!=null}">
		<!-- if message is not equal to null only then it should show on page -->
		<div align=center>
			<h4 class="text-muted">
				<i>${message}</i>
			</h4>
		</div>
	</c:if>
	<!-- ************************************* -->

	<!-- Form starts here -->
	<form class="w-25 mx-auto" id="customerForm"
		<c:if test="${Customer!=null}">
			action="update_customer"
		</c:if>
		<c:if test="${Customer==null}">
			action="create_customer"
		</c:if>
		method="post">

		<c:if test="${Customer!=null}">
			<div class="row">
				<div class="col">
					<div class="form-outline">
						<input type="text" id="customerId" class="form-control"
							name="customerId" readonly value="${Customer.getCustomerId()}" />
						<label class="form-label" for="customerId">Id</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-text">You can't change customer id</div>
			</div>
			<hr />
		</c:if>

		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="email" id="email" class="form-control" name="email"
						value="${Customer.getEmail()}" /> <label class="form-label"
						for="email">Email</label>
				</div>
			</div>
		</div>
		<hr />

		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="firstName" class="form-control"
						name="firstName" value="${Customer.getFirstName()}" /> <label
						class="form-label" for="firstName">First Name</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="lastName" class="form-control"
						name="lastName" value="${Customer.getLastName()}" /> <label
						class="form-label" for="lastName">Last Name</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="password" id="password" class="form-control"
						name="password" value="${Customer.getPassword()}" /> <label
						class="form-label" for="password">Password</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="password" id="cnPassword" class="form-control"
						name="cnPassword" value="${Customer.getPassword()}" /> <label
						class="form-label" for="cnPassword"> Confirm Password</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="number" id="phoneNum" class="form-control"
						name="phoneNum" value="${Customer.getCustomerPhone()}" /> <label
						class="form-label" for="phoneNum">Contact</label>
				</div>
			</div>
		</div>
		<hr />

		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="address" class="form-control" name="address"
						value="${Customer.getAddress()}" /> <label class="form-label"
						for="address">Address</label>
				</div>
			</div>
		</div>
		<hr />

		<div class="row">
			<div class="col">
				<select name="country" id="country" class="form-control select">

					<option disabled selected>Select Country</option>

					<c:forEach items="${mapCountries}" var="country">
						<option value="${country.value}"
							<c:if test='${Customer.getCustomerCountry() eq country.value}'>selected='selected'</c:if>>${country.key}
						</option>
					</c:forEach>
				</select>

				<%-- <input type="text" id="country" class="form-control"
						name="country" value="${Customer.getCountryName()}" /> <label
						class="form-label" for="country">Country</label>  --%>
			</div>
		</div>
		<hr />

		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="state" class="form-control" name="state"
						value="${Customer.getCustomerState()}" /> <label
						class="form-label" for="state">State</label>
				</div>
			</div>
		</div>
		<hr />

		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="city" class="form-control" name="city"
						value="${Customer.getCustomerCity()}" /> <label
						class="form-label" for="city">City</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="number" id="zipCode" class="form-control"
						name="zipCode" value="${Customer.getZipCode()}" /> <label
						class="form-label" for="zipCode">Zip Code</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<!-- Submit button -->
				<button type="submit" class="btn btn-dark btn-block mb-4">Save
					Changes</button>
			</div>
		</div>
	</form>
	<!-- Customer form ends here -->

	<br>
	<br>
	<%@include file="footer.jsp"%>



	<script>
		$(document).ready(function() {
			$('#customerForm').validate({
				rules : {
					email : {
						required : true
					},

					firstName : {
						required : true
					},
					password : {
						required : true
					},
					cnPassword : {
						required : true,
						equalTo : "#password"
					},
					phoneNum : {
						required : true
					},
					address : {
						required : true
					},
					country : {
						required : true
					},
					state : {
						required : true
					},
					city : {
						required : true
					},
					zipCode : {
						required : true
					}
				},
				messages : {
					cnPassword : {
						equalTo : "Passwords must match"
					}
				}
			});
		})
	</script>
	<script type="text/javascript" src="../js/dist/jquery.validate.min.js"></script>
	<!-- MDB -->
	<script type="text/javascript" src="../js/MdbJsFiles/mdb.min.js"></script>

</body>
</html>