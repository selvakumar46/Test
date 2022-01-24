<%@page import="com.kfc.model.Products"%>
<%@page import="com.kfc.daoimpl.ProductDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String productName1=request.getParameter("proName"); 
ProductDaoImpl productDao = new ProductDaoImpl();
Products product = new Products();
Products meal = productDao.validateProduct(productName1);
String productName=meal.getProductName();
double productPrice=meal.getPrice();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Meal Status Update</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background:linear-gradient(to right,brown,white);
}

.container {
	margin-top: 30px;
	margin-right:90px;
}
.button{
	margin-top:100px;
}

</style>

</head>
<body>


	<center>
		<div class="container">
			<form action="statusUpdate" method="post"  >
				<h3>Change Product Status</h3>
				<label for="update" id="productName" ><b>Product Name</b></label>
				<input  name="productName"  value="<%=productName %>"  > <br> <br>
				<label for="status" id="productStatus"><b>Product Status</b></label>
				<input type="text" name="productStatus" required autofocus placeholder="Availble/Sold-Out" > <br> <br>
				<button type="submit" class="btn btn-outline-success btn-sm" >Update</button>
				<button type="reset" class="btn btn-outline-primary btn-sm" >Cancel</button>
			</form> <br>
		<br>	
		<form action="PriceUpdate">
			<h3>Change product Price</h3>
			<label for="update" id="productName1" ><b>Product Name</b></label>
				<input  name="productName1"  value="<%=productName %>"  > <br> <br>
				<label for="status" id="productPrice"><b>Product Old Price </b></label>
				<input type="text" name="productPrice"  value="<%=productPrice %>" disabled > <br> <br>
				<label for="status" id="productNewPrice"><b>Product Price </b></label>
				<input type="number" name="productNewPrice" required placeholder="Enter new price..."  > <br> <br>
				<button type="submit" class="btn btn-outline-success btn-sm" >Update</button>
				<button type="reset" class="btn btn-outline-primary btn-sm">Cancel</button>
			
		</form>
		<a href="AdminPage.jsp"> <button class="btn btn-outline-dark  button" >Home</button> </a>
		</div>
		
	</center>
</body>
</html>