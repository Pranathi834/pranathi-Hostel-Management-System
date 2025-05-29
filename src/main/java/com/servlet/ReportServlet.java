package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

public class ReportServlet extends HttpServlet {
    private HostelDAO hostelDAO;

    @Override
    public void init() {
        hostelDAO = new HostelDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String reportType = request.getParameter("reportType");
        List<Student> result = null;

        try {
            switch (reportType) {
                case "pendingFees":
                    result = hostelDAO.getStudentsWithPendingFees();
                    break;

                case "roomWise":
                    String roomNumber = request.getParameter("roomNumber");
                    result = hostelDAO.getStudentsInRoom(roomNumber);
                    break;

                case "dateRange":
                    String startDateStr = request.getParameter("startDate");
                    String endDateStr = request.getParameter("endDate");

                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    java.sql.Date startDate = null;
                    java.sql.Date endDate = null;

                    try {
                        java.util.Date parsedStart = sdf.parse(startDateStr);
                        java.util.Date parsedEnd = sdf.parse(endDateStr);
                        startDate = new java.sql.Date(parsedStart.getTime());
                        endDate = new java.sql.Date(parsedEnd.getTime());
                    } catch (Exception e) {
                        e.printStackTrace();
                        // You can handle invalid date formats here (optional)
                    }

                    result = hostelDAO.getStudentsByDateRange(startDate, endDate);
                    break;
            }

            request.setAttribute("reportList", result);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error generating report: " + e.getMessage());
        }
    }
}
