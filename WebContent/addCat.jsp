<%@page import="BO.DishBO, java.util.*, entity.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html lang="en">

<head>
<title>Menu</title>
<link rel="stylesheet" href="css/menu2.css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
 
<%@include file="components/header.jsp"%>

 
<!-- ------------------------------------------------- TOP NAV BAR ------------------------------------------------------------------ -->
	<div class="header">
		<div class="navigationbar">
<%@include file="components/navigationbar.jsp"%>
		</div>
		<!-- ------------------------------------------------- 2nd NAV BAR ------------------------------------------------------------------ -->
		<div class="menu1">
			<nav class="navbar1">
				<ul class="nav-list1">

					<%
						DishBO bo = new DishBO();

						for (Map.Entry<String, List<Dish>> category : bo.categorizeDishes().entrySet()) {
							out.print("<li><a onclick=\"scrollFunc('" + category.getKey() + "')\">" + category.getKey()
									+ "</a></li>");
							
							// System.out.print(bo.countAllDishes());
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
      <button data-bs-toggle="modal" data-bs-target="#add-category">ADD</button>
    <button>Remove</button>
    
<!-- Modal -->


<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-category">
    Launch demo modal
  </button> -->
  
  <!-- Modal -->
  <div class="modal fade" id="add-category" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header custom-bg text-white">
          <h5 class="modal-title" id="exampleModalLabel">Enter the details of category</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="#">
            <div class="form-group">
                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>

            </div>
            <div class="form-group">
               <textarea class="form-control" placeholder="Enter details" name="catDescription" id="" cols="30" rows="10" required></textarea>
            </div>

          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
      </div>
      </div>
      </div>
      <br>
      <br>
      <br>
	<!-- Menu -->
	<div class="Menu">

		<%
			for (Map.Entry<String, List<Dish>> category : bo.categorizeDishes().entrySet()) {
				out.print("<div class=\"catergoryclass\"><div id=" + category.getKey() + " class=\"categoryHeading\">"
						+ category.getKey().toUpperCase() + " DISHES</div><div class=\"category\">");
				for (Dish dish : category.getValue()) {
					out.print(
							"<div class=\"container\"><div class=\"card\"><div class=\"imgBx\"><img class=\"image\" src="
									+ dish.getImage_url()
									+ "></div><div class=\"contentBx\"><h2 class=\"shop-item-title\">" + dish.getName()
									+ "</h2><br><div><h3>Price: <strike style=\"color: red;\">" + dish.getPrice()
									+ "</strike> " + (dish.getPrice() - dish.getDiscount())
									+ "/-</h3><br></div><button class=\"shop-item-button\" style=\"background-color: rgb(57, 241, 33)\">ADD</button></div></div></div>");
				}
				out.print("</div></div>");
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
</html>