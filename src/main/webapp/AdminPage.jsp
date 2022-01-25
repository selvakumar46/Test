<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin KFC</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style >
body {
		background: linear-gradient(to bottom right, #BDB76B, white);
}
.container{
	margin-top:100px;
	}
.center{
	
	margin-top:250px;
}
</style>
</head>
<body>
	<center>
	<h2>Hello Admin</h2>
		<div class="container">
	
		<form action="Insert.jsp"> <br>
			<button type="submit" class="btn btn-primary btn-sm">Insert</button> 
		</form><br>
		<form action="Update.jsp">
			<button type="submit" class="btn btn-primary btn-sm">Update</button>
		</form><br>
		<form action="ShowProductsAdmin.jsp">
			<button type="submit" class="btn btn-primary btn-sm ">List of products</button> 
		</form><br>
		</div>
	</center>
	<a href="login.jsp"><center class="center"><button type="submit" class="btn btn-outline-dark"> Logout</button></center></a>
</body>
</html>