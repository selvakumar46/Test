<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
		background: linear-gradient(to bottom right, #BDB76B, white);
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
				<h4><b>Update Admin Details</b> </h4>
				<button type="submit" class="btn btn-success btn-sm">Submit </button>			
			</form>
		</div>
		<div>
			<form action="OrderStatus" >
				<h4><b>Update Order Status</b></h4>
				<button type="submit" class="btn btn-success btn-sm">Submit </button>			
			</form> <br>
		</div> <br>
		<a href="AdminPage.jsp"><button type="submit" class="btn btn-outline-dark btn-sm">Home</button> </a>
	</center>
</body>
</html>