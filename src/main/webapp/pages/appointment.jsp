<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Appointment - HomeHaven</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<%@ include file="../components/navbar.jsp" %>

<section class="page-header">
    <div class="container">
        <h2>Schedule a Property Viewing</h2>
    </div>
</section>

<section class="appointment-section">
    <div class="container">
        <div class="appointment-container">
            <div class="appointment-content">
                <div class="appointment-form-container">
                    <h3>Book Your Visit</h3>
                    <p class="appointment-subtitle">Schedule a time to view your potential new home</p>

                    <form method="post" action="../saveAppointment">
                        <div class="form-group">
                            <label for="property">Select Property</label>
                            <select id="property" name="property" required>
                                <option value="" disabled selected>Choose a property...</option>
                                <option value="modern-family-home">Modern Family Home - $450,000</option>
                                <option value="downtown-apartment">Downtown Apartment - $325,000</option>
                                <option value="suburban-house">Suburban Family House - $385,000</option>
                                <option value="other">Other (Specify in notes)</option>
                            </select>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="appointment-date">Preferred Date</label>
                                <input type="date" id="appointment-date" name="appointment-date" required min="">
                            </div>
                            <div class="form-group">
                                <label for="appointment-time">Preferred Time</label>
                                <select id="appointment-time" name="appointment-time" required>
                                    <option value="" disabled selected>Select time...</option>
                                    <option value="9:00">9:00 AM</option>
                                    <option value="10:00">10:00 AM</option>
                                    <option value="11:00">11:00 AM</option>
                                    <option value="12:00">12:00 PM</option>
                                    <option value="13:00">1:00 PM</option>
                                    <option value="14:00">2:00 PM</option>
                                    <option value="15:00">3:00 PM</option>
                                    <option value="16:00">4:00 PM</option>
                                    <option value="17:00">5:00 PM</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="name">Full Name</label>
                                <input type="text" id="name" name="name" placeholder="John Doe" required>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="tel" id="phone" name="phone" placeholder="(555) 123-4567" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="your@email.com" required>
                        </div>

                        <div class="form-group">
                            <label for="notes">Additional Notes</label>
                            <textarea id="notes" name="notes" rows="4" placeholder="Any specific questions or requirements..."></textarea>
                        </div>

                        <div class="form-group terms-checkbox">
                            <label>
                                <input type="checkbox" name="terms" required> I understand that this is a request for an appointment and will be confirmed by a HomeHaven agent.
                            </label>
                        </div>

                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary btn-block">Schedule Appointment</button>
                        </div>
                    </form>

                    <div id="appointment-success" class="submission-message" style="display: none;">
                        <div class="success-content">
                            <h3>Appointment Request Submitted!</h3>
                            <p>Thank you for scheduling a viewing. A HomeHaven agent will contact you shortly to confirm your appointment.</p>
                            <div class="buttons">
                                <a href="index.html" class="btn btn-primary">Return to Home</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>

<%@ include file="../components/footer.jsp" %>

<script src="../js/main.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Set minimum date to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('appointment-date').setAttribute('min', today);

        // Handle form submission
        const appointmentForm = document.getElementById('appointment-form');
        if (appointmentForm) {
            appointmentForm.addEventListener('submit', function(e) {
                e.preventDefault();

                // Hide form and show success message
                appointmentForm.style.display = 'none';
                document.getElementById('appointment-success').style.display = 'block';

                // In a real application, you would send the form data to the server here
            });
        }
    });
</script>
</body>
</html>
