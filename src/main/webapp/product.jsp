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
			<div class="search_box">
				<form action="searchproductbyname" method="GET">
					<input type="search" id="search" placeholder="Search here...."
						name="search" style="position: relative; top: 30px;">
				</form>
			</div>

			<ul class="main">
				<li class="down"><a class="hdg" href="home.jsp">Home </a></li>
				<%
				Boolean loggedIn = (Boolean) session.getAttribute("loggedInSuccess");
				if (loggedIn != null && loggedIn) {
				%>
				<li class="register" style="font-size: 25px"><a
					href="<%=request.getContextPath()%>/UpdateProfile">Profile</a></li>
					<li style="font-size: 25px;color: white;font-weight: bold;"><a href="<%=request.getContextPath()%>/CartItemsDetails">Cart</a></li>
				<a href="<%=request.getContextPath()%>/LogoutServlet"><i
					class="fa-solid fa-arrow-right-from-bracket"
					style="position: relative; left: 40px; font-size: 23px; top: 2px; color: white;"></i></a>
				<%
				} else {
				%>
				<li id="profile-btn"><a href="signup.jsp">Sign-in</a></li>

				<%
				}
				%>


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

				<%
				Boolean userloggedIn = (Boolean) session.getAttribute("loggedInSuccess");
				if (userloggedIn != null && userloggedIn) {
				%>

				<a href="productoutput.jsp?id=<%=product.getId()%>" class="buy-now">Buy
					Now</a>

				<%
				} else {
				%>
				<a href="signup.jsp" class="buy-now" onclick="showSignInPopup()">Buy
					Now</a>


				<%
				}
				%>
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
	<script>
		function showSignInPopup() {

			alert("You are not signed in. Please sign in to continue.");
		}
	</script>


</body>
</html>