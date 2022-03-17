<%@page import="BO.CustomerBO, entity.Customer"%>
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
		CustomerBO bo = new CustomerBO();

		if ("POST".equalsIgnoreCase(request.getMethod())) {

			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			Long mobile = Long.parseLong(request.getParameter("mobile"));
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");

			Customer customer = bo.getCustomerByUsername(username);

			if (customer != null) {
				session.setAttribute("msg", "This username is already exists, choose another one.");
				response.sendRedirect("Signup.jsp");
			} else {

				customer = new Customer();

				customer.setFIRSTNAME(fname);
				customer.setLASTNAME(lname);
				customer.setUSERNAME(username);
				customer.setEMAILID(email);
				customer.setMOBILENUMBER(mobile);
				customer.setADDRESS(address);
				customer.setPASSWORD(password);
				customer.setGENDER(gender);

				bo.insert(customer);

				response.sendRedirect("Signin.jsp");
			}
		} else {
			session.setAttribute("msg", "Please use this page for signup.");
			response.sendRedirect("Signup.jsp");
		}
	%>
</body>
</html>