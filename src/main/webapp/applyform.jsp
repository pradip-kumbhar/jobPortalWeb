<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Application Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h2>Job Application Form</h2>
        <form action="SubmitApplicationServlet" method="post" enctype="multipart/form-data">
            
            <!-- Name fields -->
            <div class="name-row">
                <input type="text" name="firstName" placeholder="First Name" required>
                <input type="text" name="lastName" placeholder="Last Name" required>
            </div>

            <input type="email" name="email" placeholder="Email" required>

            <!-- Qualification Dropdown -->
            <select name="qualification" required>
                <option value="">-- Select Qualification --</option>
                <option value="BE/B.Tech">BE/B.Tech</option>
                <option value="BCA">BCA</option>
                <option value="BSc">BSc</option>
            </select>

            <!-- Specialization Dropdown -->
            <select name="specialization" required>
                <option value="">-- Select Specialization --</option>
                <option value="CSE">CSE</option>
                <option value="IT">IT</option>
                <option value="ENTC">ENTC</option>
                <option value="DS">DS</option>
            </select>

            <!-- Gender -->
            <div class="gender-group">
                <label>Gender:</label>
                <input type="radio" name="gender" value="Male" required> Male
                <input type="radio" name="gender" value="Female"> Female
            </div>

            <!-- Resume -->
            <label>Upload Resume:</label>
            <input type="file" name="resume" accept=".pdf" required>

            <input type="submit" value="Submit Application">
        </form>
    </div>
</body>
</html>
