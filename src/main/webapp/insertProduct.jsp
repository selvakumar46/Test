<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Meals</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background: linear-gradient(to bottom right, #BDB76B, white);
	background-attachment: fixed;
}

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
			<label for="mealName" id="mealName"><b>Meal Name</b></label> <input
				type="text" name="mealName" id="mealName" required autofocus
				placeholder="Enter meal name..."> <br> <br> <label
				for="mealDescription" id="mealDescription"><b>Meal
					Description</b></label> <input type="text" name="mealDescription"
				id="mealDescription" required
				placeholder="Enter meal description..."> <br> <br>
			<label for="mealPrice" id="mealPrice"><b>Meal Price</b></label> <input
				type="number" name="mealPrice" id="mealPrice" min="0" required
				placeholder="Enter meal price..."> <br> <br> <label
				for="mealType" id="mealType"><b>Meal Type</b></label> <select
				name="mealType" id="meal">
				<option>Veg</option>
				<option>non-veg</option>
			</select> <br> <br> <label for="mealStatus" id="mealStatus"><b>Meal
					Status</b></label> <select name="mealStatus" id="mealStatus">
				<option>Available</option>
				<option>Sold-Out</option>
			</select> <br> <br> <label for="mealCatogory" id="mealcatogory"><b>Meal
					Category</b></label> <select>
				<option>Bucket Meals</option>
				<option>Trending</option>
				<option>Snacks</option>
				<option>Burgers</option>
			</select> <br> <br>
			<label for="chooseFile" id="chooseFile"><strong>Meal Image </strong></label>
			<input type="file" id="chooseFile"> <br> <br>
			<button type="submit" style="margin-left: 60px;" class="btn btn-outline-success btn-sm ">Submit</button>
			<button type="reset" class="btn btn-outline-danger btn-sm mov">Reset</button>
		</div>
	</form>
	
	<br>
	<a href="adminPage.jsp">
		<button type="submit" style="margin-left: 160px;" class="btn btn-outline-dark btn-sm">Home</button>
	</a>

</div>
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
</body>
</html>