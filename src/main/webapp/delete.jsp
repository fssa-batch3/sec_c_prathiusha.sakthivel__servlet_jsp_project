<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./assets/css/delete.css">
<style >

body {
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS',
		sans-serif;    
	background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    font-size: 20px;
}

header {
	background-color: rgb(108, 145, 53);
	height: 100px;
	width: 100%;
	position: fixed;
	top: 0;
	z-index: 2;
	display: flex;
}

.container{
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin-top:150px;
    max-width: 700px;
    margin-left: 350px;
}

.menu-bar ul {
	list-style: none;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	text-decoration: none;
}

#profile-btn{
	font-size: 23px;
}

.login{
	font-size: 23px;
}

.menu-bar {
	margin-left: 400px;
	margin-top: -20px;
}

.hdg {
	font-size: 25px;
}

header a {
	text-decoration: none;
	font-weight: 700;
	color: white;
}

.menu-bar ul li {
	padding-left: 70px;
	font-size: 20px;
	position: relative;
	top: 55px;
	left: -200px;
}

.logo {
	border: 2px solid white;
	border-radius: 20px;
	height: 60px;
	width: 160px;
	margin-left: 250px;
	margin-top: 20px;
}

.navi {
	text-decoration: none;
	color: white;
}

.navi:hover {
	font-size: 35px;
	color: black;
}

</style>

</head>

<body>

	<header>

		<img class="logo" src="https://iili.io/Hy3dOH7.png" height="80px"
			width="250px" alt="img">

		<div class="menu-bar">
		

			<ul class="main">
				<li class="down"><a class="hdg" href="home.jsp">Home </a></li>
				<li class="down"><a class="hdg" href="about.jsp">About</a></li>

				<li><a class="product" style="font-size: 25px;"
					href="AdminServlet">Products</a>
				</li>
			</ul>

		</div>

	</header>
 
    <main>
        <div class="container">
            <form action="deleteform" id="create_form">
                <div class="titlename">
                    <label>Id:</label> <br> <br> 
                    <input type="text" id="productid" name="productid">
                </div>

                <div class="titlename">
                    <label>Name:</label> <br> <br> 
                    <input type="text" id="productname" name="productname">
                </div>
                
                <button type="button" class="delete" onclick="validateForm()"><a>Delete</a></button>
                
            </form>
        </div>
    </main>

    <script>
    
        function validateForm() {
            var productId = document.getElementById('productid').value;
            var productName = document.getElementById('productname').value;

            if (productId === '' && productName === '') {
                alert('Add any input in the input field');
                return false; 
            }

            if (isNaN(productId)) {
                alert('Invalid Id. Please enter a valid number.');
                return false;
            }
            
          
            window.location.href = 'admin.jsp';


            return true; 
        }
    
    </script>
</body>
</html>