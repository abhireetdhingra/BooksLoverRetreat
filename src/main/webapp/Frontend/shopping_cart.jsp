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
</head>
<body class="bgcolor">

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<a class="navbar-brand mt-2 mt-lg-0"
				href="${pageContext.request.contextPath}"> <img
				src="images/BookLogo.jpg" height="200" alt="MDB Logo" loading="lazy" />
			</a>


			<!-- Collapsible wrapper -->
			<div class="collapse justify-content-center navbar-collapse"
				id="navbarSupportedContent">


				<!-- Left links -->
				<form class="d-flex input-group w-50" action="search" method="post">
					<div class="input-group">
						<input type="search" class="form-control rounded inputField "
							name="keyword" placeholder="Search By Title, Author or ISBN"
							aria-label="Search" aria-describedby="search-addon" />
						<button type="submit" class="btn ">
							<i class="fas fa-search color"></i>
						</button>
					</div>

				</form>

			</div>
			<!-- Right elements -->
			<div class="d-flex align-items-center">

				<c:if test="${loggedCustomer!=null}">
					<a href="view_customer_profile" class="mx-2 px-2" id="blackCol"><b>Welcome
							${loggedCustomer.getCustomerFullName()}</b></a>
				</c:if>

			</div>

		</div>
	</nav>
	<!-- Navbar ends********************************************************************************* -->
	<div class="container bg-light mt-5" style="min-height: 100vh;">
		<c:set var="cart" value="${sessionScope['cart']}"></c:set>
		<c:if test="${cart.getTotalItems()==0}">
			<div class="container  mt-100">
				<div class="row">
					<div class="col-md-12">
						<div class="d-flex justify-content-center">
							<img src="images/emptyCart.png" class="img-fluid mb-4 mr-3">
						</div>
						<div align="center">
							<h3><strong>Add Elements to Cart</strong></h3>
							<a href="${pageContext.request.contextPath}" class="btn mt-4" id="buttonInFrontEnd">Continue Shopping</a>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${cart.getTotalItems()>0}">
			<!-- Shopping cart starts here -->
			<section class="h-100 h-custom bg-light">
				<div class="container h-100 py-5">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col">
							<form action="update_cart" method="post">
								<div class="d-flex justify-content-end ">
									<a href="${pageContext.request.contextPath}/" class="px-2"
										style="color: black" id="cartAnchors"> Continue Shopping</a> <a
										href="clear_cart" style="color: red" id="cartAnchors">Clear
										Cart</a>
								</div>
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">Index</th>
												<th scope="col">Book</th>
												<th scope="col">Title/Author</th>
												<th scope="col">Quantity</th>
												<th scope="col">Price</th>
												<th scope="col">SubTotal</th>
												<th scope="col">Remove Item</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cart.getItems()}" var="item"
												varStatus="status">
												<tr>
													<td>${status.index + 1}</td>
													<td>
														<div class="d-flex align-items-center">
															<img
																src="data:image/jpg;base64,${item.key.getBase64Image()}"
																class="img-fluid rounded-3" style="width: 120px;"
																alt="Book">
														</div>
													</td>
													<td>
														<p class="fw-normal mb-1">${item.key.getBookTitle()}</p>
														<p class="text-muted mb-0">${item.key.getBookAuthor()}</p>
													</td>

													<td>
														<div class="d-flex flex-row">
															<button class="btn btn-link px-2"
																onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
																<i class="fas fa-minus color"></i>
															</button>
															<input type="hidden" name="bookId"
																value="${item.key.getBookId()}" /> <input
																id="bookQuantity" min="1" name="quantity"
																value="${item.value}" type="number"
																class="form-control form-control-sm"
																style="width: 50px;" />
															<button class="btn btn-link px-2"
																onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
																<i class="fas fa-plus color"></i>
															</button>

														</div>
													</td>
													<td><b><fmt:formatNumber
																value="${item.key.getBookPrice()}" type="currency" /></b></td>
													<td><fmt:formatNumber
															value="${item.value * item.key.getBookPrice()}"
															type="currency" /></td>
													<td>
														<div align="center">
															<a href="remove_from_cart?bookId=${item.key.getBookId()}"
																class="text-danger"><i
																class="fas fa-trash fa-lg color"></i></a>
														</div>
													</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</form>


							<!-- Code for displaying total books and price -->

							<div class="card shadow-2-strong mb-5 mb-lg-0"
								style="border-radius: 16px;">
								<div class="card-body p-4">

									<div class="row">

										<div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0"></div>
										<div class="col-md-6 col-lg-4 col-xl-6"></div>

										<div class="col-lg-4 col-xl-3">
											<div class="d-flex justify-content-between"
												style="font-weight: 500;">
												<p class="mb-2">Total Quantity:</p>
												<p>${cart.getTotalQuantity()}book(s)</p>
											</div>


											<hr class="my-2">

											<div class="d-flex justify-content-between mb-4"
												style="font-weight: 500;">
												<p class="mb-2">Total (tax exclusive)</p>
												<p class="mb-2">
													<fmt:formatNumber value="${cart.getTotalAmount()}"
														type="currency" />
												</p>
											</div>

											<a type="button" href="checkout"
												class="btn  btn-block btn-lg" id="buttonInFrontEnd">
												<div class="d-flex justify-content-between">
													<span>Checkout </span> <span><fmt:formatNumber
															value="${cart.getTotalAmount()}" type="currency" /></span>
												</div>
											</a>

										</div>
									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
			</section>
			<!-- Shopping cart ends here -->
		</c:if>
	</div>
	<br>
	<br>

	<!-- Footer -->
	<%@ include file="footer.jsp"%>
	<script>
		$(document).ready(function() {

		})
	</script>

	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
</body>
</html>