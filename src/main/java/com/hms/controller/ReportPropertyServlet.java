package com.hms.controller;

import java.io.IOException;

import com.hms.DAO.ReportDAO;
import com.hms.models.Report;
import com.hms.models.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/report")
public class ReportPropertyServlet extends HttpServlet {
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, IOException {
        int propertyId = Integer.parseInt(request.getParameter("propertyId"));
        String message = request.getParameter("message");
        int userId = ((User) request.getSession().getAttribute("user")).getId();

        Report r = new Report(userId, propertyId, message);
        ReportDAO dao = new ReportDAO();
        dao.addReport(r);

        response.sendRedirect("pages/explore.jsp");
    }
}
