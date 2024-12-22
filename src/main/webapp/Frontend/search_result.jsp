<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div align=center>
		<h3>Results for "${keyword}"</h3>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10">

				<c:forEach var="book" items="${searchBooksResult}">
					<div class="card mb-3">
						<div class="row g-0">
							<div class="col-md-4">
								<a href="view_book?bookId=${book.getBookId()}"><img src="data:img/jpg;base64,${book.getBase64Image()}"
									alt="book image" class="img-fluid rounded-start"
									style="height: 224px; width: 222px" />
								</a>
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h5 class="card-title"
												style="font-size: large; font-weight: bold;">${book.getBookTitle()}
											</h5>
											
											<!-- Space for book star rating -->
											<%@include file="book_rating.jsp" %>
											
											<h6 class="card-subtitle mb-2 text-muted"
												style="font-size: small;">by ${book.getBookAuthor()}</h6>
											<h5 class="color">$${book.getBookPrice()}</h5>
											<h6 class="card-subtitle mb-2 text-muted">
												<b>Binding</b>: PaperBack
											</h6>
											<h6 class="card-subtitle mb-2 text-muted">
												<b>ISBN</b>: ${book.getBookIsbn() }
											</h6>
										</div>
										<div class="col">
											<p style="font-size: x-large; color: green;">Available</p>
											<p>
												Ships within <b>2 to 4 business Days</b>
											</p>

											<div class="d-grid gap-2 col-12 mx-auto">
												<a class="btn "id="buttonInFrontEnd"  href="add_to_cart?bookId=${book.getBookId()}">
												Add To Cart</a>
												<button class="btn" type="button">Add to Wishlist</button>
											</div>

										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="footer.jsp"%>
	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
</body>
</html>