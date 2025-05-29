package com.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

public class ReportCriteriaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String reportType = request.getParameter("reportType");
        String roomNumber = request.getParameter("roomNumber");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        // Store criteria in session or forward them as request attributes
        request.setAttribute("reportType", reportType);
        request.setAttribute("roomNumber", roomNumber);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);

        // Forward to actual report generator servlet
        request.getRequestDispatcher("report").forward(request, response);
    }
}
