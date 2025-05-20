import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RemoveEmployee")
public class RemoveEmployee extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // remove employee by ID, then redirect back to details page
    // int id = Integer.parseInt(req.getParameter("id"));
    // ... delete logic ...
    resp.sendRedirect("employeeDetail.jsp");
  }
}
