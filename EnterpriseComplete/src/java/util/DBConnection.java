package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    
    public static Connection createConnection() {
        Connection con = null;
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/GroupAssignDB", "app", "app");
            System.out.println("✅ Database connected successfully.");
        } catch (Exception e) {
            System.out.println("❌ Database connection failed:");
            e.printStackTrace();
        }
        return con;
    }

    public static Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}