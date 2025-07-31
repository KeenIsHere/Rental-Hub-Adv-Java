package com.hms.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.hms.database.DBConnection;
import com.hms.models.Appointment;

public class AppointmentDAO {
    public boolean insertAppointment(Appointment appointment) {
        String sql = "INSERT INTO appointments (property_id, name, email, phone, preferred_date, preferred_time, notes) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, appointment.getPropertyId());
            stmt.setString(2, appointment.getName());
            stmt.setString(3, appointment.getEmail());
            stmt.setString(4, appointment.getPhone());
            stmt.setString(5, appointment.getPreferredDate());
            stmt.setString(6, appointment.getPreferredTime());
            stmt.setString(7, appointment.getNotes());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
