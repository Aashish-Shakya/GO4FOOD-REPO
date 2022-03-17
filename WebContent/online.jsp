<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="BO.DishBO, BO.TransactionBO, java.util.*, entity.Dish"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
		TransactionBO bo = new TransactionBO();

		Enumeration paramNames = request.getParameterNames();
		Map<String, String> params = new HashMap<String, String>();

		while (paramNames.hasMoreElements()) {
			String paramName = (String) paramNames.nextElement();

			String paramValue = request.getParameter(paramName);

			if (empty(params.get(paramName))) {
				params.put(paramName, paramValue);
			}
		}

		bo.startTransaction((String) session.getAttribute("username"), params.get("hash"), params.get("key"),
				params.get("txnid"), params.get("udf2"), params.get("servise_provider"),
				Double.parseDouble(params.get("amount")), "success", "payumoney");
		
		response.sendRedirect("success.jsp");
	} else {
		response.sendRedirect("Signin.jsp");
	}
		
	%>
</body>
</html>