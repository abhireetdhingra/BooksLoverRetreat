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
		<h2>You are in Reviews management page</h2>
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
					<th scope="col">Book</th>
					<th scope="col">Rating</th>
					<th scope="col">Headline</th>
					<th scope="col">Customer</th>
					<th scope="col">Review On</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${reviewList}" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${review.getReviewId()}</td>
						<td>${review.getBook().getBookTitle()}</td>
						<td>${review.getRating()}</td>
						<td>${review.getHeadline()}</td>
						<td>${review.getCustomer().getCustomerFullName()}</td>
						<td><fmt:formatDate pattern='MM/dd/yyyy' value='${review.getReviewTime()}'/></td>
						<td>
							<div class="container text-center">
								<a href="Edit_Review?ReviewId=${review.getReviewId()}"
									class="text-light ">Edit</a>&nbsp;&nbsp;&nbsp; <a
									href="javascript:void(0);" class="text-light deleteAnchor"
									id="${review.getReviewId()}">Delete</a>
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
																	reviewId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm("Are you sure to delete review with id: "
																			+ reviewId
																			+ " ?")) {
																		window.location = "delete_review?reviewId="
																				+ reviewId;
																	}
																})
											})
						})
	</script>

	
	
	
	
</body>
</html>