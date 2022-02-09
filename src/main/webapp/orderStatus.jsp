<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Show Orders</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<script type="text/javascript" src="assets/js/dropdown.js"></script>
<style>
.container {
	margin-top: 270px;
}

table, th, tr {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 20px;
}

td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 20px;
}
.css-serial {
  counter-reset: serial-number;  /* Set the serial number counter to 0 */
}

.css-serial td:first-child:before {
  counter-increment: serial-number;  /* Increment the serial number counter */
  content: counter(serial-number);  /* Display the counter */
}
nav {
	padding: 15px;
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
								New Admin</a> <a href="TodaySalesReport">Sales Report(Today)</a>
						</div>
					</div>
					 <a class=""
					href="adminPage.jsp">
					<button type="submit" class="btn btn-light  button">Home</button>
				</a>
				</a> <a class="" href="ShowProductsAdmin">
					<button type="submit" class="btn btn-light  button">List
						of Meals</button>
				</a> <a href="ShowUsers"><button type="submit"
						class="btn btn-light button">User List</button></a>

				<!-- Left elements -->

				<!-- Right elements -->
				<a href="login.jsp"><button type="submit"
						class="btn btn-light button">Logout</button></a>
				<!-- Right elements -->

			</div>
		</nav>
	</div><br/>
	<!-- Navbar -->
	<table class="css-serial">
		<caption>

		</caption>
		<tr>
			<th>S.No</th>
			<th>Cart Id</th>
			<th>Product Id</th>
			<th>User Id</th>
			<th>Product Name</th>
			<th>Quantity</th>
			<th>Total price</th>
			<th>Status</th>
			<th>Order Date</th>
			<th>Update</th>
		</tr>
		<c:forEach items="${status}" var="orders">
			<tr>
				<td></td>
				<td><c:out value="${orders.cartId}" /></td>
				<td><c:out value="${orders.productId}" /></td>
				<td><c:out value="${orders.userId}" /></td>
				<td><c:out value="${orders.productName}" /></td>
				<td><c:out value="${orders.quantity}" /></td>
				<td><c:out value="${orders.totalPrice}" /></td>
				<td><c:out value="${orders.status}" /></td>
				<td>${orders.orderDate.format( DateTimeFormatter.ofPattern("dd-MM-yyyy"))}</td>
				<td><a href="OrderStatusUpdate?cartId=${orders.cartId}">
						<button type="submit">Delivered</button>
				</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>