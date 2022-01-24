<%@page import="com.kfc.model.Products"%>
<%@page import="com.kfc.daoimpl.ProductDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
  <% String pName = request.getParameter("pname"); 
  ProductDaoImpl productDao = new ProductDaoImpl();
Products product = new Products();
Products meal = productDao.validateProduct(pName); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>del cart</title>
<style >
body {
	background:linear-gradient(to right,brown,white);
}
</style>
</head>
<body>
	<form action="delCart" method="post">
		<%
		if (meal != null) {
		%>
		<%
		session.setAttribute("productId", meal.getProductId());
		
		%>
		<%
		}
		%>
		<button type="submit">confirm</button>
	</form>
		
		
	</form>
</body>
</html>