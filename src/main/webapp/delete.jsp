<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Delete Meal</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">

<style>
.container {
	margin-top: 20px;
}

label {
	display: inline-block;
	width: 165px;
	text-align: right;
	margin-left: -35px;;
}

.registerform {
	background-color: whitesmoke;
	height: 400px;
	width: 350px;
	position: absolute;
	left: 480px;
	top: 70px;
	border-radius: 15px;
	box-shadow: 0 0 5px green;
	margin-top: 25px;
}
</style>
</head>
<body>
	<div class="registerform">
		<form action="deleteProduct1" method="post">
			<div class="container">
				<h3>
					<strong>Confirm to delete this Meal</strong>
				</h3>
				<br> <label><strong>Meal Id</strong></label> <input type="text" id="productId"
					value="${delMeal.productId}" name="productId2"> <br> <br>
				<label><strong>Meal Name</strong></label> <input type="text" id="mealName"
					value="${delMeal.productName}" disabled><br> <br>
				<label><strong>Meal Price</strong></label> <input type="text" id="mealPrice"
					value="${delMeal.price}" disabled><br> <br> <label><strong>Meal
						Status</strong></label> <input type="text" value="${delMeal.productStatus}" id="mealStatus"
					disabled><br> <br>
				<button type="submit" style="margin-left: 130px;"
					class="btn btn-success btn-sm">Confirm</button>
			</div>
		</form>
	</div>
</body>
</html>