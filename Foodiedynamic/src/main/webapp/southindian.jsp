<%@page import="com.FoodieServers.productobj" %>
<%@page import="com.FoodieServers.productdao" %>
<%@page import="com.FoodieServers.DbCon" %>
<%@page import="java.util.List" %>
<%@page import="com.FoodieModels.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.FoodieModels.Cart" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
productdao pd = new productdao(DbCon.getConnection());
String top8 = "SELECT * FROM foodie.food_items where food_category = 'south';";
List<productobj> products = pd.getAllProducts(top8);
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="category.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/64e1bb2e91.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/64e1bb2e91.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Foodiee</title>
</head>
<body >
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

			<a href="Profilepage.jsp" class="nav-link profile-name"
				style="margin-left: 10px;margin-right:10px; display: flex; align-items: center;"><i
				class="fa-solid fa-user"> </i><%= auth.getName() %></a> <a
				href="logout"><button class="btn btn-outline-danger logout">Logout</button></a>
		</div>
	</nav>

	<div class="top" style="padding-top:70px;">
	            <h4>South Indian</h4>

	        </div>
		<div class="row">
		<%
		if(!products.isEmpty()){
			for(productobj p:products){%>
				<div class="col-md-2 my-2">
			<div class="card w-100" style="width: 25rem;">
				<div
					style="width: 100%; height: 150px; display: flex; justify-content: center; align-items: center; position: relative;">
					<img class="card-img-top"
						style="position: absolute; height: 100%; width: 100%;"
						src="<%=p.getImage()%>" alt="Card image cap">
				</div>
					<div class="card-body">
						<h5 class="card-title"><%= p.getName() %></h5>
						<h6 class="price">Price: Rs. <%= p.getPrice()  %></h6>
						<h6 class="category">Category: <%= p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between ">
							<a href="AddToCart?id=<%=p.getId()%>" class="btn btn-danger btn-sm">Add to Cart</a>
							<a href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-danger btn-sm">Order Now </a>
						</div>
					</div>
				</div>
			</div>
			<%}
		}
		%>			
	</div>
<%@include file="footer.jsp" %>

</body>
</html>