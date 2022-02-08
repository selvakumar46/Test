<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to KFC</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<style>
nav {
	padding: 10px;
}

.downnav {
	overflow: auto;
	background-color: rgb(0, 0, 0);
	text-align: center;
	margin-top: 100px;
	/* size: 300px; */
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
	margin-top: 20px;
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

input {
	width: 200px;
}
</style>
</head>
<body>
	<c:set value="${currentUser}" var="user"></c:set>
	<!--logoImage -->
	<img src="image/KFC Logo2.png " alt="KFC_Logo" width="150px" width="150px" height="100px">
	<!-- navbar-->
	<div class="moveTop">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid justify-content-between">
				<!-- Left elements -->
				<a class="nav-link d-sm-flex align-items-lg-center"> <img
					src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
					class="rounded-circle" height="25" width="#" alt="image for b/w" /> <strong
					class="d-none d-sm-block ms-7"><c:out
							value="${user.userName}" /> </strong>
				</a>
				<div class="d-flex">
					<a class="" href="showProducts">
						<button type="submit" class="btn btn-light  button">Menu</button>
					</a> <a href="MyOrders?userid1=${user.userId}"><button
							type="submit" class="btn btn-light button">My Orders</button></a>

					<!-- Search form -->
					<form action="searchProduct" class="input-group w-auto">
						<input autocomplete="off" type="search" name="search"
							class="form-control " placeholder="search by meal" />
						<button type="submit" class="btn btn-dark btn-sm">search</button>
					</form>
				</div>
				<!-- Left elements -->

				<!-- Center elements -->
				<a href="ShowCart"><button type="submit"
						class="btn btn-light button">My Cart</button></a>

				<!-- Center elements -->

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
				<strong>Hi <c:out value="${user.userName}"></c:out></strong>
			</h4>
			<h3>
				<strong>Welcome to KFC</strong>
			</h3>
		</div>
	</center>
	<div>
		<div></div>
		<h3>
			<strong>Categories:</strong>
		</h3>
	</div>
	<div>
		<form action="BucketMeals" method="post">
			<div>
				<strong>Bucket meals:</strong>
				<button type="submit" class="btn btn-success btn-sm">Submit</button>
			</div>
		</form>
		<br>
		<form action="TrendingMeal" method="post">
			<div>
				<strong>Trending meals:</strong>
				<button type="submit" class="btn btn-success btn-sm">Submit</button>
			</div>
		</form>
	</div>
	<br>
	<br>
	<div></div>
	<div class="downnav">
		<a href="">Get helpS</a> <a href="">About Us</a> <a href="">Contact
			Us</a>
	</div>

</body>
</html>
