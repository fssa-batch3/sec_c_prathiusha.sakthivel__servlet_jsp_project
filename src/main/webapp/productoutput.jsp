<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.greenfarm.model.Product" %>
<%@ page import="com.fssa.greenfarm.service.ProductService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/productoutput.css">

</head>

<header>

	<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
		width="250px" alt="img">

	<div class="menu-bar">

		<ul class="main">
			<li class="down"><a class="hdg" href="../index.html">Home </a></li>
			<li class="down"><a class="hdg" href="../html/about.html">About</a>

			</li>

			<div class="dropdown">
				<li><a class="hdg" href="../html/profilepage.html">Profile</a></li>
			</div>
		
		
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
		
		<img class="offimg" src="https://iili.io/HyEi1qJ.png"> 
		<img class="tomato" src="<%= product.getImageURL()%>">
		<div class="heading1">
			<h2 id="name_of_product"><%= product.getName() %></h2>
			<h3 id="gram" class="gramquantity">Quantity:200g</h3>
			<h4 id="quantity_of_product">Price: 	&#8377; <%= product.getPrice() %></h4>
			<button class="btn1 btn-decrement" id="decrement">-</button>
			<input class="btn-input" data-keyword="20" id="quantity" type="text"
				value="1">
			<button id="increment" class="btn1 btn-increment">+</button>
			<div class="product-ratings"></div>
			<div class="btn"></div>
			<p class="description">Description: <%=product.getDescription() %></p>
			<button id="cartbutton">
				<a href="pages/cart.jsp?id=<%=product.getId()%>" id="add-to-cart">Add to Cart</a>
			</button>
			<button id="buybutton">
				<a href="pages/payment.jsp?id=<%=product.getId()%>">Buy Now</a>
			</button>
		</div>
	
	</div>
	
	<script >


    let increment1 = document.getElementById("increment")
    let pricelist = document.getElementById("quantity_of_product");
    let gramquantity=document.querySelector("gramquantity")
    console.log(increment1)
    let decrement1 = document.getElementById("decrement");


    let maxbtn = document.getElementById("increment")
    let minbtn = document.getElementById("decrement")
    let input = document.querySelector("input")
    let price = document.getElementById("quantity_of_product")
    let gram = document.getElementById("gram")
    let id = input.dataset.keyword



    maxbtn.addEventListener("click",function () {
      

        let qty = parseFloat(input.value);
        qty = qty + 1
        input.value = qty
        let gram_value = 250 * input.value

        
        price.innerText = `Price : ₹${id * input.value}`
        if(gram_value >= 250){
          gram.innerText = ` Quantity: ${gram_value}g`
        }
        if(gram_value >= 1000){
          gram.innerText = `Quantity: ${gram_value/1000}kg`
        }


    })
     //this event for decrease quantity value
        minbtn.addEventListener("click",function () {
            if (input.value !== "1") {
         let qty = parseFloat(input.value);
         qty = qty - 1
         input.value = qty
         let gram_value = 250 * input.value

         price.innerText = `Price : ₹${id * input.value}`

         if(gram_value >= 250){
          gram.innerText = ` Quantity: ${gram_value}g`
        }
        if(gram_value >= 1000){
          gram.innerText = `Quantity: ${gram_value/1000}kg`
        }
            }
            
            
        })	
	</script>
	
</body>

</html>