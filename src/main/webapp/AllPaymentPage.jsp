<%@ page import="com.fssa.greenfarm.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.greenfarm.DAO.ProductDAO"%>
<%@ page import="com.fssa.greenfarm.DAO.CartDAO"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer">
    <link rel="stylesheet" href="assets/css/cartpayment.css">
    <title>All Payment Page</title>
</head>
<body>
<header>

    <img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
         width="250px" alt="img">

    <div class="menu-bar">

        <div class="main">
            <a href="home.jsp">Home </a> <a class="hdg" href="about.jsp">About</a>

            <div class="dropdown">

                <a class="product"
                   style="position: relative; left: 10px; font-size: 24px;"
                   href="<%=request.getContextPath()%>/GetAllProductDetailsServlet">Products</a>

            </div>

            <a href="<%=request.getContextPath()%>/UpdateProfile">Profile</a> <a
                href="<%=request.getContextPath()%>/LogoutServlet"><i
                class="fa-solid fa-power-off"
                style="position: relative; left: 5px; font-size: 23px; top: 2px; color: white;"></i></a>
        </div>
    </div>

</header>
<body>


<div class="container">
    <form id="payment_details" action="<%=request.getContextPath()%>/AllOrderServlet?id=<%=request.getParameter("id").trim()%>" method="POST"
          onsubmit="return validateForm()">

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
                                                       id="mobilenumber" type="tel" required="true"
                                                       pattern="[1-9][0-9]{9}">
                </div>

            </div>

            <div class="col">

                <h3 class="title">payment</h3>

                <input type="radio" class="payment_option" id="cashondelivery"
                       name="rdo" value="cash_on_delivery" required><span
                    class="span3">Cash on Delivery</span> <img class="labelimg2"
                                                               src="https://iili.io/JRgAlku.png" height="38px" width="40px"
                                                               alt="img">
            </div>

        </div>

        <button class="submit-btn" type="submit" id="checkoutButton">proceed
            to checkout</button>
    </form>

</div>
<div class="store">

    <h1 class="ordersummary" style="height: 700px;">Order Summary</h1>

    <%
        for (CartItems cartItem : (List<CartItems>) request.getAttribute("items")) {
    %>
    <%
        ProductDAO productDAO = new ProductDAO();
    %>
    <%
        Product product = null;
    %>

    <%
        try {
    %>
    <%
        product = productDAO.getProductById(cartItem.getProduct_id());
    %>
    <%
    } catch (Exception e) {
    %>
    <%
        e.printStackTrace();
    %>
    <%
        }
    %>
    <div class="box_div" style="margin-top: 30px;">


        <p class="product1">Product:</p>
        <img class="tomato" src="<%=product.getImageURL()%>" alt="image">
        <p class="name1">Name:</p>
        <h1 class="titlename"><%=product.getName()%></h1>
        <p class="price">Price:</p>
        <h2 class="amount" id="price"><%=cartItem.getTotalprice()%></h2>
        <p class="price">Quantity:</p>
        <h2 class="amount" id="gram">
            <%
                double quantity = cartItem.getQuantity();
                if (quantity < 1000) {
                    out.print(quantity + "kg");
                } else {
                    out.print((quantity > 1000) + "g");
                }
            %>
        </h2>

    </div>
    <%
        }
    %>
</div>
<script>
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