<%@page import="com.kfc.model.User"%>
<%@page import="com.kfc.model.Orders"%>
<%@page import="com.kfc.daoimpl.OrdersDaoImpl"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart KFC</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style >
body {
	background:linear-gradient(to right,brown,white);
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
	String pName=request.getParameter("pname");
	int userId=Integer.parseInt(request.getParameter("userId"));
	OrdersDaoImpl orderDao = new OrdersDaoImpl();
	Orders order = new Orders();
	order.setUserId(userId);
	List<Orders> showOrders;
	showOrders = orderDao.showOrders(order);
	
	%>
	
	<%User user=(User)session.getAttribute("currentUser"); %>
<img
		src="image/KFC Logo2.png "
		width="150px" height="100px" margin-top: "20px" >
	<div class="topnav">
		<a href="mainPage.jsp">Home</a>
		<a class="" href="showProducts.jsp">Menu</a> 
		<a href="showOrders.jsp?userId=<%=user.getUserId()%>">My Orders</a>
		<div class="search">
			<input type="text" onkeyup="myFunction()" placeholder="Search your meal"  title="Type in a name">
			<button type="submit">Search</button>
				
			<div class="topnav-right">
				<a href="cart.jsp?userId=<%=user.getUserId()%>">My Cart</a> <a href="login.jsp">LogOut</a>
			</div>
		</div>
	</div> <br> <br>
			<h3><b><i>Your Cart</i> </b></h3>
	<%
	int count = 0;
	
	for (Orders cart : showOrders) {
	%>

	<td>
		<table id="cartTable">
			<tbody>
				<tr>

					<td>
						<span><b>Product Name:  <%=cart.getProductName() %><b></b></span> <br>
						<span><b>Product Price: <%=cart.getPrice() %></b></span><br>
						<span>Quantity:<%=cart.getQuantity() %></span> <a href="updateCart.jsp?pname=<%=cart.getProductName()%>" >
						<button type="submit" >Update</button></a><br> 
						<span> Total Price: <%=cart.getTotalPrice()%></span><br>
							<span> <a href="delCart.jsp?pname=<%=cart.getProductName()%>">
									<button type="submit" class="btn btn-danger btn-sm">Remove</button>
								</a>
						</span>
						
					 	
					</td>
				</tr>
			</tbody>
		</table>

	</td> <br>
	
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
	</table>
	
	 <%int userId1=(int)session.getAttribute("userId");
		Orders orders=new Orders();
		orders.setUserId(userId1);
		double totalPrice=orderDao.sumOfPrice(order);
		session.setAttribute("totalPrice", totalPrice);
	 %>
	<span> <a href="payment.jsp?userId=<%=order.getUserId()%>">
									<button type="submit" class="btn btn-primary btn-sm" value="<%=totalPrice%>"><%=totalPrice%></button>
								</a>
								<%session.setAttribute("userId",order.getUserId()); %>
						</span>
<span> <a href="deleteCart.jsp?userId=<%=order.getUserId()%>">
									<button type="submit" class="btn btn-dark btn-sm">Clear Cart</button>
								</a>
								<%session.setAttribute("userId",order.getUserId()); %>
						</span>
	

</body>
</html>