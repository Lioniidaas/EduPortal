<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="eduportal.model.Student" %>
<%@ page import="eduportal.dao.EnrollmentDAO" %>
<%@ page import="eduportal.dao.CourseDAO" %>
<%@ page import="eduportal.model.Course" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>


<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("StudentLogin.jsp");
        return;
    }

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    List<Course> enrolledCourses = EnrollmentDAO.getEnrolledCoursesForStudent(student.getId());
    List<Course> availableCourses = CourseDAO.getAllCourses(); // Assuming you have this method
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard - EduPortal</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #f4f7fa;
            margin: 0;
            padding: 0;
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #1976d2;
            color: white;
            height: 100vh;
            padding-top: 30px;
            position: fixed;
            left: 0;
        }

        .sidebar h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 40px;
        }

        .sidebar button {
            width: 100%;
            padding: 15px;
            background-color: #1565c0;
            color: white;
            border: none;
            border-bottom: 1px solid #0d47a1;
            text-align: left;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .sidebar button:hover {
            background-color: #0d47a1;
        }

        .content {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1976d2;
            padding: 20px;
            border-radius: 10px;
            color: white;
            margin-bottom: 20px;
        }

        .header h2 {
            margin: 0;
        }

        .card {
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .tab-btn {
            padding: 12px 30px;
            font-size: 18px;
            background-color: #1976d2;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .tab-btn:hover {
            background-color: #1565c0;
        }

        .table-container {
            overflow-x: auto;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #1976d2;
            color: white;
        }

        .logout-btn {
            padding: 12px 25px;
            font-size: 16px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        .logout-btn:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <!-- Sidebar -->
<div class="sidebar">
    <h2>Dashboard</h2>
    <button onclick="showTab('enrollments')">✅ My Enrollments</button>
    <form action="ViewAndEnrollCourses.jsp">
        <button type="submit">View and Enroll in Courses</button>
    </form>
    <!-- New View Profile Button -->
    <form action="ViewProfile.jsp">
        <button type="submit">View Profile</button>
    </form>
    <form action="LogoutServlet" method="post">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</div>

    <!-- Content Section -->
    <div class="content">
        <div class="header">
            <h2>Welcome, <%= student.getName() %> 🎓</h2>
        </div>

        <!-- Enrollments Section -->
        <div id="enrollments" class="card">
            <h3>My Enrolled Courses</h3>
            <% if (enrolledCourses == null || enrolledCourses.isEmpty()) { %>
                <p>You have not enrolled in any courses yet.</p>
            <% } else { %>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Course Name</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Instructor</th>
                                <th>Category</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for (Course course : enrolledCourses) { %>
                            <tr>
                                <td><%= course.getName() %></td>
                                <td><%= course.getDescription() %></td>
                                <td><%= course.getPrice() %></td>
                                <td><%= course.getInstructorName() != null ? course.getInstructorName() : "N/A" %></td>
                                <td><%= course.getCategory() %></td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            <% } %>
        </div>
    </div>

    <script>
        function showTab(tabId) {
            document.getElementById('enrollments').style.display = tabId === 'enrollments' ? 'block' : 'none';
        }

        window.onload = function() {
            showTab('enrollments'); // default to showing enrollments
        }
    </script>

</body>
</html>
