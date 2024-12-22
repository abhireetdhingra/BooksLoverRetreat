<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<div class="container">

		<c:if test="${fn:length(listOrders) == 0}">
			<div align="center">
				<h3>You have not placed any orders.</h3>
			</div>
		</c:if>
		<c:if test="${fn:length(listOrders) > 0}">
			<!-- Content goes here -->
			<table
				class="table align-middle mb-0 bg-white table caption-top table-bordered border-dark">
				<caption class="text-light">Your Orders</caption>
				<thead class="bg-light">
					<tr>
						<th>Index</th>
						<th>Order ID</th>
						<th>Books</th>
						<th>Quantity</th>
						<th>Total Amount</th>
						<th>Order Date</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${listOrders}" varStatus="status">
						<tr>
							<td>${status.index + 1}</td>
							<td class="fw-bold">${order.getOrderId()}</td>
							<td>
								<div class="d-flex align-items-center">
									<c:forEach items="${order.getOrderDetails()}" var="orderDetail"
										varStatus="status">
										<img
											src="data:image/jpg;base64,${orderDetail.getBook().getBase64Image()}"
											alt="" style="width: 45px; height: 45px"
											class="rounded-circle flex-row " />
										<div class="ms-3 flex-row">
											<p class="fw-bold mb-1 ">${orderDetail.getBook().getBookTitle()}</p>
											<p class="text-muted mb-0 ">${orderDetail.getBook().getBookAuthor()}</p>
										</div>
									</c:forEach>
								</div>
							</td>
							<td class="fw-normal">${order.getBookCopies()}</td>
							<td class="fw-bold"><fmt:formatNumber value="${order.total}"
									type="currency" /></td>
							<td><fmt:formatDate pattern='MM/dd/yyyy'
									value='${order.getOrderDate()}' /></td>
							<td><span class="badge badge-success rounded-pill d-inline">${order.getStatus()}</span>
							</td>
							<td><a type="button"
								href="show_order_detail?id=${order.getOrderId()}"
								class="btn btn-link btn-sm btn-rounded"> View Details</a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</c:if>
	</div>

	<br>
	<br>
	<!-- Footer -->
	<%@ include file="footer.jsp"%>
	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
</body>
</html>
