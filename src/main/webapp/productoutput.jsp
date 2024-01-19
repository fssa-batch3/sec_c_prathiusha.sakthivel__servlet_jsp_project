<%@page import="com.fssa.greenfarm.productform"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.greenfarm.model.Product"%>
<%@ page import="com.fssa.greenfarm.service.ProductService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/productoutput.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">


</head>

<header>

	<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
		width="250px" alt="img">

	<div class="menu-bar">

		<ul class="main">
			<li class="down"><a class="hdg" href="home.jsp">Home </a></li>
			<li><a class="product"
				style="position: relative; left: -25px; font-size: 24px;"
				href="<%=request.getContextPath()%>/GetAllProductDetailsServlet">Products</a>

			</li>
			<li style="position: relative; left: -35px;"><a class="hdg"
				href="<%=request.getContextPath()%>/UpdateProfile">Profile</a></li>
			<li ><a style="font-size: 25px; color: white; font-weight: bold;position: relative; left: -45px;"
				href="<%=request.getContextPath()%>/CartItemsDetails">Cart</a></li>


			<a href="<%=request.getContextPath()%>/LogoutServlet"><i
				class="fa-solid fa-arrow-right-from-bracket"
				style="position: relative; left: -50px; font-size: 23px; top: 2px; color: white;"></i></a>

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

		<img class="tomato" src="<%=product.getImageURL()%>">
		<div class="heading1">
			<h2 id="name_of_product" style="position: relative; top: 150px;"><%=product.getName()%></h2>
			<h4 id="quantity_of_product" style="position: relative; top: 160px">
				Price:
				<%=product.getPrice()%></h4>
			<h4 style="position: relative; left: 160px; top: 85px">Per Kg</h4>
			<h3 style="position: relative; top: 80px;">Quantity:</h3>
			<button class="btn1 btn-decrement" id="decrement"
				style="position: relative; top: 5px; left: 120px">-</button>
			<h3 id="gram" class="gramquantity"
				style="position: relative; left: 250px; top: -50px;">250g</h3>
			<button id="increment" class="btn1 btn-increment"
				style="position: relative; left: 320px; top: -130px">+</button>

			<div class="product-ratings"></div>
			<div class="btn"></div>
			<p class="description">
				Description:
				<%=product.getDescription()%></p>
			<button id="cartbutton" type="button">Add to Cart</button>
			<button id="buybutton" type="button"
				style="position: relative; left: -300px;">Buy Now</button>
		</div>

	</div>

	<script type="text/javascript" src="assets/js/productoutput.js"></script>
</body>

</html>