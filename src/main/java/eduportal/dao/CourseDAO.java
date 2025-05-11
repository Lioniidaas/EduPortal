package eduportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import eduportal.model.Course;
import eduportal.util.DBConnection;

public class CourseDAO {

    public static boolean addCourse(Course course) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO courses (name, description, price, category, image_url) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, course.getName());
            ps.setString(2, course.getDescription());
            ps.setDouble(3, course.getPrice());
            ps.setString(4, course.getCategory());
            ps.setString(5, course.getImageUrl());

            int result = ps.executeUpdate();
            ps.close();

            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Course> getAllCourses() {
        List<Course> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT c.course_id, c.name, c.description, c.price, c.category, c.image_url, " +
                         "i.name AS instructor_name " +
                         "FROM courses c LEFT JOIN instructors i ON c.instructor_id = i.instructor_id";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("course_id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setPrice(rs.getDouble("price"));
                c.setCategory(rs.getString("category"));
                c.setImageUrl(rs.getString("image_url"));
                c.setInstructorName(rs.getString("instructor_name")); // instructor name from joined table

                list.add(c);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean deleteCourseById(int courseId) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM courses WHERE course_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, courseId);
            int result = ps.executeUpdate();
            ps.close();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Course getCourseById(int id) {
        Course c = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT c.*, i.name AS instructor_name " +
                         "FROM courses c LEFT JOIN instructors i ON c.instructor_id = i.instructor_id " +
                         "WHERE c.course_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                c = new Course();
                c.setId(rs.getInt("course_id"));
                c.setName(rs.getString("name"));
                c.setDescription(rs.getString("description"));
                c.setPrice(rs.getDouble("price"));
                c.setCategory(rs.getString("category"));
                c.setImageUrl(rs.getString("image_url"));
                c.setInstructorName(rs.getString("instructor_name"));
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    public static boolean updateCourse(Course c) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE courses SET name=?, description=?, price=?, category=?, image_url=? WHERE course_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getDescription());
            ps.setDouble(3, c.getPrice());
            ps.setString(4, c.getCategory());
            ps.setString(5, c.getImageUrl());
            ps.setInt(6, c.getId());

            int result = ps.executeUpdate();
            ps.close();

            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean assignInstructorToCourse(int courseId, int instructorId) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE courses SET instructor_id=? WHERE course_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, instructorId);
            ps.setInt(2, courseId);

            int rowsAffected = ps.executeUpdate();
            ps.close();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
