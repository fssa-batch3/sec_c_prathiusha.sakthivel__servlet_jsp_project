<html>
<head>
    <title>GreenFarm Product Features</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h1 {
            background-color: rgb(108, 145, 53);
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.2);
        }

        .features {
            list-style: none;
            padding: 0;
        }

        .feature-item {
            margin-bottom: 10px;
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.1);
        }

        .feature-link {
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

     
    </style>
</head>

<body>
    <h1>Product Features</h1>
    <div class="container">
        <ul class="features">
            <li class="feature-item">
                <a class="feature-link" href="<%=request.getContextPath()%>/GetAllProductDetailsServlet">Get All Product Details</a>
            </li>
            <li class="feature-item">
                <a class="feature-link" href="<%=request.getContextPath()%>/productform.jsp">Add Product</a>
            </li>
            <li class="feature-item">
                <a class="feature-link" href="<%=request.getContextPath()%>/updateform.jsp">Update Product</a>
            </li>
            <li class="feature-item">
                <a class="feature-link" href="<%=request.getContextPath()%>/delete.jsp">Delete Product</a>
            </li>
            <li class="feature-item">
                <a class="feature-link" href="<%=request.getContextPath()%>/searchproductprice.jsp">Filter Product By Price</a>
            </li>
        </ul>
    </div>
</body>

</html>