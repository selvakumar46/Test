<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Meals</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style >
body {
		background: linear-gradient(to bottom right, #BDB76B, white);
}
.container{
	margin-top:150px;
	}
label {
        display: inline-block;
        width: 155px;
        text-align: right;
        margin-left:-80px; ;
      }


</style>

</head>
<body>
	<center>
		<form action="insertMeal" method="post">
			<div class="container">
			<h2><i>Add New Meal</i></h2>
			<label for="mealName" id="mealName"><b>Meal Name</b></label>
			<input type="text" name="mealName" id="mealName" required autofocus placeholder="Enter meal name..."> <br> <br>
			<label for="mealDescription" id="mealDescription"><b>Meal Description</b></label>
			<input type="text" name="mealDescription" id="mealDescription" required placeholder="Enter meal description..."> <br> <br>
			<label for="mealPrice" id="mealPrice"  ><b>Meal Price</b></label>
			<input type="number" name="mealPrice" id="mealPrice" min="0" required placeholder="Enter meal price..."> <br> <br>
			<label for="mealType" id="mealType"><b>Meal Type</b></label>
			<input type="text" name="mealType" id="mealType" required placeholder="Enter meal type(Veg/non-veg)"> <br> <br>
			<label for="mealStatus" id="mealStatus"><b>Meal Status</b></label>
			<input type="text" name="mealStatus" id="mealStatus" required placeholder="(Available/Sold-Out)"> <br> <br>
			<label for="mealCatogory" id="mealcatogory"><b>Meal Category</b></label>
			<input type="text" name="mealCatogory" id="mealCatogory" required placeholder="Enter meal catogory..."> <br> <br>
			<button type="submit" class="btn btn-outline-success btn-sm ">Submit</button> 
			<button type="reset" class="btn btn-outline-danger btn-sm mov">Reset</button>
			</div>
		</form> <br>
		<a href="AdminPage.jsp"> <button type="submit" class="btn btn-outline-dark btn-sm">Home</button> </a>
	</center>

</body>
</html>