<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>New Meals</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<style>
.container {
	margin-top: 25px;
	margin-left: 55px;
}

label {
	display: inline-block;
	width: 155px;
	text-align: right;
	margin-left: -80px;;
}

.registerform {
	background-color: whitesmoke;
	height: 520px;
	width: 400px;
	position: absolute;
	left: 480px;
	top: 50px;
	border-radius: 15px;
	box-shadow: 0 0 5px green;
	margin-top: 25px;
}
</style>

</head>
<body>
	<div class="registerform">
		<form action="insertMeal" method="post">
			<div class="container">
				<h2>
					<em>Add New Meal</em>
				</h2>
				<label for="mealName" id="mealName"><strong>Meal
						Name</strong></label> <input type="text" name="mealName" id="mealName" required
					autofocus placeholder="Enter meal name..."> <br> <br>
				<label for="mealDescription" id="mealDescription"><strong>Meal
						Description</strong></label> <input type="text" name="mealDescription"
					id="mealDescription" required
					placeholder="Enter meal description..."> <br> <br>
				<label for="mealPrice" id="mealPrice"><strong>Meal
						Price</strong></label> <input type="number" name="mealPrice" id="mealPrice" min="0"
					required placeholder="Enter meal price..."> <br> <br>
				<label for="mealType" id="mealType"><strong>Meal
						Type</strong></label> <select name="mealType" id="meal">
					<option>Veg</option>
					<option>non-veg</option>
				</select> <br> <br> <label for="mealStatus" id="mealStatus"><strong>Meal
						Status</strong></label> <select name="mealStatus" id="mealStatus">
					<option>Available</option>
					<option>Sold-Out</option>
				</select> <br> <br> <label for="mealCatogory" id="mealcatogory"><strong>Meal
						Category</strong></label> <select>
					<option>Bucket Meals</option>
					<option>Trending</option>
					<option>Snacks</option>
					<option>Burger</option>
				</select> <br> <br> <label for="chooseFile" id="chooseFile"><strong>Meal
						Image </strong></label> <input type="file" id="chooseFile"> <br> <br>
				<button type="submit" style="margin-left: 60px;"
					class="btn btn-outline-success btn-sm ">Submit</button>
				<button type="reset" class="btn btn-outline-danger btn-sm mov">Reset</button>
			</div>
		</form>

		<br> <a href="adminPage.jsp">
			<button type="submit" style="margin-left: 160px;"
				class="btn btn-outline-dark btn-sm">Home</button>
		</a>

	</div>
</body>
</html>