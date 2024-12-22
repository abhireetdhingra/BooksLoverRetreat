<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>BookStore Administration:Book Management</title>
</head>
<body>

	<%@ include file="header.jsp"%>
	<div align=center class="mt-1">
		<h3>Edit Customer Review</h3>
		<hr width="72%">
	</div>
	<!-- ************************************* -->

	<!-- Message space to show on form if any! -->
	<c:if test="${message!=null}">
		<!-- if message is not equal to null only then it should show on page -->
		<div align=center>
			<h4 class="text-muted">
				<i>${message}</i>
			</h4>
		</div>
	</c:if>
	<!-- ************************************* -->

	<!-- Form starts here -->
	<form class="w-25 mx-auto" id="ReviewForm" action="update_review"
		method="post">

		<table>
			<tr>
				<td >Book:</td>
				<td ><b>${Review.getBook().getBookTitle()}</b></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td >Rating:</td>
				<td ><b>${Review.getRating()}</b></td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td >Customer:</td>
				<td ><b>${Review.getCustomer().getCustomerFullName()}</b></td>
			</tr>
		</table>
		<hr>
				
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="ReviewId" class="form-control"
						name="reviewId" readonly value="${Review.getReviewId()}" /> <label
						class="form-label" for="ReviewId">Id</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-text">You can't change review id</div>
		</div>
		<hr />
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="headline" class="form-control"
						name="headline" value="${Review.getHeadline()}" /> <label
						class="form-label" for="headline">HeadLine</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<textarea class="form-control" id="comment" rows="4" name="comment">${Review.getComment()}</textarea>
					<label class="form-label" for="comment">Comment</label>
				</div>
			</div>
		</div>

		<hr />
		<div class="row">
			<div class="col">
				<!-- Submit button -->
				<button type="submit" class="btn btn-dark btn-block mb-4">Save
					Changes</button>
			</div>
		</div>
	</form>
	<!-- Review form ends here -->
	<script type="text/javascript" src="../js/dist/jquery.validate.min.js"></script>
	<!-- MDB -->
	<script type="text/javascript" src="../js/MdbJsFiles/mdb.min.js"></script>
	
	<script>
	$(document).ready(function(){
		$('#ReviewForm').validate({
			rules : {
				headline : {
					required : true
				},
				comment: {
					required:true
				}
			}
		});
	})
	</script>
</body>
</html>