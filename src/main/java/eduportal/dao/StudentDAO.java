package eduportal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import eduportal.model.Student;
import eduportal.util.DBConnection;

public class StudentDAO {

    // Method to add student to the database    
	public static List<Student> getAllStudents() {
	    List<Student> students = new ArrayList<>();

	    try (Connection conn = DBConnection.getConnection()) {
	        String query = "SELECT * FROM students";
	        PreparedStatement ps = conn.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Student student = new Student();
	            student.setId(rs.getInt("STUDENT_ID"));    // ✅ correct column name
	            student.setName(rs.getString("NAME"));      // ✅
	            student.setUsername(rs.getString("USERNAME"));  // ✅
	            student.setPassword(rs.getString("PASSWORD"));  // ✅

	            students.add(student);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return students;
	}
	
	 public static Student getStudentByUsernameAndPassword(String username, String password) {
	        Student student = null;
	        try (Connection conn = DBConnection.getConnection()) {
	            String query = "SELECT * FROM students WHERE username = ? AND password = ?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, username);
	            ps.setString(2, password);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                student = new Student();
	                student.setId(rs.getInt("STUDENT_ID"));
	                student.setName(rs.getString("NAME"));
	                student.setUsername(rs.getString("USERNAME"));
	                student.setPassword(rs.getString("PASSWORD"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return student;
	    }
	 
	 public static Student validateLogin(String username, String password) {
		    Student student = null;

		    try (Connection conn = DBConnection.getConnection()) {
		        String query = "SELECT * FROM students WHERE USERNAME=? AND PASSWORD=?";
		        PreparedStatement ps = conn.prepareStatement(query);
		        ps.setString(1, username);
		        ps.setString(2, password);

		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            student = new Student();
		            student.setId(rs.getInt("STUDENT_ID"));
		            student.setName(rs.getString("NAME"));
		            student.setUsername(rs.getString("USERNAME"));
		            student.setPassword(rs.getString("PASSWORD"));
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return student;
		}
 
	 public static boolean registerStudent(Student student) {
		    boolean result = false;

		    try (Connection conn = DBConnection.getConnection()) {
		        String query = "INSERT INTO students (NAME, USERNAME, PASSWORD) VALUES (?, ?, ?)";
		        PreparedStatement ps = conn.prepareStatement(query);
		        ps.setString(1, student.getName());
		        ps.setString(2, student.getUsername());
		        ps.setString(3, student.getPassword());

		        int rows = ps.executeUpdate();
		        result = rows > 0;
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return result;
		}
	 
	 public static boolean updateStudent(Student student) throws Exception {
	        boolean status = false;
	        Connection conn = DBConnection.getConnection();
	        
	        try {
	            // Update the query to use 'STUDENT_ID' instead of 'id'
	            String query = "UPDATE students SET name = ?, username = ?, password = ? WHERE STUDENT_ID = ?";
	            
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, student.getName());
	            ps.setString(2, student.getUsername());
	            ps.setString(3, student.getPassword());
	            ps.setInt(4, student.getId()); // Ensure 'STUDENT_ID' is correctly used
	            
	            int rowsUpdated = ps.executeUpdate();
	            if (rowsUpdated > 0) {
	                status = true;
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        return status;
	    }	 
	 



}
