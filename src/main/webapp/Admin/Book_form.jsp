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
		<c:if test="${Book!=null}">
			<h3>Edit Book</h3>
		</c:if>
		<c:if test="${Book==null}">
			<h3>Create New Book</h3>
		</c:if>

		<hr width="72%">
	</div>


<!-- In case enctype="multipart/form-data" ,form values are not fectched,hence need to made changes in action page -->

	<%-- <form action="update_book" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="title" class="form-control" name="title"
						value="${Book.getBookTitle()}" /> <label class="form-label"
						for="title">Title</label>
				</div>
			</div>
		</div>
		<button type="submit">Save Changes</button>
	</form>
	<script type="text/javascript" src="../js/dist/jquery.validate.min.js"></script>
	<!-- MDB -->
	<script type="text/javascript" src="../js/mdbBootstrap/mdb.min.js"></script>

	<!-- jquery ui script tags for date picker in book form -->
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script> --%>
	
	 <c:if test="${message!=null}">
		<!-- if message is not equal to null only then it should show on page -->
		<div align=center>
			<h4 class="text-muted">
				<i>${message}</i>
			</h4>
		</div>
	</c:if>
	 <form class="w-25 mx-auto" id="bookForm"
		<c:if test="${Book!=null}">
			action="update_book"
		</c:if>
		<c:if test="${Book==null}">
			action="create_book"
		</c:if>
		 method="post" enctype="multipart/form-data"> 
		 
		 <c:if test="${Book!=null}">
			<div class="row">
				<div class="col">
					<div class="form-outline">
						<input type="text" id="bookId" class="form-control" name="bookId" readonly
							value="${Book.getBookId()}" /> <label class="form-label"
							for="title">Id</label>
					</div>
				</div>
			</div>
			<div class="row">
					<div class="form-text">You can't change book id</div>
				</div>
			<hr />
		</c:if>
		
		<div class="row">
			<div class="col">
				<label for="categoryList" class="form-label">Category</label>
			</div>
			<div class="col">
				<select class="form-select form-control" id="categoryList"
					name="categoryList" >
					<c:if test="${Book==null}">
						<option disabled selected>Choose Option...</option>
					</c:if>
					<c:if test="${Book!=null}">
						<option value="${Book.getCategory().getCategoryId()}" selected>${Book.getCategory().getCategoryName()}</option>
					</c:if>

					<c:forEach var="category" items="${listCategory}">
						<option value="${category.getCategoryId()}">${category.getCategoryName()}</option>
					</c:forEach>
				</select>

			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="title" class="form-control" name="title"
						value="${Book.getBookTitle()}" /> <label class="form-label"
						for="title">Title</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="author" class="form-control" name="author"
						value="${Book.getBookAuthor()}" /> <label class="form-label"
						for="author">Author</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="isbn" class="form-control" name="isbn"
						value="${Book.getBookIsbn()}" /> <label class="form-label"
						for="isbn">ISBN</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="text" id="publishedDate" class="form-control"
						value="<fmt:formatDate pattern='MM/dd/yyyy' value='${Book.getPublishdate()}'/>" name="publishedDate" /> <label
						class="form-label" for="publishedDate">Published Date</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<label for="imageFile" class="form-label">Book Image</label> <img
					id="thumbnail" alt="Image Preview" style="width: 80%;"
					src="data:img/jpg;base64,${Book.getBase64Image()}" />
			</div>
			<div class="col">
				<input class="form-control" type="file" id="imageFile" name="image">
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<input type="number" id="price" class="form-control" name="price"
						value="${Book.getBookPrice()}" /> <label class="form-label"
						for="price">Price</label>
				</div>
			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col">
				<div class="form-outline">
					<textarea class="form-control" id="description" rows="4"
						name="description">${Book.getBookDescription()}</textarea>
					<label class="form-label" for="description">Description</label>
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
	<%@include file="footer.jsp"%>
	<script type="text/javascript" src="../js/dist/jquery.validate.min.js"></script>
	<!-- MDB -->
	<script type="text/javascript" src="../js/mdbBootstrap/mdb.min.js"></script>

	<!-- jquery ui script tags for date picker in book form -->
	<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#publishedDate').datepicker();
			
			$('#description').richText();
			
			$('#thumbnail').hide();
			
			<c:if test="${Book!=null}">
			$('#thumbnail').show();
			</c:if>
			
			$('#imageFile').change(function() {
				showImageThumbnail(this);
				$('#thumbnail').show();
			})
			
			$('#bookForm').validate({
				rules : {
					categoryList : {
						required : true
					},
					publishedDate : {
						required : true
					},
					title : {
						required : true
					},
					author : {
						required : true
					},
					isbn : {
						required : true
					},
					<c:if test="${Book==null}">
					image : {
						required : true
					},
					</c:if>
					price : {
						required : true
					},
					description : {
						required : true
					}
				}
			});

		});
		function showImageThumbnail(fileInput) {
			var file = fileInput.files[0];
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#thumbnail').attr('src', e.target.result);
			};
			reader.readAsDataURL(file);
		}
	</script>
	<script type="text/javascript" src="../js/MdbJsFiles/mdb.min.js"></script>
	<!-- Rich text Editor with jquery script tag -->
	<script type="text/javascript" src="../js/RichTextEditor/jquery.richtext.min.js"></script>
</body>
</html>
