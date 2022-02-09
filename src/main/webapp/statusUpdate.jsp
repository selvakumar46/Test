<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Meal Status Update</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<style>
.container {
	margin-top: -30px;
	margin-right: 990px;
}

.button {
	margin-top: 100px;
}

.registerform {
	background-color: whitesmoke;
	height: 380px;
	width: 350px;
	position: absolute;
	left: 250px;
	top: 70px;
	border-radius: 15px;
	box-shadow: 0 0 5px green;
	margin-top: 25px;
}

.registerform1 {
	background-color: whitesmoke;
	height: 380px;
	width: 350px;
	position: absolute;
	left: 700px;
	top: 70px;
	border-radius: 15px;
	box-shadow: 0 0 5px green;
	margin-top: 25px;
}
h3{
	margin-right: 60px;
}
label {
	margin-top: 20px;
}
button {
	margin-right: 100px;
}
</style>

</head>
<body>
	<div class="registerform">
		<form action="statusUpdate" method="post">
			<h3><ul>Change Meal Status</ul></h3>
			<label for="update" id="productName"><strong>Meal Name</strong></label> <input
				name="productName" value="${validMeal.productName}"> <br>
			<br> <label for="status" id="productStatus"><strong>Meal
					Status</strong></label> <select>
				<option>Availble</option>
				<option>Sold-Out</option>
			</select> <br> <br>
			<button type="submit" style="margin-right: 100px;" class="btn btn-outline-success btn-sm">Update</button>
			<button type="reset" style="margin-right: 100px;" class="btn btn-outline-primary btn-sm">Cancel</button>
		</form>
	</div>
	<br>
	<div class="registerform1" style="margin-bottom: 50px;">
		<form action="PriceUpdate">
			<ul><h3>Change Meal Price</h3></ul>
			<label for="update" id="productName1"><strong>Meal Name</strong></label> <input
				name="productName1" value="${validMeal.productName}"> <br>
			<br> <label for="status" id="productPrice"><strong>Meal
					Old Price </strong></label> <input type="text" name="productPrice"
				value="${validMeal.price }" disabled> <br> <br> <label
				for="status" id="productNewPrice"><strong>Meal Price </strong></label> <input
				type="number" id="number" name="productNewPrice" required
				placeholder="Enter new price..."> <br> <br>
			<button type="submit" style="margin-right: 100px;" class="btn btn-outline-success btn-sm">Update</button>
			<button type="reset" style="margin-right: 100px;" class="btn btn-outline-primary btn-sm">Cancel</button>
		</form>

		<a href="adminPage.jsp" style="margin-right: 30px;">
			<button  class="btn btn-outline-dark  button">Home</button>
		</a>
	</div>
</body>
</html>