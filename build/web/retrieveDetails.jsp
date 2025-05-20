<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id          = (String) request.getAttribute("eEmployeeId");
  String name        = (String) request.getAttribute("eName");
  String age         = (String) request.getAttribute("eAge");
  String address     = (String) request.getAttribute("eAddress");
  String email       = (String) request.getAttribute("eEmailId");
  String jobPost     = (String) request.getAttribute("eJobPost");
  String father      = (String) request.getAttribute("eFathersName");
  String mobile      = (String) request.getAttribute("eMobileNumber");
  String qual        = (String) request.getAttribute("eQualification");
  String citizenship = (String) request.getAttribute("eCitizenshipNumber");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Employee Details</title>
  <style>
    body {
      margin: 0; padding: 0;
      font-family: "Times New Roman", serif;
      background: url("pexels-photo.jpg") no-repeat center center fixed;
      background-size: cover;
    }
    .panel {
      max-width: 600px;
      margin: 40px auto;
      padding: 20px;
      background: rgba(255,255,255,0.85);
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.3);
      display: grid;
      grid-template-columns: 180px 1fr;
      row-gap: 12px;
      column-gap: 16px;
      align-items: center;
    }
    .panel h2 {
      grid-column: 1 / -1;
      text-align: center;
      margin-bottom: 20px;
      font-style: italic;
      font-size: 24px;
      color: #333;
    }
    .panel .label {
      text-align: right;
      font-weight: bold;
      color: #333;
    }
    .panel .value {
      text-align: left;
      color: #555;
    }
    #btnOk {
      grid-column: 1 / -1;
      justify-self: center;
      margin-top: 20px;
      padding: 8px 20px;
      font-size: 16px;
      color: #fff;
      background: #4285F4;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      transition: background .3s ease;
    }
    #btnOk:hover {
      background: #357ae8;
    }
  </style>
</head>
<body>
  <div class="panel">
    <h2>Employee Details</h2>

    <div class="label">Employee Id:</div><div class="value"><%= id %></div>
    <div class="label">Age:</div><div class="value"><%= age %></div>
    <div class="label">Name:</div><div class="value"><%= name %></div>
    <div class="label">Address:</div><div class="value"><%= address %></div>
    <div class="label">Email Id:</div><div class="value"><%= email %></div>
    <div class="label">Job Post:</div><div class="value"><%= jobPost %></div>
    <div class="label">Father’s Name:</div><div class="value"><%= father %></div>
    <div class="label">Mobile Number:</div><div class="value"><%= mobile %></div>
    <div class="label">Qualification:</div><div class="value"><%= qual %></div>
    <div class="label">Citizenship Number:</div><div class="value"><%= citizenship %></div>

    <button id="btnOk" onclick="location.href='EmployeeDetail'">OK</button>
  </div>
</body>
</html>
