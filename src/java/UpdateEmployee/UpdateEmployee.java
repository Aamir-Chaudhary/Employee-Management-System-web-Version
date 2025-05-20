import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // fetch selected employee, forward to update JSP
    req.getRequestDispatcher("updateEmployee.jsp").forward(req, resp);
  }
}
