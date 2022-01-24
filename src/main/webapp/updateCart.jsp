<%@page import="com.kfc.model.Products"%>
<%@page import="com.kfc.daoimpl.ProductDaoImpl"%>
<%@page import="com.kfc.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <% String pName = request.getParameter("pname"); 
  ProductDao productDao = new ProductDaoImpl();
Products product = new Products();
product.setProductName(pName);
Products meal = productDao.validateProduct(pName);
int userId=(int)session.getAttribute("userId");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update cart Kfc</title>
<style >
body {
	background:linear-gradient(to right,brown,white);
}
</style>
</head>
<body>
	
	
	<%if (meal!=null){ %>
	<form action="upateCart" method="post">
		<div>
			Enter how many quantity you want: <input type="number" name="quantity" >
			<%session.setAttribute("price", meal.getPrice()); %>
			<%session.setAttribute("productId", meal.getProductId()); %>
			<button type="submit">Submit</button>
		</div>
		
		
	</form>
	
	<%} %>
	
</body>
</html>