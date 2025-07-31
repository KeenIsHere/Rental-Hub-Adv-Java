<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Properties - HomeHaven</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
<%@ include file="../components/navbar.jsp" %>

<section class="page-header">
    <div class="container">
        <h2>Explore Properties</h2>
    </div>
</section>

<section class="explore-section">
    <div class="container">
<%--        <div class="filter-section">--%>
<%--            <div class="search-bar">--%>
<%--                <input type="text" placeholder="Search by location, property type, etc." class="search-input">--%>
<%--                <button class="btn btn-primary">Search</button>--%>
<%--            </div>--%>
<%--            <div class="filters">--%>
<%--                <div class="filter-group">--%>
<%--                    <label for="property-type">Property Type</label>--%>
<%--                    <select id="property-type">--%>
<%--                        <option value="">All Types</option>--%>
<%--                        <option value="house">House</option>--%>
<%--                        <option value="apartment">Apartment</option>--%>
<%--                        <option value="townhouse">Townhouse</option>--%>
<%--                        <option value="land">Land</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--                <div class="filter-group">--%>
<%--                    <label for="price-range">Price Range</label>--%>
<%--                    <select id="price-range">--%>
<%--                        <option value="">Any Price</option>--%>
<%--                        <option value="0-200000">$0 - $200,000</option>--%>
<%--                        <option value="200000-400000">$200,000 - $400,000</option>--%>
<%--                        <option value="400000-600000">$400,000 - $600,000</option>--%>
<%--                        <option value="600000-800000">$600,000 - $800,000</option>--%>
<%--                        <option value="800000-1000000">$800,000 - $1,000,000</option>--%>
<%--                        <option value="1000000+">$1,000,000+</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--                <div class="filter-group">--%>
<%--                    <label for="bedrooms">Bedrooms</label>--%>
<%--                    <select id="bedrooms">--%>
<%--                        <option value="">Any</option>--%>
<%--                        <option value="1">1+</option>--%>
<%--                        <option value="2">2+</option>--%>
<%--                        <option value="3">3+</option>--%>
<%--                        <option value="4">4+</option>--%>
<%--                        <option value="5">5+</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--                <div class="filter-group">--%>
<%--                    <label for="bathrooms">Bathrooms</label>--%>
<%--                    <select id="bathrooms">--%>
<%--                        <option value="">Any</option>--%>
<%--                        <option value="1">1+</option>--%>
<%--                        <option value="2">2+</option>--%>
<%--                        <option value="3">3+</option>--%>
<%--                        <option value="4">4+</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--                <button class="btn btn-secondary" id="more-filters-btn">More Filters</button>--%>
<%--            </div>--%>
<%--            <div class="advanced-filters" id="advanced-filters" style="display: none;">--%>
<%--                <div class="filter-row">--%>
<%--                    <div class="filter-group">--%>
<%--                        <label for="min-area">Min Area (sqft)</label>--%>
<%--                        <input type="number" id="min-area" placeholder="Min">--%>
<%--                    </div>--%>
<%--                    <div class="filter-group">--%>
<%--                        <label for="max-area">Max Area (sqft)</label>--%>
<%--                        <input type="number" id="max-area" placeholder="Max">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="filter-group">--%>
<%--                    <label>Features</label>--%>
<%--                    <div class="checkbox-group">--%>
<%--                        <label><input type="checkbox" name="features" value="garage"> Garage</label>--%>
<%--                        <label><input type="checkbox" name="features" value="pool"> Swimming Pool</label>--%>
<%--                        <label><input type="checkbox" name="features" value="garden"> Garden</label>--%>
<%--                        <label><input type="checkbox" name="features" value="ac"> Air Conditioning</label>--%>
<%--                        <label><input type="checkbox" name="features" value="fireplace"> Fireplace</label>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="filter-actions">--%>
<%--                    <button class="btn btn-secondary" id="clear-filters-btn">Clear Filters</button>--%>
<%--                    <button class="btn btn-primary" id="apply-filters-btn">Apply Filters</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <div class="sort-section">
            <span>Showing ${properties.size()} properties</span>
            <div class="sort-options">
                <label for="sort-by">Sort by:</label>
                <select id="sort-by">
                    <option value="newest">Newest</option>
                    <option value="price-low">Price (Low to High)</option>
                    <option value="price-high">Price (High to Low)</option>
                    <option value="beds">Beds (Most)</option>
                    <option value="baths">Baths (Most)</option>
                    <option value="area">Area (Largest)</option>
                </select>
            </div>
            <div class="view-options">
                <button class="view-btn active" data-view="grid">Grid</button>
                <button class="view-btn" data-view="list">List</button>
            </div>
        </div>

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



    <%--            <div class="property-card" id="property-1">--%>
<%--                <div class="property-image">--%>
<%--                    <img src="https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Modern House">--%>
<%--                </div>--%>
<%--                <div class="property-details">--%>
<%--                    <h3>Modern Family Home</h3>--%>
<%--                    <p class="price">$450,000</p>--%>
<%--                    <p class="location">123 Main St, Anytown</p>--%>
<%--                    <div class="property-features">--%>
<%--                        <span>4 Beds</span>--%>
<%--                        <span>3 Baths</span>--%>
<%--                        <span>2,200 sqft</span>--%>
<%--                    </div>--%>
<%--                    <a href="property-detail.jsp?id=1" class="btn btn-secondary">View Details</a>--%>
<%--                </div>--%>
<%--            </div>--%>

        </div>

<%--        <div class="pagination">--%>
<%--            <button class="pagination-btn active">1</button>--%>
<%--            <button class="pagination-btn">2</button>--%>
<%--            <button class="pagination-btn">3</button>--%>
<%--            <button class="pagination-btn">Next</button>--%>
<%--        </div>--%>
    </div>
</section>

<%@ include file="../components/footer.jsp" %>

<script src="../js/main.js"></script>
</body>
</html>