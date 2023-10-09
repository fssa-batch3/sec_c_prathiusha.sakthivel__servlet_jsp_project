<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../assets/css/cart.css">

<%@ page import="com.fssa.greenfarm.model.Product" %>
<%@ page import="com.fssa.greenfarm.service.ProductService" %>
<%@page import="java.sql.SQLException"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<title>Addtocart</title>
</head>
<body>
	<!-- header -->
	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
			width="250px" alt="img">

		<div class="menu-bar">

			<ul class="main">
				<li class="down"><a class="hdg" href="../pages/home.html">Home
				</a></li>
				<li class="down"><a class="hdg" href="../html/about.html">About</a>

				</li>

				<li><a class="hdg" href="../html/profilepage.html">Profile</a>
				</li>

			</ul>

		</div>

	</header>
	<body>
	
			<%
				int id = Integer.parseInt(request.getParameter("id"));
				Product product = null;
				try {
					product = ProductService.readProduct(id);
					System.out.print(product.getName());
				} catch (SQLException e) {
					System.out.print("failed");
					e.printStackTrace();
				}
				%>


				<p><%=id%></p>
	<div class="main_container">
		<div class="get">
			<p>Your Cart is Empty</p>
		</div>

		<div class="container">
			<div class="cart">
				<div class="top">
					<h2>Shopping Cart</h2>
					<h2 id="itemA">4 Items</h2>
				</div>
				<table cellspacing="0" class="table-head">
					<tr>
						<th width="210" class="head-img">Image</th>
						<th width="360" class="head-img">Name</th>
						<th width="150" class="head-img">Price</th>
						<th width="150" class="head-img">Quantity</th>
						<th width="150" class="head-img">Delete</th>
					</tr>
				</table>
				<table id="root" cellspacing="0"></table>
		
				<div class="product_image">
					<img class="img-box" src="<%= product.getImageURL()%>">
					<p class="title"><%= product.getName()%></p>
					<p class="price"><%= product.getPrice()%></p>
					<p class="quantity">250g</p>
					<div class="input_div">
						<button class="btn1 btn-decrement">-</button>
						<input class="btn-input" id="quantity" type="text" value="1">
						<button class="btn1 btn-increment">+</button>
					</div>
					<div class="total-amount"></div>
					<i id="bin-icon" class="fa-solid fa-trash"
						style="margin-left: -50px"></i>

				</div>
				<hr>
			</div>
			<div class="summary">
				<div class="top">
					<h2>Order Summary</h2>
				</div>

				<div class="detail"></div>
				<div style="margin-top: 30px; padding: 0 30px;">
					<h2>Shipping</h2>
					<input type="text" placeholder="standard deilivery">
					<h2>Mobile Number</h2>
					<input type="text" placeholder="Enter Your Mobile number"
						id="promoCode">
					<button class="first-btn" id="promo" onclick="promo()">Edit</button>
					<button class="first-btn" id="promo" onclick="promo()">Apply</button>
				</div>
				<hr>
				<div class="top">
					<h2>Total</h2>
					<h2 id="totalB">₹ 30</h2>
				</div>
				<div style="padding: 0 10px; margin-bottom: 20px;">
					<button class="checkout">Check out</button>

				</div>
			</div>
		</div>

	</div>

</body>

</html>