
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Rent Hub</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<%@ include file="../components/navbar.jsp" %>

<section class="page-header">
    <div class="container">
        <h2>Create Your Account</h2>
    </div>
</section>

<section class="auth-section">
    <div class="container">
        <div class="auth-container">
            <div class="auth-content">
                <div class="auth-form-container">
                    <h3>Join Rent Hub</h3>
                    <p class="auth-subtitle">Create an account to access all features</p>
                    <form action="../register" method="post" onsubmit="return onSignup()">


                    <c:if test="${not empty error}">
                            <div style="color: red; font-weight: bold; margin-bottom: 20px; margin-top: -10px">
                                ${error}
                            </div>
                        </c:if>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="first-name">First Name</label>
                                <input type="text" id="first-name" name="first-name"  required>
                            </div>
                            <div class="form-group">
                                <label for="last-name">Last Name</label>
                                <input type="text" id="last-name" name="last-name"  required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="your@email.com" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" placeholder="(555) 123-4567" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" required>
                            <small>Password must be at least 8 characters long and include a number and a special character.</small>
                        </div>
                        <div class="form-group">
                            <label for="confirm-password">Confirm Password</label>
                            <input type="password" id="confirm-password" name="confirm-password" required>
                        </div>
                        <div class="form-group terms-checkbox">
                            <label>
                                <input type="checkbox" name="terms" required> I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>
                            </label>
                        </div>
                        <div class="form-actions">
                            <button type="submit"  class="btn btn-primary btn-block">Create Account</button>
                        </div>
                    </form>

                    <div class="auth-footer">
                        <p>Already have an account? <a href="../pages/login.jsp">Login</a></p>
                    </div>
                </div>
                <div class="auth-image">
                    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Beautiful home exterior">
                    <div class="auth-image-overlay"></div>
                    <div class="auth-image-content">
                        <h3>Start Your Journey</h3>
                        <p>Create an account to save your favorite properties, receive updates, and list your own properties.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../components/footer.jsp" %>

<script src="../js/main.js"></script>
<script>

        const onSignup = () => {
        let phone = document.getElementById("phone").value.trim();

        let cleanedPhone = phone.replace(/\D/g, '');

        if (cleanedPhone.length !== 10) {
        alert("Please enter a valid 10-digit phone number.");
        return false;
    }

        return true;
    }

</script>
</body>
</html>
