<%@page import="com.kfc.model.User"%>
<%@page import="com.kfc.model.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.kfc.model.CartItem"%>
<%@page import="com.kfc.daoimpl.cartItemDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
	<form action="cancelOrder">
	<%
	User user = (User) session.getAttribute("currentUser");
	%>
	<%
	int userId = user.getUserId();
	cartItemDaoImpl cartDao = new cartItemDaoImpl();
	CartItem cart = new CartItem();
	cart.setUserId(userId);
	List<CartItem> showOrders;
	List<CartItem> showOrders1;
	showOrders = cartDao.showInvoice(cart);
	showOrders1 = cartDao.showInvoiceDelevered(cart);
	%>
	
	<img src="image/KFC Logo2.png " width="150px" height="100px"margin-top: "20px" >
	<div class="topnav">
		<a href="mainPage.jsp">Home</a> <a class="" href="showProducts.jsp">Menu</a>
		<a href="showOrders.jsp?userId=<%=user.getUserId()%>">My Orders</a>
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
	<center>
		<%
   if(session.getAttribute("CancelOrder") != null){%>
	  <i> <h1 style="color:red;background-color:white;font-size:20px;float:right;">Your Order Will be Cancelled</h1></i>
	   
   <%session.removeAttribute("CancelOrder"); }
   %>
		<b><h3>Your Orders</h3> </b>
	</center>
	</p>
	<table>
		<tbody>
			<tr>

				<%
				int count = 0;
				for (CartItem orders : showOrders) {
				%>

				<td>
					<table id="OrdersTable">
						<tbody>
							<tr>
								<td><span>Meal name: <%=orders.getProductName()%>
								</span><br> <span> Quantity: <%=orders.getQuantity()%>
								</span><br> <span>meal price: <%=orders.getTotalPrice()%>
								</span><br> <span>Delivery Status:<b><%=orders.getStatus()%></b>
								</span><br> <span>Order Date :<b><%=orders.getOrderDate()%></b></span><br>
								<span><button type="submit" class="btn btn-outline-danger btn-sm">Cancel Order</button></span>
								<%session.setAttribute("cartId", orders.getCartId()); %>
								
								</td>
							</tr>
						</tbody>
					</table>

				</td>
				<%
				count++;

				if (count == 4) {
				%>
			</tr>
			<tr>
				<%
				count = 0;

				}
				}
				%>

			</tr>
		</tbody>
		<tbody>

			<tr>

				<%
				int count1 = 0;
				for (CartItem order : showOrders1) {
				%>

				<td>
					<table id="OrdersTable1">
						<tbody>
							<tr>

								<td><span>Meal name: <%=order.getProductName()%>
								</span><br> <span> Quantity: <%=order.getQuantity()%>
								</span><br> <span>meal price: <%=order.getTotalPrice()%>
								</span><br> <span>Delivery Status:<b><%=order.getStatus()%></b>
								</span><br> <span>Order Date :<b><%=order.getOrderDate()%></b></span><br>


								</td>
							</tr>
						</tbody>
					</table>

				</td>
				<%
				count1++;

				if (count1 == 4) {
				%>
			</tr>
			<tr>
				<%
				count1 = 0;

				}
				}
				%>

			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>