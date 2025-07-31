<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.hms.models.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    boolean isAdmin = false;
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }else{
        com.hms.models.User loggedInUser = (com.hms.models.User) user;
        if (loggedInUser.isAdmin()) {
            isAdmin = true;
        }
    }
%>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Rent Hub</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>

<header>
    <div class="container">
        <div class="logo">
            <h1>Rent Hub
            </h1>
        </div>
        <nav>
            <ul>
                <li><a href="../index.jsp" class="active">Home</a></li>
                <li><a href="../pages/explore.jsp">Explore</a></li>
                <%
                    if (user != null) {
                %>
                <li><a href="../pages/post-property.jsp">Post Property</a></li>
                <li><a href="../pages/profile.jsp">Profile</a></li>
                <% } else { %>
                <li><a href="../pages/login.jsp">Login</a></li>
                <% } %>

                <%
                    if (isAdmin) {
                %>
                <li><a href="../pages/admin.jsp">Admin</a></li>
                <% } %>
            </ul>
        </nav>
        <div class="menu-toggle">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
</header>

<section class="page-header">
    <div class="container">
        <h2>User Profile</h2>
    </div>
</section>

<section class="profile-section">
    <div class="container">
        <div class="profile-tabs">
            <button class="tab-btn active" data-tab="info">Profile Info</button>
            <button class="tab-btn" data-tab="password">Change Password</button>
        </div>

        <div class="tab-content active" id="info-tab">
            <div class="profile-card">
                <div class="profile-header">
                    <div class="profile-avatar">
                        <span>JD</span>
                    </div>
                    <div class="profile-name">
                        <h3><%= user.getFullName() %></h3>
                        <p>Member since January 2024</p>
                    </div>
                </div>
                <div class="profile-details">
                    <div class="profile-detail-item">
                        <span class="detail-label">Full Name:</span>
                        <span class="detail-value"><%= user.getFullName() %></span>
                    </div>
                    <div class="profile-detail-item">
                        <span class="detail-label">Email:</span>
                        <span class="detail-value"><%= user.getEmail() %></span>
                    </div>
                    <div class="profile-detail-item">
                        <span class="detail-label">Phone:</span>
                        <span class="detail-value"><%= user.getPhoneNumber() %></span>
                    </div>
                </div>
                <div style="display: flex;justify-content: center;align-content: center; gap: 1rem">
<%--                <div class="profile-actions">--%>
<%--                    <button class="btn btn-secondary">Edit Profile</button>--%>
<%--                </div>--%>

                <form method="post" action="../logout">
                <div class="profile-actions">
                    <button type="submit" class="btn btn-secondary">logout</button>
                </div>
                </form>
                </div>
            </div>
        </div>


        <div class="tab-content" id="password-tab">
            <c:if test="${not empty error}">
                <div style="color: red; font-weight: bold; margin-bottom: 20px; margin-top: -10px">
                        ${error}
                </div>
            </c:if>
            <div class="form-container">
                <h3>Change Password</h3>
                <form method="post" action="../change-password" >
                    <div class="form-group">
                        <label for="current-password">Current Password</label>
                        <input type="password" id="current-password" name="current-password" required>
                    </div>
                    <div class="form-group">
                        <label for="new-password">New Password</label>
                        <input type="password" id="new-password" name="new-password" required>
                        <small>Password must be at least 8 characters long and include a number and a special character.</small>
                    </div>
                    <div class="form-group">
                        <label for="confirm-password">Confirm New Password</label>
                        <input type="password" id="confirm-password" name="confirm-password" required>
                    </div>
                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Update Password</button>
                    </div>
                </form>
                <div id="password-success" class="submission-message" style="display: none;">
                    <div class="success-content">
                        <h3>Password Updated Successfully!</h3>
                        <p>Your password has been updated. You will be redirected to the login page.</p>
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