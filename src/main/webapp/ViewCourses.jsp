<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, eduportal.model.Course, eduportal.dao.CourseDAO" %>
<%@ page session="true" %>

<%
    // Check if admin is logged in
    eduportal.model.Admin admin = (eduportal.model.Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    // Prevent page from being cached after logout
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // Fetching all courses
    List<Course> courses = CourseDAO.getAllCourses();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Courses - EduPortal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f7f7f7;
            padding: 40px;
            margin: 0;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 40px;
            font-size: 2em;
        }

        .course-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        .card {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .card h4 {
            margin: 10px 0 5px;
            font-size: 1.3em;
            color: #333;
        }

        .card p {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }

        .card .actions {
            margin-top: 15px;
        }

        .card .actions a {
            text-decoration: none;
            color: #0072ff;
            margin: 0 8px;
            font-weight: bold;
            transition: color 0.3s;
        }

        .card .actions a:hover {
            color: #005bb5;
        }

        .footer {
            margin-top: 40px;
            background: #f1f1f1;
            padding: 15px;
            text-align: center;
            font-size: 1.1em;
        }

        .footer a {
            text-decoration: none;
            color: #333;
            padding: 5px 10px;
            margin: 0 15px;
            font-weight: bold;
        }

        .footer a:hover {
            color: #0072ff;
        }
    </style>
</head>
<body>

    <h2>All Courses</h2>

    <div class="course-grid">
        <%
            for (Course c : courses) {
        %>
            <div class="card">
                <img src="<%= c.getImageUrl() %>" alt="Course Image">
                <h4><%= c.getName() %></h4>
                <p><strong>Category:</strong> <%= c.getCategory() %></p>
                <p><%= c.getDescription() %></p>
                <p><strong>Price:</strong> ₹<%= c.getPrice() %></p>
                <p><strong>Instructor:</strong> <%= (c.getInstructorName() != null) ? c.getInstructorName() : "Not Assigned" %></p>
                <div class="actions">
                    <a href="EditCourse.jsp?id=<%= c.getId() %>">✏️ Edit</a>
                    <a href="DeleteCourseServlet?id=<%= c.getId() %>" onclick="return confirm('Are you sure?')">🗑️ Delete</a>
                </div>
            </div>
        <%
            }
        %>
    </div>

    <div class="footer">
        <a href="AdminDashboard.jsp">🏠 Home</a> |
        <a href="LogoutServlet">🚪 Logout</a>
    </div>

</body>
</html>
