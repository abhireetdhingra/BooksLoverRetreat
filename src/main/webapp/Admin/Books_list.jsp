<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>BookStore Administration:Books</title>
</head>
<body>

	<%@ include file="header.jsp"%>
	<br />
	<br />
	<div align=center>
		<h2>You are in Books management page</h2>
		<h3>
			<a href="new_book" class="text-dark">Create New Book?</a>
		</h3>
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

	<div class="container">
		<table class="table table-striped table-hover table-dark ">
			<thead>
				<tr class="text-center">
					<th scope="col">Index</th>
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Price</th>
					<th scope="col">Title</th>
					<th scope="col">author</th>
					<th scope="col">Category</th>
					<th scope="col">Last Updated</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="books" items="${listBooks}" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${books.getBookId()}</td>
						<td><img src="data:img/jpg;base64,${books.getBase64Image()}"
							width="84" height="110" /></td>
						<td>$${books.getBookPrice()}</td>
						<td>${books.getBookTitle()}</td>
						<td>${books.getBookAuthor()}</td>
						<td>${books.getCategory().getCategoryName()}</td>
						<td><fmt:formatDate pattern='MM/dd/yyyy' value='${books.getLastUpdateDate()}'/></td>
						<td>
							<div class="container text-center">
								<a href="Edit_Book?BookId=${books.getBookId()}"
									class="text-light ">Edit</a>&nbsp;&nbsp;&nbsp; <a
									href="javascript:void(0);" class="text-light deleteAnchor"
									id="${books.getBookId()}">Delete</a>
							</div>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<br />
	<br />
	<!-- footer -->
	<%@include file="footer.jsp"%>

	<script>
		$(document)
				.ready(
						function() {

							$(".deleteAnchor")
									.each(
											function() {
												$(this)
														.on(
																"click",
																function() {
																	bookId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm("Are you sure to delete book with id: "
																			+ bookId
																			+ " ?")) {
																		window.location = "delete_book?bookId="
																				+ bookId;
																	}
																})
											})
						})
	</script>


</body>
</html>