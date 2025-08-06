package jobportal;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import jobportal.Job; 

public class ViewJobsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM jobs";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            List<Job> jobs = new ArrayList<>();
            while (rs.next()) {
                Job job = new Job();
                job.setJobId(rs.getInt("job_id"));
                job.setTitle(rs.getString("title"));
                job.setCompany(rs.getString("company"));
                job.setLocation(rs.getString("location"));
                job.setSalary(rs.getString("salary"));
                job.setDescription(rs.getString("description"));
                jobs.add(job);
            }

            req.setAttribute("jobs", jobs);
            RequestDispatcher rd = req.getRequestDispatcher("jobs.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}
