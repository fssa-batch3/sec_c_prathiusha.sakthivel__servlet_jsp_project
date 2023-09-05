<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.greenfarm.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/product.css">
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
				<li class="down"><a class="hdg" href="/">Home </a></li>
				<li class="down"><a class="hdg" href="/html/about">About</a></li>
				<li><a class="hdg" href="/html/profilepage">Profile</a></li>

			</ul>

		</div>

	</header>

	<main>


		<!-- product container start -->

		<div class="product-list-container">
			<%
			List<Product> productList = (List<Product>) request.getAttribute("productList");

			if (productList != null) {

				for (Product product : productList) {
					
			%>
			<div class="product-card">
				<a><img src="<%=product.getImageURL()%>">
					<p><%=product.getName()%></p></a>
				<p>
					&#8377;<%=product.getPrice()%></p>
				&#11088;&#11088;&#11088;&#11088;<a
					href="productoutput.jsp?id=<%=product.getId()%>" class="buy-now">Buy
					Now</a>
			</div>
			<%
			}
			} else {
			%>
			<%
			String errorMessage = "Product Not Found";
			%>
			<p><%=errorMessage%></p>
			<%
			}
			%>
		</div>
		<!-- product container end -->
	</main>


</body>
</html>