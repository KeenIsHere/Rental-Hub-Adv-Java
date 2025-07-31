<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Property - HomeHaven</title>
    <style>
        /* Internal CSS for Edit Property Page */
        body {
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #212121;
            background-color: #faf9f6;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .page-header {
            background-color: #4e342e;
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }

        .page-header h2 {
            margin: 0;
        }

        .edit-property-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 30px 20px;
        }

        .edit-property-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .edit-property-title {
            font-size: 24px;
            color: #4e342e;
            margin: 0;
        }

        .back-link {
            color: #8d6e63;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-weight: 500;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        .edit-form {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .form-section {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 18px;
            color: #4e342e;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #e0e0e0;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -10px;
        }

        .form-group {
            flex: 1 0 200px;
            padding: 0 10px;
            margin-bottom: 20px;
        }

        .form-group.full-width {
            flex: 1 0 100%;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #212121;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #e0e0e0;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            outline: none;
            border-color: #8d6e63;
            box-shadow: 0 0 0 2px rgba(141, 110, 99, 0.2);
        }

        textarea.form-control {
            min-height: 120px;
            resize: vertical;
        }

        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
        }

        .checkbox-item input[type="checkbox"] {
            margin-right: 8px;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
        }

        .cancel-btn {
            padding: 12px 24px;
            background-color: #e0e0e0;
            color: #212121;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .cancel-btn:hover {
            background-color: #d5d5d5;
        }

        .save-btn {
            padding: 12px 24px;
            background-color: #4e342e;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .save-btn:hover {
            background-color: #3e2723;
        }

        /* Status options */
        .status-options {
            display: flex;
            gap: 15px;
        }

        .status-option {
            display: flex;
            align-items: center;
        }

        .status-option input[type="radio"] {
            margin-right: 8px;
        }

        @media (max-width: 768px) {
            .form-group {
                flex: 1 0 100%;
            }

            .form-actions {
                flex-direction: column-reverse;
            }

            .form-actions button, .form-actions a {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
<%@ include file="../components/navbar.jsp" %>
<section class="page-header">
    <div class="container">
        <h2>Edit Property</h2>
    </div>
</section>

<section class="edit-property-container">
    <div class="edit-property-header">
        <h3 class="edit-property-title">Edit Property</h3>
        <a href="javascript:history.back()" class="back-link">← Back to Properties</a>
    </div>

    <form class="edit-form" action="updateProperty" method="post">
        <input type="hidden" name="id" value="${property.id}">

        <div class="form-section">
            <h4 class="section-title">Basic Information</h4>
            <div class="form-row">
                <div class="form-group full-width">
                    <label for="title">Property Title</label>
                    <input type="text" id="title" name="title" class="form-control" value="${property.title}" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="propertyType">Property Type</label>
                    <select id="propertyType" name="propertyType" class="form-control" required>
                        <option value="House" ${property.propertyType == 'House' ? 'selected' : ''}>House</option>
                        <option value="Apartment" ${property.propertyType == 'Apartment' ? 'selected' : ''}>Apartment</option>
                        <option value="Condo" ${property.propertyType == 'Condo' ? 'selected' : ''}>Condo</option>
                        <option value="Townhouse" ${property.propertyType == 'Townhouse' ? 'selected' : ''}>Townhouse</option>
                        <option value="Land" ${property.propertyType == 'Land' ? 'selected' : ''}>Land</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Price ($)</label>
                    <input type="number" id="price" name="price" class="form-control" value="${property.price}" step="0.01" min="0" required>
                </div>
                <div class="form-group">
                    <label for="status">Status</label>
                    <div class="status-options">
                        <div class="status-option">
                            <input type="radio" id="status-available" name="status" value="Available" ${property.status == 'Available' ? 'checked' : ''}>
                            <label for="status-available">Available</label>
                        </div>
                        <div class="status-option">
                            <input type="radio" id="status-pending" name="status" value="Pending" ${property.status == 'Pending' ? 'checked' : ''}>
                            <label for="status-pending">Pending</label>
                        </div>
                        <div class="status-option">
                            <input type="radio" id="status-sold" name="status" value="Sold" ${property.status == 'Sold' ? 'checked' : ''}>
                            <label for="status-sold">Sold</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-section">
            <h4 class="section-title">Property Details</h4>
            <div class="form-row">
                <div class="form-group">
                    <label for="area">Area (sqft)</label>
                    <input type="number" id="area" name="area" class="form-control" value="${property.area}" step="0.01" min="0" required>
                </div>
                <div class="form-group">
                    <label for="bedrooms">Bedrooms</label>
                    <input type="number" id="bedrooms" name="bedrooms" class="form-control" value="${property.bedrooms}" min="0" required>
                </div>
                <div class="form-group">
                    <label for="bathrooms">Bathrooms</label>
                    <input type="number" id="bathrooms" name="bathrooms" class="form-control" value="${property.bathrooms}" min="0" required>
                </div>
            </div>
        </div>

        <div class="form-section">
            <h4 class="section-title">Location</h4>
            <div class="form-row">
                <div class="form-group full-width">
                    <label for="address">Street Address</label>
                    <input type="text" id="address" name="address" class="form-control" value="${property.address}" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" id="city" name="city" class="form-control" value="${property.city}" required>
                </div>
                <div class="form-group">
                    <label for="state">State</label>
                    <input type="text" id="state" name="state" class="form-control" value="${property.state}" required>
                </div>
                <div class="form-group">
                    <label for="zipCode">ZIP Code</label>
                    <input type="text" id="zipCode" name="zipCode" class="form-control" value="${property.zipCode}" required>
                </div>
            </div>
        </div>

        <div class="form-section">
            <h4 class="section-title">Features</h4>
            <div class="form-row">
                <div class="form-group full-width">
                    <div class="checkbox-group">
                        <div class="checkbox-item">
                            <input type="checkbox" id="hasGarage" name="hasGarage" value="true" ${property.hasGarage() ? 'checked' : ''}>
                            <label for="hasGarage">Garage</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="hasSwimmingPool" name="hasSwimmingPool" value="true" ${property.hasSwimmingPool() ? 'checked' : ''}>
                            <label for="hasSwimmingPool">Swimming Pool</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="hasGarden" name="hasGarden" value="true" ${property.hasGarden() ? 'checked' : ''}>
                            <label for="hasGarden">Garden</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="hasAirConditioning" name="hasAirConditioning" value="true" ${property.hasAirConditioning() ? 'checked' : ''}>
                            <label for="hasAirConditioning">Air Conditioning</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="hasFireplace" name="hasFireplace" value="true" ${property.hasFireplace() ? 'checked' : ''}>
                            <label for="hasFireplace">Fireplace</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-section">
            <h4 class="section-title">Contact Information</h4>
            <div class="form-row">
                <div class="form-group">
                    <label for="contactName">Contact Name</label>
                    <input type="text" id="contactName" name="contactName" class="form-control" value="${property.contactName}" required>
                </div>
                <div class="form-group">
                    <label for="contactEmail">Contact Email</label>
                    <input type="email" id="contactEmail" name="contactEmail" class="form-control" value="${property.contactEmail}" required>
                </div>
                <div class="form-group">
                    <label for="contactPhone">Contact Phone</label>
                    <input type="tel" id="contactPhone" name="contactPhone" class="form-control" value="${property.contactPhone}" required>
                </div>
            </div>
        </div>

        <div class="form-section">
            <h4 class="section-title">Description</h4>
            <div class="form-row">
                <div class="form-group full-width">
                    <label for="description">Property Description</label>
                    <textarea id="description" name="description" class="form-control" rows="6" required>${property.description}</textarea>
                </div>
            </div>
        </div>

        <input type="hidden" name="userId" value="${property.userId}">

        <div class="form-actions">
            <a href="javascript:history.back()" class="cancel-btn">Cancel</a>
            <button type="submit" class="save-btn">Save Changes</button>
        </div>
    </form>
</section>
<%@ include file="../components/footer.jsp" %>

<script>
    // Handle form submission
    document.querySelector('.edit-form').addEventListener('submit', function(e) {
        // Set hidden fields for checkboxes if not checked
        if (!document.getElementById('hasGarage').checked) {
            const hiddenField = document.createElement('input');
            hiddenField.type = 'hidden';
            hiddenField.name = 'hasGarage';
            hiddenField.value = 'false';
            this.appendChild(hiddenField);
        }

        if (!document.getElementById('hasSwimmingPool').checked) {
            const hiddenField = document.createElement('input');
            hiddenField.type = 'hidden';
            hiddenField.name = 'hasSwimmingPool';
            hiddenField.value = 'false';
            this.appendChild(hiddenField);
        }

        if (!document.getElementById('hasGarden').checked) {
            const hiddenField = document.createElement('input');
            hiddenField.type = 'hidden';
            hiddenField.name = 'hasGarden';
            hiddenField.value = 'false';
            this.appendChild(hiddenField);
        }

        if (!document.getElementById('hasAirConditioning').checked) {
            const hiddenField = document.createElement('input');
            hiddenField.type = 'hidden';
            hiddenField.name = 'hasAirConditioning';
            hiddenField.value = 'false';
            this.appendChild(hiddenField);
        }

        if (!document.getElementById('hasFireplace').checked) {
            const hiddenField = document.createElement('input');
            hiddenField.type = 'hidden';
            hiddenField.name = 'hasFireplace';
            hiddenField.value = 'false';
            this.appendChild(hiddenField);
        }
    });
</script>
</body>
</html>