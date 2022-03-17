
<%@page import="BO.CartBO, javax.servlet.RequestDispatcher"%>
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
		if (session.getAttribute("username") != null) {
			String username = request.getParameter("username");
			String cart_details = request.getParameter("cart");

			String cart[] = cart_details.trim().split(",");

			CartBO bo = new CartBO();

			bo.deleteAll(username);

			for (String dishName : cart) {
				bo.add(username, dishName);
			}

			response.sendRedirect("cart");
		} else {
			session.setAttribute("msg", "Please Log in first!");
			response.sendRedirect("login.jsp");
		}
	%>


</body>
</html>