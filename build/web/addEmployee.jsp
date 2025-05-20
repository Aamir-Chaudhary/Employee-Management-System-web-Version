<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>New Employee Details</title>
  <style>
    body {margin:0;padding:0;font-family:"Times New Roman";background:url("bg.jpg")center/cover no-repeat fixed;}
    .form-container {
      max-width: 800px; margin:30px auto; padding:20px;
      background: rgba(255,255,255,0.9); border-radius:8px;
      box-shadow:0 0 10px rgba(0,0,0,0.3);
      display:grid; grid-template-columns: 1fr 1fr; grid-gap:16px;
    }
    h2 {grid-column:1/ -1; text-align:center; margin-bottom:10px;}
    label {display:block; font-weight:bold; margin-bottom:4px;}
    input, select {width:100%; padding:6px; border:1px solid #aaa; border-radius:4px;}
    .full-row {grid-column:1/ -1;}
    .buttons {grid-column:1/ -1; text-align:center; margin-top:10px;}
    .buttons button {padding:8px 20px; margin:0 10px; cursor:pointer;}
  </style>
</head>
<body>

  <!-- ✅ Fixed form -->
  <form class="form-container" action="AddEmployee" method="post">
    <h2>New Employee Details</h2>

    <div><label for="empId">Employee ID</label>
      <input type="text" id="empId" name="empId" required pattern="\d+">
    </div>

    <div><label for="name">Name</label>
      <input type="text" id="name" name="name" required>
    </div>

    <div><label for="age">Age</label>
      <input type="number" id="age" name="age" required min="18" max="100">
    </div>

    <div><label for="father">Father’s Name</label>
      <input type="text" id="father" name="father" required>
    </div>

    <div><label for="address">Address</label>
      <input type="text" id="address" name="address" required>
    </div>

    <div><label for="mobile">Mobile Number</label>
      <input type="text" id="mobile" name="mobile" required pattern="\d+">
    </div>

    <div><label for="email">Email Id</label>
      <input type="email" id="email" name="email" required>
    </div>

    <div><label for="job">Job Post</label>
      <input type="text" id="job" name="job" required>
    </div>

    <div><label for="qualification">Qualification</label>
      <input type="text" id="qualification" name="qualification" required>
    </div>

    <div><label for="citizen">Citizenship Number</label>
      <input type="text" id="citizen" name="citizen" required pattern="\d+">
    </div>

    <div><label for="hireDate">Hire Date</label>
      <input type="date" id="hireDate" name="hireDate" required>
    </div>

    <!-- Additional fields -->
    <div><label for="attendance">Attendance (days)</label>
      <input type="number" id="attendance" name="attendance" required min="0">
    </div>

 
 <div><label for="salary">Salary (₹)</label>
      <input type="number" id="salary" name="salary" required step="0.01" min="0">
    </div>

    <div class="buttons full-row">
      <button type="submit">Add Employee</button>
      <button type="button" onclick="location.href='EmployeeDetail'">Cancel</button>
    </div>
         </form>
</body>
</html>
