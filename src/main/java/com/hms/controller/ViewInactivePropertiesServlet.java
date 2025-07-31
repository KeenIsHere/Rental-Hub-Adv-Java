package com.hms.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.hms.DAO.PropertyDAO;
import com.hms.DAO.UserDAO;
import com.hms.models.Property;
import com.hms.models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewInactivePropertiesServlet extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Property> list = new PropertyDAO().getApprovedProperties("inactive");
        ArrayList<Property> activeList = new PropertyDAO().getApprovedProperties("active");

        ArrayList<User> users = new UserDAO().getAllUsers();  // Get all users

        request.setAttribute("properties", list);
        request.setAttribute("activeProp", activeList);
        request.setAttribute("allUsers", users);

        request.getRequestDispatcher("/pages/admin.jsp").forward(request, response);
    }

}
