<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delete</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  
<style >
body {
		background: linear-gradient(to bottom right, #BDB76B, white);
}
.container{
	margin-top:100px;
	}
label {
        display: inline-block;
        width: 165px;
        text-align: right;
        margin-left:-40px; ;
    }
    button{
    margin-right:-120px;
    }
</style>
</head>
<body>
	<form action="deleteProduct1" method="post">
	<div class="container">
		<h3><b>Confirm to delete this Meal</b></h3><br> <br>
		<label><b>Product Id</b></label>
		<input type="text" value="${delMeal.productId}" name="productId2" > <br> <br>
		<label><b>Product Name</b></label>
		<input type="text" value="${delMeal.productName}" disabled><br><br>
		<label><b>Product Price</b></label>
		<input type="text" value="${delMeal.price}" disabled><br><br>
		<label><b>Product Status</b></label>
		<input type="text" value="${delMeal.productStatus}" disabled><br><br>
		<button type="submit" class="btn btn-success btn-sm">Confirm</button>
		</div>
	</form>

</body>
</html>