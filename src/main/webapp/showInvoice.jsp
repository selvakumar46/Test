
<%@page import="com.kfc.daoimpl.OrdersDaoImpl"%>
<%@page import="com.kfc.model.Orders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Invoice</title>
<style >
body {
		background: linear-gradient(to bottom right, #BDB76B, white);
}
</style>
</head>
<body>
	
	 <%int userId=(int)session.getAttribute("userId");
		Orders order=new Orders();
		order.setUserId(userId);
		OrdersDaoImpl orderDao=new OrdersDaoImpl();
		double totalPrice=orderDao.sumOfPrice(order);
		session.setAttribute("totalPrice", totalPrice);
	 %>
	 
	 
	 <form action="payment.jsp">
	 <h3>Total Order Amount is:<%=totalPrice %></h3>
	 
	 <button type="submit">Pay Now</button>
	 </form>
	 

</body>
</html>