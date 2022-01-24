<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Confirmed</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background:linear-gradient(to right,brown,white);
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
</style>
</head>
<body>
<center class="container">
	<form action="mainPage.jsp">
		<div>
			<h2><b><i>Your Order Will Placed Successfully</i></b></h2>
			<button type="Submit" class="btn btn-outline-danger btn-sm">Home</button>
		</div>
	</form>
	</center>
</body>
</html>