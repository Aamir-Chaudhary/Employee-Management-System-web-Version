import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SearchEmployee")
public class SearchEmployee extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("empId").trim();
        // Basic validation
        if (id.isEmpty()) {
            response.sendRedirect("viewEmployee.jsp?error=missing");
            return;
        }
        if (!id.matches("\\d+")) {
            response.sendRedirect("viewEmployee.jsp?error=numeric");
            return;
        }

        // Query database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/loginform", "root", "Aamir12345")) {

                String sql = "SELECT * FROM employeedetails WHERE eEmployeeId = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, id);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            // Set attributes for JSP
                            request.setAttribute("eEmployeeId",   rs.getString("eEmployeeId"));
                            request.setAttribute("eName",         rs.getString("eName"));
                            request.setAttribute("eAge",          rs.getString("eAge"));
                            request.setAttribute("eAddress",      rs.getString("eAddress"));
                            request.setAttribute("eEmailId",      rs.getString("eEmailId"));
                            request.setAttribute("eJobPost",      rs.getString("eJobPost"));
                            request.setAttribute("eFathersName",  rs.getString("eFathersName"));
                            request.setAttribute("eMobileNumber", rs.getString("eMobileNumber"));
                            request.setAttribute("eQualification",rs.getString("eQualification"));
                            request.setAttribute("eCitizenshipNumber",
                                                 rs.getString("eCitizenshipNumber"));

                            // Forward to JSP
                            request.getRequestDispatcher("retrieveDetails.jsp")
                                   .forward(request, response);
                            return;
                        } else {
                            // No record found
                            response.sendRedirect("viewEmployee.jsp?error=notfound");
                            return;
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException(e);
        }
    }
}
