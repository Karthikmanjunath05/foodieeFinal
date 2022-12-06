
    <%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.FoodieModels.Cart" %>
<%@page import="com.FoodieServers.productobj" %>
<%@page import="com.FoodieServers.productdao" %>
<%@page import="com.FoodieServers.DbCon" %>
<%@page import="com.FoodieModels.User" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/64e1bb2e91.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar fixed-top navbar-expand-md navbar-light bg-light" id= "myHeader">
  <a href="index.jsp" class="navbar-brand"><i><strong>Foodie</strong></i></a>

  <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#mnav">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse nav-container" id="mnav">
    <ul class="navbar-nav navmargin">
      <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="chinees.jsp">Chinees</a></li>
            <li><a class="dropdown-item" href="northindian.jsp">North Indian</a></li>
            <li><a class="dropdown-item" href="southindian.jsp">South Indian</a></li>
            <li><a class="dropdown-item" href="western.jsp">Western</a></li>
          </ul>
        </li>
          <li class="nav-item"><a href="orders.jsp" class="nav-link">Previous Orders</a></li>
        </ul>
      <form class="form-inline d-flex flex-nowrap searchbar">
        <input type="search" class="form-control" placeholder="search">
        <button class="btn btn-outline-danger">Search</button>
      </form>
      <a class="nav-link cartlink" href="Cart.jsp" style="margin-left: 1%;">Cart </a>
      <div style="font-size: 10px" class="badge bg-danger cart-img-badge"><span>${ cart_list.size() }</span></div>
      <a href="Profilepage.jsp"  data-toggle="modal" data-target="#exampleModal"class="nav-link profile-name" style="margin-left: 1%;"><i class="fa-solid fa-user">  </i>Karthik</a>
  </div>
	<a href="logout"><button class="btn btn-outline-danger logout">Logout</button></a>
</nav>

</body>
</html>