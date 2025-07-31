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
import jakarta.servlet.http.HttpSession;

@WebServlet("/change-password")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("/pages/login.jsp");
            return;
        }

        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");
        String confirmPassword = request.getParameter("confirm-password");

        // Check if new passwords match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "New passwords do not match.");
            request.getRequestDispatcher("/pages/profile.jsp").forward(request, response);
            return;
        }

        // Verify current password
        String storedHashedPassword = user.getPassword();
        if (!PasswordUtils.checkPassword(currentPassword, storedHashedPassword)) {
            request.setAttribute("error", "Current password is incorrect.");
            request.getRequestDispatcher("/pages/profile.jsp").forward(request, response);
            return;
        }

        // Hash and update password
        String hashedNewPassword = PasswordUtils.hashPassword(newPassword);
        UserDAO dao = new UserDAO();
        dao.updatePassword(user.getId(), hashedNewPassword);

        // Logout after password change
        session.invalidate();
        response.sendRedirect("/pages/login.jsp");
    }
}
