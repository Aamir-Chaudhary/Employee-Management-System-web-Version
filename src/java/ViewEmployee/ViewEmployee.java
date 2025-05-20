import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ViewEmployee")
public class ViewEmployee extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // fetch list from DB, set as request attribute, forward to view JSP
    // req.setAttribute("employees", list);
    req.getRequestDispatcher("viewEmployee.jsp").forward(req, resp);
  }
}
