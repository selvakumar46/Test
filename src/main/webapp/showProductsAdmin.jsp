<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>delete Product</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="assets/js/dropdown.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<style>
.container {
	margin-top: 200px;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 100%;
	padding: 20px;
	border-radius: 3px;
	border: thin;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

th, td {
	padding: 10px;
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
					<div class=" dropdown">
						<button onclick="myFunction()" class="btn btn-light dropbtn">
							Menu <em class="fa fa-caret-down"></em>
						</button>

						<div id="myDropdown" class="dropdown-content">
							<a href="insertProduct.jsp"> Insert New Meal</a> <a href="newAdmin.jsp">Add
								New Admin</a><a href="TodaySalesReport">Sales Report(Today)</a>
						</div>
					</div>
				</a> <a class="" href="adminPage.jsp">
					<button type="submit" class="btn btn-light  button">Home</button>
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
	<table>
		<tbody>
			<th>
			<tr>
				<c:set var="count" value="1" />
				<c:forEach items="${showProductAdmin}" var="products">
					<td>
						<div class="card">
							<img src="${products.productImg}" alt="Meals" style="width: 100%"><br>
							${products.productName}<br> ${products.description}<br>
							${products.price}<br> ${products.productType}<br>
							${products.productStatus}<br> <a
								href="ProductStatus?proName=${products.productName}">
								<button type="submit" class="btn btn-primary btn-sm">Update</button>
							</a> <a
								href="DeleteProductConfirm?productName=${products.productName}">
								<button type="submit" style=" margin-right: 90px;"  class="btn btn-secondary btn-sm">Delete</button>
							</a>
						</div>
					<td><c:choose>
							<c:when test="${count==3}">
			</tr>
			<tr>
				<c:set var="count" value="1" />
				</c:when>
				<c:otherwise>
					<c:set var="count" value="${count+1}" />
				</c:otherwise>
				</c:choose>
				</c:forEach>
			</tr>
			</th>
		</tbody>
	</table>
	<center>
		<a href="adminPage.jsp"><button type="submit" class="btn btn-dark">Home</button></a>
	</center>
</body>
</html>