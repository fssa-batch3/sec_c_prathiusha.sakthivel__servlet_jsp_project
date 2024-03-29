<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/about.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">


</head>
<body>
	<!-- header -->
	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
			width="250px" alt="img">

		<div class="menu-bar">

			<div class="main">
				<a href="home.jsp">Home </a>
			<a class="about" href="./about.jsp">About
				</a>
					<a class="product" href="<%=request.getContextPath()%>/GetAllProductDetailsServlet">Products</a>

		
		
		
				<%
				Boolean loggedIn = (Boolean) session.getAttribute("loggedInSuccess");
				if (loggedIn != null && loggedIn) {
				%>
				<li class="register"><a href="<%=request.getContextPath()%>/UpdateProfile">Profile</a></li>
							<a
					href="<%=request.getContextPath()%>/LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"
					style="position: relative; left: 5px; font-size: 23px; color: white;"></i></a>
				<%
				} else {
				%>
				<li id="profile-btn"><a href="signup.jsp">Sign-in</a></li>

				<%
				}
				%>
				

			</div>
		</div>

	</header>
	<!-- content -->
	<main>
		<div class="container">
			<div class="heading">
				<img class="heading1img" src="https://iili.io/JRUDZzl.jpg"
					height="200px" width="300px" alt="img">
				<p class="para1">
					Your rooftop farm can provide you nutritious food throughout the
					year. A wide range of fruits<br> and vegetables like spinach,
					cucurbits, cauliflower, citrus, tomatoes, garlic, onions, guava,<br>
					strawberries, and spices can be grown on vacant spaces on the
					rooftops. It could cut down<br> your grocery bills by a
					significant amount, depending on how much you can produce.
				</p>
			</div>
		</div>
		<!-- benefits -->
		<div class="benefits">
			<h2>Benefits of Terrace Garden</h2>
			<div class="sub-benefit1">
				<div class="benefit1">
					<h3>Supply Of Nutritious Greens</h3>
					<br> <br>
					<p>The food that we source from markets and grocery stores are
						usually grown with the help of chemical fertilizers. This chemical
						then seeps into your food system and can eventually lead to health
						hazards. Growing your own food will help you ensure the good
						quality of food that you consume on the daily basis.</p>
				</div>
				<div class="benefit2">
					<h3>Ace Your Space</h3>
					<br> <br>
					<p>Building a terrace garden helps in keeping your home cool,
						it is great for the people living in tropical areas. All the
						plants growing on your terrace will create a micro-environment and
						will lower the temperature of the place. So while you enjoy the
						wholesome home-grown food you also save up on big bills from ACs.</p>
				</div>
				<div class="benefit3">
					<h3>Reduces Your Carbon Footprint</h3>
					<br> <br>
					<p>By building a garden at your home you will help the
						environment and reduce your carbon footprint. The plants that you
						grow will improve air quality. Farming done using chemical
						materials deteriorates the soil quality and pollutes air and
						water.</p>
				</div>
			</div>
			<div class="sub-benefit2">

				<div class="benefit4">
					<h3>Stay Connected With Nature</h3>
					<br> <br>
					<p>Having your terrace garden gives you access to nature 24*7.
						As they say, “Nature is man’s best friend”. It keeps you
						disconnected from all the stress and chaos of the world. Having
						your own terrace garden means having access to your peaceful
						corner at all times.</p>
				</div>
				<div class="benefit5">
					<h3>Helps You Stay Fit</h3>
					<br> <br>
					<p>Gardening is always a great exercise, the number of efforts
						you will put into maintaining your garden will help you stay fit
						and active. Taking care of your plants, watering them, and other
						activities will keep you physically active and away from your
						everyday boring exercising routine.</p>
				</div>
			</div>
		</div>
		<!-- preparation -->
		<div class="preparation">
			<div class="tool">
				<h2 class="toolheading">How you want to do Roof Farming?</h2>
				<div class="toolparts">
					<h3 class="required">Tools Required</h3>
					<img src="https://iili.io/JRUDp19.jpg" height="200px" width="250px"
						alt="img">
					<ul>
						<li>Trowel</li>
						<li>Hose Pipe Or Watering Can</li>
						<li>Shovel</li>
						<li>Gardening Rake</li>
						<li>Pruning Scissor</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- soil preparation -->
		<div class="soil">
			<h1>Soil Preparation</h1>
			<img class="soilimg" src="https://iili.io/JRUb2mx.jpg" width="450px"
				height="250px" alt="img">
			<p class="soilpara">
				Healthy soil leads to healthy plants! Soil that is properly
				nourished and conditioned is the key to growing proper plants.
				Create your potting mixture by mixing soil<br> with organic
				compost. The ideal soil for your terrace garden should neither be
				too compacted nor too light. The soil should have a balanced
				texture, crumbly soil<br> that can retain the moisture is good
				for the plants.
			</p>
			<br>

			<p class="soilpara">
				Feed your soil with organic compost regularly. The important
				nutrients can get washed away from your rooftop garden soil with the
				rains. Therefore, it is necessary to <br>fertilize them for a
				good yield. Avoid using chemical fertilizers as it will not only
				seep into your system but it will also harm the good bacterias and
				microbes in your soil.
			</p>
			<br>

			<p class="soilpara">
				Prepare your potting mix by taking equal portions of red sand,
				organic compost, and coco peat. Mix it well and leave your potting
				mix to settle a week or two before<br> using it in containers.
				Ensure that the texture of your potting mixture is balanced. To keep
				your soil healthy, you can keep fertilizing it every now and then.<br>
				This in turn will keep your greens healthy. Here’s how to prepare
				organic fertilizers at home.
			</p>
		</div>

		<!-- water proofing -->
		<div class="watering">
			<h1>Water Proofing</h1>
			<img class="wateringimg" src="https://iili.io/JRUbnrF.jpg"
				height="300px" width="200px" alt="img">
			<p class="wateringpara">
				If you are planning to build soil patches and raised beds on your
				terrace then it’s important to start with waterproofing.<br> It
				will help you to prevent any potential damage to the building.
				Waterproofing can be easily done and the great thing<br> is
				that it’s only a one-time job.Waterproofing is an important step in
				the process of building a terrace garden. It’s like<br> laying
				the foundation of the building before you start constructing.
				Leakages and roof damage can get difficult to<br> manage for
				the people living in and around the building. Waterproofing can be
				done in various ways, one of the<br> effective ways to
				waterproof your roof is by the application of polymer coating on the
				concrete slab. Once the coating<br> is done, you can get
				started with your terrace garden.
			</p>

		</div>
		<!-- sunlight -->
		<div class="sunlight">
			<h1>Sunlight</h1>
			<img class="sunlightimg" src="https://iili.io/JRUbTmv.png"
				height="300px" width="250px" alt="img">
			<p class="sunlightpara">
				Analyze the hours of the sunlight your balcony receives and the
				areas that get the maximum amount of sunlight. Pick your plants and<br>
				place them in the spots that receive ample sunlight.If your balcony
				is shady, you can pick out the plants that can thrive in lesser<br>
				sunlight. Notice the hours of indirect sunlight coming to your
				balcony and pick your plants accordingly.All salad greens like<br>
				arugula, lettuce, spinach, mustard, chard, kale, mizuna, komatsuna
				can do well in partial shade but all these plants need some<br>
				amount of sunlight every day to thrive.
			</p>
		</div>
		<!-- plantimages -->
		<div class="plantimages">
			<img src="https://iili.io/JRUbmjR.jpg" height="350px" width="400px"
				alt="img"> <img src="https://iili.io/JRUbN49.jpg"
				height="350px" width="400px" alt="img"> <img
				src="https://iili.io/JRUbvkb.jpg" height="350px" width="400px"
				alt="img"> <img src="https://iili.io/JRUbWhl.jpg"
				height="350px" width="400px" alt="img"> <img
				src="https://iili.io/JRUbGpf.jpg" height="350px" width="400px"
				alt="img"> <img src="https://iili.io/JRUmr9s.jpg"
				height="350px" width="400px" alt="img">

		</div>
	</main>
	<hr>

	<!-- footer -->

	<footer>

		<div class="footer">

			<div class="footer1">

				<div class="footerone">
					<img src="https://iili.io/Hy3dOH7.png" width="140px" alt="img">

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

		</div>
		<div class="foot"></div>

	</footer>

</body>
</html>