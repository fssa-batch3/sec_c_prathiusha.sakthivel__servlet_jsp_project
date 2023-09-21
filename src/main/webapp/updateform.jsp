<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Product</title>
<link rel="stylesheet" href="./assets/css/updateform.css">
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
  }

  .header {
    background-color:  rgb(108, 145, 53);
    color: white;
    text-align: center;
    padding: 20px;
  }

  .container {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 20px auto;
    max-width: 500px;
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
</style>
</head>
<body>
  <div class="header">
    <h1>Update Product</h1>
  </div>
  <main>
    <div class="container">
      <form action="updateform" id="create_form" method="post">
        <div class="titlename">
          <label for="productid">Product Id:</label><br><br>
          <input type="text" id="productid" name="productid">
        </div>

        <div class="titlename">
          <label for="productname">Product Name:</label><br><br>
          <input type="text" id="productname" name="productname">
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

        <button type="submit" class="create">Update</button>
      </form>
    </div>
  </main>
</body>
</html>
