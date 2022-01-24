<%@page import="com.kfc.model.CartItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order status update</title>
<style>
body {
	background:linear-gradient(to right,brown,white);
}

.container {
	margin-top: 270px;
}
table,th,tr {
  border: 1px solid black;
  border-collapse: collapse;
  padding: 20px;
}
td{
	border: 1px solid black;
  border-collapse: collapse;
  padding: 20px;
}
</style>
</head>
<body>
	<%List<CartItem> status =(List<CartItem>) session.getAttribute("status"); %>
	
	<center>
		<form action="Orderstatus">
		<b>Order Status</b>
		<table id="orderStatus">
			<tr>
					<th>Cart Id</th>
					<th>Product Id</th>
					<th>User Id</th>
					<th>Product Name</th>
					<th>Quantity</th>
					<th>Total price</th>
					<th>Status</th>
					<th>Order Date</th>
					<th>Remark</th>
					</tr>
		</table>
		<% int count=0;
		for (CartItem cart : status){
			%>
			<table id="orderStatus"  border="1" cellspacing="0px">
				
					
				
				<tbody>
				<tr>
					<td><%= cart.getCartId()%></td>
					<td><%= cart.getProductId() %></td>
					<td><%= cart.getUserId() %></td>
					<td><%= cart.getProductName() %></td>
					<td><%= cart.getQuantity() %></td>
					<td><%= cart.getTotalPrice() %></td>
					<td><%= cart.getStatus() %></td>
					<td><%= cart.getOrderDate() %></td>
					<td><a href="Orderstatus?userId1=<%=cart.getUserId()%>,orderDate=<%= cart.getOrderDate()%>"> <button type="submit">Delevered</button></a> </td>
					</tr>
				</tbody>
			</table>
<%session.setAttribute("userId1", cart.getUserId()); %>
<%session.setAttribute("orderDate1", cart.getOrderDate()); %>
		<% }%>
		
		</form>
	</center>

</body>
</html>