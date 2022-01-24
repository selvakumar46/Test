<%@page import="com.kfc.model.Products"%>
<%@page import="com.kfc.daoimpl.ProductDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delete</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  
<style >
body {
	background:linear-gradient(to right,brown,white);
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
<%int productId=Integer.parseInt( request.getParameter("productId1")); 
ProductDaoImpl cart=new ProductDaoImpl();
Products products=new Products(productId,null,null,0,null,null,null);

Products meal=cart.validateProduct1(products);
%>

	<center>
	<form action="deleteProduct1" method="post">
	<div class="container">
		<h3><b>Confirm to delete this Meal</b></h3><br> <br>
		<label><b>Product Id</b></label>
		<input type="text" value="<%=meal.getProductId() %>" name="productId2" > <br> <br>
		<label><b>Prodduct Name</b></label>
		<input type="text" value="<%=meal.getProductName()%>" disabled><br><br>
		<label><b>Prodduct Price</b></label>
		<input type="text" value="<%=meal.getPrice()%>" disabled><br><br>
		<label><b>Prodduct Status</b></label>
		<input type="text" value="<%=meal.getProductStatus()%>" disabled><br><br>
		<button type="submit" class="btn btn-success btn-sm">Confirm</button>
		</div>
	</form>
	</center>
</body>
</html>