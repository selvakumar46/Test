<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>New Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="assets/css/background.css">
<style>
.container {
	margin-top: 100px;
}

h2 {
	margin-top: 30px;
}

.center {
	margin-right: -120px;
}

label {
	display: inline-block;
	width: 165px;
	text-align: right;
	margin-left: -30px;;
}

.registerform {
	background-color: whitesmoke;
	height: 420px;
	width: 370px;
	position: absolute;
	left: 480px;
	top: 50px;
	border-radius: 15px;
	box-shadow: 0 0 5px green;
	margin-top: 25px;
}

.button {
	margin-right: 70px;
}
</style>
</head>
<body>
	<div class="registerform">
		<form action="newAdmin">
			<h2>Add New Admin</h2>
			<br> <label for="adminName" id="adminName"><strong>Admin
					Name</strong></label> <input type="text" name="adminName" required autofocus>
			<br> <br> <label for="adminMailId" id="adminMailId"><strong>Admin
					MailId</strong></label> <input type="text" name="adminMailId"
				pattern="[a-z0-9]+[@][a-z]+[.][a-z]{2,3}"
				title="Enter your mailId In correctly example:kfc@gmail.com"
				required> <br> <br> <label for="adminNumber"
				id="adminNumber"><strong>Mobile Number</strong></label> <input
				type="number" name="adminNumber" pattern="[6-9][0-9]{9}"
				title="Enter your 10- digit mobile number" min="0" required>
			<br> <br>
			<center>
				<button type="submit" class="btn btn-success btn-sm">Submit</button>
				<button type="reset" class="btn btn-danger btn-sm">Reset</button>
			</center>
		</form>
		<br>
		<center>
			<a href="adminPage.jsp">
				<button type="submit" class="btn btn-outline-dark btn-sm">Home</button>
			</a>
		</center>
	</div>
</body>
</html>