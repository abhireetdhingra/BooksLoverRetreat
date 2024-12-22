<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="all_js_css.jsp"%>
<title>BookStore Administration:Category Management</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<br />
	<br />
	
	<div align=center>
		<h2>Administrative Dashboard:Sub Category Management</h2>
		<c:if test="${SubCategory!=null}">
			<h3>Edit Sub Category</h3>
		</c:if>
		<c:if test="${SubCategory==null}">
			<h3>Create New Sub Category</h3>
		</c:if>
		
		<hr width="72%">
	</div>
	
	<div class="container">
		<form 
		<c:if test="${SubCategory!=null}">
			action="update_subCategory"
		</c:if>
		<c:if test="${Category==null}">
			action="create_subCategory"
		</c:if>
		 method="post" id="subCategoryForm">
		 
		 	<c:if test="${SubCategory!=null}">
			<div class="row mb-3" style="margin-left:121px;margin-right:121px;margin-top:69px">
				<label for="Id"
					class="col-sm-2 col-form-label col-form-label-lg">Sub Category ID
				</label>
				<div class="col-sm-10">
					<input type="text" readonly  name="catId" value="${SubCategory.getSubCategoryId()}" required class="form-control col-form-label-lg"
						id="Id">
				</div>
				<div class="row">
					<div class="form-text col-sm-10 offset-2">You can't change sub category id</div>
				</div>
				
			</div>
			</c:if> 
		 	
			<div class="row mb-3" style="margin-left:121px;margin-right:121px;margin-top:69px">
				<label for="category" class="col-sm-2 col-form-label col-form-label-lg">
					<c:if test="${SubCategory!=null}">Update New Name</c:if>
					<c:if test="${SubCategory==null}">Add Sub Category</c:if>
				</label>
				<div class="col-sm-10">
					<input type="text" value="${SubCategory.getSubCategoryName()}" name="subCategoryName" class="form-control" id="category">
				</div>
				<label for="categoryName" class="col-sm-2 col-form-label col-form-label-lg">
					<c:if test="${SubCategory!=null}">Update Category Id</c:if>
					<c:if test="${SubCategory==null}">Category Id</c:if>
				</label>
				<div class="col-sm-10">
					<input type="number" value="${SubCategory.getCategory().getCategoryId()}" name="categoryName" class="form-control" id="category">
				</div>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-dark btn-lg">
					<c:if test="${SubCategory!=null}">Update</c:if>
					<c:if test="${SubCategory==null}">Add Sub Category</c:if>
				</button>
			</div>
		</form>
	</div>

	<br />
	<br />
	<!-- footer -->
	<%@include file="footer.jsp"%>
	
	
	
	<script type="text/javascript" src="../js/dist/jquery.validate.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#subCategoryForm').validate({
				rules:{
					subCategoryName:{
						required:true
					},
					categoryName:{
						required:true
					}
				}
			})
		})
	</script>
</body>
</html>