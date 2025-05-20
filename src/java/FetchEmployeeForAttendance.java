

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import javax.lang.model.SourceVersion;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebServlet;
import java.sql.Connection;


import javax.servlet.http.*;
@WebServlet("/FetchEmployeeForAttendance")
public class FetchEmployeeForAttendance extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empId = request.getParameter("empId");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/loginform", "root", "Aamir12345");
             PreparedStatement ps = conn.prepareStatement("SELECT eName FROM employeedetails WHERE eEmployeeId = ?")) {

            ps.setString(1, empId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("empId", empId);
                request.setAttribute("eName", rs.getString("eName"));
                request.getRequestDispatcher("markAttendance.jsp").forward(request, response);
            } else {
                response.getWriter().println("Employee not found.");
            }

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
