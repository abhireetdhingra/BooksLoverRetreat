<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>Books Lover Retreat:Online BookStore |Buy Books Online</title>
<%-- <%@ include file="MultiItemCarouselHeadTag.jsp" %> --%>
</head>
<body class="bgcolor">
	<!-- Header -->
	<%@ include file="header.jsp"%>
	<br>
	<%@ include file="Navbar2nd.jsp"%>
	<br>
	<div class="container">
		<!-- Modal For testing -->
		<!-- Button trigger modal -->
		<!-- <button type="button" class="btn btn-primary" data-mdb-toggle="modal"
			data-mdb-target="#exampleModal">Launch demo modal</button> -->

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog  modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header bgcolor">
						<h5 class="modal-title" id="staticBackdropLabel"
							style="color: whitesmoke;">Your Order is wating...Pay Fast</h5>
					</div>
					<div class="modal-body">
						<div class="row">
							
								<!-- Cart -->
								<h4
									class="d-flex justify-content-between align-items-center mb-3">
									<span class="text-muted">Your cart</span> <span
										class="badge badge-secondary badge-pill "></span>
								</h4>
								<ul class="list-group mb-3">
									<c:forEach items="${transaction.itemList.items}" var="item"
										varStatus="var">
										<li
											class="list-group-item d-flex justify-content-between lh-condensed">
											<div>
												<h6 class="my-0">${item.name}</h6>
												<%-- <small class="text-muted">${item.key.getBookAuthor()}</small> --%>
												<small class="text-muted">${item.quantity}</small> 
											</div> <span class="text-muted"> <fmt:formatNumber
													value="${item.price}" type="currency" /></span>
										</li>
									</c:forEach>

									<li class="list-group-item d-flex justify-content-between">
										<span>Sub Total</span> <fmt:formatNumber
											value="${transaction.amount.details.subtotal}"
											type="currency" />
									</li>

									<li class="list-group-item d-flex justify-content-between">
										<span>Shipping Fee</span> <fmt:formatNumber
											value="${transaction.amount.details.shipping}"
											type="currency" />
									</li>
									<li class="list-group-item d-flex justify-content-between">
										<span>Tax</span> <fmt:formatNumber
											value="${transaction.amount.details.tax}" type="currency" />
									</li>


									<li class="list-group-item d-flex justify-content-between"><span>Total
											(USD)</span> <strong><fmt:formatNumber
												value="${transaction.amount.total}" type="currency" /></strong></li>
								</ul>
								<!-- Cart ends here -->
							<div class="row">
								<h4 class="mb-3">Billing address</h4>
								<table class="table table-sm">
									<tr>
										<td><b>Recipient Name:</b></td>
										<td>${recipient.recipientName}</td>
									</tr>
									<tr>
										<td><b>Address Line 1:</b></td>
										<td>${recipient.line1}</td>
									</tr>
									<tr>
										<td><b>Address Line 2:</b></td>
										<td>${recipient.line2}</td>
									</tr>
									<tr>
										<td><b>City:</b></td>
										<td>${recipient.city}</td>
									</tr>
									<tr>
										<td><b>State:</b></td>
										<td>${recipient.state}</td>
									</tr>
									<tr>
										<td><b>Country Code:</b></td>
										<td>${recipient.countryCode}</td>
									</tr>
									<tr>
										<td><b>Postal Code:</b></td>
										<td>${recipient.postalCode}</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="modal-footer">

						<form action="execute_payment" method="post">
							<input type="hidden" name="paymentId" value="${param.paymentId}" />
							<input type="hidden" name="PayerID" value="${param.PayerID}" />
							<input type="submit" value="Pay Now" />
						</form>
						<a href="${pageContext.request.contextPath}" id="buttonInFrontEnd" class="btn" >Continue Shopping</a>			
					</div>
				</div>
			</div>
		</div>
		<!-- Modal ends -->
		<%-- <table class="table">
			<tr>
				<td><b>First Name:</b></td>
				<td>${payer.firstName}</td>
			</tr>
			<tr>
				<td><b>Last Name:</b></td>
				<td>${payer.lastName}</td>
			</tr>
			<tr>
				<td><b>E-mail:</b></td>
				<td>${payer.email}</td>
			</tr>
		</table>
		<h2>Recipient Information:</h2>
		<table class="table">
			<tr>
				<td><b>Recipient Name:</b></td>
				<td>${recipient.recipientName}</td>
			</tr>
			<tr>
				<td><b>Address Line 1:</b></td>
				<td>${recipient.line1}</td>
			</tr>
			<tr>
				<td><b>Address Line 2:</b></td>
				<td>${recipient.line2}</td>
			</tr>
			<tr>
				<td><b>City:</b></td>
				<td>${recipient.city}</td>
			</tr>
			<tr>
				<td><b>State:</b></td>
				<td>${recipient.state}</td>
			</tr>
			<tr>
				<td><b>Country Code:</b></td>
				<td>${recipient.countryCode}</td>
			</tr>
			<tr>
				<td><b>Postal Code:</b></td>
				<td>${recipient.postalCode}</td>
			</tr>
		</table>
		<h2>Transaction Details:</h2>
		<table class="table">
			<tr>
				<td><b>Description:</b></td>
				<td>${transaction.description}</td>
			</tr>
			<tr>
				<td colspan="2"><b>Item List:</b></td>
			</tr>
			<tr>
				<td colspan="2">
					<table border="1">
						<tr>
							<th>No.</th>
							<th>Name</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Subtotal</th>
						</tr>
						<c:forEach items="${transaction.itemList.items}" var="item"
							varStatus="var">
							<tr>
								<td>${var.index +1}</td>
								<td>${item.name}</td>
								<td>${item.quantity}</td>
								<td><fmt:formatNumber value="${item.price}" type="currency" /></td>
								<td><fmt:formatNumber value="${item.price * item.quantity}"
										type="currency" /></td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="right">
								<p>
									Subtotal:
									<fmt:formatNumber
										value="${transaction.amount.details.subtotal}" type="currency" />
								</p>
								<p>
									Tax:
									<fmt:formatNumber value="${transaction.amount.details.tax}"
										type="currency" />
								</p>
								<p>
									Shipping Fee:
									<fmt:formatNumber
										value="${transaction.amount.details.shipping}" type="currency" />
								</p>
								<p>
									TOTAL:
									<fmt:formatNumber value="${transaction.amount.total}"
										type="currency" />
								</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br />
		<form action="execute_payment" method="post">
			<input type="hidden" name="paymentId" value="${param.paymentId}" />
			<input type="hidden" name="PayerID" value="${param.PayerID}" /> <input
				type="submit" value="Pay Now" />
		</form>--%>
	</div>

	<!-- Footer -->
	<%@ include file="footer.jsp"%>
	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
	<!-- Modal JavaScript -->
	<script type="text/javascript">
		$(window).on('load', function() {
			$('#exampleModal').modal('show');
		});
	</script>
</body>
</html>