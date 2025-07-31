package com.hms.controller;

import java.io.IOException;

import com.hms.DAO.PropertyDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/approve")
public class ApprovePropertyServlet extends HttpServlet {
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, IOException {
        int propertyId = Integer.parseInt(request.getParameter("propertyId"));
        PropertyDAO dao = new PropertyDAO();
        dao.updateStatus(propertyId, "active");
        response.sendRedirect("explore");
    }
}
