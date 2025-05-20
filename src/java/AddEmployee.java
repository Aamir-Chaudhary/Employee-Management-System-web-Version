import java.io.IOException;
import java.sql.*;
import javax.lang.model.SourceVersion;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddEmployee")  // Ensure the servlet is correctly mapped in web.xml or with @WebServlet
public class AddEmployee extends HttpServlet {
  
  // Handle POST request - Add new employee
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    // Read and trim all parameters
    String empId    = req.getParameter("empId").trim();
    String name     = req.getParameter("name").trim();
    String age      = req.getParameter("age").trim();
    String father   = req.getParameter("father").trim();
    String address  = req.getParameter("address").trim();
    String mobile   = req.getParameter("mobile").trim();
    String email    = req.getParameter("email").trim();
    String job      = req.getParameter("job").trim();
    String qual     = req.getParameter("qualification").trim();
    String citizen  = req.getParameter("citizen").trim();
    String hireDate = req.getParameter("hireDate").trim();
    String attendance = req.getParameter("attendance").trim();
    String salary   = req.getParameter("salary").trim();

    // (Optional) Add server-side validation here...
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      try (Connection conn = DriverManager.getConnection(
              "jdbc:mysql://localhost:3306/loginform?zeroDateTimeBehavior=CONVERT_TO_NULL",
              "root", "Aamir12345")) {

        String sql = "INSERT INTO employeedetails"
                   + "(eName,eAge,eAddress,eEmailId,eJobPost,"
                   + "eEmployeeId,eFathersName,eMobileNumber,"
                   + "eQualification,eCitizenshipNumber,hireDate,"
                   + "attendance,salary) "
                   + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
          ps.setString(1, name);
          ps.setInt(2, Integer.parseInt(age));
          ps.setString(3, address);
          ps.setString(4, email);
          ps.setString(5, job);
          ps.setInt(6, Integer.parseInt(empId));
          ps.setString(7, father);
          ps.setLong(8, Long.parseLong(mobile));
          ps.setString(9, qual);
          ps.setLong(10, Long.parseLong(citizen));
          ps.setDate(11, Date.valueOf(hireDate));          // yyyy-MM-dd
          ps.setInt(12, Integer.parseInt(attendance));
          ps.setBigDecimal(13, new java.math.BigDecimal(salary));

          ps.executeUpdate();
        }
      }

      // Redirect back to the EmployeeDetail page on success
      resp.sendRedirect("EmployeeDetail?message=added");
    } catch (Exception e) {
      // On error (e.g. duplicate ID), send back to form with error flag
      resp.sendRedirect("addEmployee.jsp?error=" + 
         java.net.URLEncoder.encode(e.getMessage(), "UTF-8"));
    }
  }

  // Handle GET request - Show form for adding employee
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // Forward to the addEmployee.jsp page where the form is located
    req.getRequestDispatcher("/addEmployee.jsp").forward(req, resp);
  }

  // Optional: You can override init() and destroy() methods as well for better resource management

  public SourceVersion getSupportedSourceVersion() {
    return SourceVersion.latest();
  }
}
