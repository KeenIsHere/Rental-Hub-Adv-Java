package com.hms.controller;

import java.io.IOException;

import com.hms.DAO.UserDAO;
import com.hms.models.User;
import com.hms.utils.PasswordUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
        String terms = request.getParameter("terms");

        // Basic validation
        if (firstName == null || lastName == null || email == null || phone == null ||
                password == null || confirmPassword == null || terms == null ||
                !password.equals(confirmPassword)) {
            request.setAttribute("error", "Please fill all fields correctly and accept terms.");
            request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
            return;
        }

        User user = new User(firstName, lastName, email, phone, PasswordUtils.hashPassword(password), false);
        UserDAO dao = new UserDAO();
        boolean success = dao.register(user);

        if (success) {
            response.sendRedirect("pages/login.jsp");
        } else {
            // Debug print to verify error passed
            System.out.println("Signup error from DAO: " + dao.getLastError());

            // Pass DAO error message to JSP
            request.setAttribute("error", dao.getLastError());
            request.getRequestDispatcher("/pages/signup.jsp").forward(request, response);
        }
    }

}
