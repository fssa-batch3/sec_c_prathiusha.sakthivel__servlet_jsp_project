<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.greenfarm.model.Product"%>
<%@ page import="com.fssa.greenfarm.service.ProductService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/productoutput.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">

</head>

<header>

	<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
		width="250px" alt="img">

	<div class="menu-bar">

		<ul class="main">
		
				<li><a class="product" style="font-size: 25px;position: relative;left: 40px;"
					href="AdminServlet">Products</a></li>
			<li><a class="down"
				style="font-size: 23px; position: relative; top: 2px;"
				href="productform.jsp"><i class="fa-solid fa-plus"
					style="font-size: 20px; color: white; position: relative; left: -10px; top: -5px;"></i>AddProduct</a></li>
	            <a
					href="<%=request.getContextPath()%>/LogoutServlet"><i class="fa-solid fa-arrow-right-from-bracket"
					style="position: relative; left: 30px; font-size: 23px;top:2px; color: white;"></i></a>

		</ul>
	</div>

</header>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	Product product = null;
	try {
		product = ProductService.readProduct(id);
	} catch (SQLException e) {
		System.out.print("failed");
		e.printStackTrace();
	}
	%>

	<p><%=id%></p>
	<div class="box">

		<img class="tomato" src="<%=product.getImageURL()%>">
		<div class="heading1">
			<h2 id="name_of_product"><%=product.getName()%></h2>
			<h3 id="gram" class="gramquantity"
				style="position: relative; top: 20px;">Quantity:200g</h3>
			<h4 id="quantity_of_product" style="position: relative; top: 10px;">
				Price: &#8377;<%=product.getPrice()%></h4>
			<h4 style="position: relative; left: 180px; top: -65px">Per Kg</h4>
			<div class="product-ratings"></div>
			<div class="btn"></div>
			<p class="description" style="position: relative; top: 20px;">
				Description:
				<%=product.getDescription()%></p>

			<%
			String successMessage = (String) request.getAttribute("successMessage");
			String errorMessage = (String) request.getAttribute("errorMessage");
			%>

			<%
			if (successMessage != null) {
			%>
			<div style="color: green;"><%=successMessage%></div>
			<%
			}
			%>

			<%
			if (errorMessage != null) {
			%>
			<div style="color: red;"><%=errorMessage%></div>
			<%
			}
			%>

			<div class="btn">
				<button class="update-btn"
					style="background-color: rgb(108, 145, 53); position: relative; top: 50px;">
					<a href="<%= request.getContextPath() %>/ViewUpdateform?id=<%=product.getId()%>">Update</a>
				</button>
				<button class="delete-btn"
					style="background-color: rgb(108, 145, 53); position: relative; top: 50px;">
					<a
						href="deleteform?id=<%=product.getId()%>&name=<%=product.getName()%>">Delete</a>
				</button>

			</div>



		</div>

	</div>




</body>
</html>