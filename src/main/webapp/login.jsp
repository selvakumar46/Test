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
<link rel="stylesheet" href="assets/css/background.css">
<style>
.container {
	margin-top: 140px;
	background-attachment: fixed;
}

.head {
	margin-left: 75px;
	margin-top: 40px;
}

button {
	margin-left: 170px;
}

.registerform {
	background-color: whitesmoke;
	height: 315px;
	width: 300px;
	position: absolute;
	left: 500px;
	top: 100px;
	border-radius: 15px;
	box-shadow: 0 0 5px green;
	margin-top: 35px;
}

.input {
	margin-left: 55px;
}
</style>
</head>
<body>
	<div class="registerform">


		<form action="login" method="post">


			<h2 class="head">
				<em>Login KFC</em>
			</h2>
			<input type="email" name="mailId" autofocus required
				placeholder="Mail Id" class="input" id="mailId"> <br> <br> <input
				type="number" name="mobileNumber" required
				placeholder="Mobile Number" class="input"> <br> <br>
			<button type="submit" style="margin-left: 125px;"
				class="btn btn-success btn-sm">Login</button>
			<br>

		</form>
		<br> <a href="register.jsp"><button type="submit"
				class="btn btn-success btn-sm" style="margin-left: 120px;">SignUp</button></a>
		<br> <br> <br>
	</div>
</body>
</html>