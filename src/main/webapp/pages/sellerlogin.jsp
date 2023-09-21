<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/sellerlogin.css">

</head>
<body>
	<section class="side">
		<img src="https://iili.io/JHF1ELN.png" alt="">
	</section>

	<section class="main">
		<div class="login-container">
			<p class="title">Welcome back</p>
			<div class="separator"></div>
			<p class="welcome-message">Please, provide login credential to
				proceed to become a seller</p>

			<form class="login_form"
				action="<%=request.getContextPath()%>/SellerloginServlet"
				method="post">
				<div class="form-control">
					<input name="username" type="text" placeholder="Sellername"
						id="username" required> <i class="fas fa-user"></i>
				</div>
				<div class="form-control">
					<input name="email" type="email" placeholder="Email" id="email"
						required> <i class="fas fa-lock"></i>
				</div>
				<%
				String errorMsg = (String) request.getParameter("error");
				if (errorMsg != null) {
				%>
				<p class="errormsg" style="color: red;font-size: 20px;font-weight: bold;margin-left: 10px;"><%=errorMsg%></p>
				<%
				}
				%>


				<button type="submit" class="submit1">Login</button>
			</form>
		</div>
	</section>


</body>
</html>