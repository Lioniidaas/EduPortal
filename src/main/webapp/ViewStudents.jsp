<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="eduportal.dao.StudentDAO" %>
<%@ page import="eduportal.model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Students</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 30px;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            color: #333;
        }
        table {
            width: 85%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #0072ff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        em {
            color: gray;
        }
    </style>
</head>
<body>
    <h2>📋 List of Registered Students</h2>
    <%
        List<Student> students = StudentDAO.getAllStudents();
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Username</th>
        </tr>
        <%
            for(Student s : students) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getUsername() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
