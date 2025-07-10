package controller;

import model.bean.Info;
import dao.InfoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/edit-info")
public class EditInfoServlet extends HttpServlet {

    private InfoDAO dao;

    @Override
    public void init() {
        dao = new InfoDAO();
    }

    // Display edit form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String type = request.getParameter("type");

            Info info = "coupon".equals(type)
                    ? dao.getCouponById(id)
                    : dao.getPromotionById(id);

            request.setAttribute("info", info);
            request.setAttribute("type", type);
            request.getRequestDispatcher("EditOption.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Error loading data for editing.");
            response.sendRedirect("manage-options");
        }
    }

    // Handle update form submit
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type");
        int id = parseIntSafe(request.getParameter("id"));

        Info info = new Info();
        info.setId(id);

        boolean success = false;

        if ("coupon".equals(type)) {
            info.setCode(request.getParameter("code"));
            info.setDiscount(parseIntSafe(request.getParameter("discount")));
            info.setValidFrom(parseDateSafe(request.getParameter("validFrom")));
            info.setValidUntil(parseDateSafe(request.getParameter("validUntil")));
            info.setUsageLimit(parseIntSafe(request.getParameter("usageLimit")));

            success = dao.updateCoupon(info);

        } else {
            info.setTitle(request.getParameter("title"));
            info.setDescription(request.getParameter("description"));
            info.setStartDate(parseDateSafe(request.getParameter("startDate")));
            info.setEndDate(parseDateSafe(request.getParameter("endDate")));
            info.setAudience(request.getParameter("audience"));

            success = dao.updatePromotion(info);
        }

        // Store success/failure message in session
        HttpSession session = request.getSession();
        if (success) {
            session.setAttribute("message", "Successfully updated " + type + ".");
        } else {
            session.setAttribute("errorMessage", "Failed to update " + type + ".");
        }

        // Redirect to manage-options to prevent POST issues and allow clean reload
        response.sendRedirect("manage-options");
    }

    // Helpers
    private int parseIntSafe(String value) {
        try {
            return (value != null && !value.isEmpty()) ? Integer.parseInt(value) : 0;
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private Date parseDateSafe(String value) {
        try {
            return (value != null && !value.isEmpty()) ? Date.valueOf(value) : null;
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}