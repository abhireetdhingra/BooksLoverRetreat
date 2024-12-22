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
		<h2>You are in Sub Category management page</h2>

		<h3>
			<a href="SubCategory_form.jsp" class="text-dark">Create New
				 Sub Category?</a>
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
					<th scope="col"> Sub Category </th>
					<th scope="col">Category Name</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="subCategory" items="${subCategoriesList}"
					varStatus="status">
					<tr class="text-center">
						<td>${status.index+1}</td>
						<td>${subCategory.getSubCategoryId()}</td>
						<td>${subCategory.getSubCategoryName()}</td>
						<td>${subCategory.getCategory().getCategoryName()}</td>
						<td>
							<div class="container text-center">
								<a
									href="Edit_SubCategory?SubCategoryId=${subCategory.getSubCategoryId()}"
									class="text-light ">Edit</a>&nbsp;&nbsp;&nbsp; 
									<a
									href="javascript:void(0);" class="text-light deleteAnchor"
									id="${subCategory.getSubCategoryId()}">Delete</a>
							</div>

						</td>
					</tr>

				</c:forEach>


			</tbody>
		</table>
	</div>


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
																	subCategoryId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm("Are you sure to delete sub category with id: "
																			+ subCategoryId
																			+ " ?")) {
																		window.location = "delete_subCategory?subCatId="
																				+ subCategoryId;
																	}
																})
											})
						})
	</script>
	
</body>
</html>