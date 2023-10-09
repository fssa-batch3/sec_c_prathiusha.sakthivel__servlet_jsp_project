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
					<img class="profile" src="https://iili.io/JHFFytp.jpg" id="photo"
						alt="profile_image"> <input type="file" id="file">
					<label for="file" id="uploadbtn">Change Profile</label>
				</div>
				<!-- Edit-Profile -->
				<div class="edit">
					<button id="edit">Edit-Profile</button>
				</div>
				<br> <br>
				<!-- Save -->
				
					<button href="home.jsp" type="submit" id="home">
						<a >Home</a>
					</button>
				</div>
				<br> <br>
				<div>
					<button  id="next">
						<a href="<%=request.getContextPath()%>/LogoutServlet">Log-out</a>
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
					<div class="fname_container">
						<label>Firstname</label> <br> <input name="firstname"
							disabled type="text" id="firstname" pattern="[A-Za-z]{1,35}"
							value="<%=user.getFirstname()%>">
					</div>

					<div class="lname_container">
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
				<form action="<%=request.getContextPath()%>/UpdateUserServlet" method="post">
				
				<input type="hidden" id="emailId" name="emailId" value="<%=user.getEmail()%>">

				<!-- city and country -->
				<div class="profile_form2">
					<!-- Display city and state here -->
					<div class="city_container">
						<label>City</label> <br> <input type="text" id="city"
							required="true" name="city">
					</div>

					<div class="country_container">
						<label>State</label> <br> <input  type="text"
							id="country" required="true" name="state">
					</div>
				</div>

				<!-- address -->
				<div class="address_container">
					<label>Address</label> <br> <input  type="text"
						id="address" required="true" name="address">
				</div>

				<!-- occupation and phonenumber -->
				<div class="profile_form3">
					<!-- Display occupation and mobile number here -->
					<div class="occupation_container">
						<label>Pincode</label> <br> <input  minimum="6" maximum="6"  type="number"
							id="occupation"  required="true" name="pincode">
					</div>

					<div class="number_container">
						<label>MobileNumber</label> <br> <input 
							type="telephone" id="number" maxlength="10" minlength="10"
							required="true" name="mobilenumber">
					</div>
					<div>
					<button type="submit" id="save_button" style=" position:relative;  top:-35px;left: -1080px">Save</button>
				</div>
				<br> <br>
				<div>
				</div>
				</form>
			</div>
	
	</div>
</body>



</body>
</html>