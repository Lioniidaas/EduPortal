<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="eduportal.model.Student"%>
<%@ page import="java.util.List" %>
<%@ page import="eduportal.dao.CourseDAO, eduportal.dao.EnrollmentDAO" %>
<%@ page import="eduportal.model.Course" %>
<%@ page session="true" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>


<%
    // Get the student from the session
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("StudentLogin.jsp");
        return;
    }

    // Get all available courses
    List<Course> courses = CourseDAO.getAllCourses();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Courses</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h2 {
            text-align: center;
            margin-top: 50px;
            font-size: 2rem;
            color: #1976d2;
        }
        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #f2f2f2;
        }
        th {
            background-color: #1976d2;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .enroll-btn, .enrolled-label {
            background-color: #1976d2;
            color: white;
            padding: 8px 15px;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .enroll-btn:hover {
            background-color: #0d47a1;
        }
        .enrolled-label {
            background-color: #4caf50;
        }
        .back-btn {
            display: inline-block;
            background-color: #ff5722;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 6px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .back-btn:hover {
            background-color: #e64a19;
        }
        .logout-btn {
            display: inline-block;
            background-color: #f44336;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 6px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .logout-btn:hover {
            background-color: #d32f2f;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .action-btns {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>🎓 Available Courses</h2>

        <table>
            <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (Course course : courses) {
                    boolean isEnrolled = EnrollmentDAO.isStudentEnrolledInCourse(student.getId(), course.getId());
                %>
                <tr>
                    <td><%= course.getName() %></td>
                    <td><%= course.getDescription() %></td>
                    <td><%= course.getPrice() %></td>
                    <td><%= course.getCategory() %></td>
                    <td>
                        <% if (isEnrolled) { %>
                            <span class="enrolled-label">✅ Already Enrolled</span>
                        <% } else { %>
                            <a href="EnrollCourseServlet?courseId=<%= course.getId() %>" class="enroll-btn">Enroll</a>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>

        <div class="action-btns">
            <a href="StudentDashboard.jsp" class="back-btn">🏠 Back to Dashboard</a>
            <a href="LogoutServlet" class="logout-btn">🚪 Logout</a>
        </div>
    </div>

</body>
</html>
