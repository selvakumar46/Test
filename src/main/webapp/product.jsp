<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background: linear-gradient(to bottom right, #BDB76B, white);
	background-attachment: fixed;
}

.container {
	margin-top: 100px;
}
</style>
</head>
<body>
	<form action="insertCart">
		<div class="container">
			<b>Enter Quantity: </b><input type="number" name="Quantity" min="1"
				autofocus>
			<button type="submit" class="btn btn-info btn-sm">Submit</button>
		</div>
	</form>
</body>
</html>