package eduportal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eduportal.dao.EnrollmentDAO;
import eduportal.model.Student;

@WebServlet("/EnrollCourseServlet")
public class EnrollCourseServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        Student student = (Student) request.getSession().getAttribute("student");

        if (student != null) {
            boolean success = EnrollmentDAO.enrollStudentInCourse(student.getId(), courseId);
            
            if (success) {
                response.sendRedirect("ViewAndEnrollCourses.jsp?message=Successfully enrolled in the course!");
            } else {
                response.sendRedirect("ViewAndEnrollCourses.jsp?message=Already enrolled in this course.");
            }
        } else {
            response.sendRedirect("StudentLogin.jsp");
        }
    }
}
