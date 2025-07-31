package com.hms.models;

import java.util.List;

public class Property {
    private int id;
    private String title;
    private String propertyType; // House, Apartment, Condo, Townhouse, Land
    private double price;
    private double area; // in sqft
    private int bedrooms;
    private int bathrooms;
    private String address;
    private String city;
    private String state;
    private String zipCode;
    private String description;
    private List<String> imageUrls; // To store paths to property images

    // Features
    private boolean hasGarage;
    private boolean hasSwimmingPool;
    private boolean hasGarden;
    private boolean hasAirConditioning;
    private boolean hasFireplace;

    // Contact information
    private String contactName;
    private String contactEmail;
    private String contactPhone;

    // Original fields
    private String location; // Can be derived from address, city, state, zipCode
    private String status; // e.g., "Available", "Sold", "Pending"
    private int userId; // ID of the user who posted this property

    // Constructor with all fields
    public Property(int id, String title, String propertyType, double price, double area, int bedrooms, int bathrooms,
                    String address, String city, String state, String zipCode, String description, List<String> imageUrls,
                    boolean hasGarage, boolean hasSwimmingPool, boolean hasGarden, boolean hasAirConditioning,
                    boolean hasFireplace, String contactName, String contactEmail, String contactPhone,
                    String status, int userId) {
        this.id = id;
        this.title = title;
        this.propertyType = propertyType;
        this.price = price;
        this.area = area;
        this.bedrooms = bedrooms;
        this.bathrooms = bathrooms;
        this.address = address;
        this.city = city;
        this.state = state;
        this.zipCode = zipCode;
        this.description = description;
        this.imageUrls = imageUrls;
        this.hasGarage = hasGarage;
        this.hasSwimmingPool = hasSwimmingPool;
        this.hasGarden = hasGarden;
        this.hasAirConditioning = hasAirConditioning;
        this.hasFireplace = hasFireplace;
        this.contactName = contactName;
        this.contactEmail = contactEmail;
        this.contactPhone = contactPhone;
        this.location = address + ", " + city + ", " + state + " " + zipCode;
        this.status = status;
        this.userId = userId;
    }

    // Constructor without ID (for new properties being created)
    public Property(String title, String propertyType, double price, double area, int bedrooms, int bathrooms,
                    String address, String city, String state, String zipCode, String description, List<String> imageUrls,
                    boolean hasGarage, boolean hasSwimmingPool, boolean hasGarden, boolean hasAirConditioning,
                    boolean hasFireplace, String contactName, String contactEmail, String contactPhone,
                    String status, int userId) {
        this.title = title;
        this.propertyType = propertyType;
        this.price = price;
        this.area = area;
        this.bedrooms = bedrooms;
        this.bathrooms = bathrooms;
        this.address = address;
        this.city = city;
        this.state = state;
        this.zipCode = zipCode;
        this.description = description;
        this.imageUrls = imageUrls;
        this.hasGarage = hasGarage;
        this.hasSwimmingPool = hasSwimmingPool;
        this.hasGarden = hasGarden;
        this.hasAirConditioning = hasAirConditioning;
        this.hasFireplace = hasFireplace;
        this.contactName = contactName;
        this.contactEmail = contactEmail;
        this.contactPhone = contactPhone;
        this.location = address + ", " + city + ", " + state + " " + zipCode;
        this.status = status;
        this.userId = userId;
    }

    // Original simplified constructor (kept for backward compatibility)
    public Property(String title, String location, String description, String status, int userId) {
        this.title = title;
        this.location = location;
        this.description = description;
        this.status = status;
        this.userId = userId;
    }

    public Property() {

    }

    // Getters and Setters
    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getPropertyType() { return propertyType; }
    public double getPrice() { return price; }
    public double getArea() { return area; }
    public int getBedrooms() { return bedrooms; }
    public int getBathrooms() { return bathrooms; }
    public String getAddress() { return address; }
    public String getCity() { return city; }
    public String getState() { return state; }
    public String getZipCode() { return zipCode; }
    public String getDescription() { return description; }
    public List<String> getImageUrls() { return imageUrls; }
    public boolean hasGarage() { return hasGarage; }
    public boolean hasSwimmingPool() { return hasSwimmingPool; }
    public boolean hasGarden() { return hasGarden; }
    public boolean hasAirConditioning() { return hasAirConditioning; }
    public boolean hasFireplace() { return hasFireplace; }
    public String getContactName() { return contactName; }
    public String getContactEmail() { return contactEmail; }
    public String getContactPhone() { return contactPhone; }
    public String getLocation() { return location; }
    public String getStatus() { return status; }
    public int getUserId() { return userId; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setTitle(String title) { this.title = title; }
    public void setPropertyType(String propertyType) { this.propertyType = propertyType; }
    public void setPrice(double price) { this.price = price; }
    public void setArea(double area) { this.area = area; }
    public void setBedrooms(int bedrooms) { this.bedrooms = bedrooms; }
    public void setBathrooms(int bathrooms) { this.bathrooms = bathrooms; }
    public void setAddress(String address) {
        this.address = address;
        updateLocation();
    }
    public void setCity(String city) {
        this.city = city;
        updateLocation();
    }
    public void setState(String state) {
        this.state = state;
        updateLocation();
    }
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
        updateLocation();
    }
    public void setDescription(String description) { this.description = description; }
    public void setImageUrls(List<String> imageUrls) { this.imageUrls = imageUrls; }
    public void setHasGarage(boolean hasGarage) { this.hasGarage = hasGarage; }
    public void setHasSwimmingPool(boolean hasSwimmingPool) { this.hasSwimmingPool = hasSwimmingPool; }
    public void setHasGarden(boolean hasGarden) { this.hasGarden = hasGarden; }
    public void setHasAirConditioning(boolean hasAirConditioning) { this.hasAirConditioning = hasAirConditioning; }
    public void setHasFireplace(boolean hasFireplace) { this.hasFireplace = hasFireplace; }
    public void setContactName(String contactName) { this.contactName = contactName; }
    public void setContactEmail(String contactEmail) { this.contactEmail = contactEmail; }
    public void setContactPhone(String contactPhone) { this.contactPhone = contactPhone; }
    public void setStatus(String status) { this.status = status; }
    public void setUserId(int userId) { this.userId = userId; }

    // Helper method to update location when address components change
    private void updateLocation() {
        if (address != null && city != null && state != null && zipCode != null) {
            this.location = address + ", " + city + ", " + state + " " + zipCode;
        }
    }
}