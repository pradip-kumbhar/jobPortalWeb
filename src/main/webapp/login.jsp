<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">

<div class="container">
	<h2>Login</h2>
	<%
	String error = (String) request.getAttribute("errorMsg");
	if (error != null) {
	%>
	<div style="color: red; margin-bottom: 10px;"><%=error%></div>
	<%
	}
	%>
	<form action="LoginServlet" method="post">
		<input type="text" name="email" placeholder="Enter Email" required>
		<!-- ✅ Fixed here -->
		<input type="password" name="password" placeholder="Enter Password"
			required> <input type="submit" value="Login"> <a
			href="register.jsp">Create an account</a>

	</form>
</div>
