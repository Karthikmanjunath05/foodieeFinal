
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.FoodieServers.OrderDao"%>
<%@page import="com.FoodieServers.DbCon"%>
<%@page import="com.FoodieServers.productdao"%>
<%@page import="com.FoodieModels.*"%>
<%@page import="java.util.*"%>

	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	
	%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/64e1bb2e91.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/64e1bb2e91.js" crossorigin="anonymous"></script>
<title>Foodie</title>
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
	<div class="container" style="padding-top:70px;">
		<div class="card-header my-3">Previous Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<!--  <th scope="col">Cancel</th> -->
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<!--	<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>-->
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>