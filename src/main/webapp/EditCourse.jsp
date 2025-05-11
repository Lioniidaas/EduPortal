<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="eduportal.dao.CourseDAO, eduportal.model.Course" %>
<%
    String idStr = request.getParameter("id");
    int courseId = Integer.parseInt(idStr);
    Course course = CourseDAO.getCourseById(courseId);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Course</title>
    <style>
        body {
            font-family: Arial;
            padding: 30px;
            background: #f4f4f4;
        }
        h2 {
            text-align: center;
        }
        form {
            width: 400px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 10px;
        }
        button {
            margin-top: 15px;
            padding: 10px 15px;
            background-color: #0072ff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Edit Course</h2>
    <form action="EditCourseServlet" method="post">
        <input type="hidden" name="course_id" value="<%= course.getId() %>">
        <label>Course Name</label>
        <input type="text" name="name" value="<%= course.getName() %>" required>

        <label>Description</label>
        <textarea name="description" rows="4"><%= course.getDescription() %></textarea>

        <label>Price</label>
        <input type="number" name="price" value="<%= course.getPrice() %>" required>

        <label>Category</label>
        <input type="text" name="category" value="<%= course.getCategory() %>" required>

        <label>Image URL</label>
        <input type="text" name="image_url" value="<%= course.getImageUrl() %>">

        <button type="submit">Update Course</button>
    </form>
</body>
</html>
