<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="eduportal.model.Admin" %>
<%@ page session="true" %>

<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Course - EduPortal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f8f8;
            padding: 40px;
        }

        h2 {
            color: #333;
        }

        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 50%;
            margin: 0 auto;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        button {
            padding: 12px 20px;
            background-color: #0072ff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056d6;
        }
    </style>
</head>
<body>

    <h2>Add New Course</h2>

    <div class="form-container">
        <form action="AddCourseServlet" method="post">
            <input type="text" name="courseName" placeholder="Course Name" required><br>
            <textarea name="courseDescription" placeholder="Course Description" rows="5" required></textarea><br>
            <input type="number" name="coursePrice" placeholder="Price" required><br>
            <input type="text" name="courseCategory" placeholder="Category" required><br>
            <input type="text" name="courseImage" placeholder="Image URL" required><br>
            <button type="submit">Add Course</button>
        </form>
    </div>

</body>
</html>
