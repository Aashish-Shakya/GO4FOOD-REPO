<%@page import="BO.CartBO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String operation = request.getParameter("operator");
		
		CartBO cart = new CartBO();
		
		switch (operation.trim()) {
		
		case ("update") :
			
			cart.updateQuantity((String) session.getAttribute("username"), request.getParameter("dish").trim(), Integer.parseInt(request.getParameter("qty")));
			break;
			
		case ("remove") :
			cart.delete((String) session.getAttribute("username"), request.getParameter("dish").trim());
			break;
			
		case ("removeAll") :
			cart.deleteAll((String) session.getAttribute("username"));
			break;
			
		}
		
		response.sendRedirect("cart");
	%>
</body>
</html>