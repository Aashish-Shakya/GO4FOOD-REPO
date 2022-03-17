<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login JSP</title>
</head>
<body>
	<%@page import="java.sql.*"%>
	<%@page import="javax.sql.*"%>
	<%@page import="javax.servlet.http.HttpSession, BO.CustomerBO, entity.Customer"%>
	<%
		String userid = request.getParameter("username");
		String fname = request.getParameter("fname");
		String pwd = request.getParameter("password");
		
		CustomerBO bo = new CustomerBO();
		
		Customer customer = bo.getCustomerByUsername(userid);
		
		
	 
	 
		
		if (customer != null) {
			if (customer.getPASSWORD().equals(pwd)) {

				session.setAttribute("username", userid);
				session.setAttribute("fname", customer.getFIRSTNAME());
				session.setAttribute("lname", customer.getLASTNAME());
				session.setAttribute("username", customer.getUSERNAME());
				session.setAttribute("email", customer.getEMAILID());
				session.setAttribute("mobileno", customer.getMOBILENUMBER().toString());
				session.setAttribute("address", customer.getADDRESS());

				response.sendRedirect("home.jsp");

			} else {
				session.setAttribute("msg", "Invalid Password! Please try again.");
				response.sendRedirect("Signin.jsp");

			}

		}

		else {
			if(userid.equals("admin") && pwd.equals("Admin@123")){
		        response.sendRedirect("http://localhost:4200/");
		
		     }else{
			session.setAttribute("msg", "Username does not exists!");
			response.sendRedirect("Signin.jsp");}
		}
	%>


</body>
</html>