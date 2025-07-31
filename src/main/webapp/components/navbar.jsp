<%
    Object user = session.getAttribute("user");
    boolean isAdmin = false;
    if (user != null) {
        com.hms.models.User loggedInUser = (com.hms.models.User) user;
        if (loggedInUser.isAdmin()) {
            isAdmin = true;
        }
    }
%>

<header>
    <div class="container">
        <div class="logo">
            <h1>RentHub</h1>
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
