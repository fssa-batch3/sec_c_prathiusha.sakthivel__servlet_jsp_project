<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/searchproductbyprice.css">
</head>
<body>
	<main>
		<div class="container">
			<form action="./searchproductbyprice" id="create_form" method="get">

				<div class="titlename">
					<label>Product Price(FromRange):</label> <br> <br> <input type="number"
						id="titlename" name="FromRange">
				</div>

				<div class="titlename">
					<label>Product Price(ToRange):</label> <br> <br> <input type="number"
						id="titlename" name="ToRange">
				</div>
					<button type="submit" class="delete" value="submit">
				Search
				</button>

			</form>
		</div>
	</main>

</body>
</html>