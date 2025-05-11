package eduportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import eduportal.model.Instructor;
import eduportal.util.DBConnection;

public class InstructorDAO {

    public static List<Instructor> getAllInstructors() {
        List<Instructor> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM instructors";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Instructor inst = new Instructor();
                inst.setId(rs.getInt("instructor_id"));
                inst.setName(rs.getString("name"));
                inst.setEmail(rs.getString("email"));
                list.add(inst);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
