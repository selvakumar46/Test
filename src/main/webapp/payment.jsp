<%@page import="com.kfc.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payment</title>
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
	</div>
	<center>
		<h3><b><i>Payment Process</i></b></h3>
		<div>
		
			<form action="creditCard.jsp">
				<label for="payments"><b>Choose a payment method:</b></label> <select
					name="Paymrnts" id="payments">
					<option value="Creditcard">Credit Card</option>

					<option value="Paytm">Paytm</option>

				</select> <br> <br> <button type="submit" class="btn btn-outline-success btn-sm">Submit</button>
			</form>
		</div>
	</center>
</body>
</html>