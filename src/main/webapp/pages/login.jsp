<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Rent Hub</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<%@ include file="../components/navbar.jsp" %>

<section class="page-header">
    <div class="container">
        <h2>Login to Your Account</h2>
    </div>
</section>

<section class="auth-section">
    <div class="container">
        <div class="auth-container">
            <div class="auth-content">
                <div class="auth-form-container">
                    <h3>Welcome Back</h3>
                    <p class="auth-subtitle">Enter your credentials to access your account</p>

                    <form method="post" action="../login">
                        <c:if test="${not empty error}">
                            <div style="color: red; font-weight: bold; margin-bottom: 20px; margin-top: -10px">
                                    ${error}
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" placeholder="your@email.com" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" required>
                            <div class="forgot-password">
                                <a href="#">Forgot password?</a>
                            </div>
                        </div>
                        <div class="form-group remember-me">
                            <label>
                                <input type="checkbox" name="remember"> Remember me
                            </label>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </div>
                    </form>

                    <div class="auth-footer">
                        <p>Don't have an account? <a href="../pages/signup.jsp">Sign up</a></p>
                    </div>
                </div>
                <div class="auth-image">
                    <img src="https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1473&q=80" alt="Beautiful home interior">
                    <div class="auth-image-overlay"></div>
                    <div class="auth-image-content">
                        <h3>Find Your Dream Home</h3>
                        <p>Access your account to manage your properties, saved listings, and more.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../components/footer.jsp" %>
<script src="../js/main.js"></script>
</body>
</html>
