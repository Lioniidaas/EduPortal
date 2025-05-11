<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="eduportal.dao.CourseDAO, eduportal.dao.InstructorDAO, eduportal.model.Course, eduportal.model.Instructor" %>
<%
    List<Course> courses = CourseDAO.getAllCourses(); // Fetch all courses
    List<Instructor> instructors = InstructorDAO.getAllInstructors(); // Fetch all instructors
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Assign Instructor</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 30px;
        }
        h2 {
            text-align: center;
            font-size: 2em;
            color: #333;
            margin-bottom: 30px;
        }
        form {
            width: 400px;
            margin: auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            font-size: 1em;
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        select, button {
            width: 100%;
            padding: 10px;
            margin-top: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
        }
        button {
            background-color: #0072ff;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #005bb5;
        }
    </style>
</head>
<body>
    <h2>Assign Instructor to Course</h2>
    <form action="AssignInstructorServlet" method="post">
        <label for="course_id">Select Course</label>
        <select name="course_id" id="course_id" required>
            <option value="">Select Course</option>
            <% for (Course course : courses) { %>
                <option value="<%= course.getId() %>"><%= course.getName() %></option>
            <% } %>
        </select>

        <label for="instructor_id">Select Instructor</label>
        <select name="instructor_id" id="instructor_id" required>
            <option value="">Select Instructor</option>
            <% for (Instructor instructor : instructors) { %>
                <option value="<%= instructor.getId() %>"><%= instructor.getName() %></option>
            <% } %>
        </select>

        <button type="submit">Assign Instructor</button>
    </form>
</body>
</html>
