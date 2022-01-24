<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Insert</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style >
body {
	background:linear-gradient(to right,brown,white);
}
.container{
	margin-top:200px;
	}

</style>
</head>
<body>
	<center>
	<form action="InsertProduct.jsp">
		<div class="container" >
			<h4>Insert New Meal</h4>
			<button type="submit" class="btn btn-outline-success btn-sm">Submit</button>
		</div>
		</form> <br>
	<form action="NewAdmin.jsp">
		<div>
			<h4>Insert New Admin</h4><button type="submit" class="btn btn-outline-success btn-sm">Submit</button>
		</div>
	</form>
	</center>
</body>
</html>