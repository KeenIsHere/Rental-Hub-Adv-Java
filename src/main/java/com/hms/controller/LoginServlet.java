package com.hms.controller;

import java.io.IOException;

import com.hms.DAO.UserDAO;
import com.hms.models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Email: " + email); // Debug
        System.out.println("Password: " + password); // Debug (avoid in production)

        UserDAO dao = new UserDAO();
        User user = dao.login(email, password);

        if (user != null) {
            // Debug: Print user details
            System.out.println("User found:");
            System.out.println("ID: " + user.getId());
            System.out.println("Name: " + user.getFirstName() + " " + user.getLastName());
            System.out.println("Email: " + user.getEmail());
            System.out.println("Phone: " + user.getPhoneNumber());
//            System.out.println("Address: " + user.get());
            System.out.println("Is Admin: " + user.isAdmin());

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            if (user.isAdmin()) {
                response.sendRedirect("/pages/admin.jsp");
            } else {
                response.sendRedirect("/pages/profile.jsp");
            }
        } else {
            System.out.println("Invalid login attempt.");
            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
        }
    }
}
