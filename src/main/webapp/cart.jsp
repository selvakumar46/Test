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
<!--logoImage -->
	<img src="image/KFC Logo2.png " width="150px" height="100px"margin-top: "20px" >
	<!-- navbar-->
	<div class="moveTop">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid justify-content-between">
				<!-- Left elements -->
				<a class="nav-link d-sm-flex align-items-lg-center"> <img
					src="https://mdbcdn.b-cdn.net/img/new/avatars/1.webp"
					class="rounded-circle" height="25" alt="image for b/w" /> <strong
					class="d-none d-sm-block ms-7"><%=user.getUserName()%></strong>
				</a>
				<div class="d-flex">
					<a href="mainPage.jsp">
						<button type="submit" class="btn btn-light button">Home</button>
					</a> <a class="" href="showProducts.jsp">
						<button type="submit" class="btn btn-light  button">Menu</button>
					</a> <a href="showOrders.jsp?userId=<%=user.getUserId()%>"><button
							type="submit" class="btn btn-light button">My Orders</button></a>

					<!-- Search form -->
					<form action="searchProduct" class="input-group w-auto">
						<input autocomplete="off" type="search" name="search"
							class="form-control " placeholder="search by meal" />
						<button type="submit" class="btn btn-dark btn-sm">search</button>
					</form>
				</div>
				<!-- Left elements -->

				<!-- Center elements -->
				<a href="cart.jsp?userId=<%=user.getUserId()%>"><button
						type="submit" class="btn btn-light button">My Cart</button></a>

				<!-- Center elements -->

				<!-- Right elements -->
				<a href="login.jsp"><button type="submit"
						class="btn btn-light button">Logout</button></a>
				<!-- Right elements -->
			</div>
		</nav>
	</div>
	<!-- Navbar --> <br>
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