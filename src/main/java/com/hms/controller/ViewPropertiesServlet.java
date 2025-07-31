package com.hms.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.hms.DAO.PropertyDAO;
import com.hms.models.Property;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewPropertiesServlet extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException, IOException {
        ArrayList<Property> list = new PropertyDAO().getApprovedProperties("active");
        request.setAttribute("properties", list);
        request.getRequestDispatcher("/pages/explore.jsp").forward(request, response);
    }
}
