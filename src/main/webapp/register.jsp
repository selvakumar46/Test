<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Kfc</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<style>
.container {
	margin-top: 170px;
}

label {
	display: inline-block;
	width: 155px;
}

h2 {
	margin-left: 80px;;
	margin-top: 55px;
}

button {
	margin-right: 80px;
}

.bold {
	margin-right: -80px;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 100%;
	padding: 20px;
	border-radius: 3px;
	border: thin;
}

.registerform {
	background-color: whitesmoke;
	height: 380px;
	width: 350px;
	position: absolute;
	left: 480px;
	top: 70px;
	border-radius: 15px;
	box-shadow: 0 0 5px green;
	margin-top: 25px;
}

input {
	margin-left: 70px;
}
</style>
</head>
<body>
	<div class="registerform">
		<form action="s1" method="post" class="was-validated">
			<h2>
				<em>Register KFC</em>
			</h2>
			<br>
			<div class="mb-1 mt-1">
				<input type="text" name="name" pattern="[A-Za-z]{3,}" id="name"
					title="Enter Name max three characters" placeholder="User Name">
			</div>
			<div class="mb-1 mt-1">
				<input type="text" name="mobileNumber" pattern="[6-9][0-9]{9}" id="mobilenumber"
					title="Enter your 10- digit mobile number"
					placeholder="Mobile Number">
			</div>
			<div class="mb-1 mt-1">
				<input type="email" name="mailId"
					pattern="[a-z0-9]+[@][a-z]+[.][a-z]{2,3}" id="mailId"
					title="Looks like you forgot something"
					placeholder="Mail Id">
			</div>
			<button type="submit" style="margin-left: 125px"
				class="btn btn-primary" value="SignUp">SignUp</button>
			<br></br>
		</form>
		<a href="login.jsp"><button type="submit" class="btn btn-success"
				style="margin-left: 130px" value="SignUp">Login</button></a>
	</div>
</body>
</html>

