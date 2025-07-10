package controller;

import dao.InfoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/delete-info")
public class DeleteInfoServlet extends HttpServlet {

    private InfoDAO dao;

    @Override
    public void init() {
        dao = new InfoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");
        int id = parseIntSafe(request.getParameter("id"));

        boolean success = false;

        if ("coupon".equals(type)) {
            success = dao.deleteCouponById(id);
        } else if ("promotion".equals(type)) {
            success = dao.deletePromotionById(id);
        }

        if (success) {
            request.setAttribute("message", type + " deleted successfully.");
        } else {
            request.setAttribute("errorMessage", "Failed to delete " + type + ".");
        }

        // Forward to ManageOptions.jsp with updated list
        request.getRequestDispatcher("manage-options").forward(request, response);
    }

    // Safe parse method
    private int parseIntSafe(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return -1;
        }
    }
}