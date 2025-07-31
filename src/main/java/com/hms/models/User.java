package com.hms.models;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String password;
    private boolean isAdmin;

    // Updated constructor
    public User(int id, String firstName, String lastName, String email, String phoneNumber, String password, boolean isAdmin) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    // Add overloaded constructor if needed
    public User(String firstName, String lastName, String email, String phoneNumber, String password, boolean isAdmin) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    // Getters
    public int getId() { return id; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getEmail() { return email; }
    public String getPhoneNumber() { return phoneNumber; }
    public String getPassword() { return password; }
    public boolean isAdmin() { return isAdmin; }

    // Utility method for full name
    public String getFullName() {
        return firstName + " " + lastName;
    }

    // Setters
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public void setEmail(String email) { this.email = email; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
    public void setPassword(String password) { this.password = password; }
    public void setAdmin(boolean isAdmin) { this.isAdmin = isAdmin; }
}
