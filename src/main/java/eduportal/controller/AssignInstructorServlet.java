package eduportal.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eduportal.dao.CourseDAO;

@WebServlet("/AssignInstructorServlet")
public class AssignInstructorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  // No SQLException here

        int courseId = Integer.parseInt(request.getParameter("course_id"));
        int instructorId = Integer.parseInt(request.getParameter("instructor_id"));

        try {
            // Call the DAO to assign the instructor
            boolean isAssigned = CourseDAO.assignInstructorToCourse(courseId, instructorId);

            if (isAssigned) {
                response.sendRedirect("ViewCourses.jsp"); // Redirect after assignment
            } else {
                response.sendRedirect("AssignInstructor.jsp"); // Redirect on failure
            }
        } catch (Exception e) {
            // Handle SQLException locally
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to an error page if SQLException occurs
        }
    }
}
