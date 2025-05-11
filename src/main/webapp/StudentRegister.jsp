<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Registration - EduPortal</title>
    <style>
        body {
            background: #f0f8ff;
            font-family: Arial;
            text-align: center;
            padding: 50px;
        }

        h2 {
            color: #0072ff;
        }

        form {
            display: inline-block;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.15);
        }

        input {
            display: block;
            margin: 10px auto;
            padding: 10px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            background: #0072ff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #0055cc;
        }
    </style>
</head>
<body>
    <h2>Register as Student 👩‍🎓👨‍🎓</h2>
    <form action="RegisterStudentServlet" method="post">
        <input type="text" name="name" placeholder="Full Name" required />
        <input type="text" name="username" placeholder="Username" required />
        <input type="password" name="password" placeholder="Password" required />
        <button type="submit">Register</button>
    </form>
    <br><br>
    <a href="StudentLogin.jsp">Already have an account? Login here</a>
</body>
</html>
