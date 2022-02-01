<%@page import="com.kfc.model.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.kfc.daoimpl.ProductDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delete Product</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  
<style >
body {
		background: linear-gradient(to bottom right, #BDB76B, white);
}
.container{
	margin-top:200px;
	}
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	width: 100%;
	padding: 20px;
	border-radius: 3px;
	border: thin;
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}
th, td {
	padding: 10px;
}
</style>
</head>
<body>
	<strong>Product list</strong>
	<table>
		<tbody>
		<th>
			<tr>
			<c:set var="count" value="1" />
			<c:forEach items="${showProductAdmin}" var="products">
			<td>
				<div class="card">
					<img src="${products.productImg}" style="width: 100%"><br>
					${products.productName}<br>
					${products.description}<br>
					${products.price}<br>
					${products.productType}<br>
					${products.productStatus}<br>
					<a href="StatusUpdate.jsp?proName=${products.productName}" > <button type="submit" class="btn btn-primary btn-sm">Update</button> </a>
					<a href="Delete.jsp?productId1=${products.productId}"> <button type="submit" class="btn btn-secondary btn-sm"   >Delete</button></a>
				</div>
				<td><c:choose>
							<c:when test="${count==3}">
			</tr>
			<tr>
				<c:set var="count" value="1" />
				</c:when>
				<c:otherwise>
					<c:set var="count" value="${count+1}" />
				</c:otherwise>
				</c:choose>

				</c:forEach>

			</tr>
			</th>
		</tbody>
	</table>
<center>
	<a href="AdminPage.jsp" ><button type="submit" class="btn btn-dark">Home</button></a>
</center>
	
</body>
</html>