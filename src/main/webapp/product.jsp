<%@page import="com.kfc.model.Products"%>
<%@page import="com.kfc.daoimpl.ProductDaoImpl"%>
<%@page import="com.kfc.daoimpl.OrdersDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
     <%
    String pName=request.getParameter("pname");
    ProductDaoImpl cart=new ProductDaoImpl();
    Products products=new Products();
    products.setProductName(pName);
    Products meal=cart.validateProduct(pName);
    
  
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style >
body {
	background:linear-gradient(to right,brown,white);
}
.container {
	margin-top: 100px;
</style>
</head>
<body>
	<center>
	<form action="cart">
		<div class="container">
		<% if(meal!=null){  %>
			
			<b>Enter Quantity: </b><input type="number" name="Quantity" min="1">
			<button type="submit" class="btn btn-info btn-sm">Submit</button>
			<%session.setAttribute("price", meal.getPrice()); %>
			<%session.setAttribute("productId", meal.getProductId()); %>
			<%} %>
		</div>
	</form>
	
	</center>
	
</body>
</html>