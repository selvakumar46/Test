<%@page import="java.util.List"%>
<%@page import="com.kfc.model.Orders"%>
<%@page import="com.kfc.daoimpl.OrdersDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delete cart</title>
</head>
<body>
		
		<% int userId=Integer.parseInt(request.getParameter("userId")) ; %>
   <%OrdersDaoImpl ordDao=new OrdersDaoImpl();
   Orders order1=new Orders();
   order1.setUserId(userId);
   Orders order=ordDao.delOrder(order1);
   response.sendRedirect("mainPage.jsp");
   %>
</body>
</html>