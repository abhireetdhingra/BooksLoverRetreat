<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>Books Lover Retreat:Online BookStore |Buy Books Online</title>

<!-- Css stylesheet for jquery rateYo(for stars) -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

</head>
<body class="bgcolor">
	<!-- Header -->
	<%@ include file="header.jsp"%>
	<br>
	<%@ include file="Navbar2nd.jsp"%>
	<br>
	<div align=center>
		<h3>You are in view Books Details page</h3>
	</div>

	<div class="container">
		<div class="card mb-3">
			<div class="row g-0">
				<div class="col-md-4" align=center>
					<img src="data:img/jpg;base64,${book.getBase64Image()}"
						alt="Trendy Pants and Shoes" class="img-fluid rounded-start"
						width="240" height="300" />
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title"
							style="font-size: xx-large; font-weight: bold;">${book.getBookTitle()}</h5>

						<h6 style="" class="card-subtitle mb-2 text-muted">by
							${book.getBookAuthor()}</h6>

						<!-- Space for book star rating -->
						<%@include file="book_rating.jsp"%>
						<a href="#Reviews">${fn:length(book.reviews)} Reviews</a>
						<!-- ************************************* -->

						<h5 class="color">$${book.getBookPrice()}</h5>
						<br>
						<p style="font-size: x-large; color: green;">Available</p>
						<p>
							Ships within <b>2 to 4 business Days</b>
						</p>
						<div align=center>
							<div class="row">
								<div class="col">
									<a class="btn color btn-lg btn-block" id="buttonInFrontEnd"
										href="add_to_cart?bookId=${book.getBookId()}"><i class="fas fa-cart-arrow-down">Add To Cart</i></a>
								</div>
								<div class="col">
									<a class="btn color bgcolor btn-lg btn-block" href="#"><i
										class="far fa-list-alt"> Add to wishlist</i></a>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>

			<div class="row px-2">
				<h4 class="color">
					<b>Description</b>
				</h4>
				<p>${book.getBookDescription()}</p>
			</div>


			<div>
				<div class="row px-2 my-2">
					<h4 class="color">
						<b>Product Details</b>
					</h4>
				</div>
				<div class="row px-2">
					<div class="col">
						<h6>
							ISBN: <span class="text-muted">${book.getBookIsbn()}</span>
						</h6>
						<h6>
							Binding: <span class="text-muted">Paper Back</span>
						</h6>
					</div>
					<div class="col">
						<h6>
							Published Date: <span class="text-muted">${book.getPublishdate()}</span>
						</h6>
						<h6>
							No Of Pages: <span class="text-muted">320</span>
						</h6>
					</div>

				</div>
			</div>


			<!-- Code to display book reviews made by other customers from mdb bootsrtap-->

			<section style="color: #000; background-color: #f3f2f2;">
				<div class="container py-5">
					<div class="row d-flex justify-content-center">
						<div class="col-md-10 col-xl-8 text-center">
							<h3 class="fw-bold mb-4 color">
								<a id="Reviews">Reviews made by customers</a>
							</h3>
							<!-- <p class="mb-4 pb-2 mb-md-5 pb-md-0"></p>  -->
						</div>
					</div>

					<div class="row text-center">

						<c:forEach items="${book.getReviews()}" var="review">
							<div class="col-md-4 mb-4 mb-md-0">
								<div class="card">
									<div class="card-body py-4 mt-2">

										<h5 class="font-weight-bold">${review.getCustomer().getCustomerFullName() }</h5>
										<h6 class="my-3 color">${review.getHeadline() }</h6>
										<h6 class=" form-text my-3">on ${review.getReviewTime()}</h6>

										<!-- Code to display stars -->
										<ul class="list-unstyled d-flex justify-content-center">
											<c:forTokens items="${review.getStars()}" delims=","
												var="star">
												<c:if test="${star eq 'on' }">
													<i class="fas fa-star starColor"></i>
												</c:if>
												<c:if test="${star eq 'off' }">
													<i class="far fa-star"></i>
												</c:if>
												<c:if test="${star eq 'half' }">
													<i class="fas fa-star-half starColor"></i>
												</c:if>
											</c:forTokens>
										</ul>
										<p class="mb-2">
											<i class="fas fa-quote-left pe-2"></i> ${review.getComment() }
										</p>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</section>

			<!-- *************************************************************************************************************************** -->


			<!-- write Book Review for this book -->
			<div class="container mt-4">
				<div align=center class="color">
					<h6>
						<b>${loggedCustomer.getFirstName()}</b>,
						<c:if test="${existedReview!=null}">Thank you for your valuable Review</c:if>
						<c:if test="${existedReview==null}">write A Review for
						${book.getBookTitle()}</c:if>

					</h6>
				</div>

				<div class="card mb-3">
					<div class="row g-0">
						<div class="col-md-4">
							<div class="d-flex justify-content-center mb-4">
								<img src="data:img/jpg;base64,${book.getBase64Image()}"
									alt="book image" class="rounded-circle shadow-1-strong"
									width="150" height="150" />
							</div>
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<div class="row">
									<c:if test="${existedReview==null}">
										<form id="reviewForm" action="create_review" method="post">
											<div id="rateYo"></div>
											<input type="hidden" id="rating" name="rating" /> <input
												type="hidden" id="bookId" name="bookId"
												value="${book.getBookId()}" /> &nbsp;

											<div class="form-outline mb-4">

												<input type="text" id="reiewHeadline" name="reiewHeadline"
													class="form-control" /> <label class="form-label"
													for="reiewHeadline">HeadLine</label>

											</div>

											<div class="form-outline mb-4">

												<textarea id="reviewComment" name="reviewComment"
													class="form-control"></textarea>
												<label class="form-label" for="reviewComment">Book
													Review</label>
											</div>
											<button type="submit"
												class="btn  btn-block mb-4 color bg-color"
												id="buttonInFrontEnd">Place Review</button>
										</form>
									</c:if>
								</div>
							</div>
						</div>

					</div>
				</div>




			</div>


		</div>
	</div>
	<!-- Footer -->
	<%@ include file="footer.jsp"%>

	<script>
		$(document).ready(function() {
			$("#rateYo").rateYo({
				starWidth : "40px",
				fullStar : true,
				onSet : function(rating, rateYoInstance) {
					$("#rating").val(rating);
				}
			});
		})
	</script>

	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
	<!-- Script src file for jquery rateyo(for  displaying stars) -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
	<script type="text/javascript" src="js/dist/jquery.validate.min.js"></script>
</body>
</html>