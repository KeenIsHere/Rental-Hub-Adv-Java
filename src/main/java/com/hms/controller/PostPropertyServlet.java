package com.hms.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.hms.DAO.PropertyDAO;
import com.hms.models.Property;
import com.hms.models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,      // 1 MB
        maxFileSize = 1024 * 1024 * 5,        // 5 MB per file
        maxRequestSize = 1024 * 1024 * 20     // 20 MB total
)
public class PostPropertyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        assert user != null;

        request.setCharacterEncoding("UTF-8");

        String title = request.getParameter("title");
        String propertyType = request.getParameter("type");
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

        List<String> imageUrls = new ArrayList<>();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        for (Part part : request.getParts()) {
            String partName = part.getName();
            String submittedFileName = part.getSubmittedFileName();

            if (partName.equals("images") && part.getSize() > 0) {
                String fileName = Paths.get(submittedFileName).getFileName().toString();
                String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                String filePath = uploadPath + File.separator + uniqueFileName;

                try {
                    part.write(filePath);
                    imageUrls.add("images/" + uniqueFileName);
                } catch (IOException ignored) {
                }
            }
        }

        Property property = new Property(title, propertyType, price, area, bedrooms, bathrooms,
                address, city, state, zipCode, description, imageUrls,
                hasGarage, hasSwimmingPool, hasGarden, hasAirConditioning, hasFireplace,
                contactName, contactEmail, contactPhone, status, userId);

        PropertyDAO prop = new PropertyDAO();
        prop.postProperty(property);

        session.setAttribute("newProperty", property);
        response.sendRedirect("explore");
    }
}
