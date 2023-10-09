<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>seller_registration</title>
  <link rel="stylesheet" href="assets/css/sellerregister.css"></head>
<body>
  <header>

    <img class="logo" src="https://iili.io/Hy3dOH7.png" height="70px" width="150px" alt="img">

    <div class="menu-bar">

      <div class="main">
        <a href="./home.jsp">Home </a>

        <a class="about" href="./about.jsp">About </a>

        <a class="about" href="seller.html">Seller</a>

        <a class="register" href="#"></a>

      </div>
    </div>
  </header>

  <main>
    <form id="forms" action="<%=request.getContextPath()%>/SellerServlet" method="post">

      <div class="main_div">
        <div class="bussiness_name">
          <div class="year">
            <label class="top-head">YOUR NAME (OR) YOUR BUSSINESS NAME</label>
            <br>
            <input id="name" class="name__" name="name" type="text" title="Farm bussiness name cannot empty" required>
          </div>

          <div class="year">
            <label class="top-head">OWNERSHIP TYPE</label>
            <br>
            <select name="sub" id="type">
              <option name="ownershiptype" value="sole proprietorship"> SOLE PROPRIETORSHIP</option>
              <option name="ownershiptype" value="partnership">PARTNERSHIP</option>
              <option name="ownershiptype" value="corporation">CORPORATION</option>
            </select>
          </div>

          <div class="year">
            <label class="top-head">GENDER</label>
            <br>
            <select name="sub" id="type1">
              <option name="gender" value="male"> MALE</option>
              <option name="gender" value="female">FEMALE</option>
              <option name="gender" value="others">OTHERS</option>
            </select>
          </div>
        </div>
        <br>
        <br>
        <!--  -->
        <div class="appoinment-section">
          <div class="date">
            <div class="date-choose">
              <label for="appointment-date" class="top-head">Email</label>
              <br>
              <input name="email"  id="date" type="email" required aria-label="date" required>
            </div>
            <br>
            <div class="date-choose">
              <label name="address" for="appointment-date" class="top-head">ADDRESS</label>
              <br>
              <input name="address" id="address" type="text" required aria-label="time" title="Firstname cannot contain space"
                required>
            </div>
            <br>
            <div class="date-choosing">

              <label for="appointment-date" class="top-head" id="category">SELECT YOUR CATEGORIES</label>
              <br>
              <div class="list-checkbox">
                <label for="text" class="checkbox">
                  <input value="vegetables" name="box" type="checkbox" id="check1" class="item" aria-label="checkbox">
                  Vegetables</label>
                <label for="text" class="checkbox" title="Firstname cannot contain space" required="true">
                  <input name="box" value="fruits" type="checkbox" id="check2" class="item" aria-label="checkbox">
                  Fruits</label>
                <label for="text" class="checkbox" title="Firstname cannot contain space" required="true">
                  <input name="box" value="both" type="checkbox" id="check3" class="item" aria-label="checkbox">
                  Both</label>
              </div>

            </div>

          </div>
          <!-- address details -->
          <div class="addres">
            <label for="" class="top-head">ADDRESS DETAILS</label>
            <br>
            <input name="district" type="text" id="contactemail" placeholder="Your District*" title="Firstname cannot contain space"
              required>
            <br>
            <input name="state" type="text" id="contactphone" placeholder="Your State" title="Firstname cannot contain space"
              required>
            <br>
            <input type="number" id="contactpincode" placeholder="Pincode" minlength="5" maxlength="7"
              title="Firstname cannot contain space" required>
            <br>
          </div>

        </div>
        <!-- squarefeet -->
        <div class="year">
          <label class="top-head">SQUARE FEET</label>
          <br>
          <input id="squarefeet" class="name__" name="name" type="number" step="1" aria-label="Phone" required="true">
        </div>
        <!-- bankdetails -->
        <div class="bankdetails">
          <div class="date">
            <div class="subclass">
              <!-- bankname -->
              <div class="bankname">
                <label for="appointment-date" class="top-head">BANK NAME</label>
                <br>
                <input name="bankname" id="bankname" type="text" required aria-label="date" required>
              </div>
              <br>
              <!-- branchname -->
              <div class="branchname">
                <label for="appointment-date" class="top-head">BRANCH NAME</label>
                <br>
                <input name="branchname" id="time" type="text" required aria-label="time" required>
              </div>
              <br>

            </div>

            <!-- terms and conditions -->
            <div class="terms">
              <label class="top-head">Above mentioned details are true</label>
              <br>
              <select name="sub" id="termsand">
                <option value="yes"> YES</option>
                <option value="no">NO</option>

              </select>
            </div>
            <!-- message -->
            <textarea name="feedback" id="message" cols="30" rows="3" placeholder="Additional Feedback or Comments"></textarea>
            <br>
            <br>

            <p class="post">Add your terrace farming images</p>
            <input name="farmimage" placeholder="Upload Image" type="file" id="inputbox">
            <img src="#" id="myImg">

          </div>

        </div>

        <!-- div ends -->
      </div>

      <div class="next">
        <button type="submit" id="seller_records" >Next</button>

      </div>
    </form>

    <hr>
    <!-- footer -->

    <footer>

      <div class="footer">

        <div class="footer1">

          <div class="footerone">
            <img class="footlogo" src="https://iili.io/Hy3dOH7.png" width="140px" alt="img">

          </div>

          <div class="footerone">
            <p>Home</p>
          </div>

          <div class="footerone">
            <p>About</p>
          </div>

          <div class="footerone">
            <p>Contact</p>
          </div>

          <div class="footerone">
            <p>Pricing</p>
          </div>

        </div>

        <!-- footer two -->

        <div class="footer2">

          <div class="footertwo">

            <i class="fa-solid fa-location-dot"></i>

            <p>Dubai 123 South Street</p>

          </div>

          <div class="footertwo">

            <i class="fa-solid fa-phone"></i>
            <p>+1234567890</p>
          </div>

          <div class="footertwo">
            <i class="fa-solid fa-envelope"></i>
            <p>Randy@90gmail.com</p>
          </div>

        </div>

        <div class="footerthird">
          <h3>About Us</h3>
          <p>
            We supply organic fruits<br>
            and vegetables at a fair <br> price to everyone.
          </p>
          <i class="fa-brands fa-facebook"></i>
          <i class="fa-brands fa-whatsapp"></i>
          <i class="fa-brands fa-instagram"></i>
          <i class="fa-brands fa-twitter"></i>
          <p></p>
        </div>
      </div>
      <!-- footer ends -->
      <div class="foot">

      </div>
      </footer>
  </main>


</body>
</html>