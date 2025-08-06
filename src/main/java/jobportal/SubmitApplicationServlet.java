package jobportal;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.nio.file.*;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)


public class SubmitApplicationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html");

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String qualification = req.getParameter("qualification");
        String specialization = req.getParameter("specialization");
        String gender = req.getParameter("gender");

        Part filePart = req.getPart("resume");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "resumes";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO applications (first_name, last_name, email, qualification, specialization, gender, resume_path) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, qualification);
            ps.setString(5, specialization);
            ps.setString(6, gender);
            ps.setString(7, fileName);
            ps.executeUpdate();

            // Redirect to success page
            res.sendRedirect("success.jsp");

        } catch (Exception e) {
            res.getWriter().println("Database Error: " + e.getMessage());
        }
    }
}
