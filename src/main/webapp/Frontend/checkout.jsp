<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

		<c:set var="cart" value="${sessionScope['cart']}"></c:set>
		<c:if test="${cart.getTotalItems()==0}">
			There are no items in your cart
		</c:if>
		<c:if test="${cart.getTotalItems()>0}">
			<div class="container bg-light">
				<div class="py-5 text-center">

					<h2>
						<i class="fas fa-shopping-cart"></i>Checkout Your Cart
					</h2>
					<!-- <p class="lead">Below is an example form built entirely with
					Bootstrap 5 form controls. Each required form group has a
					validation state that can be triggered by attempting to submit the
					form without completing it.</p> -->
				</div>

				<div class="row">
					<div class="col-md-4 order-md-2 mb-4">
						<h4 class="d-flex justify-content-between align-items-center mb-3">
							<span class="text-muted">Your cart</span> <span
								class="badge badge-secondary badge-pill ">${cart.getTotalQuantity()}</span>
						</h4>
						<ul class="list-group mb-3">

							<c:forEach items="${cart.getItems()}" var="item"
								varStatus="status">

								<li
									class="list-group-item d-flex justify-content-between lh-condensed">
									<small class="text-muted">${item.value}</small> <img
									src="data:image/jpg;base64,${item.key.getBase64Image()}"
									alt="bookImage" style="width: 45px; height: 45px"
									class="rounded-circle" />
									<div>
										<h6 class="my-0">${item.key.getBookTitle()}</h6>
										<small class="text-muted">${item.key.getBookAuthor()}</small>
									</div> <span class="text-muted"> <fmt:formatNumber
											value="${item.value * item.key.getBookPrice()}"
											type="currency" /></span>
								</li>
							</c:forEach>


							<li class="list-group-item d-flex justify-content-between">
								<span>Sub Total</span> <fmt:formatNumber
									value="${cart.getTotalAmount()}" type="currency" />
							</li>

							<li class="list-group-item d-flex justify-content-between">
								<span>Shipping Fee</span> <fmt:formatNumber
									value="${shippingFee}" type="currency" />
							</li>
							<li class="list-group-item d-flex justify-content-between">
								<span>Tax</span> <fmt:formatNumber value="${tax}"
									type="currency" />
							</li>


							<li class="list-group-item d-flex justify-content-between"><span>Total
									(USD)</span> <strong><fmt:formatNumber value="${total}"
										type="currency" /></strong></li>
						</ul>
					</div>
					<div class="col-md-8 order-md-1">
						<h4 class="mb-3">Billing address</h4>
						<!-- Form starts here -->
						<form id="orderForm" action="place_order" method="post">
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="firstName">First name</label> <input type="text"
										class="form-control" id="firstName" placeholder=""
										name="firstName" value="${loggedCustomer.getFirstName()}">
								</div>
								<div class="col-md-6 mb-3">
									<label for="lastName">Last name</label> <input type="text"
										class="form-control" id="lastName" placeholder=""
										name="lastName" value="${loggedCustomer.getLastName()}">
								</div>
							</div>

							<div class="mb-3">
								<label for="phone">Phone</label> <input type="number"
									class="form-control" id="phone" name="phone"
									value="${loggedCustomer.getCustomerPhone()}">
							</div>

							<div class="mb-3">
								<label for="email">Email</label> <input type="email"
									name="email" class="form-control" id="email"
									placeholder="you@example.com"
									value="${loggedCustomer.getEmail()}">
							</div>

							<div class="mb-3">
								<label for="address">Address</label> <input type="text"
									class="form-control" id="address" placeholder="1234 Main St"
									name="address1" value="${loggedCustomer.getAddress()}">
							</div>

							<div class="mb-3">
								<label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
								<input type="text" class="form-control" id="address2"
									name="address2" placeholder="Apartment or suite">
							</div>

							<div class="row">
								<div class="col-md-3 mb-3">
									<label for="country">Country</label> <select name="country"
										id="country" class="form-control select">
										<option disabled selected>Select Country</option>
										<c:forEach items="${mapCountries}" var="country">
											<option value="${country.value}"
												<c:if test='${loggedCustomer.getCustomerCountry() eq country.value}'>selected='selected'
													</c:if>>${country.key}
											</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-3 mb-3">
									<label for="state">State</label> <input type="text"
										class="form-control" id="state" placeholder="" name="state"
										value="${loggedCustomer.getCustomerState()}">
								</div>
								<div class="col-md-3 mb-3">
									<label for="city">City</label> <input type="text"
										class="form-control" id="city" placeholder="" name="city"
										value="${loggedCustomer.getCustomerCity()}">
								</div>
								<div class="col-md-3 mb-3">
									<label for="zip">Zip</label> <input type="number"
										class="form-control" id="zip" placeholder="" name="zipcode"
										value="${loggedCustomer.getZipCode()}">

								</div>
							</div>
							<hr class="mb-4">

							<h4 class="mb-3">Payment</h4>

							<div class="d-block my-3">
								<select
									name="paymentMethod" id="paymentMode"
									class="form-control select">
									<option disabled selected>Select Mode Of Payment</option>
									<option value="Cash On Delivery">Cash On Delivery</option>
									<option value="paypal">PayPal or Credit card</option>
								</select>
							</div>
							<hr class="mb-4">
							<button class="btn btn-primary btn-lg btn-block mb-4"
								id="buttonInFrontEnd" type="submit">Continue to
								checkout</button>
						</form>
					</div>
				</div>

			</div>
		</c:if>

		<!-- Content goes here -->
		<!-- Form from codehim.com -->

	</div>
	<br>
	<!-- Footer -->
	<%@ include file="footer.jsp"%>

	<script>
		$(document).ready(function() {
			$('#orderForm').validate({
				rules : {
					email : {
						required : true
					},
					firstName : {
						required : true
					},

					lastName : {
						required : true
					},

					phone : {
						required : true
					},
					address1 : {
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
					zipcode : {
						required : true
					},
					paymentMethod : {
						required : true
					}
				}
			});
		})
	</script>
	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
	<script type="text/javascript" src="js/dist/jquery.validate.min.js"></script>
</body>
</html>