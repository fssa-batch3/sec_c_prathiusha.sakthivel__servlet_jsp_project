<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/home.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">

</head>
<body>
	<!--   header -->
	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="70px"
			width="150px" alt="img">

		<div class="menu-bar">

			<div class="main">
				<a href="#">Home </a> <a class="about" href="../pages/about.jsp">About
				</a>

				<div class="dropdown">

					<a class="product" href="#">Products</a>

					<div class="dropdown-content">
						<button>
							<a href="http://localhost:8080/greenfarm-web/GetAllProductDetailsServlet">Vegetables</a>
						</button>
						<a class="fruits" href="#">Fruits</a>
					</div>
				</div>

				<a class="login" href="../pages/seller.html">Seller</a>




				<%
				Boolean loggedIn = (Boolean) session.getAttribute("loggedInSuccess");
				if (loggedIn != null && loggedIn) {
				%>
				<li class="register"><a href="<%=request.getContextPath()%>/UpdateProfile">Profile</a></li>
				
				<a href="<%=request.getContextPath()%>/OrderHistoryServlet"> <i id="icon"
					class="fa-sharp fa-solid fa-bars"></i>
				<%
				} else {
				%>
				<li id="profile-btn"><a href="../signup.jsp">Sign-in</a></li>

				<%
				}
				%>
				

			</div>
		</div>

	</header>
	<main>

		<div class="img1">
			<p class="para">
				We Supply Organic<br>Fruits and Vegetables
			</p>
			<%
				Boolean userloggedIn = (Boolean) session.getAttribute("loggedInSuccess");
				if (userloggedIn != null && userloggedIn) {
				%>
				
			<a class="shop"
				href="http://localhost:8080/greenfarm-web/GetAllProductDetailsServlet">Shop
				Now</a>
					
					<%
				} else {
				%>
				<a class="shop"
				href="http://localhost:8080/greenfarm-web/GetAllProductDetailsServlet" onclick="showSignInPopup()">Shop
				Now</a>

				<%
				}
				%>
			
			<div class="bor">
				<img src="https://iili.io/J9EoMvt.jpg" height="80px" width="80px"
					alt="img"> <img src="https://iili.io/J9Eo4wu.jpg"
					height="80px" width="90px" alt="img"> <img
					src="https://iili.io/J9EosMx.jpg" height="80px" width="90px"
					alt="img"> <img src="https://iili.io/J9Exots.jpg"
					height="80px" width="90px" alt="img"> <img
					src="https://iili.io/J9ExRl2.jpg" height="80px" width="90px"
					alt="img"> <img src="https://iili.io/J9ExEVj.jpg"
					height="80px" width="90px" alt="img"> <img
					src="https://iili.io/J9Exglp.jpg" height="90px" width="90px"
					alt="img"> <img src="https://iili.io/J9ExiOX.png"
					height="80px" width="90px" alt="img"> <img
					src="https://iili.io/J9ExQxs.jpg" height="80px" width="90px"
					alt="img"> <img src="https://iili.io/J9Ezqqx.jpg"
					height="80px" width="90px" alt="img"> <img
					src="https://iili.io/J9EzRLJ.jpg" height="90px" width="100px"
					alt="img"> <img src="https://iili.io/J9EzldN.jpg"
					height="80px" width="100px" alt="img">
			</div>

		</div>
		<!-- freshvegetables -->
		<div class="bg">
			<div class="mainpage2">

				<div class="mpage1">

					<img class="p2" src="https://iili.io/J9EI5u9.jpg" height="300px"
						width="450px" alt="img">
					<div class="page2">
						<p class="fv">
							FRESH<br> VEGETABLES
						</p>
						<p>
							<a class="but" href="./home.jsp">View More</a>
						</p>
					</div>
				</div>
			</div>

			<!-- freshfruits -->
			<div class="mainpage3">
				<div class="mpage2">
					<img class="p3" src="https://iili.io/J9EId2p.jpg" height="300px"
						width="450px" alt="img">
					<div class="page3">
						<p class="ff">
							FRESH<br>FRUITS
						</p>
						<p>
							<a class="but1" href="./home.jsp">View More</a>
						</p>
					</div>
				</div>
			</div>
		</div>

		<!-- features -->
		<div class="features">
			<div class="box">
				<img class="vegimg" src="https://iili.io/J9ET2Pj.jpg" height="420px"
					width="300px" alt="img">
				<h2 class="heading2">
					The Future of Food is Fast,<br>Fresh & Sustainable at
					Greenfarm.
				</h2>
				<p class="heading3">
					We are on cusp of new agricultural revolution<br> that will
					likely reshape the way we farm, ship and<br> consume food.
				</p>
				<div class="boxes">
					<div class="box1">
						<img class="featurebox1" src="https://iili.io/J9ETNO7.png"
							alt="img"> <img class="featurebox2"
							src="https://iili.io/J9EuP4f.png" alt="img">
					</div>
					<div class="box2">
						<img class="featurebox3" src="https://iili.io/J9EAH4j.png"
							alt="img"> <img class="featurebox4"
							src="https://iili.io/J9EAcnn.png" alt="img">
					</div>

				</div>
			</div>
		</div>

		<!-- discount -->
		<div class="background1">
			<h1>
				DISCOUNT<br> OF 25% OFF<br> FOR YOUR<br> FIRST <br>PURCHASE
			</h1>
			<div class="borderofbox">
				<!-- <p>Send Your Feedback</p> -->
				<img class="feedback" src="https://iili.io/J9EAOMu.jpg" alt="image">
				<form onsubmit="sendEmail(); reset(); return false;"
					id="feedback_form">
					<label> <input id="name" type="text" placeholder="Name..">
					</label> <br> <label> <input id="email" type="email"
						placeholder="Email..">
					</label> <br>
					<textarea id="message" cols="30" rows="3"
						placeholder="Your Feedback .."></textarea>
					<br>
					<button id="send">Send</button>

				</form>
			</div>

		</div>

		<!-- slider -->

		<div id="slider">
			<figure>
				<img src="https://iili.io/J9ERaRV.jpg" alt="no error img">
				<img src="https://iili.io/J9ERfS4.jpg" alt="no error img">
				<img src="https://iili.io/J9ERwRp.jpg" alt="no error img">
				<img src="https://iili.io/J9E57Bn.jpg" alt="no error img">
			</figure>
		</div>
	</main>

	<!-- slider ends -->

	<!-- footer -->
	<footer>

		<div class="footer">

			<div class="footer1">

				<div class="footerone">
					<img class="footlogo" src="https://iili.io/Hy3dOH7.png"
						width="140px" alt="img">

				</div>

				<div class="footerone">
					<p>Home</p>
				</div>

				<div class="footerone">
					<p>About</p>
				</div>

				<div class="footerone">
					<p>Contact</p>
				</div>

				<div class="footerone">
					<p>Pricing</p>
				</div>

			</div>

			<!-- footer two -->

			<div class="footer2">

				<div class="footertwo">

					<i class="fa-solid fa-location-dot"></i>

					<p>Dubai 123 South Street</p>

				</div>

				<div class="footertwo">

					<i class="fa-solid fa-phone"></i>
					<p>+1234567890</p>
				</div>

				<div class="footertwo">
					<i class="fa-solid fa-envelope"></i>
					<p>Randy@90gmail.com</p>
				</div>

			</div>

			<div class="footerthird">
				<h3>About Us</h3>
				<p>
					We supply organic fruits<br> and vegetables at a fair <br>
					price to everyone.
				</p>
				<i class="fa-brands fa-facebook"></i> <i
					class="fa-brands fa-whatsapp"></i> <i
					class="fa-brands fa-instagram"></i> <i class="fa-brands fa-twitter"></i>
				<p></p>
			</div>

			<!-- footer ends -->

		</div>
		<div class="foot"></div>

	</footer>

	<script>
		function showSignInPopup() {
			
			alert("You are not signed in. Please sign in to continue.");
		}
	</script>

</body>
</html>