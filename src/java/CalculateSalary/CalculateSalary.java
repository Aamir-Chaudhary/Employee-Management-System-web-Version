import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import javax.lang.model.SourceVersion;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebServlet;
import java.time.LocalDate;
import java.math.BigDecimal;


import javax.servlet.http.*;


@WebServlet("/CalculateSalary")
public class CalculateSalary extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empId = request.getParameter("empId");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginform", "root", "Aamir12345")) {

            // Get current month start and end
            LocalDate today = LocalDate.now();
            LocalDate firstDay = today.withDayOfMonth(1);
            LocalDate lastDay = today.withDayOfMonth(today.lengthOfMonth());

            // Check if salary is already paid for this month
            String checkSql = "SELECT * FROM salary_log WHERE empId = ? AND salary_month = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setInt(1, Integer.parseInt(empId));
                checkStmt.setDate(2, java.sql.Date.valueOf(firstDay));
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    response.getWriter().println("<h3>Salary already paid for this month.</h3>");
                    return;
                }
            }

            // Fetch monthly salary and hire date
            String empSql = "SELECT hiredate, salary FROM employeedetails WHERE eEmployeeId = ?";
            try (PreparedStatement empStmt = conn.prepareStatement(empSql)) {
                empStmt.setInt(1, Integer.parseInt(empId));
                ResultSet empRs = empStmt.executeQuery();

                if (empRs.next()) {
                    Date hireDate = empRs.getDate("hiredate");
                    double monthlySalary = empRs.getDouble("salary");

                    // Fetch days present in current month
                    String attSql = "SELECT COUNT(*) FROM attendance WHERE empId = ? AND status = 'Present' AND date BETWEEN ? AND ?";
                    try (PreparedStatement attStmt = conn.prepareStatement(attSql)) {
                        attStmt.setInt(1, Integer.parseInt(empId));
                        attStmt.setDate(2, java.sql.Date.valueOf(firstDay));
                        attStmt.setDate(3, java.sql.Date.valueOf(lastDay));

                        ResultSet attRs = attStmt.executeQuery();
                        attRs.next();
                        int daysPresent = attRs.getInt(1);

                        // Calculate salary
                        double perDay = monthlySalary / 30.0;
                        double calculatedSalary = perDay * daysPresent;

                        // Insert into salary_log
                        String insertSql = "INSERT INTO salary_log (empId, salary_month, amount_paid) VALUES (?, ?, ?)";
                        try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                            insertStmt.setInt(1, Integer.parseInt(empId));
                            insertStmt.setDate(2, java.sql.Date.valueOf(firstDay));
                            insertStmt.setBigDecimal(3, new BigDecimal(calculatedSalary));
                            insertStmt.executeUpdate();
                        }

                        // Show salary breakdown
                        response.setContentType("text/html");
                        response.getWriter().println("<div style='font-family: Arial; background: #f4f4f4; padding: 20px; max-width: 600px; margin: 40px auto; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.2);'>");
                        response.getWriter().println("<h2>Salary Details for Employee ID: " + empId + "</h2>");
                        response.getWriter().println("<p><strong>Hire Date:</strong> " + hireDate + "</p>");
                        response.getWriter().println("<p><strong>Monthly Salary:</strong> ₹" + monthlySalary + "</p>");
                        response.getWriter().println("<p><strong>Days Present (This Month):</strong> " + daysPresent + "</p>");
                        response.getWriter().println("<p><strong>Calculated Salary:</strong> ₹" + String.format("%.2f", calculatedSalary) + "</p>");
                        response.getWriter().println("</div>");
                    }
                } else {
                    response.getWriter().println("<h3>Employee not found.</h3>");
                }
            }

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
