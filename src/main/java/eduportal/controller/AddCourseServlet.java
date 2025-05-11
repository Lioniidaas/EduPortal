package eduportal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import eduportal.dao.CourseDAO;
import eduportal.model.Course;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String courseName = request.getParameter("courseName");
        String courseDescription = request.getParameter("courseDescription");
        double coursePrice = Double.parseDouble(request.getParameter("coursePrice"));
        String courseCategory = request.getParameter("courseCategory");
        String courseImage = request.getParameter("courseImage");

        Course newCourse = new Course();
        newCourse.setName(courseName);
        newCourse.setDescription(courseDescription);
        newCourse.setPrice(coursePrice);
        newCourse.setCategory(courseCategory);
        newCourse.setImageUrl(courseImage);

        boolean isAdded = CourseDAO.addCourse(newCourse);

        if (isAdded) {
            response.sendRedirect("AdminDashboard.jsp");
        } else {
            response.sendRedirect("AddCourse.jsp?error=1");
        }
    }
}
