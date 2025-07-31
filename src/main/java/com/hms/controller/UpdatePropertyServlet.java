package com.hms.controller;

import java.io.IOException;

import com.hms.DAO.PropertyDAO;
import com.hms.models.Property;
import com.hms.models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,      // 1 MB
        maxFileSize = 1024 * 1024 * 5,        // 5 MB per file
        maxRequestSize = 1024 * 1024 * 20     // 20 MB total
)


public class UpdatePropertyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
//        Property property = (session != null) ? (Property) session.getAttribute("user") : null;
        assert user != null;

        request.setCharacterEncoding("UTF-8");

        String title = request.getParameter("title");
        String propertyType = request.getParameter("propertyType");
        double price = Double.parseDouble(request.getParameter("price"));
        double area = Double.parseDouble(request.getParameter("area"));
        int bedrooms = Integer.parseInt(request.getParameter("bedrooms"));
        int bathrooms = Integer.parseInt(request.getParameter("bathrooms"));

        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipCode = request.getParameter("zip");

        String description = request.getParameter("description");

        boolean hasGarage = request.getParameter("hasGarage") != null;
        boolean hasSwimmingPool = request.getParameter("hasSwimmingPool") != null;
        boolean hasGarden = request.getParameter("hasGarden") != null;
        boolean hasAirConditioning = request.getParameter("hasAirConditioning") != null;
        boolean hasFireplace = request.getParameter("hasFireplace") != null;

        String contactName = request.getParameter("contact-name");
        String contactEmail = request.getParameter("contact-email");
        String contactPhone = request.getParameter("contact-phone");

        String status = "inactive";
        int userId = user.getId();

        Property property = new Property(title, propertyType, price, area, bedrooms, bathrooms,
                address, city, state, zipCode, description, null,
                hasGarage, hasSwimmingPool, hasGarden, hasAirConditioning, hasFireplace,
                contactName, contactEmail, contactPhone, status, userId);

        PropertyDAO prop = new PropertyDAO();
        prop.postProperty(property);

        session.setAttribute("newProperty", property);
        response.sendRedirect("explore");
    }
}
