package com.hms.controller;

import java.io.IOException;

import com.hms.DAO.AppointmentDAO;
import com.hms.models.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/scheduleAppointment")
public class ScheduleAppointmentServlet extends HttpServlet {

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int propertyId = Integer.parseInt(request.getParameter("property-id"));
        String name = request.getParameter("schedule-name");
        String email = request.getParameter("schedule-email");
        String phone = request.getParameter("schedule-phone");
        String date = request.getParameter("schedule-date");
        String time = request.getParameter("schedule-time");
        String notes = request.getParameter("schedule-notes");

        Appointment appointment = new Appointment(propertyId, name, email, phone, date, time, notes);
        AppointmentDAO dao = new AppointmentDAO();
        boolean success = dao.insertAppointment(appointment);

        if (success) {
            response.sendRedirect("/explore");
        } else {
            response.sendRedirect("/explore");
        }
    }
}
