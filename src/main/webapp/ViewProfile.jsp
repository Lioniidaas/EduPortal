<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="eduportal.model.Student" %>
<%@ page import="eduportal.dao.StudentDAO" %>
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

    // Get the updated values from the form if they are submitted
    String updatedName = request.getParameter("name");
    String updatedUsername = request.getParameter("username");
    String updatedPassword = request.getParameter("password");

    if (updatedName != null && updatedUsername != null && updatedPassword != null) {
        // Update student details in the database
        student.setName(updatedName);
        student.setUsername(updatedUsername);
        student.setPassword(updatedPassword);

        // Save the updated student details to the database (assuming you have a DAO for Student)
        boolean isUpdated = StudentDAO.updateStudent(student);

        if (isUpdated) {
            session.setAttribute("student", student);  // Update session
            out.println("<script>alert('Profile updated successfully!'); window.location.href = 'ViewProfile.jsp';</script>");
        } else {
            out.println("<script>alert('Error updating profile. Please try again later.');</script>");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile - EduPortal</title>
    <style>
        body {
            font-family: 'Helvetica Neue', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            color: #555;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .header h2 {
            margin: 0;
            font-size: 26px;
            color: #1e3c72;
        }
        .header p {
            font-size: 16px;
            color: #888;
            margin-top: 10px;
        }
        label {
            font-size: 16px;
            margin-bottom: 8px;
            display: block;
            color: #444;
        }
        input {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            background-color: #f9f9f9;
            color: #555;
        }
        .password-container {
            position: relative;
        }
        .show-password-btn {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 14px;
            color: #1976d2;
        }
        .button {
            width: 48%;
            padding: 12px 0;
            background-color: #1976d2;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            text-align: center;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .button:hover {
            background-color: #1565c0;
        }
        .logout-btn {
            padding: 12px 25px;
            font-size: 14px;
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s;
        }
        .logout-btn:hover {
            background-color: #d32f2f;
        }
        .btn-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 20px;
        }
        .btn-container a {
            text-decoration: none;
        }
        .btn-container {
  		    display: flex;
    		justify-content: space-between;
    		gap: 20px;
    		margin-top: 20px;
		}
		.button {
    		flex: 1;
    		padding: 12px 0;
    		background-color: #1976d2;
    		color: white;
    		border: none;
    		border-radius: 5px;
    		cursor: pointer;
    		font-size: 16px;
    		transition: background-color 0.3s ease;
    		text-align: center;
    		white-space: nowrap;
		}
		.button:hover {
    		background-color: #1565c0;
		}
        
</style>
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("password");
            var showPasswordBtn = document.getElementById("showPasswordBtn");
            if (passwordField.type === "password") {
                passwordField.type = "text";
                showPasswordBtn.textContent = "Hide";
            } else {
                passwordField.type = "password";
                showPasswordBtn.textContent = "Show";
            }
        }
    </script>
</head>
<body>

    <div class="container">
        <div class="header">
            <h2>My Profile</h2>
            <p>Update your personal details below.</p>
        </div>

        <form method="post" action="ViewProfile.jsp">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" value="<%= student.getName() %>" required />

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" value="<%= student.getUsername() %>" required />

            <div class="password-container">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="<%= student.getPassword() %>" required />
                <span id="showPasswordBtn" class="show-password-btn" onclick="togglePassword()">Show</span>
            </div>

            <div class="btn-container">
    			<button type="submit" class="button">Update Profile</button>
    			<a href="StudentDashboard.jsp" style="flex:1;"><button type="button" class="button">Back to Dashboard</button></a>
			</div>

        </form>

        <form action="LogoutServlet" method="post">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

</body>
</html>
