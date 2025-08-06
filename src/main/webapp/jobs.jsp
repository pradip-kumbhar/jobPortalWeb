<%@ page import="java.util.*, jobportal.Job" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Available Jobs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jobs.css">
</head>
<body>

<div class="container">
    <h2>Available Jobs</h2>

    <% 
    List<Job> jobs = (List<Job>) request.getAttribute("jobs");
    if (jobs != null) {
        for (Job job : jobs) {
    %>
        <div class="job-card">
    <div class="job-details">
        <h3><%= job.getTitle() %></h3>
        <p><strong>Company:</strong> <%= job.getCompany() %></p>
        <p><strong>Location:</strong> <%= job.getLocation() %></p>
        <p><strong>Salary:</strong> <%= job.getSalary() %></p>
        <p><%= job.getDescription() %></p>
    </div>
    <form action="ApplyServlet" method="post">
        <input type="hidden" name="jobId" value="<%= job.getJobId() %>">
        <button type="submit">Apply Now</button>
    </form>
</div>

    <%
        }
    } else {
    %>
        <p>No jobs available.</p>
    <% } %>

</div>

</body>
</html>
