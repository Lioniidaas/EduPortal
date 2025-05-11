package eduportal.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import eduportal.model.Admin;

public class AdminDAO {

    public static Admin validateAdmin(String username, String password) {
        Admin admin = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "system", "mydb");

            String sql = "SELECT * FROM edu_admins WHERE USERNAME = ? AND PASSWORD = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                admin = new Admin();
                admin.setId(rs.getInt("ADMIN_ID"));
                admin.setUsername(rs.getString("USERNAME"));
                // You can set other fields if necessary
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
}
