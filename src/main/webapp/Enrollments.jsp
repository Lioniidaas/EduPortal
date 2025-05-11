<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="eduportal.dao.CourseDAO, eduportal.model.Course" %>
<%@ page import="eduportal.dao.EnrollmentDAO" %>

<%
    List<Course> courses = CourseDAO.getAllCourses();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Course Enrollments - EduPortal</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 40px 20px;
            background: linear-gradient(to right, #ece9e6, #ffffff);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 40px;
        }

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        th, td {
            padding: 18px 20px;
            border-bottom: 1px solid #eee;
            text-align: center;
            font-size: 16px;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 17px;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        em {
            color: #999;
            font-style: italic;
        }

        .badge {
            background-color: #2196F3;
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 14px;
            display: inline-block;
        }

        .badge.gray {
            background-color: #9e9e9e;
        }

        .instructor {
            font-weight: 500;
        }

        .container {
            max-width: 1000px;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>📊 Course Enrollments Overview</h2>

    <table>
        <tr>
            <th>📘 Course</th>
            <th>👨‍🎓 Enrolled Students</th>
            <th>👨‍🏫 Instructor</th>
        </tr>

        <% for (Course course : courses) {
            int count = EnrollmentDAO.getEnrollmentCountByCourse(course.getId()); %>
        <tr>
            <td><strong><%= course.getName() %></strong></td>
            <td>
                <% if (count == 0) { %>
                    <span class="badge gray">No Enrollments</span>
                <% } else { %>
                    <span class="badge"><%= count %> Student<%= count > 1 ? "s" : "" %></span>
                <% } %>
            </td>
            <td>
                <span class="instructor">
                <%= course.getInstructorName() != null 
                    ? course.getInstructorName() 
                    : "<em>Not Assigned</em>" %>
                </span>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</body>
</html>
