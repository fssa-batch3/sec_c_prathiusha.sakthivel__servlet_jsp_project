<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
<title>Login</title>
</head>
<body>
	<div class="bg">
		<!-- background -->

		<%
		String errorMsg = (String) request.getParameter("error");
		if (errorMsg != null) {
		%>
		<p class="errormsg"
			style="position: relative; left: 165px; top: -30px; color: red; font-weight: bold;"><%=errorMsg%></p>
		<%
		}
		%>

		<%
		String errorMsg2 = (String) request.getParameter("error2");
		if (errorMsg2 != null) {
		%>
		<p class="errormsg2"
			style="position: relative; left: 200px; top: 80px; color: red; font-weight: bold;"><%=errorMsg2%></p>
		<%
		}
		%>
		<form id="loginpage" action="<%=request.getContextPath() %>/LoginServlet" method="post">

			<div class="mhd">

				<img class="img" src="https://iili.io/Hy3dOH7.png" height="110px"
					width="210px" alt="img">
				<h2>Log-in Account</h2>
				<p class="para1">Email</p>

				<input name="email" type="email" id="email" required>
				<p class="para2">Password</p>
				<input name="password" type="password" id="password" required>

				<button class="but" type="submit">Log-in</button>

				<div class="or">
					<p>
						Don't have an Account? <a href="./signup.jsp">Sign-up<i
							class="fa-sharp fa-solid fa-arrow-right"></i></a>
					</p>
				</div>

				
			</div>
		</form>
	</div>
</body>


</html>