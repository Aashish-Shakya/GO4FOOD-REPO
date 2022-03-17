<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Form</title>
<link rel="stylesheet" href="css/Signup1.css">
<%@include file="components/header.jsp"%>

</head>

<body>
	<%@include file="components/navigationbar.jsp"%>
	<div class=" background1">
        <div class="formbody">
            <div class="container">
                <center>
                    <div class="title">Signup</div>
                </center>
                <% if (session.getAttribute("msg") != null) {
                %>
                <br>
                <h3 class="msg"><%= session.getAttribute("msg") %></h3>
                <%
                session.removeAttribute("msg");
                } %>
                <br>
                <div class="icon">
                    <ul class="unicon">
                        <li> <a href="#"><img src="images/fb.jfif" alt="" class="fb" width="60px"></a></li>
                        <li ><a href="#"><img src="images/instagram.png" alt="" class="fb" width="60px"></a></li>
                        <li ><a href="#"><img src="images/google.jfif" alt="" class="fb" width="60px"></a></li>
                    </ul>
                </div>
                <form action="signup_servlet.jsp" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <span class="details">First Name</span>
                            <input type="text" name="fname" placeholder="Enter your first name" minlength="2"
                                maxlength="20" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Last Name</span>
                            <input type="text" name="lname" placeholder="Enter your last name" minlength="2"
                                maxlength="14" required>
                        </div>
                        <div class="input-box">
                            <span class="details">User Name</span>
                            <input type="text" name="username" placeholder="Enter your password" minlength="5"
                                maxlength="25" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Email id</span>
                            <input type="text" name="email" placeholder="Enter your email id" minlength="4"
                                maxlength="25" required>
                        </div>
                        <div class="gender-details">
                        <input type="radio" name="gender" id="dot-1" value="male">
                        <input type="radio" name="gender" id="dot-2" value="female">
                        <input type="radio" name="gender" id="dot-3" value="other">
                        <span class="gender-title">Gender</span>
                        <div class="category">
                            <label for="dot-1">
                                <span class="dot one"></span>
                                <span class="gender" >Male</span>
                            </label>
                            <label for="dot-2">
                                <span class="dot two"></span>
                                <span class="gender">Female</span>
                            </label>
                            <label for="dot-3">
                                <span class="dot three"></span>
                                <span class="gender">Other</span>
                            </label>
                        </div>
                    </div> 
                        <div class="input-box">
                            <span class="details">Mobile Number</span>
                            <input type="number" name="mobile" placeholder="Enter your mobile number" minlength="10"
                                maxlength="10" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Address</span>
                            <input name="address" placeholder="Enter your address" minlength="5" maxlength="50"
                                required>
                        </div>
                        <div class="input-box">
                            <span class="details">Password</span>
                            <input type="password" id= "pwd" name="password" placeholder="Enter your password" minlength="8" maxlength="25" required>
                        </div>
                        <div class="input-box">
                            <span class="details">Confirm Password</span>
                            <input type="password" id = "cpwd" name="caddress" placeholder="Confirm your password" minlength="8"
                                maxlength="25" required>
                        </div>
                    </div>
                
                    <center>
                        <div class="button">
                            <label style = "color: red;" id = "test"></label><br>
                            <input type="submit" onclick="return check()" name="submitto" value="Register">
                        </div>
                        <div class="reset">
                            <input type="reset" name="resetto" value="Reset">
                        </div>
                        <script>
                        function check(){
                            var password = document.getElementById("pwd").value;
                            var cpassword = document.getElementById("cpwd").value;
                            if(password == cpassword) {
                                document.getElementById("test")  //.innerHTML = "Form submitted"
                                return true;
                            }
                            else{
                                document.getElementById("test").innerHTML = "Password didn't match"
                                return false;
                            }
                        }
                    </script>
                </form>
            </div>
        </div>
    </div>
	<%@include file="components/footer.jsp"%>
</body>
</html>