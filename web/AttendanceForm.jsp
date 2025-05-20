<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Mark Attendance</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f7f9;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      background: #ffffff;
      padding: 30px 40px;
      border-radius: 10px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
      text-align: center;
    }

    h2 {
      margin-bottom: 20px;
      color: #333;
    }

    input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
    }

    button {
      width: 100%;
      background-color: #007bff;
      color: white;
      padding: 12px;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    button:hover {
      background-color: #0056b3;
    }
  </style>
   <script>
    // Function to show a success message popup
    function showMessage(message) {
      alert(message);
    }
  </script>
</head>
<body>
  <div class="container">
    <h2>Mark Employee Attendance</h2>
    <form action="FetchEmployeeForAttendance" method="post">
      <input type="text" name="empId" placeholder="Enter Employee ID" required>
      <button type="submit">Fetch</button>
    </form>
  </div>
    <%-- Check if a message is set (after successful insertion) --%>
<% String message = (String) request.getAttribute("message"); %>
<% if (message != null) { %>
  <script>
    showMessage("<%= message %>");
  </script>
<% } %>
</body>
</html>
