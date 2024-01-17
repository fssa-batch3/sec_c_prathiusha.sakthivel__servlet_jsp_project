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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<body>



	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
			width="250px" alt="img">

		<div class="menu-bar">


			<ul class="main" style="position: relative; top: 50px; left: -200px">
				

				<li><a class="product" style="font-size: 25px;"
					href="AdminServlet">Products</a></li>
				<li><a class="down"
					style="font-size: 23px; position: relative; top: 2px;left: 30px;" 	href="productform.jsp"><i
						class="fa-solid fa-plus"
						style="font-size: 20px; color: white; position: relative; left: -10px; top: 2px;"></i>AddProduct</a></li>
						<a
					href="<%=request.getContextPath()%>/LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"
					style="position: relative; left: 120px; font-size: 23px;top:2px; color: white;"></i></a>

			</ul>

		</div>

	</header>

	<main>


		<!-- product container start -->

		<div class="product-list-container">
			<%
			List<Product> productList = (List<Product>) request.getAttribute("productList");

			if (productList != null && !productList.isEmpty()) {

				for (Product product : productList) {
			%>
			<div class="product-card">
				<a><img src="<%=product.getImageURL()%>">
					<p><%=product.getName()%></p></a>
				<p>
					&#8377;<%=product.getPrice()%></p>

				<a href="adminUpdate.jsp?id=<%=product.getId()%>&name=<%=product.getName() %>" class="buy-now">Details</a>


			</div>



			<%
			}
			} else {
			%>

			<img src="https://iili.io/JqH34oP.jpg" alt="Image Not Found"
				class="image-not-found">

			<%
			}
			%>
		</div>
		<!-- product container end -->
	</main>



</body>
</html>