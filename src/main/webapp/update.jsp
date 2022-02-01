<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Update Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background: linear-gradient(to bottom right, #BDB76B, white);
	background-attachment: fixed;
}

.container {
	margin-top: 150px;
}
</style>

</head>
<body>
	<center class="container">
		<div>
			<form action="" method="post">
				<h4>
					<strong>Update Admin Details</strong>
				</h4>
				<button type="submit" class="btn btn-success btn-sm">Submit
				</button>
			</form>
		</div>
		<div>
			<form action="OrderStatus">
				<h4>
					<strong>Update Order Status</strong>
				</h4>
				<button type="submit" class="btn btn-success btn-sm">Submit
				</button>
			</form>
			<br>
		</div>
		<br> <a href="adminPage.jsp"><button type="submit"
				class="btn btn-outline-dark btn-sm">Home</button> </a>
	</center>
</body>
</html>