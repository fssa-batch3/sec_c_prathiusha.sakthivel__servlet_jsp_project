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
<link rel="stylesheet" href="assets/css/payment.css">
<title>Insert title here</title>

</head>

<body>
	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
			width="250px" alt="img">

		<div class="menu-bar">

			<div class="main">
				<a href="home.jsp">Home </a>


				<div class="dropdown">

					<a class="product" href="http://localhost:8080/greenfarm-web/GetAllProductDetailsServlet">Products</a>

				</div>

				<a href="../pages/seller.html">Seller</a>
				 <a href="<%=request.getContextPath()%>/UpdateProfile" >Profile</a>

			</div>
		</div>

	</header>
<body>
	<%
	UserDAO userDaO= new UserDAO();

	int productId = Integer.parseInt(request.getParameter("id"));
	
	int price = Integer.parseInt(request.getParameter("price"));
	
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	
	
	

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
			action="<%=request.getContextPath()%>/OrderServlet?id=<%=productId%>&quantity=<%=quantity%>&price=<%=price%>" method="post" onsubmit="return validateForm()">

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
								type="number" minlength="6" maxlength="6"
								title="Firstname cannot contain space" required="true">
						</div>
					</div>
					<div class="inputBox">
						<span>Mobile Number:</span> <input name="mobilenumber"
							id="mobilenumber" type="tel" required="true" pattern="[1-9][0-9]{9}">
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
			<h2 class="amount" id="price"></h2>
		    <p class="price">Product Quantity:</p>
            <h2 class="amount" id="gram"><%=product.getQuantity() %></h2>
		</div>

	</div>

    <script>
    
   	getDetails();
    
    function getDetails(){
    		
   	  const url = window.location.search;
 	  const params = new URLSearchParams(url)

	
            const price = params.get("price");
            const gram_value = params.get("gram");
           
            
         let amount =   document.getElementById("price");
         amount.innerText = '\u20B9' + price;
         let gram = document.getElementById("gram");
         
         if(gram_value >= 250){
             gram.innerText = gram_value+"g"
           	  console.log(gram_value)
           }
           
           if(gram_value >= 1000){
             gram.innerText = (gram_value/1000) +"kg"
          
           }
         
            
    }
    
    
        function validateForm() {
            var address = document.getElementById("address").value;
            var city = document.getElementById("city").value;
            var state = document.getElementById("state").value;
            var pincode = document.getElementById("pincode").value;
            var mobilenumber = document.getElementById("mobilenumber").value;

            if (!/^[1-9][0-9]{9}$/.test(mobilenumber)) {
                alert("Mobile number should not start with 0 and should contain 10 digits.");
                return false;
            }

            if (!/^[A-Za-z]+$/.test(city) || !/^[A-Za-z]+$/.test(state)) {
                alert("City and state should not be empty and should contain only characters.");
                return false;
            }

            if (!/^[1-9][0-9]{5}$/.test(pincode)) {
                alert("Pincode should contain 6 digits and should not start with 0.");
                return false;
            }

           
            return true; 
        }
    </script>


</body>
</html>