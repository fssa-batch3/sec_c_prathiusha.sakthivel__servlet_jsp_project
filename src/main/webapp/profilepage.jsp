<%@ page import="com.fssa.greenfarm.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<title>Document</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profilepage.css">
<style>
</style>
</head>
<body>
	<!-- outer_container -->
	<div class="outer_container">

		<form id="profile_form" action="UpdateProfile" method="get">

			<!-- right_container -->
			<div class="right_container">
				<div class="profile_image">
					<!-- Profile image here -->
					<img class="profile" src="https://iili.io/JRgYVAF.jpg" id="photo"
						alt="profile_image"> <input type="file" id="file">
				</div>


				<button href="home.jsp" type="submit" id="home"
					style="background-color: rgb(108, 145, 53); margin-top: 80px;">
				<a href="home.jsp" style="color: white; font-weight: bold;">Home</a>
				</button>
			</div>
			<br> <br>
			<div>
				<button id="next" style="background-color: rgb(108, 145, 53);">
					<a href="<%=request.getContextPath()%>/LogoutServlet"
						style="color: white; font-weight: bold;">Log-out</a>
				</button>
			</div>
	</div>

	<div class="form_div">
		<!-- heading -->
		<h1>My Account</h1>
		<%
		User user = (User) request.getAttribute("user");
		%>

		<!-- fname and lname -->
		<div class="profile_form">
			<!-- Display user details here -->
			<div class="fname_container" style="margin-left: -120px;">
				<label>Firstname</label> <br> <input name="firstname" disabled
					type="text" id="firstname" pattern="[A-Za-z]{1,35}"
					value="<%=user.getFirstname()%>">
			</div>

			<div class="lname_container" style="margin-left: -250px">
				<label>Last name</label> <br> <input name="lastname" disabled
					type="text" id="lastname" pattern="[A-Za-z]{1,35}"
					value="<%=user.getLastname()%>">
			</div>
		</div>

		<!-- email -->
		<div class="email_container">
			<label>Email</label> <br> <input name="email" disabled
				type="email" id="email" disabled value="<%=user.getEmail()%>">
		</div>
		</form>
		<form action="<%=request.getContextPath()%>/UpdateUserServlet"
			method="post">

			<input type="hidden" id="emailId" name="emailId"
				value="<%=user.getEmail()%>">

			<!-- city and countrsy -->
			<div class="profile_form2">
				<!-- Display city and state here -->
				<div class="city_container" style="margin-left: -100px;">
					<label>City</label> <br>
					<%
					String userCity = user.getCity();
					if (userCity == null || userCity.isEmpty()) {
					%>
					<input type="text" id="city" required="true" name="city" value="">
					<%
					} else {
					%>
					<input type="text" id="city" required="true" name="city"
						value="<%=userCity%>">
					<%
					}
					%>
				</div>
				<div class="country_container" style="margin-left: -200px;">
					<label style="position: relative; right: -130px;">State</label> <br>
					<%
					String userState = user.getState();
					if (userState == null || userState.isEmpty()) {
					%>
					<input type="text" id="country" required="true" name="state"
						style="position: relative; right: -130px;" value="">
					<%
					} else {
					%>
					<input type="text" id="country" required="true" name="state"
						style="position: relative; right: -130px;"
						value="<%=userState%>">
					<%
					}
					%>
				</div>

			</div>

			<!-- address -->
			<div class="address_container">
				<label>Address</label> <br>
				<%
				String userAddress = user.getAddress();
				if (userAddress == null || userAddress.isEmpty()) {
				%>
				<input type="text" id="address" required="true" name="address"
					value="">
				<%
				} else {
				%>
				<input type="text" id="address" required="true" name="address"
					value="<%=userAddress%>">
				<%
				}
				%>
			</div>


			<!-- occupation and phonenumber -->
			<div class="profile_form3">
				<!-- Display occupation and mobile number here -->
				<div class="occupation_container">
					<label>Pincode</label> <br>
					<%
					int userPincode = user.getPincode();
					if (userPincode == 0) {
					%>
					<input type="number" id="occupation" required="true" name="pincode"
						value="">
					<%
					} else {
					%>
					<input type="number" id="occupation" required="true" name="pincode"
						value="<%=userPincode%>">
					<%
					}
					%>
				</div>


				<div class="number_container">
					<label style="position: relative; right: -60px;">MobileNumber</label>
					<br>
					<%
					long userMobileNumber = user.getMobilenumber();
					if (userMobileNumber == 0) {
					%>
					<input type="tel" id="number" maxlength="10" minlength="10"
						required="true" name="mobilenumber"
						style="position: relative; right: -60px;" value="">
					<%
					} else {
					%>
					<input type="tel" id="number" maxlength="10" minlength="10"
						required="true" name="mobilenumber"
						style="position: relative; right: -60px;"
						value="<%=userMobileNumber%>">
					<%
					}
					%>
				</div>

				<div>
					<button type="submit" id="save_button"
						style="position: relative; top: -95px; left: -1080px; background-color: rgb(108, 145, 53);">Save</button>
				</div>
				<br> <br>
				<div></div>
		</form>
	</div>

	</div>
</body>



</body>
</html>