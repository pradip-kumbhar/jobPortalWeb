package jobportal;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT user_id FROM users WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("user_id");
                HttpSession session = req.getSession();
                session.setAttribute("userId", userId);
                res.sendRedirect("ViewJobsServlet");
            } else {
                // 👇 Set error message if credentials are invalid
                req.setAttribute("errorMsg", "⚠️ Invalid email or password.");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, res);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            res.getWriter().println("❌ Error: " + e.getMessage());
        }
    }
}
