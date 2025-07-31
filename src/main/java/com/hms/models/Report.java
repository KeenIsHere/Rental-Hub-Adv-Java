package com.hms.models;

import java.util.Date;

public class Report {
    private int id;
    private int userId;
    private String userEmail;
    private String userName;
    private int propertyId;
    private String propertyTitle;
    private Date reportDate;
    private String reason;  // e.g., "Inaccurate information", "Inappropriate content", etc.
    private String details; // Detailed explanation of the report
    private String status;  // e.g., "Pending", "Reviewed", "Resolved"
    private Date reviewDate;
    private String adminNotes;

    // Constructor with all fields
    public Report(int id, int userId, String userName, String userEmail, int propertyId,
                  String propertyTitle, Date reportDate, String reason, String details,
                  String status, Date reviewDate, String adminNotes) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.propertyId = propertyId;
        this.propertyTitle = propertyTitle;
        this.reportDate = reportDate;
        this.reason = reason;
        this.details = details;
        this.status = status;
        this.reviewDate = reviewDate;
        this.adminNotes = adminNotes;
    }

    // Constructor for new reports (without id, with default status and no review data)
    public Report(int userId, String userName, String userEmail, int propertyId,
                  String propertyTitle, Date reportDate, String reason, String details) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.propertyId = propertyId;
        this.propertyTitle = propertyTitle;
        this.reportDate = reportDate;
        this.reason = reason;
        this.details = details;
        this.status = "Pending";
        this.reviewDate = null;
        this.adminNotes = null;
    }

    // Simple constructor (for backward compatibility)
    public Report(int userId, int propertyId, String details) {
        this.userId = userId;
        this.propertyId = propertyId;
        this.details = details;
        this.reportDate = new Date(); // Current date
        this.status = "Pending";
    }

    // Getters
    public int getId() { return id; }
    public int getUserId() { return userId; }
    public String getUserName() { return userName; }
    public String getUserEmail() { return userEmail; }
    public int getPropertyId() { return propertyId; }
    public String getPropertyTitle() { return propertyTitle; }
    public Date getReportDate() { return reportDate; }
    public String getReason() { return reason; }
    public String getDetails() { return details; }
    public String getStatus() { return status; }
    public Date getReviewDate() { return reviewDate; }
    public String getAdminNotes() { return adminNotes; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setUserId(int userId) { this.userId = userId; }
    public void setUserName(String userName) { this.userName = userName; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }
    public void setPropertyId(int propertyId) { this.propertyId = propertyId; }
    public void setPropertyTitle(String propertyTitle) { this.propertyTitle = propertyTitle; }
    public void setReportDate(Date reportDate) { this.reportDate = reportDate; }
    public void setReason(String reason) { this.reason = reason; }
    public void setDetails(String details) { this.details = details; }
    public void setStatus(String status) { this.status = status; }
    public void setReviewDate(Date reviewDate) { this.reviewDate = reviewDate; }
    public void setAdminNotes(String adminNotes) { this.adminNotes = adminNotes; }

    // Method to mark a report as reviewed
    public void markAsReviewed(String status, String adminNotes) {
        this.status = status;
        this.adminNotes = adminNotes;
        this.reviewDate = new Date(); // Current date
    }
}