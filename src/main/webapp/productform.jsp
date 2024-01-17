<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/productform.css">
<style >
 body {
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS',
		sans-serif;    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    font-size: 20px;
  }

header {
	background-color: rgb(108, 145, 53);
	height: 100px;
	width: 100%;
	position: fixed;
	top: 0;
	z-index: 2;
	display: flex;
}
.container{
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-top:150px;
    max-width: 700px;
    margin-left: 350px;
}
.menu-bar ul {
	list-style: none;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	text-decoration: none;
}
#profile-btn{
	font-size: 23px;
}
.login{
	font-size: 23px;
}


.menu-bar {
	margin-left: 400px;
	margin-top: -20px;
}

.hdg {
	font-size: 25px;
}

header a {
	text-decoration: none;
	font-weight: 700;
	color: white;
}

.menu-bar ul li {
	padding-left: 70px;
	font-size: 20px;
	position: relative;
	top: 55px;
	left: -200px;
}

.logo {
	border: 2px solid white;
	border-radius: 20px;
	height: 60px;
	width: 160px;
	margin-left: 250px;
	margin-top: 20px;
}

.navi {
	text-decoration: none;
	color: white;
}

.navi:hover {
	font-size: 35px;
	color: black;
}
  
</style>
</head>


<body>
  	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
			width="250px" alt="img">

		<div class="menu-bar">
			<ul class="main">
				<li class="down"><a class="hdg" href="home.jsp">Home </a></li>
				<li class="down"><a class="hdg" href="about.jsp">About</a></li>
				<li><a class="product" style="font-size: 25px;" href="AdminServlet">Products</a></li>
			</ul>
		</div>
		
	</header>
	
	<main>
		<div class="container">
			<form action="productform" id="create_form" method="post">
				<div class="titlename">
					<label>Name:</label> <br> <br> <input type="text"
					 id="titlename" name="productname">
				</div>

				<div class="imageurl">
					<label>Image url:</label> <br> <br> <input
					 type="text" id="image" name="imageurl">
				</div>

				<div class="productprice">
					<label>Price:</label> <br> <br> <input
					 type="number" id="price" name="price">
				</div>

				<div class="separate">
					<div class="Quantity">
						<label>Quantity:</label> <br> <br> <input
						 type="number" id="quantity" name="quantity">
					</div>

					<div class="rating">
						<label >Category:</label> <br> <br> <select
						 name="sub" id="Category">
							<option name="category" value="Vegetables">Vegetables</option>
							<option name="category" value="Fruits">Fruits</option>
						</select>
					</div>

					<div class="Quantity">
						<label> Description:</label> <br> <br> <input
						 type="text" id="quantity" name="description">
					</div>

					<div class="Quantity">
						<label> Percentage:</label> <br> <br> <input
						 type="text" id="quantity" name="percentage">
					</div>

					<div class="Quantity">
						<label> CreatedDate:</label> <br> <br> <input
						 type="text" id="quantity" name="createdDate">
					</div>
					
				</div>
				
				<button type="submit" class="create"><a>Create</a></button>
				
			</form>
		</div>

	</main>

</body>
</html>