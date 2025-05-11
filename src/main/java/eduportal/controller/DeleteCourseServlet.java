package eduportal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import eduportal.dao.CourseDAO;

@WebServlet("/DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                boolean deleted = CourseDAO.deleteCourseById(id);

                if (deleted) {
                    response.sendRedirect("ViewCourses.jsp");
                } else {
                    response.getWriter().write("Course could not be deleted.");
                }
            } catch (NumberFormatException e) {
                response.getWriter().write("Invalid Course ID.");
            }
        } else {
            response.getWriter().write("Course ID is required.");
        }
    }
}
