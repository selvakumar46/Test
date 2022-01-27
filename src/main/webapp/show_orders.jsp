<%@page import="com.kfc.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background: linear-gradient(to bottom right, #BDB76B, white);
}

.topnav {
	overflow: auto;
	background-color: rgb(0, 0, 0);
	size: 500px;
	width: 1200px;
	position: relative;
	margin-top: -110px;
	margin-left: 150px;
}

.topnav a {
	float: left;
	color: #ffffff;
	text-align: center;
	padding: 20px 20px;
	font-size: 18px;
}

.topnav-right {
	float: right;
}

.search {
	text-align: center;
	align-self: center;
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
</style>
</head>
<body>
		<%
		User user = (User) session.getAttribute("currentUser");
		%>
		<img src="image/KFC Logo2.png " width="150px" height="100px">
		<div class="topnav">
			<a href="mainPage.jsp">Home</a> <a class="" href="showProducts.jsp">Menu</a>
			<a href="show_orders.jsp?userId=<%=user.getUserId()%>">My Orders</a>
			<div class="search">
				<input type="text" onkeyup="myFunction()"
					placeholder="Search your meal" title="Type in a name">
				<button type="submit">Search</button>

				<div class="topnav-right">
					<a href="cart.jsp?userId=<%=user.getUserId()%>">My Cart</a> <a
						href="login.jsp">LogOut</a>
				</div>
			</div>
		</div>
		<p>
		
			<%
			if (session.getAttribute("CancelOrder") != null) {
			%>
			
				<h1	style="color: red; background-color: white; font-size: 20px; float: right;"><i>Your
					Order Will be Cancelled</i></h1>
			

			<%
			session.removeAttribute("CancelOrder");
			}
			%>
			<h3><b>Your Orders </b></h3>
		<table id="shoeOrders">
			<tbody>
				<tr>
					<th>
				<c:set var="count" value="1" />
						<c:forEach items="${cancelOrder}" var="orderList">
							<td>
								<div class="container">
									${orderList.productName} <br> 
									${orderList.quantity} <br>
									${orderList.totalPrice} <br>
							 		${orderList.orderDate} <br>
							 		
									<a href="CancelOrder?cartId=${orderList.productId }">
										<button type="submit" class="btn btn-outline-danger btn-sm">cancel order</button>
									</a>
								</div>
							</td>
						</c:forEach>
					</th>
				</tr>	
			</tbody>
		</table>
		<table>
			<tbody>
				<tr>
					<th>
						<c:forEach items="${deleveredOrder }" var="orderList1">
							<td>
								<div class="container">
									${orderList1.productName} <br> 
									${orderList1.quantity} <br>
									${orderList1.totalPrice} <br>
							 		${orderList1.orderDate} <br>
								</div>
							</td>
						</c:forEach>
					</th>
				</tr>
			</tbody>
		</table>
</body>
</html>