package controller;

import model.bean.Info;
import dao.InfoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/add-info")
public class AddInfoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        InfoDAO infoDAO = new InfoDAO();
        Info info = new Info();

        // Determine form type
        String actionType = request.getParameter("code") != null ? "coupon" : "promotion";
        System.out.println("[AddInfoServlet] Action type: " + actionType);

        try {
            if ("coupon".equals(actionType)) {
                // Handle Coupon
                info.setType("coupon");
                info.setCode(request.getParameter("code"));
                info.setDiscount(parseIntSafe(request.getParameter("discount")));
                info.setValidFrom(parseDateSafe(request.getParameter("valid-from")));
                info.setValidUntil(parseDateSafe(request.getParameter("valid-until")));
                info.setUsageLimit(parseIntSafe(request.getParameter("usage-limit")));

                boolean success = infoDAO.insertCoupon(info);

                if (success) {
                    request.setAttribute("message", "Coupon added successfully.");
                } else {
                    request.setAttribute("errorMessage", "Failed to add coupon.");
                }

            } else {
                // Handle Promotion
                info.setType("promotion");
                info.setTitle(request.getParameter("title"));
                info.setDescription(request.getParameter("description"));
                info.setStartDate(parseDateSafe(request.getParameter("start-date")));
                info.setEndDate(parseDateSafe(request.getParameter("end-date")));
                info.setAudience(request.getParameter("audience"));

                boolean success = infoDAO.insertPromotion(info);

                if (success) {
                    request.setAttribute("message", "Promotion added successfully.");
                } else {
                    request.setAttribute("errorMessage", "Failed to add promotion.");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
        }

        // Forward to view
        request.getRequestDispatcher("AddOption.jsp").forward(request, response);
    }

    // Helper: Parse Integer
    private int parseIntSafe(String value) {
        try {
            return (value != null && !value.isEmpty()) ? Integer.parseInt(value) : 0;
        } catch (NumberFormatException e) {
            System.out.println("Failed to parse integer: " + value);
            return 0;
        }
    }

    // Helper: Parse Date
    private Date parseDateSafe(String value) {
        try {
            return (value != null && !value.isEmpty()) ? Date.valueOf(value) : null;
        } catch (IllegalArgumentException e) {
            System.out.println("Failed to parse date: " + value);
            return null;
        }
    }
}