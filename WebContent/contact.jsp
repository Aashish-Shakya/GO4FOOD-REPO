 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/contact.css">
  <%@include file="components/header.jsp"%>
</head>
<body>
   <%@include file="components/navigationbar.jsp"%>
<body>
    <div class="main-block">
        <div class="left-part">
          <i class="fas fa-envelope"></i>
          <i class="fas fa-at"></i>
          <i class="fas fa-mail-bulk"></i>
        </div>
        <form >
          <h1>Contact Us</h1>
          <div class="info">
            <input class="fname" type="text" name="name" placeholder="Full name">
            <input type="text" name="name" placeholder="Email">
            <input type="number" name="name" placeholder="Phone number">
            <input type="text" name="name" placeholder="Website">
          </div>
          <p>Message</p>
          <div>
            <textarea rows="4"></textarea>
          </div>
          <button type="submit" >Submit</button>
        </form>
      </div>
      	<%@include file="components/footer.jsp"%>
</body>
</html>
