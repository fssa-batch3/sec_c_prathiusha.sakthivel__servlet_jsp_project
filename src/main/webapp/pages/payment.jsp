<%@page import="com.fssa.greenfarm.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.fssa.greenfarm.model.Product"%>
<%@ page import="com.fssa.greenfarm.model.User"%>
<%@ page import="com.fssa.greenfarm.service.ProductService"%>
<%@ page import="com.fssa.greenfarm.DAO.ProductDAO"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../assets/css/payment.css">
<title>Insert title here</title>
</head>

<body>
	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
			width="250px" alt="img">

		<div class="menu-bar">

			<div class="main">
				<a href="../index.html">Home </a>


				<div class="dropdown">

					<a class="product" href="../html/veges.html">Products</a>

				</div>

				<a href="../html/sellerpage.html">Seller</a> <a
					href="../html/profilepage.html">Profile</a>

			</div>
		</div>

	</header>
<body>
	<%
	UserDAO userDaO= new UserDAO();

	int productId = Integer.parseInt(request.getParameter("id"));
	String email= (String) session.getAttribute("email");
	Product product = ProductDAO.getProductById(productId);
	User user = userDaO.getUserByEmail(email);
	System.out.print(user+"user");
	String userName = "";
	 email = "";
	if (user!=null) {
		 userName = user.getFirstname()+user.getLastname();
		 email = user.getEmail();
	}
	%>
	<div class="container">

		<form id="payment_details"
			action="<%=request.getContextPath()%>/OrderServlet?id=<%=productId%>" method="post">

			<div class="row">

				<div class="col">

					<h3 class="title">Shipping address</h3>

					<div class="inputBox">
						<span>address :</span> <input name="address" id="address"
							type="text" title="Fill the address field" required="true">
					</div>
					<div class="inputBox">
						<span>city :</span> <input name="city" id="city" type="text"
							title="City field cannot be empty" required="true"
							pattern="[A-Za-z]{1,32}">
					</div>

					<div class="flex">
						<div class="inputBox">
							<span>state :</span> <input name="state" id="state" type="text"
								title="State field cannot be empty" required="true"
								pattern="[A-Za-z]{1,32}">
						</div>
						<div class="inputBox">
							<span>Pincode :</span> <input name="pincode" id="pincode"
								type="number" minlength="5" maxlength="7"
								title="Firstname cannot contain space" required="true">
						</div>
					</div>
					<div class="inputBox">
						<span>Mobile Number:</span> <input name="mobilenumber"
							id="mobilenumber" type="tel" required="true">
					</div>

				</div>

				<div class="col">

					<h3 class="title">payment</h3>
					<input type="radio" class="payment_option" id="upi" name="rdo"
						value="upi" required><span class="span1">UPI</span> <img
						class="labelimg1" src="https://iili.io/JHmCLEN.png" height="50px"
						width="50px" alt="img">
					<div class="inputBox">
						<span class="span2"><input type="radio" id="expand"
							name="rdo">cards accepted :</span> <img
							src="https://iili.io/JHmBNUX.png" alt="">
					</div>

					<!--  
                    <div class="hidden">
                        <div class="inputBox">
                        <span>name on card :</span>
                        <input id="name_on_card" class="payment_option" type="text">
                    </div>
                    <div class="inputBox">
                        <span>Card number :</span>
                        <input id="creditcard" type="number">
                    </div>
                    <div class="inputBox">
                        <span class="mobile">Branch Name:</span>
                        <input id="branchname" type="text">
                    </div>
                    <div class="inputBox">
                        <label>Card Expiry (MM/YYYY)
                        <input type="tel" id="cc_exp" placeholder="•• / ••••" data-payment='cc-exp'>
                       </label>
                    </div>
                    <div class="inputBox">
                        <span class="mobile">CVV Number:</span>
                        <input id="cvv" type="text">
                    </div> 
                    </div>
                    -->
					<input type="radio" class="payment_option" id="cashondelivery"
						name="rdo" value="cash_on_delivery" required><span
						class="span3">Cash on Delivery</span> <img class="labelimg2"
						src="https://iili.io/JHmCAes.png" height="38px" width="40px"
						alt="img">


				</div>

			</div>

			<button class="submit-btn" type="submit">proceed to checkout</button>
		</form>

	</div>
	<div class="store">

		<h1 class="ordersummary">Order Summary</h1>
		<div class="box_div">
			<p class="product1">Product:</p>
			<img class="tomato" src="<%=product.getImageURL()%>" alt="image">
			<p class="name1">Product Name:</p>
			<h1 class="titlename"><%=product.getName()%></h1>
			<p class="price">Product Price:</p>
			<h2 class="amount">
				&#8377;<%=product.getPrice()%></h2>

		</div>

	</div>

</body>
</html>