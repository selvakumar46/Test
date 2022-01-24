<%@page import="com.kfc.daoimpl.UserDaoImpl"%>
<%@page import="com.kfc.servlet.LoginServlet"%>
<%@page import="com.kfc.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcom to KFC</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background:linear-gradient(to top,brown,white);
}

.logo {
	margin-top: -100px;
}

.background {
	background-image: url();
	height: 657px;
	width: 1366px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
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

.slide {
	margin-top: 20px;
}
</style>
</head>
<body>

<%User user=(User)session.getAttribute("currentUser"); %>
	<!-- <div class="backround"> -->
	<img
		src="image/KFC Logo2.png "
		width="150px" height="100px" margin-top: "20px" >
		
		
	<div class="topnav">
		<a class="" href="showProducts.jsp">Menu</a> 
		<a href="showOrders.jsp?userId=<%=user.getUserId()%>">My Orders</a>
		<div class="search">
		<form action="searchProduct">
			<input type="text" id="myInput" name="search" placeholder="Search your meal" >
			<button type="submit">Search</button>
			</form>	
			<div class="topnav-right">
			
				<a href="cart.jsp?userId=<%=user.getUserId()%>">My Cart</a> <a href="login.jsp">Logout</a>
			</div>
		</div>
	</div>
	<center>
		<div class="slide">
			<img src="image/Bucket.png" width="800px" height="300px"
				alt="Kfc Food Special">
				
			<center>

				<h4><b>Hi <%=user.getUserName() %></b></h4>
				<h3><b>Welcome to KFC</b></h3>
			</center>
		</div>
	</center>
	<div>
	<div>
	
	</div>
		<h3><b>Categories:</b></h3>
		
	</div>
	<div>
		<form action="BucketMeals.jsp" method="post">
			<div>
				
				<b>Bucket meals:</b><button  >Submit</button> </a>
			</div>
			
		</form> <br>
		<form action="TrendMeals.jsp" method="post">
			<div>
				
				<b>Trending meals:</b><button class="btn-change7">Submit</button> </a>
			</div>
			
		</form>
		 
	</div>
	<br>
	<br>
	<div>
		
	</div>
	<div class="downnav">
		<a href="">Get helpS</a> <a href="">About Us</a> <a href="">Contact
			Us</a>
	</div>

<script>
function myFunction() {
    var input, filter, ul, li, a, i, txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("a")[0];
        txtValue = a.textContent || a.innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
</script>

</body>
</html>
