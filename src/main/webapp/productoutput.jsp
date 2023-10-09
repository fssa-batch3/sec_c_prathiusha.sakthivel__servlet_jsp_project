<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.greenfarm.model.Product" %>
<%@ page import="com.fssa.greenfarm.service.ProductService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/productoutput.css">

</head>

<header>

	<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
		width="250px" alt="img">

	<div class="menu-bar">

		<ul class="main">
			<li class="down"><a class="hdg" href="home.jsp">Home </a></li>
			<li class="down"><a class="hdg" href="about.jsp">About</a>

			</li>
				<li><a class="hdg" href="<%=request.getContextPath()%>/UpdateProfile" >Profile</a></li>
		
		</ul>
	</div>
</header>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	Product product = null;
	try {
	    product = ProductService.readProduct(id);
	} catch (SQLException e) {
		System.out.print("failed");
	    e.printStackTrace();
	}
	
	
	%>

	<p><%=id%></p>
	<div class="box">
		
		<img class="offimg" src="https://iili.io/HyEi1qJ.png"> 
		<img class="tomato" src="<%= product.getImageURL()%>">
		<div class="heading1">
			<h2 id="name_of_product"><%= product.getName() %></h2>
			<h3 id="gram" class="gramquantity">Quantity:200g</h3>
			<h4 id="quantity_of_product">Price: <%= product.getPrice() %></h4>
			<button class="btn1 btn-decrement" id="decrement">-</button>
			<input class="btn-input" data-keyword=<%= product.getPrice()%> id="quantity" type="text"
				value="1" >
			<button id="increment" class="btn1 btn-increment">+</button>
			<div class="product-ratings"></div>
			<div class="btn"></div>
			<p class="description">Description: <%=product.getDescription() %></p>
			<!--  <button id="cartbutton">
				<a href="pages/cart.jsp?id=<%=product.getId()%>" id="add-to-cart">Add to Cart</a>
			</button>-->
			<button id="buybutton" >
			Buy Now
				<!-- <a href="payment.jsp?id=<%=product.getId()%>">Buy Now</a> -->
			</button>
		</div>
	
	</div>
	
	<script type="text/javascript" src="assets/js/productoutput.js"></script>
</body>

</html>