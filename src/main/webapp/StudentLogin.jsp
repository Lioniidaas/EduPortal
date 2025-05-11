<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login - EduPortal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.2);
            text-align: center;
        }
        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        button {
            padding: 12px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background-color: #388E3C;
        }
        .register-link {
            margin-top: 15px;
            display: block;
            color: #007bff;
            text-decoration: none;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Student Login</h2>
        <form action="StudentLoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>

        <% if (request.getParameter("error") != null) { %>
            <p class="error">Invalid username or password</p>
        <% } %>

        <a class="register-link" href="StudentRegister.jsp">Don't have an account? Register here</a>
    </div>
</body>
</html>
