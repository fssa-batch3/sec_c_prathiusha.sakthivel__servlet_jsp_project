<!DOCTYPE html>

<%@page import="com.fssa.greenfarm.logger.Logger"%>
<%@page import="com.fssa.greenfarm.model.OrderedProduct"%>
<%@ page import="com.fssa.greenfarm.model.Order"%>
<%@ page import="com.fssa.greenfarm.model.Product"%>
<%@ page import="com.fssa.greenfarm.model.User"%>
<%@ page import="com.fssa.greenfarm.service.OrderedProductService"%>
<%@ page import="com.fssa.greenfarm.DAO.ProductDAO"%>
<%@ page import="com.fssa.greenfarm.DAO.UserDAO"%>
<%@page import="java.util.ArrayList"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>order history</title>
<link rel="stylesheet" href="./assets/css/orderhistory.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<style>
body {
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS',
		sans-serif;
}

#order-history {
	height: auto;
	width: auto;
	border: #000000e9 solid 2px;
}

#order-history h1 {
	text-align: center;
}

.order-his {
	margin-top: 4%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.or-contain {
	width: 1200px;
	display: flex;
	background-color: white;
	box-shadow: 2px 2px 6px rgba(162, 157, 157, 0.753);
	border-radius: 6px;
	padding: 5px 30px;
	margin-left: 50px;
	margin-top: 5%;
	justify-content: space-between;
	align-items: center;
	border-left: #6c9135 solid 10px;
	/* border-right: #a576f5 solid 10px; */
	/* align-items:normal; */
}

.oeder-address {
	width: 300px;
	height: auto;
	padding: 20px;
	/* border: #000000e9 solid 2px; */
}

#pincode {
	font-weight: 600;
}

.or-contain img {
	padding: 10px;
	height: 150px;
	width: 150px;
}

.order-dtitail {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.order-dtitail h4 {
	width: 200px;
	border: #000000e9 solid 2px;
}
/* This is user container */
#profile-page {
	margin-top: 5%;
}

.user-container {
	margin-top: 5px;
	min-height: calc(100vh - 90px);
}
</style>
</head>
<body>
	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
			width="250px" alt="img">

		<div class="menu-bar">
			<div class="search_box">
				<input type="text" id="search" placeholder="search here...."
					style="height: 30px; width: 200px; position: relative; left: -60px">
			</div>

			<ul class="main" style="position: relative; left: -100px">
				<li class="down"><a class="hdg" href="home.jsp">Home </a></li>

				<li class="down"><a class="hdg" href="about.jsp">About</a></li>
				<li><a class="product" style="font-size: 25px;"
					href="http://localhost:8080/greenfarm-web/GetAllProductDetailsServlet">Products</a>
				</li>

				<li><a class="hdg"
					href="<%=request.getContextPath()%>/UpdateProfile">Profile</a></li>
						<a
					href="<%=request.getContextPath()%>/LogoutServlet"><i class="fa-solid fa-power-off"
					style="position: relative; left: 40px; font-size: 23px;top:-40px; color: white;"></i></a>

			</ul>
		</div>

	</header>

	<main>
		<%
		ArrayList<Order> orderDetails = (ArrayList<Order>) request.getAttribute("orderDetails");
		System.out.print(orderDetails + "got");

		Product product2 = new Product();
		boolean isCartEmpty = orderDetails == null || orderDetails.isEmpty();

		if (isCartEmpty) {
		%>
		<!-- Display this image when the cart is empty -->
		<img src="https://iili.io/JKRDEu9.jpg" alt="Empty Cart"
			id="emptyCartImage"
			style="display: block; margin-top: 200px; margin-left: 250px; height: 500px;">

		<button
			style="border: 2px solid #6c9135; height: 30px; width: 180px; background-color: #6c9135; color: white; margin-left: 650px">
			<a href="home.jsp" style="text-decoration: none; color: white;">Back</a>
		</button>
		<%
		} else {
		for (Order order : orderDetails) {

			for (OrderedProduct product : order.getOrderedProducts()) {

				Product product1 = ProductDAO.getProductById(product.getProductId());
		%>

		<!-- This is order history -->
		<div id="order_history" class="display_cls">

			<div class="order-his">
				<div class="or-contain">
					<div class="order-pic">
						<img id="order-image1" src="<%=product1.getImageURL()%>">
					</div>
					<div class="order-ditail">
						<h4 id="order-name">Product:</h4>

						<h4 id="order-name"><%=product.getProductname()%></h4>

					</div>
					<div class="order-price">
						<h4 id="order-name">Total Price:</h4>
						<h4 id="order-price">
							&#8377;<%=product.getTotalAmount()%></h4>
					</div>
					<div class="oeder-address">
						<h4 id="order-name"> Quantity:</h4>
						<h4 id="order-price">
							<%
							double quantity = product.getQuantity();
							if (quantity < 1000) {
								out.print(quantity + " g");
							} else {
								out.print((quantity / 1000) + " kg");
							}
							%>
						</h4>
						<div>
						<h4>Ordered Date</h4>
						<h4><%=order.getOrderdate().toString()%></h4>
						</div>

					</div>
					<div class="button">



						<%
						if (product.getStatus() == 1) {
						%>
						<form
							action="<%=request.getContextPath()%>/CancelOrder?orderId=<%=order.getOrder_id()%>"
							method="post">

							<button type="submit"
								style="border: 2px solid #6c9135; height: 30px; width: 150px; background-color: #6c9135; color: white; margin-left: -100px"
								id="cancelButton">cancel order</button>

						</form>

						<%
						} else {
						%>
						<form
							action="<%=request.getContextPath()%>/CancelOrder?orderId=<%=order.getOrder_id()%>"
							method="post">
							<button type="submit"
								style="border: 2px solid red; height: 30px; width: 150px; background-color: red; color: white; margin-left: -100px"
								id="cancelButton">Cancelled</button>
							<%
							}
							%>

						</form>

					</div>
				</div>
			</div>
		</div>
		<%
		}
		}
		}
		%>


	</main>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
	
	<%String errorMsg = (String) request.getAttribute("success");

if (errorMsg != null) {%>
		
		<%System.out.print(errorMsg + "inside");%>
		
		swal("Success!","<%=errorMsg%>", "success");
		
		setTimeout(() => {
			console.log("df");
			window.location.href="OrderHistoryServlet";
		}, 1000);//after one second the msg will come
	<%}%>
	</script>



</body>
</html>