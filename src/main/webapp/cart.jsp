<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Cart KFC</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<link rel="stylesheet" href="assets/css/userNav.css">
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
	<br>
	<h3>
		<strong><em>Your Cart</em></strong>
	</h3>
	<table>
		<tbody>
			<tr>
				<th><c:set var="count" value="1" /> <c:forEach items="${cart}"
						var="showCart">
						<td>
							<div class="container">
								Product Name : <Strong>${showCart.productName}</Strong><br> Product
								Price : &#8377;<strong>${showCart.price}</strong><br> Quantity : <input
									type="button" value="-"
									onclick="window.location='DecreaseQuantity?orderId=<c:out value="${showCart.orderId}" />'">
								<strong>${showCart.quantity}</strong> <input type="button" value="+"
									onclick="window.location='IncreaseQuantity?orderId=<c:out value="${showCart.orderId}" />'">
								<br> Total Price : &#8377;<strong>${showCart.totalPrice}</strong><br> <a
									href="delCart?productName=${showCart.productName}">
									<button type="submit" class="btn btn-danger btn-sm">Remove</button>
								</a><br> <br>

							</div>
						<td><c:choose>
								<c:when test="">
									<c:otherwise>
										<c:set var="count" value="${count+1}" />
									</c:otherwise>
								</c:when>
							</c:choose>
					</c:forEach>
			</tr>
			</th>
		</tbody>
	</table>
	<a href="payment.jsp">
		<button type="submit" class="btn btn-primary btn-sm"
			value="${totalPrice}">
			<c:out value="${totalPrice}" />
		</button>
	</a>
	<a href="DeleteAllCart">
		<button type="submit" class="btn btn-dark btn-sm">Clear Cart</button>
	</a>
</body>
</html>