<!DOCTYPE html>

<%@page import="com.fssa.greenfarm.model.OrderedProduct"%>
<%@ page import="com.fssa.greenfarm.model.Order"%>
<%@ page import="com.fssa.greenfarm.model.Product"%>
<%@ page import="com.fssa.greenfarm.service.OrderedProductService"%>
<%@ page import="com.fssa.greenfarm.DAO.ProductDAO"%>
<%@page import="java.util.ArrayList"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>order history</title>
<link rel="stylesheet" href="../assets/css/orderhistory.css">
</head>
<body>
	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
			width="250px" alt="img">

		<div class="menu-bar">
			<div class="search_box">
				<input type="text" id="search" placeholder="search">
			</div>

			<ul class="main">
				<li class="down"><a class="hdg" href="../index.html">Home </a>
				</li>

				<li class="down"><a class="hdg" href="../html/about.html">About</a>
				</li>

				<li><a class="hdg" href="../html/sellerpage.html">Seller</a></li>

			</ul>
		</div>
	</header>

	<main>
		<%
		ArrayList<Order> orderDetails = (ArrayList<Order>) request.getAttribute("orderDetails");
		System.out.print(orderDetails.get(0) + "got");
	
		for (Order order : orderDetails) {

			for (OrderedProduct product : order.getOrderedProducts()) {

				Product product1 = ProductDAO.getProductById(product.getProductId());
		%>
		<!-- borderbox -->
		<h1>Purchase History</h1>

		<div class="outer_div" id="outer_div">
			<div class="get">
				<p>Your Order is Empty</p>
			</div>
			<div class="borderbox">

				<div class="tomato">
					<img class="tomato1" src="https://iili.io/JJfMgef.jpg" alt="img">
					<h2><%=product.getProductname()%></h2>
					<h3><%=product.getProductPrice()%></h3>
					<h4><%=product.getQuantity()%></h4>

				</div>

				<div class="price">
					<h2 id="product">Price Details:-</h2>
					<div class="order">
						<p id="order">Order Price : &#8377;<%=product.getProductPrice() %></p>
						<p id="total_count1">Total:<%=product.getTotalAmount()%></p>
					</div>

					<div class="cancel">
						<button id="cancelbutton">Cancel Order</button>
					</div>

				</div>

			</div>
			<%
			}
			}
			%>
			<div class="profile_box">
				<div class="profile_image">
					<img id="user_profile" src="https://iili.io/JJfVME7.jpg"
						alt="profile image">
					<p id="user_name">Prathiusha Sakthivel</p>
				</div>
				<div class="details">
					<div class="email">
						<p>Email</p>
						<p>prathiusha@gmail.com</p>
					</div>
					<div class="address">
						<p>Address</p>
						<p>1/243-KKR nagar,Main road,chennai.</p>
					</div>
					<div class="phone">
						<p>Phone</p>
						<p>9876543210</p>
					</div>
				</div>

			</div>

		</div>
	</main>


</body>
</html>