package com.hms.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter({"/pages/admin.jsp"})
public class AdminRedirectFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse httpResp = (HttpServletResponse) servletResponse;
        HttpServletRequest httpReq = (HttpServletRequest) servletRequest;

        httpResp.sendRedirect(httpReq.getContextPath() + "/admin");
    }
}
