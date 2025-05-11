<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="eduportal.dao.EnrollmentDAO" %>
<%@ page import="eduportal.model.Student" %>
<%@ page session="true" %>

<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("StudentLogin.jsp");
        return;
    }

    String courseIdStr = request.getParameter("courseId");
    if (courseIdStr == null || courseIdStr.isEmpty()) {
        out.println("<h2>Error: No course selected</h2>");
        return;
    }

    int courseId = Integer.parseInt(courseIdStr);

    // Check if the student is already enrolled in the course
    boolean alreadyEnrolled = EnrollmentDAO.isStudentEnrolledInCourse(student.getId(), courseId);

    if (alreadyEnrolled) {
%>
    <h2>Enrollment Failed</h2>
    <p>You are already enrolled in this course. Please check your enrolled courses.</p>
    <a href="MyEnrollments.jsp">Go to My Enrollments</a>
<%
    } else {
%>
    <h2>Enrollment Failed</h2>
    <p>There was an issue with your enrollment. Please try again later.</p>
<%
    }
%>
