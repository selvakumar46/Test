<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Cart View</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<style>
.container {
	margin-top: 100px;
}
</style>
</head>
<body>
	<form action="insertCart">
		<div class="container">
			<strong>Enter Quantity: </strong><input type="number" id="quantity" name="Quantity" min="1"
				autofocus>
			<button type="submit" class="btn btn-info btn-sm">Submit</button>
		</div>
	</form>
</body>
</html>