<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Property - HomeHaven</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<%@ include file="../components/navbar.jsp" %>

<section class="page-header">
    <div class="container">
        <h2>Post Your Property</h2>
    </div>
</section>

<section class="post-property">
    <div class="container">
        <div class="form-container">
            <form  method="post" action="../addProperty" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Property Title</label>
                    <input type="text" id="title" name="title"  required>
                </div>
                <div class="form-group">
                    <label for="type">Property Type</label>
                    <select id="type" name="type" required>
                        <option value="">Select Type</option>
                        <option value="house">House</option>
                        <option value="apartment">Apartment</option>
                        <option value="townhouse">Townhouse</option>
                        <option value="land">Land</option>
                    </select>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="price">Price ($)</label>
                        <input type="number" id="price" name="price" required>
                    </div>
                    <div class="form-group">
                        <label for="area">Area (sqft)</label>
                        <input type="number" id="area" name="area" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="bedrooms">Bedrooms</label>
                        <input type="number" id="bedrooms" name="bedrooms" min="0" required>
                    </div>
                    <div class="form-group">
                        <label for="bathrooms">Bathrooms</label>
                        <input type="number" id="bathrooms" name="bathrooms" min="0" step="0.5" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label for="city">City</label>
                        <input type="text" id="city" name="city" required>
                    </div>
                    <div class="form-group">
                        <label for="state">State</label>
                        <input type="text" id="state" name="state" required>
                    </div>
                    <div class="form-group">
                        <label for="zip">Zip Code</label>
                        <input type="text" id="zip" name="zip" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="5" required></textarea>
                </div>
                <div class="form-group">
                    <label for="image">Property Images</label>
                    <input type="file" id="image" name="images" accept="image/*" multiple>
                    <small>You can select multiple images</small>
                </div>
                <div class="form-group">
                    <label>Features</label>
                    <div class="checkbox-group">
                        <label><input type="checkbox" name="hasGarage" value="garage"> Garage</label>
                        <label><input type="checkbox" name="hasSwimmingPool" value="pool"> Swimming Pool</label>
                        <label><input type="checkbox" name="hasGarden" value="garden"> Garden</label>
                        <label><input type="checkbox" name="hasAirConditioning" value="ac"> Air Conditioning</label>
                        <label><input type="checkbox" name="hasFireplace" value="fireplace"> Fireplace</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="contact-name">Contact Name</label>
                    <input type="text" id="contact-name" name="contact-name" required>
                </div>
                <div class="form-group">
                    <label for="contact-email">Contact Email</label>
                    <input type="email" id="contact-email" name="contact-email" required>
                </div>
                <div class="form-group">
                    <label for="contact-phone">Contact Phone</label>
                    <input type="tel" id="contact-phone" name="contact-phone" required>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Submit Property</button>
                    <button type="reset" class="btn btn-secondary">Reset Form</button>
                </div>
            </form>
        </div>
        <div id="submission-success" class="submission-message" style="display: none;">
            <div class="success-content">
                <h3>Property Submitted Successfully!</h3>
                <p>Your property has been submitted and is pending approval by our administrators.</p>
                <p>Current Status: <span class="status pending">Pending</span></p>
                <div class="buttons">
                    <a href="index.html" class="btn btn-secondary">Back to Home</a>
                    <a href="post-property.html" class="btn btn-primary">Post Another Property</a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../components/footer.jsp" %>

<script src="../js/main.js"></script>
</body>
</html>