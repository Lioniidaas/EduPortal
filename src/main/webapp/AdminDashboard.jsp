<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="eduportal.model.Admin" %>
<%@ page session="true" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }

    // Cache control
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - EduPortal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
        }

        header {
            background-color: #1e3c72;
            color: white;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        header h1 {
            margin: 0;
            font-size: 28px;
        }

        .welcome {
            text-align: center;
            font-size: 20px;
            margin: 30px 0 10px;
            color: #333;
        }

        .dashboard {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 30px;
            gap: 20px;
        }

        .card {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 30px 20px;
            width: 230px;
            text-align: center;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: 0.3s ease;
        }

        .card:hover {
            transform: translateY(-8px);
            background-color: #f0f8ff;
        }

        .card img {
            width: 70px;
            margin-bottom: 15px;
        }

        .card a {
            text-decoration: none;
            font-weight: 600;
            font-size: 16px;
            color: #1e3c72;
        }

        .logout-container {
            text-align: center;
            margin: 40px 0;
        }

        .logout-btn {
            padding: 12px 30px;
            background-color: #ff4444;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .logout-btn:hover {
            background-color: #cc0000;
        }

        @media (max-width: 600px) {
            .card {
                width: 80%;
            }
        }
    </style>
</head>
<body>

    <header>
        <h1>EduPortal Admin Dashboard</h1>
    </header>

    <div class="welcome">
        Welcome, <strong><%= admin.getUsername() %></strong>! 👋
    </div>

    <div class="dashboard">
        <div class="card">
            <img src="https://cdn-icons-png.flaticon.com/512/753/753345.png" alt="Add Course">
            <a href="AddCourse.jsp">➕ Add New Course</a>
        </div>
        <div class="card">
            <img src="https://cdn-icons-png.flaticon.com/512/4275/4275531.png" alt="Manage Courses">
            <a href="ViewCourses.jsp">📚 Manage Courses</a>
        </div>
        <div class="card">
            <img src="https://cdn-icons-png.flaticon.com/512/4206/4206277.png" alt="Assign Instructors">
            <a href="AssignInstructor.jsp">👨‍🏫 Assign Instructors</a>
        </div>
        <div class="card">
            <img src="https://cdn-icons-png.flaticon.com/512/2140/2140860.png" alt="View Enrollments">
            <a href="Enrollments.jsp">📋 View Enrollments</a>
        </div>
        <div class="card">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135755.png" alt="View Students">
            <a href="ViewStudents.jsp">👨‍🎓 View Registered Students</a>
        </div>
    </div>

    <div class="logout-container">
        <form action="LogoutServlet" method="post">
            <button type="submit" class="logout-btn">🚪 Logout</button>
        </form>
    </div>

</body>
</html>
