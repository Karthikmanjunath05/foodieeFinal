<%@page import="com.FoodieServers.productobj"%>
<%@page import="com.FoodieServers.productdao"%>
<%@page import="com.FoodieServers.DbCon"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.FoodieModels.Cart"%>
<%@page import="com.FoodieModels.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
    else if (auth == null){ 
    	response.sendRedirect("Login.jsp");
    	}
productdao pd = new productdao(DbCon.getConnection());
String top8 ="Select * from `food_items` limit 8;";
List<productobj> products = pd.getAllProducts(top8);
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
	}
%>

<html>
<head>
<title>Foodiee</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/64e1bb2e91.js" crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="category.css">
<script src="https://kit.fontawesome.com/64e1bb2e91.js"
	crossorigin="anonymous"></script>
</head>
<body style="margin-top:100px;">
	<nav class="navbar fixed-top navbar-expand-md navbar-light bg-light"
		id="myHeader">
		<div style="margin-left: 100px">
			<a href="index.jsp" class="navbar-brand"><i><strong>Foodie</strong></i></a>
		</div>

		<button class="navbar-toggler" data-bs-toggle="collapse"
			data-bs-target="#mnav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse nav-container" id="mnav">
			<ul class="navbar-nav navmargin">
				<li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						Categories </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="chinees.jsp">Chinese</a></li>
						<li><a class="dropdown-item" href="northindian.jsp">North
								Indian</a></li>
						<li><a class="dropdown-item" href="southindian.jsp">South
								Indian</a></li>
						<li><a class="dropdown-item" href="western.jsp">Western</a></li>
					</ul></li>
				<li class="nav-item"><a href="orders.jsp"
					class="nav-link">Previous Orders</a></li>
			</ul>

		</div>
		<div
			style="margin-right: 100px; display: flex; flex-direction: row; align-items: center;">
			<a class="nav-link cartlink" href="Cart.jsp"
				style="margin-left: 1%; text-aligen: center"">Cart </a>
			<div style="font-size: 10px; margin: 3px; text-aligen: center"
				"
						class="badge bg-danger cart-img-badge">
				<span>${ cart_list.size()>0?cart_list.size():0 }</span>
			</div>

			<a href="#!" class="nav-link profile-name"  data-toggle="modal" data-target="#exampleModal"
				style="margin-left: 10px; margin-right: 10px; display: flex; align-items: center;"><i
				class="fa-solid fa-user"> </i> <%= auth.getName() %></a> <a
				href="logout"><button class="btn btn-outline-danger logout">Logout</button></a>
		</div>
	
	</nav>
	
	<div class="container" style="margin-top: 30px">
		<div class="row" style="width: 100%; height: 100%">
			<div class="col-md-6 my-6 "
				style="display: flex; flex-direction: column; justify-content: center">
				<p class="h1">Hungry?!</p>
				<br>
				<p class="h3">Good. We are here to serve you <%= auth.getName() %>!</p>
				<br>
				<button type="button" class="btn btn-lg btn-danger" ><a style="color:white;" href="AllFoodItems.jsp">Start
					ordering now</a></button>
			</div>
			<div class="col-md-6 my-6">
				<img class="card-img-top" style="border-radius: 25px"
					src="product-image/vegfood.jpeg" alt="Card image cap">
			</div>
		</div>
		<div class="top">
			<h4>Food Items</h4>
			<div class="view-all">
				<a href="AllFoodItems.jsp" style="color:#ea0505">View All</a>
			</div>
		</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (productobj p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 25rem;">
					<div
						style="width: 100%; height: 150px; display: flex; justify-content: center; align-items: center; position: relative;">
						<img class="card-img-top"
							style="position: absolute; height: 100%; width: 100%;"
							src="<%=p.getImage()%>" alt="Card image cap">
					</div>
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">
							Price: Rs.
							<%=p.getPrice()%></h6>
						<h6 class="category">
							Category:
							<%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between ">
							<a href="AddToCart?id=<%=p.getId()%>"
								class="btn btn-danger btn-sm">Add to Cart</a> <a href="order-now?quantity=1&id=<%=p.getId()%>"
								class="btn btn-danger btn-sm">Order Now </a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
      <div class="modal-body">
        <div class="container text-center">
        	<h5 class="modal-title" id="exampleModalLabel"> <%= auth.getName() %> </h5>
        	<table class="table">
			  
			  <tbody>
			    <tr>
			      <th scope="row">ID :</th>
			      <td><%= auth.getId() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Email :</th>
			      <td><%= auth.getEmail() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Contact</th>
			      <td><%= auth.getContact() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Age</th>
			      <td>23</td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Address :</th>
			      <td><%= auth.getAddress() %></td>
			      
			    </tr>
			    
			  </tbody>
			</table>
        </div>
      </div>
     <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger"><a href="orders.jsp" style="color:white;">Your orders</a></button>
      </div>
        </div>
      </div>
     
      </div>

		<%@include file="footer.jsp"%>
</body>
</html>
