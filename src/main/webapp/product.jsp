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
					<input type="search" id="search" placeholder="search" name="search">
				</form>
			</div>

			<ul class="main">
				<li class="down"><a class="hdg" href="home.jsp">Home
				</a></li>
				<li class="down"><a class="hdg" href="about.jsp">About</a></li>
				<%
				Boolean loggedIn = (Boolean) session.getAttribute("loggedInSuccess");
				if (loggedIn != null && loggedIn) {
				%>
				<li class="register"><a
					href="<%=request.getContextPath()%>/UpdateProfile">Profile</a></li>
				<%
				} else {
				%>
				<li id="profile-btn"><a href="signup.jsp">Sign-in</a></li>

				<%
				}
				%>
				<li><a class="login" href="seller.html">Seller</a></li>


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
				&#11088;&#11088;&#11088;&#11088;
				<%
				Boolean userloggedIn = (Boolean) session.getAttribute("loggedInSuccess");
				if (userloggedIn != null && userloggedIn) {
				%>
				
				<a href="productoutput.jsp?id=<%=product.getId()%>" class="buy-now">Buy Now</a>
					
					<%
				} else {
				%>
				<a href="signup.jsp" class="buy-now"
					onclick="showSignInPopup()">Buy Now</a>
					

				<%
				}
				%>
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
	<script>
		function showSignInPopup() {
			
			alert("You are not signed in. Please sign in to continue.");
		}
	</script>


</body>
</html>