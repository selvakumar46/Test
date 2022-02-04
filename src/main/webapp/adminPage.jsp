<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin KFC</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background: linear-gradient(to bottom right, #BDB76B, white);
	background-attachment: fixed;
}

.container {
	margin-top: 80px;
}

.center {
	margin-top: 250px;
}

nav {
	padding: 15px;
}

.downnav {
	overflow: auto;
	background-color: rgb(0, 0, 0);
	text-align: center;
	margin-top: 100px;
	height: 50px;
	position: relative;
}

.downnav a {
	float: center;
	text-align: center;
	font-size: 18px;
	padding: 20px 20px;
	color: blanchedalmond;
}

.slide {
	margin-top: 30px;
	left: 20cm;
}

.moveTop {
	width: 1198 px;
	margin-left: 150px;
	margin-top: -90px;
}

.button {
	border-radius: 4px;
	background-color: #0000FF;
	border: none;
	color: #FFFAFA;
	text-align: center;
	font-size: 23px;
	padding: 2px;
	width: 150px;
	transition: all 0.5s;
	cursor: move;
	margin: 5px;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 10;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

.registerform {
	background-color: GhostWhite;
	height: 580px;
	width: 350px;
	position: absolute;
	left: 500px;
	top: 50px;
	border-radius: 0px;
	margin-top: 25px;
}

.button1 {
	border-radius: 4px;
	background-color: #0000FF;
	border: none;
	color: #FFFAFA;
	text-align: center;
	font-size: 23px;
	padding: 2px;
	width: 320px;
	transition: all 0.5s;
	cursor: move;
	margin: 5px;
}

.dropbtn {
	border-radius: 4px;
	background-color: #0000FF;
	border: none;
	color: #FFFAFA;
	text-align: center;
	padding: 2px;
	width: 170px;
	font-size: 23px;
	transition: all 0.5s;
	border: none;
	cursor: help;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: green;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown a:hover {
	background-color: #ddd;
}

.show {
	display: block;
}
</style>
</head>
<body>
	<c:set value="${currentUser1}" var="user" />
	<!--logoImage -->
	<img src="image/KFC Logo2.png " width="150px" height="100px">
	<!-- navbar-->
	<div class="moveTop">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid justify-content-between">
				<!-- Left elements -->
				<a class="nav-link d-sm-flex align-items-lg-center"> <img
					src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
					class="rounded-circle" height="25" alt="image for b/w" /> <strong
					class="d-none d-sm-block ms-7"><c:out
							value="${user.userName}" /> </strong>
					<div class=" dropdown">
						<button onclick="myFunction()" class="btn btn-light dropbtn">
							Menu <i class="fa fa-caret-down"></i>
						</button>

						<div id="myDropdown" class="dropdown-content">
							<a href="insertProduct.jsp"> Insert New Meal</a> <a href="newAdmin.jsp">Add
								New Admin</a> <a href="TodaySalesReport">Sales Report(Today)</a>
						</div>
					</div>
				</a> <a class="" href="ShowProductsAdmin">
					<button type="submit" class="btn btn-light  button">List
						of Meals</button>
				</a> <a href="ShowUsers"><button type="submit"
						class="btn btn-light button">User List</button></a> <a class=""
					href="OrderStatus">
					<button type="submit" class="btn btn-light  button">Orders</button>
				</a>

				<!-- Left elements -->

				<!-- Right elements -->
				<a href="login.jsp"><button type="submit"
						class="btn btn-light button">Logout</button></a>
				<!-- Right elements -->

			</div>
		</nav>
	</div>
	<!-- Navbar -->
	<center>
	<div class="slide">
		<img src="image/Bucket.png" width="800px" height="300px"
			alt="Kfc Food Special">
		<h4>
			<b>Hi <c:out value="${user.userName}"></c:out>(Admin)</b>
		</h4>
		<h3>
			<b>Welcome to KFC</b>
		</h3>
	</div>
	</center>
	<script>
		/* When the user clicks on the button, 
		 toggle between hiding and showing the dropdown content */
		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}

		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
			if (!event.target.matches('.dropbtn')) {
				var dropdowns = document
						.getElementsByClassName("dropdown-content");
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