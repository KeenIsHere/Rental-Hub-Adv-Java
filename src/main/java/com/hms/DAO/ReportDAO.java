package com.hms.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.hms.database.DBConnection;
import com.hms.models.Report;

public class ReportDAO {
    public int addReport(Report report) {
        int generatedId = -1;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO reports (user_id, user_name, user_email, property_id, property_title, " +
                    "report_date, reason, details, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, report.getUserId());
            ps.setString(2, report.getUserName());
            ps.setString(3, report.getUserEmail());
            ps.setInt(4, report.getPropertyId());
            ps.setString(5, report.getPropertyTitle());
            ps.setTimestamp(6, new Timestamp(report.getReportDate().getTime()));
            ps.setString(7, report.getReason());
            ps.setString(8, report.getDetails());
            ps.setString(9, report.getStatus());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return generatedId;
    }

    public List<Report> getAllReports() {
        List<Report> reports = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reports ORDER BY report_date DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Report report = extractReportFromResultSet(rs);
                reports.add(report);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reports;
    }

    public List<Report> getPendingReports() {
        List<Report> reports = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reports WHERE status='Pending' ORDER BY report_date ASC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Report report = extractReportFromResultSet(rs);
                reports.add(report);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reports;
    }

    public Report getReportById(int reportId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reports WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, reportId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return extractReportFromResultSet(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Report> getReportsByUserId(int userId) {
        List<Report> reports = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reports WHERE user_id = ? ORDER BY report_date DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Report report = extractReportFromResultSet(rs);
                reports.add(report);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reports;
    }

    public List<Report> getReportsByPropertyId(int propertyId) {
        List<Report> reports = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM reports WHERE property_id = ? ORDER BY report_date DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, propertyId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Report report = extractReportFromResultSet(rs);
                reports.add(report);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reports;
    }

    public void updateReportStatus(int reportId, String status, String adminNotes) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE reports SET status = ?, admin_notes = ?, review_date = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, adminNotes);
            ps.setTimestamp(3, new Timestamp(new Date().getTime()));
            ps.setInt(4, reportId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int getTotalReports() {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM reports");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
				return rs.getInt(1);
			}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalPendingReports() {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM reports WHERE status='Pending'");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
				return rs.getInt(1);
			}
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Helper method to extract a Report object from a ResultSet
    private Report extractReportFromResultSet(ResultSet rs) throws SQLException {
        int id = rs.getInt("id");
        int userId = rs.getInt("user_id");
        String userName = rs.getString("user_name");
        String userEmail = rs.getString("user_email");
        int propertyId = rs.getInt("property_id");
        String propertyTitle = rs.getString("property_title");
        Date reportDate = new Date(rs.getTimestamp("report_date").getTime());
        String reason = rs.getString("reason");
        String details = rs.getString("details");
        String status = rs.getString("status");

        // These can be null
        Timestamp reviewTimestamp = rs.getTimestamp("review_date");
        Date reviewDate = reviewTimestamp != null ? new Date(reviewTimestamp.getTime()) : null;
        String adminNotes = rs.getString("admin_notes");

        return new Report(
                id, userId, userName, userEmail, propertyId, propertyTitle,
                reportDate, reason, details, status, reviewDate, adminNotes
        );
    }
}