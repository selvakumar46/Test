<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
LocalDate date = LocalDate.now();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>payment details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<link rel="stylesheet" href="assets/css/userNav.css">
<style>
.container {
	margin-top: 50px;
}

h3 {
	margin-top: 50px;
}

label {
	display: inline-block;
	width: 155px;
	text-align: right;
	margin-left: -70px;;
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
							value="${user.userName}" /></strong>
				</a>
				<div class="d-flex">
					<a href="mainPage.jsp">
						<button type="submit" class="btn btn-light button">Home</button>
					</a> <a class="" href="showProducts">
						<button type="submit" class="btn btn-light  button">Menu</button>
					</a> <a href="MyOrders?userId=${user.userId}"><button type="submit"
							class="btn btn-light button">My Orders</button></a>

					<!-- Search form -->
					<form action="searchProduct" class="input-group w-auto">
						<input autocomplete="off" type="search" name="search" id="search"
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

		<h3>Credit Card details:</h3>
		<div class="container">
			<form action="payment" method="post">
				<label for="cardNumber"><strong>Card Number:</strong></label> <input id="cardNumber"
					type="text" name="cardNumber" pattern="[0-9]{16}"
					title="enter 16 digit card number" required
					placeholder="16 digit card number"><br> <br> <label
					for="cardType"><strong>Card type</strong></label> <input type="text" id="cardNumber"
					name="cardType" required placeholder="(ex:visa)"> <br>
				<br> <label for="cardDate"><strong>Card Expire Date:</strong></label> <input id="cardDate"
					type="date" name="cardDate" id="cardDate" min="<%=date%>" required><br>
				<br> <label for="cvv"><strong>Cvv: </strong></label> <input id="cvvNumber"
					type="password" name="Cvv" pattern="[0-9]{3}"
					title="enter 3 digit cvv number" required
					placeholder="3 digit cvv number"><br> <br>



				<button type="submit" class="btn btn-info btn-sm">Submit</button>
				<button type="reset" class="btn btn-warning btn-sm">Reset</button>

			</form>
		</div>
</body>
</html>