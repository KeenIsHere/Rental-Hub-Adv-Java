package com.hms.filter;

import java.io.IOException;

import com.hms.models.User;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter({"/pages/editProperty.jsp"})
public class EditPropertyRedirectFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        assert user != null;
        if (!user.isAdmin()) {
            // User logged in but not admin
            response.sendRedirect(request.getContextPath() + "/home"); // Or show 403 page
            return;
        }

        // User is admin, allow access
        filterChain.doFilter(servletRequest, servletResponse);
    }

}
