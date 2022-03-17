
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="css/Signin.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Oleo+Script&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Corinthia:wght@700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Shojumaru&display=swap"
	rel="stylesheet">
<style>
h3.msg {
	text-align: center;
	color: red;
}
</style>
</head>
<body>
	<nav class="navbar">
		<ul class="nav-list">
			<p class="left">GO 4 FOOD</p>
			<div class="logo">
				<img src="images/logopic.jpg" alt="logo">
			</div>
			<li class="home"><a href="home.jsp">Home</a></li>
			<li><a href="Menu.jsp">Menu </a></li>
			<li><a href="cart">Cart</a></li>
			<li><a href="orders.jsp">Orders</a></li>
			<li><a href="./Signup.jsp">Sign up</a></li>
		</ul>

	</nav>

	<div class="formbody">
		<div class="container">

			<center>
				<div class="title">Sign in</div>
			</center>
			<%
				if (session.getAttribute("msg") != null) {
			%>
			<br>
			<h3 class="msg"><%=session.getAttribute("msg")%></h3>
			<%
				session.removeAttribute("msg");
				}
			%>
			<br>

			<form action="signin_servlet.jsp" method="post">
				<div class="user-details">
					<div class="input-box">
						<span class="details">User Name</span> <input type="text"
							name="username" placeholder="Enter your password" minlength="5"
							maxlength="25" required>
					</div>
					<div class="input-box">
						<span class="details">Password</span> <input type="password"
							name="password" placeholder="Enter your password" minlength="8"
							maxlength="25" required>
					</div>
				</div>
				<br> <br>
				<div class="button">
					<input type="submit" name="submitto" value="Login">
				</div>
				<div class="reset">
					<input type="reset" name="resetto" value="Reset">
				</div>
			</form>
		</div>
	</div>

	<section class="footer">
		<div class="social">
			<a href="https://www.facebook.com/"><i class="fab fa-facebook"></i>
			</a> <a href="#"><i class="fab fa-instagram"></i></a> <a href="#"><i
				class="fab fa-twitter"></i></a> <a href="#"><i
				class="fab fa-linkedin"></i></a>
		</div>
		<ul class="list">
			<li><a href="#">Home</a></li>
			<li><a href="#">Services</a>
			<li><a href="./aboutus.html">About </a></li>
			<li><a href="#">Gallery</a></li>
			<li><a href="#">Contact </a></li>
		</ul>
		<p class="copyright">All rights reserved under Team leader
			Satyajeet,Aashish,Anurag,Aryan,Deepak,Harsh,Shruti @2021</p>


 
	</section>
</body>
</html>