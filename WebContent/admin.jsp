<%@page import="BO.DishBO, java.util.*, entity.Dish"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html lang="en">

<head>
<title>Menu</title>
<link rel="stylesheet" href="css/menu2.css">
  <link rel="stylesheet" href="css/admin.css">
  
<%@include file="components/header.jsp"%>

  
<%@include file="components/navigationbar.jsp"%>
	 
    
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="demo.css">
 
	 
  
<body>
    
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
 

	<%@include file="components/footer.jsp"%>

</body>
</html>