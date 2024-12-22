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

		<!-- Check if end user is trying to mess up by changing id on url -->
		<c:if test="${order == null}">
			<div align="center">
				<h2>Sorry, you are not authorized to view this order</h2>
			</div>
		</c:if>

		<c:if test="${order != null}">
		
			<!-- Main Content goes here Taken help from bootdey.com -->	
			<div class="container-fluid">
				<div class="container">
					<!-- Title -->
					<div class="d-flex justify-content-between align-items-center py-3">
						<h2 class="h5 mb-0">
							<a href="#" class="text-muted"></a>
						</h2>
					</div>

					<!-- Main content -->
					<div class="row">
						<div class="col-lg-8">
							<!-- Details -->
							<div class="card mb-4">
								<div class="card-body">
									<div class="mb-3 d-flex justify-content-between">
										<div>
											<span class="me-3"><fmt:formatDate
													pattern='MM/dd/yyyy' value='${order.getOrderDate()}' /></span> <span
												class="me-3">#${order.getOrderId()}</span> <span
												class="me-3">${order.getPaymentMethod()}</span> <span
												class="badge rounded-pill bg-info">${order.getStatus()}</span>
										</div>
										<div class="d-flex">
											<button
												class="btn btn-link p-0 me-3 d-none d-lg-block btn-icon-text">
												<i class="bi bi-download"></i> <span class="text">Invoice</span>
											</button>
											<div class="dropdown">
												<button class="btn btn-link p-0 text-muted" type="button"
													data-bs-toggle="dropdown">
													<i class="bi bi-three-dots-vertical"></i>
												</button>
												<ul class="dropdown-menu dropdown-menu-end">
													<li><a class="dropdown-item" href="#"><i
															class="bi bi-pencil"></i> Edit</a></li>
													<li><a class="dropdown-item" href="#"><i
															class="bi bi-printer"></i> Print</a></li>
												</ul>
											</div>
										</div>
									</div>
									<table class="table table-borderless">
										<tbody>
											<c:forEach items="${order.getOrderDetails()}"
												var="orderDetail">
												<tr>
													<td>
														<div class="d-flex mb-2">
															<div class="flex-shrink-0">
																<img
																	src="data:image/jpg;base64,${orderDetail.getBook().getBase64Image()}"
																	class="img-fluid rounded-3" style="width: 120px;"
																	alt="Book">
															</div>
															<div class="flex-lg-grow-1 ms-3">
																<h6 class="small mb-0">
																	<a
																		href="view_book?bookId=${orderDetail.getBook().getBookId()}"
																		class="text-reset">${orderDetail.getBook().getBookTitle()}</a>
																</h6>
																<span class="small">${orderDetail.getBook().getBookAuthor()}</span>
															</div>
														</div>
													</td>
													<td class="color fw-bold">${orderDetail.getQuantity()}</td>
													<td class="text-end fw-bold"><fmt:formatNumber
															value="${orderDetail.getSubtotal()}" type="currency" /></td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="2">Subtotal</td>
												<td class="text-end"><fmt:formatNumber
														value="${order.getSubtotal()}" type="currency" /></td>
											</tr>
											<tr>
												<td colspan="2">Tax</td>
													<td class="text-end"><fmt:formatNumber
														value="${order.getTax()}" type="currency" /></td>
											</tr>
											<tr>
												<td colspan="2">Shipping</td>
												<td class="text-end"><fmt:formatNumber
														value="${order.getShippingFee()}" type="currency" /></td>
											</tr>
											<tr class="fw-bold">
												<td colspan="2">TOTAL</td>
												<td class="text-end"><fmt:formatNumber
														value="${order.getTotal()}" type="currency" /></td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
							<!-- Payment -->
							<div class="card mb-4">
								<div class="card-body">
									<div class="row">
										<div class="col-lg-6">
											<h3 class="h6 color">Payment Method</h3>
											<p class="fw-bold">
												<i>${order.getPaymentMethod()}</i><br>Total:
												<fmt:formatNumber value="${order.getTotal()}"
													type="currency" />
												<span class="badge bg-danger rounded-pill">NOT PAID</span>
											</p>
										</div>
										<div class="col-lg-6">
											<h3 class="h6 color">Billing address</h3>
											<address>
												<strong>${order.getFullName()}</strong><br>${order.getFullAddress()}<br>
												<abbr title="Phone">P:</abbr> ${order.getPhone()}
											</address>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<!-- Customer Notes -->

							<div class="card mb-4">
								<!-- Shipping information -->
								<div class="card-body">
									<h3 class="h6 color">Shipping Information</h3>
									<strong>FedEx</strong> <span><a href="#"
										class="text-decoration-underline" target="_blank">FF1234567890</a>
										<i class="bi bi-box-arrow-up-right"></i> </span>
									<hr>
									<h3 class="h6">Address</h3>
									<address>
										<strong>${order.getFullName()}</strong><br>${order.getFullAddress()}
										<br> <abbr title="Phone">P:</abbr> ${order.getPhone()}
									</address>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		

	</div>
	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
</body>
</html>