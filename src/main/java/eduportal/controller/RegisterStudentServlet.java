package eduportal.controller;

import eduportal.dao.StudentDAO;
import eduportal.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterStudentServlet")
public class RegisterStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get data from form
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create Student object
        Student student = new Student();
        student.setName(name);
        student.setUsername(username);
        student.setPassword(password);

        // Save using DAO
        boolean success = StudentDAO.registerStudent(student);

        if (success) {
            response.sendRedirect("StudentLogin.jsp"); // Registration successful
        } else {
            response.sendRedirect("StudentRegister.jsp?error=1"); // Failed
        }
    }
}
