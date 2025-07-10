

import dao.UserDAO;
import model.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);
        UserDAO dao = new UserDAO();

        if (dao.validateUser(user)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("Homepage.jsp");  // or dashboard.jsp
        } else {
            request.setAttribute("errorMessage", "❌ Invalid username or password.");
            request.getRequestDispatcher("MainMenu.jsp").forward(request, response);
        }
    }
}