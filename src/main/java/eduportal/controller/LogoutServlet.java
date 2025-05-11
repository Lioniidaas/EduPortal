package eduportal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles logout via hyperlink <a href="LogoutServlet">
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Avoid creating a new session
        String redirectPage = "index.jsp"; // Default fallback

        if (session != null) {
            if (session.getAttribute("admin") != null) {
                redirectPage = "AdminLogin.jsp";
            } else if (session.getAttribute("student") != null) {
                redirectPage = "StudentLogin.jsp";
            }
            session.invalidate();
        }

        response.sendRedirect(redirectPage);
    }

    // Handles logout via POST (e.g., <form method="post">)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Delegate to doGet to avoid duplication
    }
}
