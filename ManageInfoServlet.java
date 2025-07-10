package controller;

import model.bean.Info;
import dao.InfoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/manage-options")
public class ManageInfoServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        InfoDAO dao = new InfoDAO();

        try {
            // Retrieve all coupons and promotions from the database
            List<Info> coupons = dao.getAllCoupons();
            List<Info> promotions = dao.getAllPromotions();

            // Debug logs
            System.out.println("ManageInfoServlet triggered:");
            System.out.println("→ Coupons found: " + coupons.size());
            System.out.println("→ Promotions found: " + promotions.size());

            // Set data to request
            request.setAttribute("coupons", coupons);
            request.setAttribute("promotions", promotions);

            // Get messages from session and transfer to request
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("message") != null) {
                    request.setAttribute("message", session.getAttribute("message"));
                    session.removeAttribute("message");
                }
                if (session.getAttribute("errorMessage") != null) {
                    request.setAttribute("errorMessage", session.getAttribute("errorMessage"));
                    session.removeAttribute("errorMessage");
                }
            }

            // Forward to the JSP
            request.getRequestDispatcher("ManageOptions.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to retrieve data.");
            request.getRequestDispatcher("ManageOptions.jsp").forward(request, response);
        }
    }
}