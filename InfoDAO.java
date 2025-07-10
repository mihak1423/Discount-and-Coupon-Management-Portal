package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.bean.Info;

public class InfoDAO {

    private final String jdbcURL = "jdbc:derby://localhost:1527/GroupAssignDB";
    private final String jdbcUsername = "app";
    private final String jdbcPassword = "app";

    private static final String INSERT_COUPON_SQL =
        "INSERT INTO COUPON (CODE, DISCOUNT, VALID_FROM, VALID_UNTIL, USAGE_LIMIT) VALUES (?, ?, ?, ?, ?)";

    private static final String INSERT_PROMOTION_SQL =
        "INSERT INTO PROMOTION (TITLE, DESCRIPTION, START_DATE, END_DATE, AUDIENCE) VALUES (?, ?, ?, ?, ?)";

    public InfoDAO() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found.");
            e.printStackTrace();
        }
    }

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // === INSERT COUPON ===
    public boolean insertCoupon(Info info) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_COUPON_SQL)) {

            ps.setString(1, info.getCode());
            ps.setInt(2, info.getDiscount());
            ps.setDate(3, info.getValidFrom());
            ps.setDate(4, info.getValidUntil());
            ps.setInt(5, info.getUsageLimit());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error inserting coupon:");
            e.printStackTrace();
            return false;
        }
    }

    // === INSERT PROMOTION ===
    public boolean insertPromotion(Info info) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_PROMOTION_SQL)) {

            ps.setString(1, info.getTitle());
            ps.setString(2, info.getDescription());
            ps.setDate(3, info.getStartDate());
            ps.setDate(4, info.getEndDate());
            ps.setString(5, info.getAudience());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error inserting promotion:");
            e.printStackTrace();
            return false;
        }
    }

    // === GET ALL COUPONS ===
    public List<Info> getAllCoupons() {
        List<Info> coupons = new ArrayList<>();
        String sql = "SELECT * FROM COUPON";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Info info = new Info();
                info.setId(rs.getInt("ID"));
                info.setCode(rs.getString("CODE"));
                info.setDiscount(rs.getInt("DISCOUNT"));
                info.setValidFrom(rs.getDate("VALID_FROM"));
                info.setValidUntil(rs.getDate("VALID_UNTIL"));
                info.setUsageLimit(rs.getInt("USAGE_LIMIT"));
                coupons.add(info);
            }

            System.out.println("getAllCoupons(): Found " + coupons.size() + " records.");

        } catch (SQLException e) {
            System.err.println("Error retrieving coupons:");
            e.printStackTrace();
        }

        return coupons;
    }

    // === GET ALL PROMOTIONS ===
    public List<Info> getAllPromotions() {
        List<Info> promotions = new ArrayList<>();
        String sql = "SELECT * FROM PROMOTION";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Info info = new Info();
                info.setId(rs.getInt("ID"));
                info.setTitle(rs.getString("TITLE"));
                info.setDescription(rs.getString("DESCRIPTION"));
                info.setStartDate(rs.getDate("START_DATE"));
                info.setEndDate(rs.getDate("END_DATE"));
                info.setAudience(rs.getString("AUDIENCE"));
                promotions.add(info);
            }

            System.out.println("getAllPromotions(): Found " + promotions.size() + " records.");

        } catch (SQLException e) {
            System.err.println("Error retrieving promotions:");
            e.printStackTrace();
        }

        return promotions;
    }

    // === GET COUPON BY ID ===
    public Info getCouponById(int id) {
        Info info = null;
        String sql = "SELECT * FROM COUPON WHERE ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                info = new Info();
                info.setId(id);
                info.setCode(rs.getString("CODE"));
                info.setDiscount(rs.getInt("DISCOUNT"));
                info.setValidFrom(rs.getDate("VALID_FROM"));
                info.setValidUntil(rs.getDate("VALID_UNTIL"));
                info.setUsageLimit(rs.getInt("USAGE_LIMIT"));
            }

        } catch (SQLException e) {
            System.err.println("Error retrieving coupon by ID:");
            e.printStackTrace();
        }

        return info;
    }

    // === GET PROMOTION BY ID ===
    public Info getPromotionById(int id) {
        Info info = null;
        String sql = "SELECT * FROM PROMOTION WHERE ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                info = new Info();
                info.setId(id);
                info.setTitle(rs.getString("TITLE"));
                info.setDescription(rs.getString("DESCRIPTION"));
                info.setStartDate(rs.getDate("START_DATE"));
                info.setEndDate(rs.getDate("END_DATE"));
                info.setAudience(rs.getString("AUDIENCE"));
            }

        } catch (SQLException e) {
            System.err.println("Error retrieving promotion by ID:");
            e.printStackTrace();
        }

        return info;
    }

    // === UPDATE COUPON ===
    public boolean updateCoupon(Info info) {
        String sql = "UPDATE COUPON SET CODE = ?, DISCOUNT = ?, VALID_FROM = ?, VALID_UNTIL = ?, USAGE_LIMIT = ? WHERE ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, info.getCode());
            ps.setInt(2, info.getDiscount());
            ps.setDate(3, info.getValidFrom());
            ps.setDate(4, info.getValidUntil());
            ps.setInt(5, info.getUsageLimit());
            ps.setInt(6, info.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error updating coupon:");
            e.printStackTrace();
            return false;
        }
    }

    // === UPDATE PROMOTION ===
    public boolean updatePromotion(Info info) {
        String sql = "UPDATE PROMOTION SET TITLE = ?, DESCRIPTION = ?, START_DATE = ?, END_DATE = ?, AUDIENCE = ? WHERE ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, info.getTitle());
            ps.setString(2, info.getDescription());
            ps.setDate(3, info.getStartDate());
            ps.setDate(4, info.getEndDate());
            ps.setString(5, info.getAudience());
            ps.setInt(6, info.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error updating promotion:");
            e.printStackTrace();
            return false;
        }
    }

    // === DELETE COUPON ===
    public boolean deleteCouponById(int id) {
        String sql = "DELETE FROM COUPON WHERE ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error deleting coupon:");
            e.printStackTrace();
            return false;
        }
    }

    // === DELETE PROMOTION ===
    public boolean deletePromotionById(int id) {
        String sql = "DELETE FROM PROMOTION WHERE ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error deleting promotion:");
            e.printStackTrace();
            return false;
        }
    }
}