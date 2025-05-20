<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Employee Details</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: "Times New Roman", serif;
      background: url("ballpen-blur-close-up-461077-1.jpg") no-repeat center center fixed;
      background-size: cover;
    }
    .container {
      position: relative;
      width: 834px;
      height: 531px;
      margin: 0 auto;
      top: 20px;
    }
    h1 {
      
      position: absolute;
      top: 10px;
      left: 480px;
      font-size: 36px;
      color: white;
      text-shadow: 2px 2px 4px rgba(0,0,0,0.6);
      
    }
    .btn {
      position: absolute;
      width: 128px;
      height: 40px;
      font-size: 24px;
      color: white;
      background: rgba(0,0,0,0.5);
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background 0.3s;
    }
    .btn:hover { background: rgba(0,0,0,0.8); }

    #btnAdd    { top: 90px;  left: 480px; }
    #btnView   { top: 90px;  left: 620px; }
    #btnUpdate { top: 150px; left: 620px; }
    #btnRemove { top: 150px; left: 480px; }

    #btnHome {
      position: absolute;
      top: 0; left: -330px;
      width: 115px;
      height: 40px;
      font-size: 20px;
      color: white;
      background: rgba(0,0,0,0.5);
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background 0.3s;
     
    }
    #btnHome:hover { text-decoration: underline; }
  </style>
</head>
<body>
  <div class="container">
    <h1>Employee Details</h1>
    <-<!--<button onclick="location.href='addEmployee.jsp'">Add</button> --> 
    <button id="btnAdd"    class="btn" onclick="location.href='AddEmployee'">Add</button>
    <button id="btnView"   class="btn" onclick="location.href='ViewEmployee'">View</button>
    <button id="btnUpdate" class="btn" onclick="location.href='UpdateEmployee'">Update</button>
    <button id="btnRemove" class="btn" onclick="location.href='RemoveEmployee'">Remove</button>
    <button id="btnAttendance" class="btn" style="top: 210px; left: 480px;" onclick="location.href='AttendanceForm.jsp'">Attendance</button>
    <button id="btnSalary" class="btn" style="top: 210px; left: 620px;" onclick="location.href='SalaryForm.jsp'">Salary</button>

    <button id="btnHome"   onclick="location.href='loginform.html'">Home</button>
  </div>
</body>
</html>
