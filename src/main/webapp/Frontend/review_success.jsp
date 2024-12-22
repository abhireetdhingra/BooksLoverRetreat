<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

	<div class="container mt-4">
		<div align=center class="color">
			<h6>
				<b>${book.getBookTitle()}</b>

			</h6>
		</div>

		<div class="card mb-3">
			<div class="row g-0">
				<div class="col-md-4">
					<div class="d-flex justify-content-center mb-4">
						<img src="data:img/jpg;base64,${book.getBase64Image()}"
							alt="book image" class="rounded-circle shadow-1-strong"
							width="150" height="150" />
					</div>
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<div class="row">
							<p class="mb-4 pb-2 mb-md-5 pb-md-0"> Thank you for writing your valuable Review. Very soon your review will be available.
							</p>
						</div>
					</div>
				</div>

			</div>
		</div>




	</div>

	<script type="text/javascript" src="js/MdbJsFiles/mdb.min.js"></script>
	<script type="text/javascript" src="js/dist/jquery.validate.min.js"></script>
</body>
</html>