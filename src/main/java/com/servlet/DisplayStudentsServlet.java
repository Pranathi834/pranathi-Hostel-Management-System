package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DisplayStudentsServlet extends HttpServlet {
    private HostelDAO hostelDAO;

    @Override
    public void init() {
        hostelDAO = new HostelDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            List<Student> students = hostelDAO.selectAllStudents();
            request.setAttribute("studentList", students);
            request.getRequestDispatcher("studentdisplay.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error retrieving student data: " + e.getMessage());
        }
    }
}
