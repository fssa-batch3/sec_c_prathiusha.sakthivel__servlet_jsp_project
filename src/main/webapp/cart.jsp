<!DOCTYPE html>
<%@page import="com.fssa.greenfarm.DAO.ProductDAO"%>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="assets/css/cart.css">
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fssa.greenfarm.model.*"%>
<%@ page import="com.fssa.greenfarm.service.ProductService"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="com.fssa.greenfarm.model.*"%>


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
				<li class="down"><a class="hdg" href="home.jsp"
					style="font-size: 25px;">Home </a></li>


				<li><a class="hdg" href="profilepage.jsp"
					style="font-size: 25px;">Profile</a></li>
				<li><a class="product"
					style="position: relative; left: -25px; font-size: 24px;"
					href="<%=request.getContextPath()%>/GetAllProductDetailsServlet"
					style="font-size: 25px;">Products</a></li>
				<a href="<%=request.getContextPath()%>/LogoutServlet"><i
					class="fa-solid fa-arrow-right-from-bracket"
					style="position: relative; font-size: 23px; top: 2px; color: white;"></i></a>
				</li>
			</ul>

		</div>

	</header>
<body>
	<%
	int count_1 = 0;
	ArrayList<CartItems> cartDetails = (ArrayList<CartItems>) request.getAttribute("CartItemsDetails");
	System.out.println(cartDetails);
	%>

	<div class="main_container">
		<%
		if (cartDetails.isEmpty()) {
		%>
		<!-- Display this image when the cart is empty -->
		<img src="https://iili.io/J7WC2K7.png" alt="Empty Cart Image"
			class="empty-cart-image"
			style="margin-left: 250px; height: 800px; width: 1000px; margin-top: -100px;">
		<p
			style="position: relative; left: 590px; font-size: 40px; top: -160px; color: grey;">Your
			Cart is Empty</p>
		<%
		} else {
		%>

		<div class="container">

			<div class="cart">

				<div class="top">
					<h2>Shopping Cart</h2>
				</div>
				<table cellspacing="0" class="table-head">
					<tr>
						<th width="210" class="head-img"
							style="position: relative; left: 90px;">Image</th>
						<th width="360" class="head-img"
							style="position: relative; left: 90px;">Name</th>
						<th width="150" class="head-img"
							style="position: relative; left: -90px;">Price</th>
						<th width="150" class="head-img"
							style="position: relative; left: -30px;">Quantity</th>
						<th width="150" class="head-img"
							style="position: relative; left: 50px;">Remove</th>
					</tr>
				</table>
				<table id="root" cellspacing="0"></table>

				<%
				Product product = null;
				for (CartItems cart : cartDetails) {

					product = ProductDAO.getProductById(cart.getProduct_id());
				%>
				<div class="product_image">
					<input type="checkbox" id="<%=cart.getCart_id()%>"
						style="position: relative; left: 30px; height: 50px; width: 20px; top: -20px;"
						class="checkbox"> <img class="img-box"
						src="<%=product.getImageURL()%>"
						style="position: relative; left: 50px;">
					<p class="title" style="position: relative; left: 230px;"><%=product.getName()%></p>
					<p class="price" style="position: relative; left: 470px;">
						&#8377;<%=cart.getTotalprice()%></p>
					<p class="price"
						style="position: relative; left: 670px; top: -99px;">
						<%
						float quantity = cart.getQuantity();
						if (quantity < 1000) {
							out.print(quantity + " g");
						} else {
							out.print((quantity / 1000) + " kg");
						}
						%>
					</p>


					<button style="position: relative; left: 810px; top: -130px;"
						key="<%=cart.getCart_id()%>" class="removeButton" type="button">Remove</button>


				</div>
				<hr>
				<%
				}
				%>
			</div>


			<div class="summary">
				<%
				for (CartItems carts : cartDetails) {
					count_1 += carts.getTotalprice();
				}
				%>

				<div class="top">
					<h2>Order Details</h2>
				</div>

				<div class="detail"></div>
				<div style="margin-top: 30px; padding: 0 30px;">

					<h2>Delivery</h2>
					<input value="Free deilivery" id="promoCode" readonly>

				</div>
				<hr>
				<div class="top">
					<h2 style="position: relative; left: 23px;">Total Amount:</h2>
					<h2 style="position: relative; left: -30px;id="totalB">
						&#8377;
						<%=count_1%></h2>
				</div>
				<div style="padding: 0 10px; margin-bottom: 20px;">
					<button class="checkout" id="checkoutButton" type="button">Check
						out</button>

				</div>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<script type="text/javascript" src="assets/js/cart.js"></script>


</body>

</html>