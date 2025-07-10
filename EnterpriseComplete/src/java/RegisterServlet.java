



import dao.UserDAO;
import model.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);
        UserDAO dao = new UserDAO();

        if (dao.registerUser(user)) {
            // Redirect with success flag
            response.sendRedirect("Register.jsp?success=true");
        } else {
            // Stay on the same page with error message
            request.setAttribute("errorMessage", "❌ Registration failed. Username may already exist.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }
}
