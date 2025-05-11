package eduportal.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import eduportal.dao.CourseDAO;
import eduportal.model.Course;

@WebServlet("/EditCourseServlet")
public class EditCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("course_id"));
        String name = req.getParameter("name");
        String desc = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        String category = req.getParameter("category");
        String image = req.getParameter("image_url");

        Course course = new Course();
        course.setId(id);
        course.setName(name);
        course.setDescription(desc);
        course.setPrice(price);
        course.setCategory(category);
        course.setImageUrl(image);

        boolean updated = CourseDAO.updateCourse(course);

        if (updated) {
            res.sendRedirect("ViewCourses.jsp");
        } else {
            res.getWriter().write("Error updating course.");
        }
    }
}
