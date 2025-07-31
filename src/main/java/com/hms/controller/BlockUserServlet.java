package com.hms.controller;

import java.io.IOException;

import com.hms.DAO.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BlockUserServlet extends HttpServlet {
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDAO dao = new UserDAO();
        dao.blockUser(userId);
        response.sendRedirect("UserDashboardServlet");
    }
}
