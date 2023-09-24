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
				<div>
					<button type="submit" id="save_button">Save</button>
				</div>
				<br> <br>
				<div>
					<button type="submit" id="home">
						<a>Home</a>
					</button>
				</div>
				<br> <br>
				<div>
					<button onclick="logout()" id="next">
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

				<!-- city and country -->
				<div class="profile_form2">
					<!-- Display city and state here -->
					<div class="city_container">
						<label>City</label> <br> <input type="text" id="city"
							required="true">
					</div>

					<div class="country_container">
						<label>State</label> <br> <input disabled type="text"
							id="country" required="true">
					</div>
				</div>

				<!-- address -->
				<div class="address_container">
					<label>Address</label> <br> <input disabled type="text"
						id="address" required="true">
				</div>

				<!-- occupation and phonenumber -->
				<div class="profile_form3">
					<!-- Display occupation and mobile number here -->
					<div class="occupation_container">
						<label>Occupation</label> <br> <input disabled type="text"
							id="occupation" required="true">
					</div>

					<div class="number_container">
						<label>MobileNumber</label> <br> <input disabled
							type="telephone" id="number" maxlength="10" minlength="10"
							required="true">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>


<script>

        let user_data = JSON.parse(localStorage.getItem("user_records")) ?? [];// this is user object

        let profile_form = document.getElementById("profile_form");

        let profile_arr = localStorage.getItem('data');

        let active_user;

        function get_user() {

            active_user = user_data.find((obj) => profile_arr === obj.email);

        }

        get_user();


        user_data.find(function (obj) {

            if (obj.email == profile_arr) {

                document.getElementById("firstname").value = obj["Firstname"];
                document.getElementById("lastname").value = obj["lastname"];
                document.getElementById("email").value = obj["email"];

                if (obj.communication != null) {

                    document.getElementById("city").value = obj.communication["city"];
                    document.getElementById("country").value = obj.communication["country"];
                    document.getElementById("address").value = obj.communication["address"];
                    document.getElementById("occupation").value = obj.communication["occupation"];
                    document.getElementById("number").value = obj.communication["mobile_number"];
                }
            }
        })

        let save_button = document.getElementById("save_button");

        let editbutton = document.getElementById("edit");

        let inputs = document.querySelectorAll("input");

        editbutton.addEventListener("click", e => {

            e.preventDefault()

            inputs.forEach(input => {
                if (input.type == "email") {
                    input.disabled = true;
                } else {
                    input.disabled = false;
                }
            })
        });

        let commun_obj;

        profile_form.addEventListener("submit", (e) => {

            e.preventDefault();

            user_data.find(function (obj) {

                if (obj.email === profile_arr) {

                    obj["Firstname"] = document.getElementById("firstname").value;
                    obj["lastname"] = document.getElementById("lastname").value;
                    obj["email"] = document.getElementById("email").value;

                    commun_obj = {

                        "city": document.getElementById("city").value,
                        "country": document.getElementById("country").value,
                        "address": document.getElementById("address").value,
                        "occupation": document.getElementById("occupation").value,
                        "mobile_number": document.getElementById("number").value
                    }

                    obj["communication"] = commun_obj;

                    localStorage.setItem("user_records", JSON.stringify(user_data));

                    alert("Profile Updated");
                }
            })


        })

        //profile image
        const imageFileUpload = document.getElementById("file");
        const imageShow = document.querySelector(".profile");
        imageFileUpload.addEventListener("change", (e) => {
            const file = e.target.files[0];
            const fileReader = new FileReader();
            fileReader.onload = (e) => {
                imageShow.src = e.target.result;
                const userRecords = JSON.parse(localStorage.getItem("user_records"))
                const user_logged = JSON.parse(localStorage.getItem("active_user"));
                for (let i = 0; i < userRecords.length; i++) {
                    if (user_logged["email"] == userRecords[i]["email"]) {
                        userRecords[i]["image_name"] = file.name;
                        userRecords[i]["image_url"] = e.target.result;
                        break;
                    };
                }
                localStorage.setItem("user_records", JSON.stringify(userRecords));
            };
            fileReader.readAsDataURL(file);
        });

        const userRecords = JSON.parse(localStorage.getItem("user_records"));

        const user_logged = JSON.parse(localStorage.getItem("active_user"));

        for (let i = 0; i < userRecords.length; i++) {
            if (user_logged["email"] == userRecords[i]["email"]) {
                const savedImage = userRecords[i];

                if (savedImage && savedImage.image_url) {
                    imageShow.src = savedImage.image_url;

                }
                else {
                    imageShow.src = "https://iili.io/HkW7U4S.jpg"
                }
                break;
            }
        }

        const user_logged1 = JSON.parse(localStorage.getItem("active_user"));
        const logout = document.getElementById("next")
        logout.addEventListener("click", (e) => {
            let deletefalse = delete user_logged1

            localStorage.setItem("active_user", deletefalse);
            
            window.location.href = "../index.html";

        })
 
        let home_button = document.getElementById("home");

        home_button.addEventListener("click", (e) => {

            if (active_user["communication"] == null || active_user["communication"] == undefined) {

                alert("Please fill the address details")

                get_user();
            }
            else {
                window.location.href = "../pages/home.html"
            }

        });

    </script>

</body>
</html>