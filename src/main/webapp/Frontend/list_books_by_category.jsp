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
	<div align=center style="background-color:white;" class="d-flex justify-content-center align-items-center">
		<a href="${pageContext.request.contextPath}" class="color fw-bold">Home</a>&nbsp;&nbsp; >>
		<a href="${requestScope['javax.servlet.forward.request_uri']}?catId=${category.getCategoryId()}" 
		class="color fw-bold">${category.getCategoryName()}</a>&nbsp;&nbsp;
		<small>${countBooksByCategory} results found</small>
	</div>
	<div class="container mt-3" style="min-height: 100vh;">
		<div class="row row-cols-1 row-cols-sm-3 row-cols-md-6  g-4">

			<c:forEach items="${booksList}" var="book">
				<%@ include file="book_group.jsp" %>
				<%-- <div class="col">
					<div class="card h-100">
						<div class="bg-image hover-overlay ripple"
							data-mdb-ripple-color="light">
							<div class="ratio ratio-16x9">
								<img src="data:img/jpg;base64,${book.getBase64Image()}"
									class="card-img-top" alt="Book Image"  />
							</div>

							<a href="view_book?bookId=${book.getBookId()}"><div class="mask"
									style="background-color: rgba(251, 251, 251, 0.15);"></div> </a>

						</div>
						<div class="card-body">

							<h5 style="font-size: small; font-weight: bold"
								class="card-title">
								<a href="view_book?bookId=${book.getBookId()}">${book.getBookTitle()}</a>
							</h5>
								
								<!-- Space for book rating stars -->
								<%@include file="book_rating.jsp" %>
								
							<h6 style="font-size: x-small;"
								class="card-subtitle mb-2 text-muted">by
								${book.getBookAuthor()}</h6>
							<h5 class="color">$${book.getBookPrice()}</h5>
							<a class="btn color btn-block" id="buttonInFrontEnd"  href="add_to_cart?bookId=${book.getBookId()}">
							Add to cart</a>
						</div>
					</div>
				</div> --%>
			</c:forEach>

		</div>

	</div>

	<!-- Footer -->
	<%@ include file="footer.jsp"%>
	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
</body>
</html>