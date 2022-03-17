<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success - Go4Food</title>
    <link rel="stylesheet" href="css/success.css">
	<%@include file="components/header.jsp"%>
</head>
<body>
   <%@include file="components/navigationbar.jsp"%>
   <% //to remove cache pages
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("username") != null) { 
	%>
    <div class="body"><div class="box">
        <h1 class="payment">Successfully Done</h1>
        <br> <br>
      <center>  <hr class="line"></center>
      <center><h2 class="view"><a href="receipt.jsp" class="viewlink">View Receipt</a></h2></center>
      <center><H3 class="or"> <label><a href="" class="dr">Have a nice day!</a></label></H2></center>
      <center><img src="images/paid.jpeg" alt="" class="paid"></center>
        </div>
</div>
	<%
	} else {
		response.sendRedirect("Signin.jsp");
	}
	%>
    <%@include file="components/footer.jsp"%>
</body>
</html>