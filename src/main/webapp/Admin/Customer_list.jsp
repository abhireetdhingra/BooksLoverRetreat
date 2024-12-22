<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>BookStore Administration:Customer</title>
</head>
<body>
<%@ include file="header.jsp"%>
	<br />
	<br />
	
	<div align=center>
		<h2>You are in Customer management page</h2>

		<h3>
			<a href="new_customer" class="text-dark">Create New
				Customer?</a>
		</h3>
		<hr width="72%">
	</div>
	
	<!-- Message -->
	<c:if test="${message!=null}">
		<!-- if message is not equal to null only then it should show on page -->
		<div align=center>
			<h4 class="text-muted">
				<i>${message}</i>
			</h4>
		</div>
	</c:if>
	<!-- Message ends here -->
	
	<div class="container">
		<table class="table table-striped table-hover table-dark ">
			<thead>
				<tr class="text-center">
					<th scope="col">Index</th>
					<th scope="col">Id</th>
					<th scope="col">Email</th>
					<th scope="col">Full Name</th>
					<th scope="col">City</th>
					<th scope="col">Country</th>
					<th scope="col">Registered Date</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customerList}"
					varStatus="status">
					<tr>
						<td class="text-center">${status.index+1}</td>
						<td class="text-center">${customer.getCustomerId()}</td>
						<td class="text-center">${customer.getEmail()}</td>
						<td class="text-center">${customer.getCustomerFullName()}</td>
						<td class="text-center">${customer.getCustomerCity()}</td>
						<td class="text-center">${customer.getCountryName()}</td>
						<td class="text-center">${customer.getRegisteredDate()}</td>
						<td>
							<div class="container text-center">
								<a
									href="Edit_Customer?CustomerId=${customer.getCustomerId()}"
									class="text-light ">Edit</a>&nbsp;&nbsp;&nbsp; 
									<a
									href="javascript:void(0);" class="text-light deleteAnchor"
									id="${customer.getCustomerId()}">Delete</a>
							</div>

						</td>
					</tr>

				</c:forEach>


			</tbody>
		</table>
		<hr>
	</div>
	
	
	
	
	<br />
	<br />
	<!-- footer -->
	<%@include file="footer.jsp"%>

<script>
		$(document)
				.ready(
						function() {

							$(".deleteAnchor")
									.each(
											function() {
												$(this)
														.on(
																"click",
																function() {
																	customerId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm("Are you sure to delete customer with id: "
																			+ customerId
																			+ " ?")) {
																		window.location = "delete_customer?custId="
																				+ customerId;
																	}
																})
											})
						})
	</script>
	<!-- MDB -->
<script type="text/javascript" src="../js/mdbBootstrap/mdb.min.js"></script>
</body>
</html>