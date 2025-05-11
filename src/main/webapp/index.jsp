<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EduPortal - Welcome</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        nav {
            background: #2c3e50;
            padding: 20px;
            text-align: center;
        }

        nav a {
            color: white;
            margin: 0 20px;
            text-decoration: none;
            font-size: 18px;
            transition: 0.3s;
        }

        nav a:hover {
            color: #f39c12;
        }

        .hero {
            background: url('images/banner.jpg') no-repeat center center/cover;
            height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        .hero h1 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .hero p {
            font-size: 22px;
        }

        .offer-banner {
            background: #e67e22;
            color: white;
            margin: 30px auto;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            font-size: 18px;
            text-align: center;
        }

        .btn-container {
            text-align: center;
            margin: 40px 0;
        }

        .login-btn {
            padding: 15px 30px;
            font-size: 18px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            background-color: #2c3e50;
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-btn:hover {
            background-color: #34495e;
        }

        .section {
            background: white;
            padding: 60px 20px;
            text-align: center;
        }

        .section h2 {
            color: #2c3e50;
            font-size: 32px;
        }

        .course-cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 30px;
            gap: 30px;
        }

        .card {
            width: 280px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
        }

        .card h3 {
            margin: 10px 0 5px;
            font-size: 20px;
        }

        .card p {
            padding: 0 15px 20px;
            font-size: 15px;
            color: #666;
        }
    </style>
</head>
<body>

<nav>
    <a href="AdminLogin.jsp">Admin Login</a>
    <a href="StudentLogin.jsp">Student Login</a>
</nav>

<div class="hero">
    <h1>Welcome to EduPortal</h1>
    <p>Learn, Grow & Succeed with Top Online Courses</p>
</div>

<div class="offer-banner">
    🎉 <strong>Summer Learning Festival:</strong> Get 30% OFF on all premium courses! <br>
    <em>Limited Time Offer – Until May 31st</em>
</div>

<div class="btn-container">
    <form action="AdminLogin.jsp" method="get" style="display:inline;">
        <button type="submit" class="login-btn">Admin Login</button>
    </form>
    <form action="StudentLogin.jsp" method="get" style="display:inline;">
        <button type="submit" class="login-btn">Student Login</button>
    </form>
</div>

<div class="section">
    <h2>✨ Featured Courses</h2>
    <div class="course-cards">
        <div class="card">
            <img src="images/java_course.jpg" alt="Java Programming">
            <h3>Java Programming</h3>
            <p>Learn core Java with OOP principles and build real-time projects.</p>
        </div>
        <div class="card">
            <img src="images/advjava.jpg" alt="Advanced Java">
            <h3>Advanced Java</h3>
            <p>Master JDBC, Servlets, JSP, and develop dynamic web apps.</p>
        </div>
        <div class="card">
            <img src="images/web_dev.jpg" alt="Web Development">
            <h3>Web Development</h3>
            <p>Build responsive websites with HTML5, CSS3, JS, and Bootstrap.</p>
        </div>
    </div>
</div>

</body>
</html>
