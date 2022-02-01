<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order status update</title>
<style>
body {
	background: linear-gradient(to bottom right, #BDB76B, white);
	background-attachment: fixed;
}

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
</style>
</head>
<body>
		<b>Order Status</b>
		<table id="orderStatus">
		<caption><h2>List of Orders</h2></caption>
			<tr>
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
					<td><c:out value="${orders.cartId}" /></td>
					<td><c:out value="${orders.productId}" /></td>
					<td><c:out value="${orders.userId}" /></td>
					<td><c:out value="${orders.productName}" /></td>
					<td><c:out value="${orders.quantity}" /></td>
					<td><c:out value="${orders.totalPrice}" /></td>
					<td><c:out value="${orders.status}" /></td>
					<td><c:out value="${orders.orderDate}" /></td>
					<td><a
							href="OrderStatusUpdate?cartId=${orders.cartId}">
							<button type="submit">Delivered</button>
						</a></td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>