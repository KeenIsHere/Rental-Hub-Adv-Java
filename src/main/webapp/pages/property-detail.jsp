<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<%--<%--%>
<%--    String idParam = request.getParameter("id");--%>
<%--    int id = Integer.parseInt(idParam); --%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${property.getTitle()} - HomeHaven</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<%@ include file="../components/navbar.jsp" %>

<section class="page-header">
    <div class="container">
        <h2>Property Details</h2>
    </div>
</section>

<section class="property-detail-section">
    <div class="container">
        <div class="property-detail-container">
            <div class="property-gallery">
                <div class="main-image">
                    <c:choose>
                        <c:when test="${not empty property.getImageUrls() and property.getImageUrls().size() > 0}">
                            <img id="main-property-image" src="${property.getImageUrls().get(0)}" alt="${property.getTitle()}">
                        </c:when>
                        <c:otherwise>
                            <img id="main-property-image" src="https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="${property.getTitle()}">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="thumbnail-images">
                    <c:choose>
                        <c:when test="${not empty property.getImageUrls() and property.getImageUrls().size() > 0}">
                            <c:forEach var="imageUrl" items="${property.getImageUrls()}" varStatus="status">
                                <img class="thumbnail ${status.index == 0 ? 'active' : ''}" src="${imageUrl}" alt="${property.getTitle()} - Image ${status.index + 1}" onclick="changeImage(this)">
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <img class="thumbnail active" src="https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="${property.getTitle()} Exterior" onclick="changeImage(this)">
                            <img class="thumbnail" src="https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="${property.getTitle()} Kitchen" onclick="changeImage(this)">
                            <img class="thumbnail" src="https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="${property.getTitle()} Living Room" onclick="changeImage(this)">
                            <img class="thumbnail" src="https://images.unsplash.com/photo-1560185127-6ed189bf02f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="${property.getTitle()} Bedroom" onclick="changeImage(this)">
                            <img class="thumbnail" src="https://images.unsplash.com/photo-1584622650111-993a426fbf0a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="${property.getTitle()} Bathroom" onclick="changeImage(this)">
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="property-info">
                <div class="property-header">
                    <h2 id="property-title">${property.getTitle()}</h2>
                    <p class="property-address" id="property-address">${property.getLocation()}</p>
                    <p class="property-price" id="property-price">$<fmt:formatNumber value="${property.getPrice()}" pattern="#,###.00" /></p>
                </div>
                <div class="property-features-detail">
                    <div class="feature">
                        <span class="feature-label">Bedrooms</span>
                        <span class="feature-value" id="property-beds">${property.getBedrooms()}</span>
                    </div>
                    <div class="feature">
                        <span class="feature-label">Bathrooms</span>
                        <span class="feature-value" id="property-baths">${property.getBathrooms()}</span>
                    </div>
                    <div class="feature">
                        <span class="feature-label">Area</span>
                        <span class="feature-value" id="property-area"><fmt:formatNumber value="${property.getArea()}" pattern="#,###"/> sqft</span>
                    </div>
                    <div class="feature">
                        <span class="feature-label">Type</span>
                        <span class="feature-value" id="property-type">${property.getPropertyType()}</span>
                    </div>
                    <div class="feature">
                        <span class="feature-label">Status</span>
                        <span class="feature-value" id="property-status">${property.getStatus()}</span>
                    </div>
                </div>
                <div class="property-description">
                    <h3>Description</h3>
                    <p id="property-description">${property.getDescription()}</p>
                </div>
                <div class="property-amenities">
                    <h3>Amenities</h3>
                    <ul class="amenities-list" id="property-amenities">
                        <c:if test="${property.hasAirConditioning()}">
                            <li>Central Air Conditioning</li>
                        </c:if>
                        <c:if test="${property.hasGarage()}">
                            <li>Attached Garage</li>
                        </c:if>
                        <c:if test="${property.hasFireplace()}">
                            <li>Fireplace</li>
                        </c:if>
                        <c:if test="${property.hasGarden()}">
                            <li>Garden/Yard</li>
                        </c:if>
                        <c:if test="${property.hasSwimmingPool()}">
                            <li>Swimming Pool</li>
                        </c:if>

                    </ul>
                </div>
                <div class="property-contact">
                    <h3>Contact Information</h3>
                    <p><strong>Listing Agent:</strong> <span id="property-agent">${property.getContactName()}</span></p>
                    <p><strong>Email:</strong> <span id="property-email">${property.getContactEmail()}</span></p>
                    <p><strong>Phone:</strong> <span id="property-phone">${property.getContactPhone()}</span></p>
                </div>
                <div class="property-actions">

                    <button class="btn btn-primary" id="schedule-btn">Schedule Viewing</button>
                    <button class="btn btn-outline" id="report-btn">Report Property</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Schedule Viewing Modal -->
<div class="modal" id="schedule-modal">
    <div class="modal-content">
        <span class="close-modal">&times;</span>
        <h3>Schedule a Viewing for ${property.getTitle()}</h3>
        <form method="post" action="../scheduleAppointment">
            <div class="form-group">
                <label for="schedule-name">Your Name</label>
                <input type="text" id="schedule-name" name="schedule-name" required>
            </div>
            <div class="form-group">
                <label for="schedule-email">Your Email</label>
                <input type="email" id="schedule-email" name="schedule-email" required>
            </div>
            <div class="form-group">
                <label for="schedule-phone">Your Phone</label>
                <input type="tel" id="schedule-phone" name="schedule-phone" required>
            </div>
            <div class="form-group">
                <label for="schedule-date">Preferred Date</label>
                <input type="date" id="schedule-date" name="schedule-date" required>
            </div>
            <div class="form-group">
                <label for="schedule-time">Preferred Time</label>
                <select id="schedule-time" name="schedule-time" required>
                    <option value="">Select Time</option>
                    <option value="9:00 AM">9:00 AM</option>
                    <option value="10:00 AM">10:00 AM</option>
                    <option value="11:00 AM">11:00 AM</option>
                    <option value="12:00 PM">12:00 PM</option>
                    <option value="1:00 PM">1:00 PM</option>
                    <option value="2:00 PM">2:00 PM</option>
                    <option value="3:00 PM">3:00 PM</option>
                    <option value="4:00 PM">4:00 PM</option>
                    <option value="5:00 PM">5:00 PM</option>
                </select>
            </div>
            <div class="form-group">
                <label for="schedule-notes">Additional Notes</label>
                <textarea id="schedule-notes" name="schedule-notes" rows="3">I would like to schedule a viewing for ${property.getTitle()}.</textarea>
            </div>
            <input type="hidden" name="property-id" value="${property.getId()}">
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Schedule Viewing</button>
            </div>
        </form>
    </div>
</div>

<!-- Report Property Modal -->
<div class="modal" id="report-modal">
    <div class="modal-content">
        <span class="close-modal">&times;</span>
        <h3>Report Property</h3>
        <form id="report-form">
            <div class="form-group">
                <label for="report-name">Your Name</label>
                <input type="text" id="report-name" name="report-name" required>
            </div>
            <div class="form-group">
                <label for="report-email">Your Email</label>
                <input type="email" id="report-email" name="report-email" required>
            </div>
            <div class="form-group">
                <label for="report-reason">Reason for Report</label>
                <select id="report-reason" name="report-reason" required>
                    <option value="">Select Reason</option>
                    <option value="inaccurate">Inaccurate Information</option>
                    <option value="misleading">Misleading Photos</option>
                    <option value="unavailable">Property Not Available</option>
                    <option value="scam">Potential Scam</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="report-details">Details</label>
                <textarea id="report-details" name="report-details" rows="4" required>I am reporting the property: ${property.getTitle()} (ID: ${property.getId()}).</textarea>
            </div>
            <input type="hidden" name="property-id" value="${property.getId()}">
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Submit Report</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="../components/footer.jsp" %>

<script>
    // Function to change the main image when a thumbnail is clicked
    function changeImage(thumbnail) {
        // Get the main image element
        const mainImage = document.getElementById('main-property-image');
        // Update the main image source with the thumbnail source
        mainImage.src = thumbnail.src;
        mainImage.alt = thumbnail.alt;

        // Remove active class from all thumbnails
        const thumbnails = document.querySelectorAll('.thumbnail');
        thumbnails.forEach(thumb => thumb.classList.remove('active'));

        // Add active class to the clicked thumbnail
        thumbnail.classList.add('active');
    }

    // Modal functionality
    document.addEventListener('DOMContentLoaded', function() {
        const contactBtn = document.getElementById('contact-btn');
        const scheduleBtn = document.getElementById('schedule-btn');
        const reportBtn = document.getElementById('report-btn');

        const contactModal = document.getElementById('contact-modal');
        const scheduleModal = document.getElementById('schedule-modal');
        const reportModal = document.getElementById('report-modal');

        const closeModalBtns = document.querySelectorAll('.close-modal');

        // Open modal functions
        if (contactBtn) {
            contactBtn.addEventListener('click', function() {
                contactModal.style.display = 'block';
            });
        }

        if (scheduleBtn) {
            scheduleBtn.addEventListener('click', function() {
                scheduleModal.style.display = 'block';
            });
        }

        if (reportBtn) {
            reportBtn.addEventListener('click', function() {
                reportModal.style.display = 'block';
            });
        }

        // Close modal functions
        closeModalBtns.forEach(function(btn) {
            btn.addEventListener('click', function() {
                contactModal.style.display = 'none';
                scheduleModal.style.display = 'none';
                reportModal.style.display = 'none';
            });
        });

        // Click outside to close
        window.addEventListener('click', function(event) {
            if (event.target == contactModal) {
                contactModal.style.display = 'none';
            }
            if (event.target == scheduleModal) {
                scheduleModal.style.display = 'none';
            }
            if (event.target == reportModal) {
                reportModal.style.display = 'none';
            }
        });

        // Tab functionality
        const tabBtns = document.querySelectorAll('.tab-btn');
        const tabContents = document.querySelectorAll('.tab-content');

        tabBtns.forEach(function(btn) {
            btn.addEventListener('click', function() {
                const tabName = this.getAttribute('data-tab');

                // Remove active class from all buttons and tabs
                tabBtns.forEach(b => b.classList.remove('active'));
                tabContents.forEach(c => c.classList.remove('active'));

                // Add active class to current button and tab
                this.classList.add('active');
                document.getElementById(tabName + '-tab').classList.add('active');
            });
        });

        // Form submission
        const contactForm = document.getElementById('contact-form');
        const scheduleForm = document.getElementById('schedule-form');
        const reportForm = document.getElementById('report-form');

        if (contactForm) {
            contactForm.addEventListener('submit', function(e) {
                e.preventDefault();
                // Here you would normally send the form data to the server
                alert('Thank you for your message. The agent will contact you shortly.');
                contactModal.style.display = 'none';
            });
        }

        if (scheduleForm) {
            scheduleForm.addEventListener('submit', function(e) {
                e.preventDefault();
                // Here you would normally send the form data to the server
                alert('Your viewing request has been submitted. The agent will confirm shortly.');
                scheduleModal.style.display = 'none';
            });
        }

        if (reportForm) {
            reportForm.addEventListener('submit', function(e) {
                e.preventDefault();
                // Here you would normally send the form data to the server
                alert('Thank you for your report. We will review it promptly.');
                reportModal.style.display = 'none';
            });
        }
    });
</script>
</body>
</html>