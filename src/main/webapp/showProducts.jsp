<%@page import="com.kfc.model.User"%>
<%@page import="com.kfc.daoimpl.ProductDaoImpl"%>
<%@page import="com.kfc.model.Products"%>

<%@page import="java.util.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>KFC's Meals</title>
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

.img {
	height: 200px;
	width: 337px;
}
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 100%;
  border: thin;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
	padding: 2px 0px;
}
</style>

</head>
<body>

	<%
	String pName = request.getParameter("pname");
	ProductDaoImpl products = new ProductDaoImpl();
	List<Products> showProduct;

	showProduct = products.showProduct();
	%>
	<%
	User user = (User) session.getAttribute("currentUser");
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
	<br>
	<br>

	<center>
		<b><h3>Meals list</h3></b>
	</center>

	<table>
		<tbody>
			<tr>

				<%
				int count = 0;
				int i = showProduct.size();
				for (Products meals : showProduct) {
				%>

				<td>
					<table id="productTable">
						<tbody>
							<tr>

								<td>
									<div class="card">
										<img  alt="meal" src="<%=meals.getProductImg()%>" style="width:100%"><br>
										<div class="container">
											<span>Meal name: <b> <%=meals.getProductName()%></b>
											</span><br> <span> meal Description: <%=meals.getDescription()%>
											</span><br> <span>meal price:<b> <%=meals.getPrice()%></b>
											</span><br> <span>Meal Type:<%=meals.getProductType()%>
											</span><br> <span>Meal Status:<%=meals.getProductStatus()%></span><br>

											<span> <a
												href="product.jsp?pname=<%=meals.getProductName()%>">
													<button type="submit" class="btn btn-outline-dark btn-sm">Add
														Cart</button>
											</a>
											</span>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

				</td>
				<%
				count++;

				if (count == 3) {
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


</body>
</html>

