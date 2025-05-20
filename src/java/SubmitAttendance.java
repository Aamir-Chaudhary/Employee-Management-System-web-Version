import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SubmitAttendance")
public class SubmitAttendance extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String empId = request.getParameter("empId");
        String status = request.getParameter("status");
        java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

        try (Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/loginform", "root", "Aamir12345")) {

            // Check if attendance already exists for today
            String checkSql = "SELECT * FROM attendance WHERE empId = ? AND date = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setString(1, empId);
                checkStmt.setDate(2, today);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    request.setAttribute("error", "Attendance already marked for today.");
                    request.getRequestDispatcher("markAttendance.jsp").forward(request, response);
                    return;
                }
            }

            // Insert attendance
            String insertSql = "INSERT INTO attendance (empId, date, status) VALUES (?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(insertSql)) {
                ps.setString(1, empId);
                ps.setDate(2, today);
                ps.setString(3, status);
                ps.executeUpdate();
            }

            // Redirect to avoid resubmission
            response.sendRedirect("EmployeeDetail");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("markAttendance.jsp").forward(request, response);
        }
    }
}
