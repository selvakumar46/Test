<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Search Meal</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/userNav.css">
<link rel="stylesheet" href="assets/css/background.css">
<style>
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

.container {
	padding: 2px 0px;
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
</style>
</head>
<body>
	<c:set value="${currentUser}" var="user"></c:set>
	<!--logoImage -->
	<img src="image/KFC Logo2.png " alt="KFC_Logo" width="150px"
		width="150px" height="100px">
	<!-- navbar-->
	<div class="moveTop">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid justify-content-between">
				<!-- Left elements -->
				<a class="nav-link d-sm-flex align-items-lg-center"> <img
					src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
					class="rounded-circle" height="25" width="#" alt="image for b/w" />
					<strong class="d-none d-sm-block ms-7"><c:out
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
	<br>
	<h3>Meals list</h3>

	<table>
		<tbody>
			<tr>
				<td>
					<table id="productTable">
						<tbody>
							<tr>
								<th><c:set var="count" value="1" /> <c:forEach
										items="${searchProduct}" var="search">
										<td>
											<div class="card">
												<img src="${search.productImg}" alt="searchImage"
													style="width: 100%"><br> ${search.productName}
												<br> ${search.description} <br> ${search.price} <br>
												${search.productType} <br> ${search.productStatus} <br>
												<a href="addCart?productName=${productList.productName }">
													<button type="submit" class="btn btn-outline-dark btn-sm">Add
														Cart</button>
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
					</table>
</body>
</html>
