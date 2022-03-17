<%@page import="entity.Order"%>
<%@page import="BO.OrderBO"%>
<%@page import="entity.Bill"%>
<%@page import="BO.BillBO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="BO.DishBO, BO.CartBO, BO.TransactionBO, java.util.*, entity.Dish"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Successful</title>
</head>
<body>
	<%!public boolean empty(String s) {
		if (s == null || s.trim().equals(""))
			return true;
		else
			return false;
	}%>
	<%
	if (session.getAttribute("username") != null) {
		
		String username = session.getAttribute("username").toString();
		
		TransactionBO bo = new TransactionBO();
		CartBO cartBo = new CartBO();
		BillBO billBo = new BillBO();
		OrderBO orderBo = new OrderBO();

		bo.startCod((String) session.getAttribute("username"), Double.parseDouble((String) session.getAttribute("amount")), "success", "cash on delivery");
		
		Map<Dish, Integer> cart = (Map<Dish, Integer>) session.getAttribute("cart");
		
		cartBo.deleteAll(username);
		
		billBo.insertBill(new Bill((String) session.getAttribute("username"), Double.parseDouble((String) session.getAttribute("amount")), (String) session.getAttribute("address"), (String) session.getAttribute("txnid"), "success"));
		
		for (Map.Entry<Dish, Integer> item : cart.entrySet()) {
			orderBo.insertOrder(new Order((String) session.getAttribute("username"), item.getKey(), item.getValue(), "COD"));
			System.out.println("Dish name : " + item.getKey());
			System.out.println("Quantity : " + item.getValue());
		}
		session.setAttribute("showReceipt", "true");
		response.sendRedirect("success.jsp");
	} else {
		response.sendRedirect("Signin.jsp");
	}
		
	%>
</body>
</html>