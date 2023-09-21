<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Products By Price</title>
<link rel="stylesheet" href="./assets/css/searchproductbyprice.css">
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
  }

  .header {
    background-color: rgb(108, 145, 53);
    color: white;
    text-align: center;
    padding: 20px;
  }

  .container {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    margin: 20px auto;
    max-width: 500px;
  }

  .container h1 {
    font-size: 24px;
    color: #333;
    text-align: center;
  }

  label {
    font-weight: bold;
    color: #333;
  }

  input[type="number"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  button.delete {
    background-color:  rgb(108, 145, 53);
    color: white;
    padding: 15px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
  }

 
</style>
</head>
<body>
  <div class="header">
    <h1>Filter Products By Price</h1>
  </div>
  <main>
    <div class="container">
      <form action="./searchproductbyprice" id="create_form" method="get">
        <div class="titlename">
          <label for="FromRange">Product Price (From Range):</label><br><br>
          <input type="number" id="FromRange" name="FromRange">
        </div>

        <div class="titlename">
          <label for="ToRange">Product Price (To Range):</label><br><br>
          <input type="number" id="ToRange" name="ToRange">
        </div>

        <button type="submit" class="delete">Search</button>
      </form>
    </div>
  </main>
</body>
</html>
