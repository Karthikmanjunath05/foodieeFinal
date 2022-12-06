<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.FoodieServers.DbCon" %>
    <%@page import="com.FoodieServers.productdao" %>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.FoodieModels.Cart" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.FoodieModels.User"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	productdao pDao = new productdao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Foodiee</title>
<style type="text/css">
.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}
</style>
</head>
<body style="margin-top:70px;">
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

	<div class="container my-3"  style="margin-top:70px;">
	
		<div>
        	<h4 style="color:#ea0505">My Cart</h4>
        </div>
		<table class="table table-light table-responsive">
			<thead>
				<tr>
					<th >Name</th>
					<th>Image</th>
					<th>Category</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td>
                       <img style="width:120px; border-radius:10px"  src="<%= c.getImage() %>" alt="img">
                    </td>
					<td><%=c.getCategory()%></td>
					<td><%= dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre" href="QuantityServlet?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
								<input type="text" name="quantity" class="form-control" style="width:50px" value="<%=c.getQuantity()%>" readonly> 
								<a class="btn btn-sm btn-decre" href="QuantityServlet?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
							</div>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}}%>
				
			</tbody>
		</table>
		<div class="d-flex py-3"><h3>Total Price: Rs. ${(total>0)?dcf.format(total):0} </h3> <a class="mx-3 btn btn-danger" href="cart-check-out">Check Out</a></div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>