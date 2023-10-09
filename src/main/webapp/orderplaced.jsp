<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/orderplaced.css">

<title>Insert title here</title>
</head>
<body>

   <!-- borderbox -->
    <div class="borderbox">
        <img class="img" src="https://iili.io/JJun1cJ.jpg" height="200px" width="200px" alt="img">
    </div>
    <!-- container -->
    <div class="container">
        <span class="text1">Your Order</span>
        <span class="text2">Placed Successfully</span>

        <!-- back -->
        <div class="last">
            <a href="home.jsp">Back</a>
        </div>
    </div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
<%String errorMsg = (String) request.getAttribute("error");
System.out.println(  errorMsg + "path :"  );
if (errorMsg != null) {%>
		
		<%System.out.print(errorMsg + "inside");%>
		swal("Failed!","<%=errorMsg%>", "error");
		setTimeout(() => {
			console.log("df");
			window.location.href="OrderServlet";
		}, 4000);
		
	<%}%>
		
</script>
</body>
</html>