<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<h2>Administrative Dashboard</h2>
		<hr width="72%">
	</div>

	<div class="container">
		<div align="center">
			<h2>Quick Actions</h2>
			<b> <a href="new_book">New Book</a> &nbsp; <a
				href="users_form.jsp">New User</a> &nbsp; <a
				href="Category_form.jsp"> New Category</a> &nbsp; <a
				href="new_customer">New Customer</a> &nbsp;
			</b>
			<hr width="72%">
		</div>
		<div align="center">
			<h2>Recent Sales</h2>
			<table class="table table-sm">
				<thead>
					<tr class="text-center">
						<th scope="col">Order ID</th>
						<th scope="col">Ordered By</th>
						<th scope="col">Book Copies</th>
						<th scope="col">Total</th>
						<th scope="col">Payment Method</th>
						<th scope="col">Status</th>
						<th scope="col">Order Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${listMostRecentSales}"
						varStatus="status">
						<tr>
							<td class="text-center "><b><a
									href="View_Order?OrderId=${order.getOrderId()}"
									class="text-dark px-1"> ${order.orderId}</a></b></td>
							<td class="text-center">${order.customer.getCustomerFullName()}</td>
							<td class="text-center">${order.getBookCopies()}</td>
							<td class="text-center"><fmt:formatNumber
									value="${order.total}" type="currency" /></td>
							<td class="text-center">${order.paymentMethod}</td>
							<td class="text-center">${order.status}</td>
							<td class="text-center"><fmt:formatDate pattern='MM/dd/yyyy'
									value='${order.getOrderDate()}' /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<hr width="72%">
		</div>
		<div align="center">
			<h2>Recent Reviews</h2>
			<table class="table  table-sm">
				<thead>
					<tr class="text-center">
						<th scope="col">Book</th>
						<th scope="col">Rating</th>
						<th scope="col">Headline</th>
						<th scope="col">Customer</th>
						<th scope="col">Review On</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="review" items="${listMostRecentReviews}"
						varStatus="status">
						<tr class="text-center">
							<td>${review.book.getBookTitle()}</td>
							<td>${review.rating}</td>
							<td><b><a
									href="Edit_Review?ReviewId=${review.getReviewId()}"
									class="text-dark ">${review.headline}</a></b></td>
							<td>${review.customer.getCustomerFullName()}</td>
							<td><fmt:formatDate pattern='MM/dd/yyyy'
									value='${review.reviewTime}' /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr width="72%">
		</div>

		<div align="center">
			<h2>Statistics</h2>
			<hr width="72%">
			Total Users: ${totalUsers} &nbsp;&nbsp;&nbsp;&nbsp; Total Books:
			${totalBooks} &nbsp;&nbsp;&nbsp;&nbsp; Total Customers:
			${totalCustomers} &nbsp;&nbsp;&nbsp;&nbsp; Total Reviews:
			${totalReviews} &nbsp;&nbsp;&nbsp;&nbsp; Total Orders: ${totalOrders}

			<hr width="60%" />
		</div>

		<!-- footer -->
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>