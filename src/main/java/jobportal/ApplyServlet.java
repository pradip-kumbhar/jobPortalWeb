package jobportal;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ApplyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String jobId = req.getParameter("jobId");

        req.setAttribute("jobId", jobId);
        RequestDispatcher rd = req.getRequestDispatcher("applyform.jsp");
        rd.forward(req, res);
    }
}
