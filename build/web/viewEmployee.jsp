<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Read any error parameter
    String error = request.getParameter("error");
    String errorMsg = null;
    if ("missing".equals(error)) {
        errorMsg = "Please enter an Employee ID.";
    } else if ("numeric".equals(error)) {
        errorMsg = "Invalid input: numbers only.";
    } else if ("notfound".equals(error)) {
        errorMsg = "Employee ID not found.";
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>View Employee</title>
  <style>
    body {
      margin: 0; padding: 0;
      font-family: "Times New Roman", serif;
      background: url("pexels-photo.jpg") no-repeat center center fixed;
      background-size: cover;
    }
    .panel {
      position: relative;
      width: 440px;
      height: 280px;
      margin: 50px auto;
      background: rgba(255,255,255,0.9);
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.3);
    }
    h2 {
      margin-top: 0;
      text-align: center;
      color: #333;
    }
    .error {
      color: #b00;
      background: #fdd;
      border: 1px solid #b00;
      padding: 8px;
      margin-bottom: 12px;
      text-align: center;
      border-radius: 4px;
    }
    label {
      display: inline-block;
      width: 120px;
      font-weight: bold;
      color: #333;
    }
    input[type="text"] {
      width: 200px;
      padding: 4px;
      border: 1px solid #aaa;
      border-radius: 4px;
    }
    .btn {
      padding: 6px 12px;
      font-size: 16px;
      margin-top: 15px;
      margin-left: 145px;
      cursor: pointer;
      border: none;
      border-radius: 4px;
    }
    #btnSearch { background: #4285f4; color: white; }
    #btnCancel { background: #aaa; color: white; margin-left: 8px; }
  </style>
</head>
<body>
  <div class="panel">
    <h2>View Employee</h2>

    <% if (errorMsg != null) { %>
      <div class="error"><%= errorMsg %></div>
    <% } %>

    <form id="viewForm" action="SearchEmployee" method="post">
      <label for="empId">Employee ID:</label>
      <input type="text" id="empId" name="empId" required><br>
      <button type="submit" id="btnSearch" class="btn">Search</button>
      <button type="button" id="btnCancel" class="btn" onclick="location.href='EmployeeDetail'">Cancel</button>
    </form>
  </div>
</body>
</html>
