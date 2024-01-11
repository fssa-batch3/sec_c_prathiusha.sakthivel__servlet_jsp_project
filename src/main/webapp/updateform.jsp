<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.fssa.greenfarm.model.*"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<link rel="stylesheet" href="./assets/css/updateform.css">
<style>
  body {
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS',
		sans-serif;    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
  }

 

  .container {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-top:150px;
    max-width: 700px;
  }

  .container h1 {
    font-size: 24px;
    color:white;
    text-align: center;
  }

  label {
    font-weight: bold;
  }

  input[type="text"],
  input[type="number"],
  select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  button.create {
    background-color:  rgb(108, 145, 53);
    color: white;
    padding: 15px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
  }

  button.create:hover {
    background-color: #45a049;
  }
  /* header */
header {
	background-color: rgb(108, 145, 53);
	height: 100px;
	width: 100%;
	position: fixed;
	top: 0;
	z-index: 2;
	display: flex;
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
	top: 70px;
	left: -300px;
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

				<li><a class="product" style="font-size: 25px;"
					href="AdminServlet">Products</a>
				</li>


			</ul>

		</div>

	</header>
  <main>
   <%
	Product product = (Product) request.getAttribute("product");
	%>
	    <div class="container">

	<%
	if (product != null) {
	%>

   
      <form action="<%=request.getContextPath()%>/updateform" id="create_form" method="post">
      
          <input type="hidden" name="productId" value="<%=product.getId()%>">
      

        <div class="titlename">
          <label for="productname">Name:</label><br><br>
          <input type="text" id="productname" name="productname" value="<%=product.getName()%>">
        </div>

       		<div class="imageurl">
					<label>Image url:</label> <br> <br> <input
						type="text" id="image" name="imageurl" value="<%=product.getImageURL() %>">
				</div>

				<div class="productprice">
					<label>Price:</label> <br> <br> <input
						type="number" id="price" name="price" value="<%=product.getPrice() %>">
				</div>

				<div class="separate">
					<div class="Quantity">
						<label>Quantity:</label> <br> <br> <input
							type="number" id="quantity" name="quantity" value="<%=product.getQuantity()%>">
					</div>

					<div class="rating">
						<label>Category:</label> <br> <br> <select
							name="sub" id="Category">
							<option name="category" value="<%=product.getCategory() %>">Vegetables</option>
							<option name="category" value="<%=product.getCategory() %>">Fruits</option>
						</select>
					</div>

					<div class="Quantity">
						<label>Description:</label> <br> <br> <input
							type="text" id="quantity" name="description" value="<%=product.getDescription() %>">
					</div>

					<div class="Quantity">
						<label>Discount:</label> <br> <br> <input
							type="text" id="quantity" name="percentage" value="<%=product.getPercentage()%>">
					</div>

					<div class="Quantity">
						<label>CreatedDate:</label> <br> <br> <input
							type="text" id="quantity" name="createdDate" value="<%=product.getCreateddate()%>">
					</div>
					</div>
      <div>
              <button type="submit" class="create">Update</button>
      </div>
      </form>
	
   
   <%
	} else {
	%>
	<h1>No records found</h1>
	<%
	}
	%>
	 </div>
  </main>
</body>
</html>
