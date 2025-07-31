package com.hms.controller;

import java.io.IOException;

import com.hms.DAO.PropertyDAO;
import com.hms.models.Property;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewProperty")
public class ViewPropertyUsingIdServlet extends HttpServlet {
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");

            if (idParam != null) {
                int propertyId = Integer.parseInt(idParam);

                PropertyDAO propertyDAO = new PropertyDAO();
                Property property = propertyDAO.getPropertyById(propertyId);
                System.out.println(property.getCity());
                request.setAttribute("property", property);
            }

            request.getRequestDispatcher("/pages/property-detail.jsp?id="+idParam).forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
            response.sendRedirect("/pages/error.jsp");
        }
    }
}
