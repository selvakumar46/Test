<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
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
<link rel="stylesheet" href="assets/css/background.css">
<link rel="stylesheet" href="assets/css/adminNav.css">
<script type="text/javascript" src="assets/js/dropdown.js"></script>
<style>
.slide {
	margin-right: 50px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<c:set value="${currentUser1}" var="user" />
	<!--logoImage -->
	<img src="image/KFC Logo2.png " alt="KFC_Logo" width="150px"
		height="100px">
	<!-- navbar start-->
	<div class="moveTop">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid justify-content-between">
				<!-- Left elements -->
				<a class="nav-link d-sm-flex align-items-lg-center"> <img
					src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
					class="rounded-circle" height="25" width="#" alt="image for b/w" />
					<strong class="d-none d-sm-block ms-7"><c:out
							value="${user.userName}" /> </strong>
					<div class=" dropdown">
						<button onclick="myFunction()" class="btn btn-light dropbtn">
							Menu <em class="fa fa-caret-down"></em>
						</button>

						<div id="myDropdown" class="dropdown-content">
							<a href="insertProduct.jsp"> Insert New Meal</a> <a
								href="newAdmin.jsp">Add New Admin</a> <a href="TodaySalesReport">Sales
								Report(Today)</a>
						</div>
					</div>
				</a> <a class="" href="ShowProductsAdmin">
					<button type="submit" class="btn btn-light  button">List
						of Meals</button>
				</a> <a href="ShowUsers"><button type="submit"
						class="btn btn-light button">User List</button></a> <a class=""
					href="OrderStatus">
					<button type="submit" class="btn btn-light  button">Order</button>
				</a>
				<!-- Left elements -->
				<!-- Right elements -->
				<a href="login.jsp"><button type="submit"
						class="btn btn-light button">Logout</button></a>
				<!-- Right elements -->
			</div>
		</nav>
	</div>
	<!-- Navbar end-->

	<div class="slide">
		<img src="image/Bucket.png" width="800px" height="300px"
			alt="Kfc Food Special">
	</div>
	<div>
		<h4>
			<strong>Hi <c:out value="${user.userName}"></c:out>(Admin)
			</strong>
		</h4>
		<h3>
			<strong>Welcome to KFC</strong>
		</h3>
	</div>
</body>
</html>