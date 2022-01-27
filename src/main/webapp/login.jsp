<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login KFC</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	background: linear-gradient(to bottom right, #BDB76B, white);
	background-attachment: fixed;
	background-size: 100%;
	
}

.container {
	margin-top: 140px;
	background-attachment: fixed;
	
}
label {
	display: inline-block;
	width: 160px;
	font-color: yellow;
	text-align: right;
	margin-left: 340px;;
}
.exception {
	color: red;
	backround-color: white;
	font-size: 15px;
	float: center;
	margin-right: -150px;
}
.head{
	margin-left: 500px;
	margin-top: 100px;	
}
button{
	margin-left: 550px;
}

</style>
</head>
<body>
	<div class="container">
		

			<form action="login" method="post">


				<h2 class="head"><i>Login KFC</i></h2>
				<label> <b>Mail ID:</b></label><input type="email" name="mailId"
					autofocus required placeholder="ex:kfc@gmail.com"> <br>
				<br><label><b>Mobile Number:</b></label><input type="number" name="mobileNumber"
					required placeholder="Enter mobile Number"> <br> <br>
				<button type="submit" class="button btn btn-success btn-sm">Login</button><br>
				
			</form><br>
			<a href="Register.jsp"><button type="submit" class="btn btn-success btn-sm">SignUp</button></a> <br> <br>
			<br>
			
			<%
			if (session.getAttribute("invalidUser") != null) {
			%>
			
				<h1 class="exception"><b>
					<i>Invalid MailId or Password</i></b>
				</h1>
			

			<%
			session.removeAttribute("invalidUser");
			}
			%>

	</div>
</body>
</html>