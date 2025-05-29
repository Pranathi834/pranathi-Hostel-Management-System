package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

public class UpdateStudentServlet extends HttpServlet {
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
            String studentName = request.getParameter("studentName");
            String roomNumber = request.getParameter("roomNumber");
            Date admissionDate = Date.valueOf(request.getParameter("admissionDate"));
            double feesPaid = Double.parseDouble(request.getParameter("feesPaid"));
            double pendingFees = Double.parseDouble(request.getParameter("pendingFees"));

            Student student = new Student(studentID, studentName, roomNumber, admissionDate, feesPaid, pendingFees);
            hostelDAO.updateStudent(student);

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating student: " + e.getMessage());
        }
    }
}
