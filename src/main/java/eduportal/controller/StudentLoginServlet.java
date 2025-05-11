package eduportal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import eduportal.dao.StudentDAO;
import eduportal.model.Student;

@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Student student = StudentDAO.validateLogin(username, password);

        if (student != null) {
            HttpSession session = request.getSession();
            session.setAttribute("student", student);
            response.sendRedirect("StudentDashboard.jsp");
        } else {
            response.sendRedirect("StudentLogin.jsp?error=1");
        }
    }
}
