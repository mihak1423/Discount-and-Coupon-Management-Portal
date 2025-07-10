package dao;

import model.bean.User;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // Register a new user
    public boolean registerUser(User user) {
        String sql = "INSERT INTO USERS (USERNAME, PASSWORD) VALUES (?, ?)";
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;

        } catch (Exception e) {
            System.out.println("❌ Error in registerUser():");
            e.printStackTrace();
            return false;
        }
    }

    // Validate user login
    public boolean validateUser(User user) {
        String sql = "SELECT * FROM USERS WHERE USERNAME = ? AND PASSWORD = ?";
        try (Connection conn = DBConnection.createConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());

            ResultSet rs = ps.executeQuery();
            return rs.next(); // returns true if match found

        } catch (Exception e) {
            System.out.println("❌ Error in validateUser():");
            e.printStackTrace();
            return false;
        }
    }
}