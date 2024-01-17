<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/home.css">
</head>
<body>
  <div class="container">
        <img src="../assets/image/mainlogo.png" alt="logaimage">

        <div class="header">
            <h1>Create Account</h1>
        </div>

        <form class="form" id="form">

            <div class="form-control">
                <label>First name</label>
                <input type="text" placeholder="" id="firstname"
                    title="Firstname must contain at least one uppercase and lowercase letter, and at least 8 or more characters"
                    required="true" pattern="[A-Za-z]{1,35}">
                <i class="fa-solid fa-check"></i>
            </div>

            <div class="form-control">
                <label>Last name</label>
                <input type="text" placeholder="" id="lastname" title="Lastname cannot contain number or space "
                    required="true" pattern="[A-Za-z]{1,35}">
                <i class="fa-solid fa-check"></i>
            </div>

            <div class="form-control">
                <label>Email</label>
                <input type="email" placeholder="" id="email" required="true"
                    pattern="^[a-zA-Z0-9][a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" title="Enter a valid Email">
                <i class="fa-solid fa-check"></i>
            </div>

            <div class="form-control">
                <label>Password</label>
                <input type="password" placeholder="" id="password" required="true"
                    pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
                    title="Your password must contain at least 8 characters, contain at least one number or special character, one uppercase letter, and one lowercase letter, and must not contain dots or newline characters."
                    minlenght="6">
                <i class="fa-solid fa-check"></i>
            </div>

            <div class="form-control">
                <label>confirm Password</label>
                <input type="password" placeholder="" id="password2" required="true"
                    pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"
                    title="Your password must contain at least 8 characters, contain at least one number or special character, one uppercase letter, and one lowercase letter, and must not contain dots or newline characters."
                    minlenght="6">
                <i class="fa-solid fa-check"></i>
            </div>

            <button type="submit">Submit</button>

            <p>
                Already have an Account? <a href="../html/login1.html">Log-in→</a>
            </p>

        </form>
    </div>

    <script>
        const userList = JSON.parse(localStorage.getItem("user_records")) ?? [];

        const form = document.getElementById("form");
        const firstname = document.getElementById("firstname");
        const lastname = document.getElementById("lastname");
        const email = document.getElementById("email");
        const password = document.getElementById("password");
        const password2 = document.getElementById("password2");

        form.addEventListener('submit', e => {
            e.preventDefault();
            checkInput();
        });

        function checkInput() {

            const firstnamevalue = firstname.value.trim();
            const lastnamenamevalue = lastname.value.trim();
            const emailvalue = email.value.trim();
            const passwordvalue = password.value.trim();
            const password2value = password2.value.trim();

            if (firstnamevalue === '') {
                setError(firstname, 'Firstname cannot be blank');
            }
            else {
                setSucess(firstname);
            }
            if (lastnamenamevalue === '') {
                setError(lastname, 'Lastname cannot be blank');
            }
            else {
                setSucess(lastname);
            }
            if (emailvalue === '') {
                setError(email, 'Email cannot be blank');
            }
            else {
                setSucess(email);
            }
            if (passwordvalue === '') {
                setError(password, 'Password cannot be blank');
            }
            else {
                setSucess(password);
            }
            if (passwordvalue !== password2value) {
                setError(password2, 'Password does not match')
            }
            else {
                setSucess(password2);
            }

            let success = true;

            if (userList !== null) {

                for (let i = 0; i < userList.length; i++) {

                    if (userList[i].email == emailvalue) {
                        success = false;
                        break;
                    }
                }
            }
            if (success) {

                const user = {
                    "Firstname": firstnamevalue,
                    "lastname": lastnamenamevalue,
                    "email": emailvalue,
                    "password": passwordvalue,
                    "status": true,
                    "image_name": "",
                    "image_url": "",

                };

                userList.push(user);
                localStorage.setItem("user_records", JSON.stringify(userList))
                window.location.href = "../html/login1.html"
            }
            else {
                alert("You Already have an account")
            }
        }

        function setError(input, message) {
            const formcontrol = input.parentElement;
            const small = formcontrol.querySelector('small');
            formcontrol.classname = 'form-control error';
            small.innerText = message;
        }

        function setSucess(input) {
            const formcontrol = input.parentElement;
            formcontrol.className = 'form-control success';
        }

        const logoutuser = JSON.parse(localStorage.getItem("user_records"))
    </script>


</body>
</html>