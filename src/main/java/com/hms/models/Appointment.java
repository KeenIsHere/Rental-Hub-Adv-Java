package com.hms.models;

public class Appointment {
    private int id;
    private int propertyId;
    private String name;
    private String email;
    private String phone;
    private String preferredDate;
    private String preferredTime;
    private String notes;

    // Constructors
    public Appointment() {}

    public Appointment(int propertyId, String name, String email, String phone, String preferredDate, String preferredTime, String notes) {
        this.propertyId = propertyId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.preferredDate = preferredDate;
        this.preferredTime = preferredTime;
        this.notes = notes;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getPropertyId() { return propertyId; }
    public void setPropertyId(int propertyId) { this.propertyId = propertyId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getPreferredDate() { return preferredDate; }
    public void setPreferredDate(String preferredDate) { this.preferredDate = preferredDate; }

    public String getPreferredTime() { return preferredTime; }
    public void setPreferredTime(String preferredTime) { this.preferredTime = preferredTime; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
