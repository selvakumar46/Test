<%@page import="com.kfc.model.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.kfc.daoimpl.ProductDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delete Product</title>
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
	<%
	ProductDaoImpl products = new ProductDaoImpl();
	List<Products> showProduct;
	
	showProduct = products.showProductAdmin();
	%>
	<p>
					<b>Product list</b>
				</p>
	<table>
		<tbody>
			<tr>
				
			 <%
 int count = 0;
			 int i=showProduct.size();
 for (Products meals : showProduct) {
 %>

					<td>
						<table id="productTable">
							<tbody>
								<tr>

									<td><span>Meal name: <b> <%=meals.getProductName()%></b>
									</span><br> <span> meal Description: <%=meals.getDescription()%>
									</span><br> <span>meal price:<b> <%=meals.getPrice()%></b>
									</span><br> <span>Meal Type:<%=meals.getProductType()%>
									</span><br> <span>Meal Status:<%=meals.getProductStatus()%></span><br>
									
									<span> <a href="StatusUpdate.jsp?proName=<%=meals.getProductName() %>" > <button type="submit" class="btn btn-primary btn-sm">Update</button> </a></span>

										<span>
										 	<%session.setAttribute("productName", meals.getProductName()); %>
											<a href="Delete.jsp?productId1=<%=meals.getProductId()%>"> <button type="submit" class="btn btn-secondary btn-sm"   >Delete</button></a>
									</span></td>
								</tr>
							</tbody>
						</table>

				</td> 
<%
 count++;

 if (count == 3) {
 %>
			</tr>
			<tr>
				<%
				count = 0;

				}
				}
				%>

			</tr>
		</tbody>
	</table>
<center>
	<a href="AdminPage.jsp" ><button type="submit" class="btn btn-dark">Home</button></a>
</center>
	
</body>
</html>