<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - HomeHaven</title>
    <link rel="stylesheet" href="../css/styles.css">
    <style>
        /* Internal CSS for Properties Tab */
        .properties-container {
            padding: 20px 0;
        }

        .properties-title {
            font-size: 24px;
            margin-bottom: 20px;
            color: #4e342e;
        }

        .properties-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .properties-table th {
            background-color: #6d4c41;
            color: white;
            text-align: left;
            padding: 15px;
            font-weight: 500;
        }

        .properties-table td {
            padding: 15px;
            border-bottom: 1px solid #e0e0e0;
            vertical-align: middle;
        }

        .properties-table tr:last-child td {
            border-bottom: none;
        }

        .properties-table tr:hover {
            background-color: #faf9f6;
        }

        .property-image {
            width: 200px;
            height: 120px;
            object-fit: cover;
            border-radius: 4px;
        }

        .property-name {
            font-weight: 600;
            margin-bottom: 5px;
            color: #212121;
        }

        .property-details {
            color: #757575;
            font-size: 14px;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            text-align: center;
        }

        .approved {
            background-color: #388e3c;
            color: white;
        }

        .pending {
            background-color: #f57c00;
            color: white;
        }

        .declined {
            background-color: #d84315;
            color: white;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .edit-btn {
            background-color: #8d6e63;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .edit-btn:hover {
            background-color: #6d4c41;
        }

        .delete-btn {
            background-color: #d84315;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .delete-btn:hover {
            background-color: #bf360c;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .modal-title {
            margin-top: 0;
            color: #4e342e;
        }

        .modal-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .cancel-btn {
            background-color: #e0e0e0;
            color: #212121;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .confirm-btn {
            background-color: #d84315;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
    </style>
</head>
<body>
<%@ include file="../components/navbar.jsp" %>

<section class="page-header">
    <div class="container">
        <h2>Admin Dashboard</h2>
    </div>
</section>

<section class="admin-panel">
    <div class="container">
        <div class="admin-tabs">
            <button class="tab-btn active" data-tab="pending">Pending Properties</button>
            <button class="tab-btn" data-tab="properties">All Properties</button>
            <button class="tab-btn" data-tab="users">User Management</button>
        </div>

        <div class="tab-content active" id="pending-tab">
            <h3>Pending Properties</h3>
            <div class="pending-properties">

                <c:if test="${not empty properties}">
                    <c:forEach var="item" items="${properties}">
                        <div class="property-card pending-card" id="pending-1">
                            <div class="property-image">
                                <img src="${item.imageUrls[0]}" alt="Suburban House">
                                <span class="status pending">${item.status}</span>
                            </div>

                            <div class="property-details">
                                <h3>Suburban Family House</h3>
                                <p class="price">$${item.price}</p>
                                <p class="location">${item.zipCode} ${item.address} - ${item.city}</p>
                                <div class="property-features">
                                    <span>${item.bedrooms} Beds</span>
                                    <span>${item.bathrooms} Baths</span>
                                    <span>${item.area} sqft</span>
                                </div>
                                <div class="admin-actions">
                                    <!-- Approve Form -->
                                    <form action="../approve" method="post" style="display:inline;">
                                        <input type="hidden" name="propertyId" value="${item.id}">
                                        <input type="hidden" name="action" value="approve">
                                        <button type="submit" class="btn btn-approve">Approve</button>
                                    </form>

                                    <!-- Decline Form -->
                                    <form action="../decline" method="post" style="display:inline;">
                                        <input type="hidden" name="propertyId" value="${item.id}">
                                        <input type="hidden" name="action" value="decline">
                                        <button type="submit" class="btn btn-decline">Decline</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${empty properties}">
                    <p>No property to approve</p>
                </c:if>

            </div>

        </div>

        <!-- New Properties Tab Content -->
        <div class="tab-content" id="properties-tab">
            <div class="properties-container">
                <h3 class="properties-title">All Properties</h3>

                <table class="properties-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Property</th>
                        <th>Price</th>
                        <th>Location</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="property" items="${activeProp}">
                        <tr>
                            <td>${property.id}</td>
                            <td>
                                <img src="${property.imageUrls[0]}" alt="Property" class="property-image">
                            </td>
                            <td>
                                <div class="property-name">${property.title}</div>
                                <div class="property-details">${property.bedrooms} Beds • ${property.bathrooms} Baths • ${property.area} sqft</div>
                            </td>
                            <td>$${property.price}</td>
                            <td>${property.city}, ${property.zipCode}</td>
                            <td>
                                <span class="status-badge ${property.status.toLowerCase()}">${property.status}</span>
                            </td>
                            <td>
                                <div class="action-buttons">
<%--                                    <a href="../property/edit?id=${property.id}" class="edit-btn">Edit</a>--%>
                                    <button class="delete-btn" onclick="confirmDelete(${property.id})">Delete</button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <!-- Sample data if allProperties is empty -->
                    <c:if test="${empty activeProp}">
                        <p>No property to show</p>
                    </c:if>
                    </tbody>
                </table>
            </div>

            <!-- Delete Confirmation Modal -->
            <div id="deleteModal" class="modal" style="display: none;">
                <div class="modal-content">
                    <h3 class="modal-title">Confirm Deletion</h3>
                    <p>Are you sure you want to delete this property? This action cannot be undone.</p>

                    <form action="../decline" method="post">
                        <input type="hidden" id="deletePropertyId" name="propertyId" value="${item.id}">
                        <div class="modal-actions">
                            <button type="button" class="cancel-btn" onclick="closeDeleteModal()">Cancel</button>
                            <button type="submit" class="confirm-btn">Delete Property</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="tab-content" id="users-tab">
            <h3>User Management</h3>


            <div class="user-list">
                <c:if test="${not empty allUsers}">
                    <c:forEach var="item" items="${allUsers}">
                        <div class="user-card">
                            <div class="user-info">
                                <h4>Full Name : ${item.getFullName()}</h4>
                                <p>Email : ${item.email}</p>
                                <p>Phone : ${item.phoneNumber}</p>
                                <p>Role : ${item.isAdmin() ? "Admin" : "Client"}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

        </div>
</section>

<%@ include file="../components/footer.jsp" %>

<script src="../js/main.js"></script>
<script>
    // JavaScript for delete confirmation modal
    function confirmDelete(propertyId) {
        document.getElementById('deletePropertyId').value = propertyId;
        document.getElementById('deleteModal').style.display = 'block';
    }

    function closeDeleteModal() {
        document.getElementById('deleteModal').style.display = 'none';
    }

    // Close modal when clicking outside of it
    window.onclick = function(event) {
        const modal = document.getElementById('deleteModal');
        if (event.target == modal) {
            closeDeleteModal();
        }
    }
</script>
</body>
</html>