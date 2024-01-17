<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/delete.css">
</head>
<body>
	<main>
		<div class="container">
			<form action="deleteform" id="create_form">
				<h1>Delete Product</h1>
				<div class="titlename">
					<label>Product Id:</label> <br> <br> <input type="text"
						id="titlename" name="productid">
				</div>

				<div class="titlename">
					<label>Product Name:</label> <br> <br> <input type="text"
						id="titlename" name="productname">
				</div>
				<button type="submit" class="delete">
					<a>Delete</a>
				</button>

			</form>
		</div>
	</main>


</body>
</html>