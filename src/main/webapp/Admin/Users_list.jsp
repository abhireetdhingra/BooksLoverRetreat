<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,com.bookstore.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>Administration: Users</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<br />
	<br />
	<div align=center>
		<h2>You are in Users management page</h2>

		<h3>
			<a href="users_form.jsp" class="text-dark">Create New User?</a>
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
					<th scope="col">Email</th>
					<th scope="col">FullName</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${listUsers}" varStatus="status">
					<tr>
						<td>${status.index+1}</td>
						<td>${user.getUserId()}</td>
						<td>${user.getEmail()}</td>
						<td>${user.getFullName()}</td>
						<td><a class="text-light"
							href="EditUsersServlet?UserId=${user.getUserId()}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="text-light deleteAnchor" id="${user.getUserId()}"
							href="javascript:void(0);">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<!-- footer -->
	<%@include file="footer.jsp"%>
	<script type="text/javascript" src="../js/dist/jquery.validate.min.js"></script>
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
																	userId = $(
																			this)
																			.attr(
																					"id");
																	if (confirm("Are you sure to delete user with id: "
																			+ userId
																			+ " ?")) {
																		window.location = "delete_user?userId="
																				+ userId;
																	}
																})
											})
						})
	</script>
</body>
</html>