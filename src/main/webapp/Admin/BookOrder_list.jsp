<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>BookStore Administration:Orders</title>
</head>
<body>

	<%@ include file="header.jsp"%>
	<br />
	<br />
	<div align=center>
		<h2>Manage your Orders</h2>
		<hr width="72%">
	</div>

	<!-- Space for message -->

	<c:if test="${message!=null}">
		<!-- if message is not equal to null only then it should show on page -->
		<div align=center>
			<h4 class="text-muted">
				<i>${message}</i>
			</h4>
		</div>
	</c:if>

	<!-- Main content goes here -->
	<div class="container">
		<table class="table table-striped table-hover table-dark ">
			<thead>
				<tr class="text-center">
					<th scope="col">Index</th>
					<th scope="col">Order Id</th>
					<th scope="col">Order By</th>
					<th scope="col">Book Copies</th>
					<th scope="col">Total</th>
					<th scope="col">Payment Method</th>
					<th scope="col">Status</th>
					<th scope="col">Order Date</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${orderList}" varStatus="status">
					<tr>
						<td class="text-center">${status.index+1}</td>
						<td class="text-center">${order.getOrderId()}</td>
						<td class="text-center">${order.getFullName()}</td>
						<td class="text-center">${order.getBookCopies()}</td>
						<td class="text-center"><fmt:formatNumber
								value="${order.getTotal()}" type="currency" /></td>
						<td class="text-center">${order.getPaymentMethod()}</td>
						<td class="text-center">${order.getStatus()}</td>
						<td class="text-center"><fmt:formatDate pattern='MM/dd/yyyy'
								value='${order.getOrderDate()}' /></td>
						<td>
							<div class="container text-center">
								<a href="View_Order?OrderId=${order.getOrderId()}"
									class="text-light px-1">View Details</a> 
								<a
									href="javascript:void(0);" class="text-light deleteAnchor px-1"
									id="${order.getOrderId()}">Delete</a>
							</div>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
																	orderId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm("Are you sure to delete order with id: "
																			+ orderId
																			+ " ?")) {
																		window.location = "delete_order?orderId="
																				+ orderId;
																	}
																})
											})
						})
	</script>

</body>
</html>