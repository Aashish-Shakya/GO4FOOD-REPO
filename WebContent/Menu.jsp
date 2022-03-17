<%@page import="BO.DishBO, java.util.*, entity.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu</title>
<link rel="stylesheet" href="css/menu2.css">
<script src="collections/collections.min.js"></script>
<script src="menu.js" async></script>

<script>
	function scrollFunc(id) {
		var elmnt = document.getElementById(id);
		elmnt.scrollIntoView();
	}
</script>

<!-- CSS -->
    <!-- Script -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js' type='text/javascript'></script>
        <link rel="stylesheet" href="css/modal.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<%@include file="components/header.jsp"%>
</head>

<body>

 <div class="modalcontainer">
        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Enter Pincode</h4>
                        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        Pincode :
                        <input type="text" placeholder="Pincode" minlength="6" maxlength="6" id="pincode" required/>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" id="pincodeBtn" class="btn btn-success" onclick="demo()">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- ------------------------------------------------- TOP NAV BAR ------------------------------------------------------------------ -->
	<div class="header">
		
		<%@include file="components/navigationbar.jsp"%>
		
		<!-- ------------------------------------------------- 2nd NAV BAR ------------------------------------------------------------------ -->
		<div class="menu1">
			<nav class="navbar1">
				<ul class="nav-list1">

					<%
						DishBO bo = new DishBO();

						for (Map.Entry<String, List<Dish>> category : bo.categorizeDishes().entrySet()) {
							out.print("<li><a onclick=\"scrollFunc('" + category.getKey() + "')\">" + category.getKey()
									+ "</a></li>");
						}
					%>
				</ul>
			</nav>
		</div>
	</div>
	<div class="title">

		<img id="menuIcon" src="images/menu_2.png">
	</div>
	<br>
	<br>

	<!-- Menu -->
	<div class="Menu">

		<%
			for (Map.Entry<String, List<Dish>> category : bo.categorizeDishes().entrySet()) {
				out.print("<div id=" + category.getKey() + " class=\"categoryHeading\"> <span class='heading'>"
						+ category.getKey().toUpperCase() + "</span> DISHES</div><div class=\"category\">");
				for (Dish dish : category.getValue()) {
					out.print(
							"<div class=\"container\"><div class=\"card\"><div class=\"imgBx\"><img class=\"image\" src="
									+ dish.getImage_url()
									+ "></div><div class=\"contentBx\"><h2 class=\"shop-item-title\">" + dish.getName()
									+ "</h2><br><div><h3>Price: <strike style=\"color: red;\">" + dish.getPrice()
									+ "</strike> " + (dish.getPrice() - dish.getDiscount())
									+ "/-</h3><br></div><button class=\"shop-item-button\" style=\"background-color: rgb(57, 241, 33)\">ADD</button></div></div></div>");
				}
				out.print("</div>");
			}
		%>

	</div>
	<!-- Menu ends -->

	<!-- Checkout Button -->
	<div class="checkout_div">
		<%
			if (session.getAttribute("username") == null) {
				out.print("<button class=\"checkout\" onclick=\"alert('Please Log in first!')\">Checkout</button>");
			} else {
				out.print("<button class=\"checkout\" onclick=\"checkout('" + session.getAttribute("username")
						+ "')\">Checkout</button>");
			}
		%>

	</div>
	<!-- Checkout Button -->

	<%@include file="components/footer.jsp"%>

</body>