<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Job Application Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <h2>Job Application Form</h2>
    <form action="${pageContext.request.contextPath}/SubmitApplicationServlet" method="post" enctype="multipart/form-data">
        <input type="hidden" name="jobId" value="${jobId}">
        
        <input type="text" name="firstName" placeholder="First Name" required>
        <input type="text" name="lastName" placeholder="Last Name" required>
        <input type="email" name="email" placeholder="Email" required>

        <select name="qualification" required>
            <option value="">-- Select Qualification --</option>
            <option value="BE/B.Tech">BE/B.Tech</option>
            <option value="BCA">BCA</option>
            <option value="BSc">BSc</option>
        </select>

        <select name="specialization" required>
            <option value="">-- Select Specialization --</option>
            <option value="CSE">CSE</option>
            <option value="IT">IT</option>
            <option value="ENTC">ENTC</option>
            <option value="DS">DS</option>
        </select>

        <label>Gender:</label>
        <input type="radio" name="gender" value="Male" required> Male
        <input type="radio" name="gender" value="Female"> Female

        <label>Upload Resume:</label>
        <input type="file" name="resume" accept=".pdf" required>

        <input type="submit" value="Submit Application">
    </form>
</div>
</body>
</html>
