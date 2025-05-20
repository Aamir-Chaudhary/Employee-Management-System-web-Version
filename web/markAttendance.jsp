<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mark Attendance</title>
    <style>
        body {
            background: #f0f2f5;
            font-family: Arial, sans-serif;
        }
        .card {
            width: 400px;
            margin: 80px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            padding: 30px;
            text-align: center;
        }
        .card input, .card select, .card button {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .card button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .card button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Mark Attendance</h2>
        <form method="post" action="SubmitAttendance">
            <input type="text" name="empId" placeholder="Enter Employee ID" required><br>
            <select name="status" required>
                <option value="">-- Select Status --</option>
                <option value="Present">Present</option>
                <option value="Absent">Absent</option>
            </select><br>
            <button type="submit">Submit</button>
        </form>
    </div>

    <% if (request.getAttribute("status") != null) { %>
    <script>
        alert("Attendance marked successfully.");
        window.location.href = "EmployeeDetail";
    </script>
    <% } else if (request.getAttribute("error") != null) { %>
    <script>
        alert("<%= request.getAttribute("error") %>");
    </script>
    <% } %>
</body>
</html>
