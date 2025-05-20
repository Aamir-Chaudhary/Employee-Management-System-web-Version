<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Calculate Salary</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: "Segoe UI", sans-serif;
      background: url("bg.jpg") center/cover no-repeat fixed;
    }
    .container {
      max-width: 500px;
      margin: 100px auto;
      background: rgba(255, 255, 255, 0.9);
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0, 0, 0, 0.3);
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-top: 8px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }
    button {
      width: 100%;
      padding: 12px;
      background-color: #007bff;
      border: none;
      color: white;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Salary Calculation</h2>
    <form action="CalculateSalary" method="post">
      <label for="empId">Enter Employee ID:</label>
     
      <input type="text" id="empId" name="empId" required pattern="\d+">

      <button type="submit">Calculate Salary</button>
    </form>
  </div>
</body>
</html>
