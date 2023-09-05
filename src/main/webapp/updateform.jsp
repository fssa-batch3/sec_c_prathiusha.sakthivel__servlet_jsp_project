<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/updateform.css">
</head>
<body>
	
	<main>
		<div class="container">
			<form action="updateform" id="create_form" method="post">

				<div class="titlename">
					<label>Product Id:</label> <br> <br> <input type="text"
						id="titlename" name="productid">
				</div>

				<div class="titlename">
					<label>Product Name:</label> <br> <br> <input type="text"
						id="titlename" name="productname">
				</div>


				<div class="imageurl">
					<label>Product Image url:</label> <br> <br> <input
						type="text" id="image" name="imageurl">
				</div>

				<div class="productprice">
					<label>Product Price:</label> <br> <br> <input
						type="number" id="price" name="price">
				</div>

				<div class="separate">
					<div class="Quantity">
						<label>Product Quantity:</label> <br> <br> <input
							type="number" id="quantity" name="quantity">
					</div>

					<div class="rating">
						<label>Product Category:</label> <br> <br> <select
							name="sub" id="Category">
							<option name="category" value="Vegetables">Vegetables</option>
							<option name="category" value="Fruits">Fruits</option>
						</select>
					</div>

					<div class="Quantity">
						<label>Product Description:</label> <br> <br> <input
							type="text" id="quantity" name="description">
					</div>

					<div class="Quantity">
						<label>Product Percentage:</label> <br> <br> <input
							type="text" id="quantity" name="percentage">
					</div>

					<div class="Quantity">
						<label>Product CreatedDate:</label> <br> <br> <input
							type="text" id="quantity" name="createdDate">
					</div>
				</div>
				<button type="submit" class="create">
					<a>Update</a>
				</button>

			</form>
		</div>

	</main>

</body>
</html>