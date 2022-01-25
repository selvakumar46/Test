<%@page import="com.kfc.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.kfc.daoimpl.ProductDaoImpl"%>
<%@page import="com.kfc.model.Products"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bucket Meals</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
		background: linear-gradient(to bottom right, #BDB76B, white);
}
.container{
	margin-top:270px;
}
label {
        display: inline-block;
        width: 155px;
        text-align: right;
        margin-left:-50px; ;
      }
      button {
	margin-right:-80px; ;
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
	
	<%Products product=new Products();
ProductDaoImpl productDao=new ProductDaoImpl();
List<Products> bucket=productDao.showBucket(); %>
<%User  user=(User)session.getAttribute("currentUser"); %>
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
	</div>
	<h3><center><b><i>Bucket Meals</i></b></center></h3>
	<table>
		<tbody>
			<tr>

<%
 int count = 0;

 for (Products meals : bucket ) {
 %>

					<td>
						<table id="BucketMeal">
							<tbody>
								<tr>

									<td><span>Meal name: <b> <%=meals.getProductName()%></b>
									</span><br> <span> meal Description: <%=meals.getDescription()%>
									</span><br> <span>meal price:<b> <%=meals.getPrice()%></b>
									</span><br> <span>Meal Type:<%=meals.getProductType()%>
									</span><br> <span>Meal Status:<%=meals.getProductStatus()%></span><br>

										<span>
										 
										<a href="product.jsp?pname=<%=meals.getProductName() %>" >	<button type="submit" class="btn btn-outline-dark btn-sm" >Add Cart</button></a>
									</span></td>
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