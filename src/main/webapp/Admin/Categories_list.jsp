<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>BookStore Administration:Categories</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<br />
	<br />
	<div align=center>
		<h2>You are in Category management page</h2>

		<h3>
			<a href="Category_form.jsp" class="text-dark">Create New
				Category?</a>
		</h3>
		<hr width="72%">
	</div>

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
					<th scope="col">Category Name</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="category" items="${categoriesList}"
					varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${category.getCategoryId()}</td>
						<td>${category.getCategoryName()}</td>
						<td>
							<div class="container text-center">
								<a
									href="Edit_Category?CategoryId=${category.getCategoryId()}"
									class="text-light ">Edit</a>&nbsp;&nbsp;&nbsp; 
									<a
									href="javascript:void(0);" class="text-light deleteAnchor"
									id="${category.getCategoryId()}">Delete</a>
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
																	categoryId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm("Are you sure to delete category with id: "
																			+ categoryId
																			+ " ?")) {
																		window.location = "delete_category?catId="
																				+ categoryId;
																	}
																})
											})
						})
	</script>

</body>
</html>