
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RentHub - Real Estate Listings</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
@WebServlet("/home")
<%@ include file="components/navbar.jsp" %>
<section class="hero">
    <div class="hero-overlay"></div>
    <div class="container">
        <div class="hero-content">
            <h2 class="hero-title">Find Your Dream Home</h2>
            <p class="hero-subtitle">Discover the perfect property with RentHub's extensive listings</p>
            <div class="hero-search">
                <input type="text" placeholder="Enter location, property type, or keywords..." class="hero-search-input">
                <button class="btn btn-accent">Search</button>
            </div>
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/pages/explore.jsp" class="btn btn-primary btn-lg">Explore Properties</a>
                <a href="${pageContext.request.contextPath}/pages/post-property.jsp" class="btn btn-outline-light btn-lg">List Your Property</a>
            </div>
            <div class="hero-stats">
                <div class="hero-stat">
                    <span class="hero-stat-number">500+</span>
                    <span class="hero-stat-label">Properties</span>
                </div>
                <div class="hero-stat">
                    <span class="hero-stat-number">300+</span>
                    <span class="hero-stat-label">Happy Clients</span>
                </div>
                <div class="hero-stat">
                    <span class="hero-stat-number">15+</span>
                    <span class="hero-stat-label">Cities</span>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="featured">
    <div class="container">
        <h2>Featured Properties</h2>
        <div class="property-grid">
            <c:forEach var="item" items="${properties}">
                <div class="property-card">
                    <div class="property-image">
                        <img src="${item.imageUrls[0]}" alt="${item.title}">
                    </div>
                    <div class="property-details">
                        <h3>${item.title}</h3>
                        <p class="price">$${item.price}</p>
                        <p class="location">${item.location}</p>
                        <div class="property-features">
                            <span>${item.bedrooms} Beds</span>
                            <span>${item.bathrooms} Baths</span>
                            <span>${item.area} sqft</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/viewProperty?id=${item.id}" class="btn btn-secondary">View Details</a>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
</section>

<section class="cta">
    <div class="container">
        <h2>Have a Property to Sell or Rent?</h2>
        <p>List your property with us and reach thousands of potential buyers or tenants</p>
        <a href="${pageContext.request.contextPath}/pages/post-property.jsp" class="btn btn-primary">Post Your Property</a>
    </div>
</section>
<%@ include file="components/footer.jsp" %>


<script src="js/main.js"></script>
</body>
</html>