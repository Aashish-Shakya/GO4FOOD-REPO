	<nav class="navBar">
		<ul class="nav-list">
			<p class="left">GO 4 FOOD</p>
			<div class="logo">
				<img src="images/logopic.jpg" alt="logo">
			</div>
			<li class="home"><a href="home.jsp">Home</a></li>
			<li><a href="Menu.jsp">Menu </a></li>
			<li><a href="cart">Cart</a></li>
			<li><a href="orders.jsp">Orders</a></li>

			

						
						<%
							//to remove cache pages
							response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

							if (session.getAttribute("username") == null) {
								out.print("<li><a href=\"Signin.jsp\">Log In</a></li>");
							} else {
								out.print("<li><a href=\"logout.jsp\">Log out</a></li>");
								out.print("<li class=\"user\">Welcome! " + session.getAttribute("fname") + "</li>");
							}
						%>
					
		</ul>

	</nav>