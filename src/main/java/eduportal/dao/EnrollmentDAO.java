package eduportal.dao;

import eduportal.model.Course;
import eduportal.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EnrollmentDAO {

    // Enroll student to a course
    public static boolean enrollStudent(int studentId, int courseId) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO enrollments (enrollment_id, student_id, course_id) VALUES (enrollments_seq.NEXTVAL, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = true;
            }

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Check if student is already enrolled in the course
    public static boolean isStudentEnrolledInCourse(int studentId, int courseId) {
        boolean enrolled = false;
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT COUNT(*) FROM enrollments WHERE student_id = ? AND course_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                enrolled = rs.getInt(1) > 0;
            }

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return enrolled;
    }

    // Enroll student in a course (prevents duplicate enrollments)
    public static boolean enrollStudentInCourse(int studentId, int courseId) {
        try (Connection conn = DBConnection.getConnection()) {
            // Check if the student is already enrolled in the course
            if (isStudentEnrolledInCourse(studentId, courseId)) {
                return false; // Already enrolled, prevent duplicate
            }

            // Proceed with inserting the enrollment if not already enrolled
            String sql = "INSERT INTO enrollments (ENROLLMENT_ID, student_id, course_id) VALUES (ENROLLMENT_SEQ.NEXTVAL, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ps.setInt(2, courseId);

            int result = ps.executeUpdate();
            ps.close();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get list of courses the student is enrolled in
    public static List<Course> getEnrolledCoursesForStudent(int studentId) {
        List<Course> enrolledCourses = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT c.course_id, c.name, c.description, c.price, c.category, c.image_url, i.name AS instructor_name " +
                         "FROM courses c " +
                         "JOIN enrollments e ON c.course_id = e.course_id " +
                         "LEFT JOIN instructors i ON c.instructor_id = i.instructor_id " +
                         "WHERE e.student_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("course_id"));
                course.setName(rs.getString("name"));
                course.setDescription(rs.getString("description"));
                course.setPrice(rs.getDouble("price"));
                course.setCategory(rs.getString("category"));
                course.setImageUrl(rs.getString("image_url"));
                course.setInstructorName(rs.getString("instructor_name"));
                enrolledCourses.add(course);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return enrolledCourses;
    }
    
 // Get the number of students enrolled in a specific course
    public static int getEnrollmentCountByCourse(int courseId) {
        int count = 0;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM enrollments WHERE course_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

}
