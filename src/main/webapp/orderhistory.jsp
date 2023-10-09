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
				<input type="text" id="search" placeholder="search">
			</div>

			<ul class="main">
				<li class="down"><a class="hdg" href="./pages/home.jsp">Home
				</a></li>

				<li class="down"><a class="hdg" href="./pages/home.jsp">About</a>
				</li>

				<li><a class="hdg" href="./pages/seller.html">Seller</a></li>

			</ul>
		</div>

	</header>

	<main>
		<%
		ArrayList<Order> orderDetails = (ArrayList<Order>) request.getAttribute("orderDetails");
		System.out.print(orderDetails.size() + "got");

		Product product2 = new Product();

		for (Order order : orderDetails) {

			for (OrderedProduct product : order.getOrderedProducts()) {

				Product product1 = ProductDAO.getProductById(product.getProductId());
				int val = product.getStatus();
				Logger.info(("val: " + val));
				if (1 == val) {
		%>

		<!-- This is order history -->
		<div id="order_history" class="display_cls">

			<div class="order-his">
				<div class="or-contain">
					<div class="order-pic">
						<img id="order-image1" src="<%=product1.getImageURL()%>">
					</div>
					<div class="order-ditail">
						<h4 id="order-name">Product Name:</h4>
					
						<h4 id="order-name"><%=product.getProductname()%></h4>

					</div>
					<div class="order-price">
						<h4 id="order-name">Total Price:</h4>
						<h4 id="order-price"><%=product.getTotalAmount()%></h4>
					</div>
					<div class="oeder-address">
						<h4 id="order-name">Product Quantity:</h4>
						<h4 id="order-price"><%=product.getQuantity()%></h4>

					</div>
					<div class="button">
						<form
							action="<%=request.getContextPath()%>/CancelOrder?orderId=<%=order.getOrder_id()%>"
							method="post">

							<button type="submit"
								style="border: 2px solid #6c9135; height: 30px; width: 150px; background-color: #6c9135; color: white; margin-left: -100px">
								Cancel Order</button>
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
		}, 1000);//code will excute after 1 second because of the setTimeout func()
		
	<%}%>
	
	</script>



</body>
</html>