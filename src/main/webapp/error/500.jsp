<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="../Frontend/all_js_css.jsp"%>
<title>Internal Server Error</title>
</head>
<body>
	<%@ include file="../Frontend/header.jsp"%>
	<div align=center>
		<img class="mt-4"
			src="${pageContext.request.contextPath}/images/404error.png"
			style="height: 200px;" />
		<h1 style="color: #ff4081">500 Internal Server error</h1>
		<p style="color: #f48fb1; font-size: larger;">Unfortunately the
			page you are looking for may have been removed, had its name changed,
			or is temporarily unavailable.</p>
	</div>
	<br />
	<br />
	<br />
	<hr>
	<%@ include file="../Frontend/footer.jsp"%>
</body>
</html>