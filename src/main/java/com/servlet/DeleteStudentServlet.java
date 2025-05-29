package com.servlet;

import com.dao.HostelDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteStudentServlet extends HttpServlet {
    private HostelDAO hostelDAO;

    @Override
    public void init() {
        hostelDAO = new HostelDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try {
            int studentID = Integer.parseInt(request.getParameter("studentID"));
            hostelDAO.deleteStudent(studentID);
            response.sendRedirect("displayStudents");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting student: " + e.getMessage());
        }
    }
}
