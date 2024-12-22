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
		<h2>Order Details</h2>
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
		<div class="row">
			<div class="col">
				<h2 class="text-center">Recipient Information</h2>
				<table class="table">
					<tbody class="text-center">
						<tr>
							<td><b>First Name: </b></td>
							<td>${order.getFirstname()}</td>
						</tr>
						<tr>
							<td><b>Last Name: </b></td>
							<td>${order.getLastname()}</td>
						</tr>
						<tr>
							<td><b>Phone: </b></td>
							<td>${order.getPhone()}</td>
						</tr>
						<tr>
							<td><b>Address Line 1: </b></td>
							<td>${order.getAddressLine1()}</td>
						</tr>
						<tr>
							<td><b>Address Line 2: </b></td>
							<td>${order.getAddressLine2()}</td>
						</tr>
						<tr>
							<td><b>City: </b></td>
							<td>${order.getCity()}</td>
						</tr>
						<tr>
							<td><b>State: </b></td>
							<td>${order.getState()}</td>
						</tr>
						<tr>
							<td><b>Country: </b></td>
							<td>${order.getCountry()}</td>
						</tr>
						<tr>
							<td><b>Zipcode: </b></td>
							<td>${order.getZipcode()}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col">
				<h2 class="text-center">Order Overview</h2>
				<table class="table table-striped table-hover table-dark ">
					<tbody class="text-center">
						<tr>
							<td><b>Ordered By: </b></td>
							<td>${order.getCustomer().getCustomerFullName()}</td>
						</tr>
						<tr>
							<td><b>Order Status: </b></td>
							<td>${order.getStatus()}</td>
						</tr>
						<tr>
							<td><b>Order Date: </b></td>
							<td><fmt:formatDate pattern='MM/dd/yyyy'
									value='${order.getOrderDate()}' /></td>
						</tr>
						<tr>
							<td><b>Payment Method: </b></td>
							<td>${order.getPaymentMethod()}</td>
						</tr>
						<tr>
							<td><b>Book Copies: </b></td>
							<td>${order.getBookCopies()}</td>
						</tr>
						<tr>
							<td><b>Sub Total: </b></td>
							<td>${order.getSubtotal()}</td>
						</tr>
						<tr>
							<td><b>Shipping Fee: </b></td>
							<td>${order.getShippingFee()}</td>
						</tr>
						<tr>
							<td><b>Tax: </b></td>
							<td>${order.getTax()}</td>
						</tr>
						<tr>
							<td><b>Total Amount: </b></td>
							<td><fmt:formatNumber value="${order.getTotal()}"
									type="currency" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<hr>
		<h2 class="text-center">Ordered Books</h2>
		<table class="table table-striped table-hover table-dark">
			<tr>
				<th>Index</th>
				<th>Book</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Subtotal</thd>
			</tr>

			<c:forEach items="${order.orderDetails}" var="orderDetail"
				varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td>
						<div class="d-flex align-items-center">
							<img
								src="data:image/jpg;base64,${orderDetail.getBook().getBase64Image()}"
								style="width: 45px; height: 45px" class="rounded-circle" />
							<div class="ms-3">
								<p class="fw-bold mb-1">${orderDetail.getBook().getBookTitle()}</p>
								<p class="text-muted mb-0">${orderDetail.getBook().getBookAuthor()}</p>
							</div>
						</div>
					</td>

					<td><fmt:formatNumber
							value="${orderDetail.getBook().getBookPrice()}" type="currency" /></td>
					<td>${orderDetail.getQuantity()}</td>
					<td><fmt:formatNumber value="${orderDetail.getSubtotal()}"
							type="currency" /></td>
				</tr>
			</c:forEach>
		</table>

	</div>


	<br />
	<br />
	<!-- footer -->
	<%@include file="footer.jsp"%>
</body>
</html>