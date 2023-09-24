<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/signup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Document</title>
<title>Insert title here</title>
</head>

<body>

	<div class="container">
	
		<img src="https://iili.io/Hy3dOH7.png" alt="logaimage">

		<div class="header" >
			<h1>Create Account</h1>
		</div>

		<form class="form" id="form" action="SignupServlet" method="post" onsubmit="return validateForm()">


			<div class="form-control">
				<label>First name</label> <input name="firstname" type="text"
					placeholder="" id="firstname"
					title="Firstname cannot contain space, number or any speacial characters"
					required="true" pattern="[A-Za-z]{1,32}"> <i
					class="fa-solid fa-check"></i>
			</div>


			<div class="form-control">
				<label>Last name</label> <input name="lastname" type="text"
					placeholder="" id="lastname"
					title="Lastname cannot contain space, number or any speacial characters"
					required="true" pattern="[A-Za-z]{1,32}"> <i
					class="fa-solid fa-check"></i>
			</div>


			<div class="form-control">
				<label>Email</label> <input name="email" type="email" placeholder=""
					id="email" required="true"> <i class="fa-solid fa-check"></i>
			</div>


			<div class="form-control">
				<label>Password</label> <input name="password" type="password"
					placeholder="" id="password" required="true" minlenght="6">
				<i class="fa-solid fa-check"></i>
			</div>


			<div class="form-control">
				<label>confirm Password</label> <input name="conformpassword"
					type="password" placeholder="" id="password2" required="true"
					minlenght="6" title="Password cannot contain space"> <i
					class="fa-solid fa-check"></i>
			</div>

			<button type="submit">Submit</button>

			<p>
				Already have an Account? <a href="./login.jsp">Log-in<i
					class="fa-sharp fa-solid fa-arrow-right"></i></a>
			</p>

		</form>
	</div>
	<script>
		function validateForm() {
			var password1 = document.getElementById("password").value;
			var password2 = document.getElementById("password2").value;

			if (password1 !== password2) {
				alert("Passwords do not match. Please check and try again.");
				return false;
			}

			return true;
		}
	</script>

</body>

</html>