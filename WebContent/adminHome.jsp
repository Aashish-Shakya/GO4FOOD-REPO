<%@page import="BO.DishBO,BO.CustomerBO, java.util.*, entity.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">


  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>

  <title>Admin-portal</title>
<link rel="stylesheet" href="css/admin.css">
<script type="text/javascript" src="js/admin.js"></script> 
</head>

<body>

  <nav class="navbar navbar-expand-lg navbar-dark custom-bg">

    <div class="container">
      <a class="navbar-brand" href="#">ADMIN_PORTAL</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">GO 4 FOOD</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <!-- <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li> -->
          <!-- <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown"
              aria-expanded="false">
              Dropdown
            </a> -->
            <!-- <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul> -->
          <!-- </li>
          <li class="nav-item">
            <a class="nav-link disabled">Disabled</a>
          </li> -->
        </ul>
        <ul class="navbar-nav ml-auto">

          <li class="nav-item  active">
            <a class="nav-link" href="#">Logout</a>
          </li>
          <!-- <li class="nav-item  active">
            <a class="nav-link" href="#">Register</a>
          </li> -->

        </ul>

      </div>
    </div>

  </nav>

  <!-- <div class="cont"> -->
  <div class="container">
    <div class="row mt-5">
      <div class="col-md-4">
        <div class="card">
          <div class="card-body text-center">

            <div class="tilter">
              <div class="container">
                <img class="img-fluid" src="images/team.png" alt="">
              </div>
              <h1 class="text"> 

				<%
						CustomerBO cbo = new CustomerBO();

						 	
							
              // out.print( cbo.noOfUser());
						 
				%>
			</h1>
              <h1 class="text-muted">USERS</h1>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
       <a href="addCat.jsp" > <div class="card">
          <div class="card-body text-center">

            <div class="tilter">
              <div class="container">
                <img class="img-fluid" src="images/dish.png" alt="">
              </div>
              
              
              <h1 class="text"> 

				<%
						DishBO bo = new DishBO();

						 	
							
            //   out.print( bo.countAllDishes());
						 
				%>
			</h1>
              <h1 class="text-muted">DISHES</h1>
            </div>
          </div>
        </div></a>
      </div>
      <div class="col-md-4">
        <div class="card">
          <div class="card-body text-center">

            <div class="tilter">
              <div class="container">
                <img class="img-fluid" src="images/order.png" alt="">
              </div>
              <h1 class="text">1200</h1>
              <h1 class="text-muted">ORDERS</h1>
            </div>
          </div>
        </div>
      </div>
      


    </div>

    </div>
  </div>

 
</body>

</html>