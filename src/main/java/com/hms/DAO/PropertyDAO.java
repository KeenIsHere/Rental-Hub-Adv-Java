package com.hms.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.hms.database.DBConnection;
import com.hms.models.Property;

public class PropertyDAO {
    public void postProperty(Property p) {
        int generatedId = -1;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO property (title, property_type, price, area, bedrooms, bathrooms, " +
                    "address, city, state, zip_code, description, has_garage, has_swimming_pool, " +
                    "has_garden, has_air_conditioning, has_fireplace, contact_name, contact_email, " +
                    "contact_phone, status, user_id, image_urls) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            System.out.println("Preparing SQL: " + sql);

            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, p.getTitle());
            ps.setString(2, p.getPropertyType());
            ps.setDouble(3, p.getPrice());
            ps.setDouble(4, p.getArea());
            ps.setInt(5, p.getBedrooms());
            ps.setInt(6, p.getBathrooms());
            ps.setString(7, p.getAddress());
            ps.setString(8, p.getCity());
            ps.setString(9, p.getState());
            ps.setString(10, p.getZipCode());
            ps.setString(11, p.getDescription());
            ps.setBoolean(12, p.hasGarage());
            ps.setBoolean(13, p.hasSwimmingPool());
            ps.setBoolean(14, p.hasGarden());
            ps.setBoolean(15, p.hasAirConditioning());
            ps.setBoolean(16, p.hasFireplace());
            ps.setString(17, p.getContactName());
            ps.setString(18, p.getContactEmail());
            ps.setString(19, p.getContactPhone());
            ps.setString(20, p.getStatus());
            ps.setInt(21, p.getUserId());
            ps.setString(22, p.getImageUrls() != null && !p.getImageUrls().isEmpty()
                    ? String.join(",", p.getImageUrls())
                    : null);

            System.out.println("Executing insert statement...");
            int affectedRows = ps.executeUpdate();

            System.out.println("Insert affected rows: " + affectedRows);

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
                System.out.println("Generated property ID: " + generatedId);


            } else {
                System.out.println("No ID generated for the property.");
            }
        } catch (Exception e) {
            System.err.println("Error while inserting property: " + e.getMessage());
            e.printStackTrace();
        }
    }


    private void savePropertyImages(int propertyId, List<String> imageUrls, Connection con) throws SQLException {
        String sql = "INSERT INTO property_images (property_id, image_url) VALUES (?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);

        for (String imageUrl : imageUrls) {
            ps.setInt(1, propertyId);
            ps.setString(2, imageUrl);
            ps.addBatch();
        }

        ps.executeBatch();
    }

    public ArrayList<Property> getApprovedProperties(String status) {
        ArrayList<Property> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            // Use a parameterized query to avoid SQL syntax issues and injection risks
            String sql = "SELECT * FROM property WHERE status = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status); // Set the status (e.g., "active", "inactive")

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Property p = extractPropertyFromResultSet(rs);
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace(); // In production, use a logger instead
        }
        return list;
    }


    public List<Property> getPropertiesByUserId(int userId) {
        List<Property> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT p.*, GROUP_CONCAT(pi.image_url) as image_urls FROM properties p " +
                    "LEFT JOIN property_images pi ON p.id = pi.property_id " +
                    "WHERE p.user_id = ? " +
                    "GROUP BY p.id";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Property p = extractPropertyFromResultSet(rs);
                list.add(p);
            }
        } catch (Exception ignored) {
        }
        return list;
    }

    public Property getPropertyById(int propertyId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "select * from property where property_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, propertyId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return extractPropertyFromResultSet(rs);
            }
        } catch (Exception ignored) {
        }
        return null;
    }

    public void updateStatus(int propertyId, String status) {

        try (Connection con = DBConnection.getConnection()) {
            String query = "UPDATE property SET status=? WHERE property_id=?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, propertyId);

            int rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void updateProperty(Property p) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE properties SET title=?, property_type=?, price=?, area=?, bedrooms=?, " +
                    "bathrooms=?, address=?, city=?, state=?, zip_code=?, description=?, " +
                    "has_garage=?, has_swimming_pool=?, has_garden=?, has_air_conditioning=?, " +
                    "has_fireplace=?, contact_name=?, contact_email=?, contact_phone=?, status=? " +
                    "WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, p.getTitle());
            ps.setString(2, p.getPropertyType());
            ps.setDouble(3, p.getPrice());
            ps.setDouble(4, p.getArea());
            ps.setInt(5, p.getBedrooms());
            ps.setInt(6, p.getBathrooms());
            ps.setString(7, p.getAddress());
            ps.setString(8, p.getCity());
            ps.setString(9, p.getState());
            ps.setString(10, p.getZipCode());
            ps.setString(11, p.getDescription());
            ps.setBoolean(12, p.hasGarage());
            ps.setBoolean(13, p.hasSwimmingPool());
            ps.setBoolean(14, p.hasGarden());
            ps.setBoolean(15, p.hasAirConditioning());
            ps.setBoolean(16, p.hasFireplace());
            ps.setString(17, p.getContactName());
            ps.setString(18, p.getContactEmail());
            ps.setString(19, p.getContactPhone());
            ps.setString(20, p.getStatus());
            ps.setInt(21, p.getId());

            ps.executeUpdate();

            if (p.getImageUrls() != null) {
                PreparedStatement psDelete = con.prepareStatement("DELETE FROM property_images WHERE property_id=?");
                psDelete.setInt(1, p.getId());
                psDelete.executeUpdate();

                savePropertyImages(p.getId(), p.getImageUrls(), con);
            }
        } catch (Exception ignored) {
        }
    }

    public boolean deleteProperty(int propertyId) {
        try (Connection con = DBConnection.getConnection()) {

            String deletePropertySql = "DELETE FROM property WHERE property_id = ?";
            PreparedStatement psProperty = con.prepareStatement(deletePropertySql);
            psProperty.setInt(1, propertyId);
            int rowsAffected = psProperty.executeUpdate();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public int getTotalApproved() {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM properties WHERE status='approved'");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
				return rs.getInt(1);
			}
        } catch (Exception ignored) {
        }
        return 0;
    }

    public int getTotalPending() {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM properties WHERE status='pending'");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
				return rs.getInt(1);
			}
        } catch (Exception ignored) {
        }
        return 0;
    }

    public List<Property> searchProperties(String keyword, String propertyType, Double minPrice, Double maxPrice,
                                           Integer minBedrooms, Integer maxBedrooms, String city, String state) {
        List<Property> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            StringBuilder sql = new StringBuilder(
                    "SELECT p.*, GROUP_CONCAT(pi.image_url) as image_urls FROM properties p " +
                            "LEFT JOIN property_images pi ON p.id = pi.property_id " +
                            "WHERE p.status='approved' "
            );

            List<Object> params = new ArrayList<>();

            if (keyword != null && !keyword.trim().isEmpty()) {
                sql.append("AND (p.title LIKE ? OR p.description LIKE ?) ");
                String wildcardKeyword = "%" + keyword + "%";
                params.add(wildcardKeyword);
                params.add(wildcardKeyword);
            }

            if (propertyType != null && !propertyType.trim().isEmpty()) {
                sql.append("AND p.property_type = ? ");
                params.add(propertyType);
            }

            if (minPrice != null) {
                sql.append("AND p.price >= ? ");
                params.add(minPrice);
            }

            if (maxPrice != null) {
                sql.append("AND p.price <= ? ");
                params.add(maxPrice);
            }

            if (minBedrooms != null) {
                sql.append("AND p.bedrooms >= ? ");
                params.add(minBedrooms);
            }

            if (maxBedrooms != null) {
                sql.append("AND p.bedrooms <= ? ");
                params.add(maxBedrooms);
            }

            if (city != null && !city.trim().isEmpty()) {
                sql.append("AND p.city = ? ");
                params.add(city);
            }

            if (state != null && !state.trim().isEmpty()) {
                sql.append("AND p.state = ? ");
                params.add(state);
            }

            sql.append("GROUP BY p.id");

            PreparedStatement ps = con.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Property p = extractPropertyFromResultSet(rs);
                list.add(p);
            }
        } catch (Exception ignored) {
        }
        return list;
    }

    private Property extractPropertyFromResultSet(ResultSet rs) throws SQLException {
        Property p = new Property();
        p.setId(rs.getInt("property_id"));
        p.setTitle(rs.getString("title"));
        p.setPropertyType(rs.getString("property_type"));
        p.setPrice(rs.getDouble("price"));
        p.setArea(rs.getDouble("area"));
        p.setBedrooms(rs.getInt("bedrooms"));
        p.setBathrooms(rs.getInt("bathrooms"));
        p.setAddress(rs.getString("address"));
        p.setCity(rs.getString("city"));
        p.setState(rs.getString("state"));
        p.setZipCode(rs.getString("zip_code"));
        p.setDescription(rs.getString("description"));
        p.setHasGarage(rs.getBoolean("has_garage"));
        p.setHasSwimmingPool(rs.getBoolean("has_swimming_pool"));
        p.setHasGarden(rs.getBoolean("has_garden"));
        p.setHasAirConditioning(rs.getBoolean("has_air_conditioning"));
        p.setHasFireplace(rs.getBoolean("has_fireplace"));
        p.setContactName(rs.getString("contact_name"));
        p.setContactEmail(rs.getString("contact_email"));
        p.setContactPhone(rs.getString("contact_phone"));
        p.setStatus(rs.getString("status"));
        p.setUserId(rs.getInt("user_id"));

        String imageUrls = rs.getString("image_urls");
        if (imageUrls != null && !imageUrls.isEmpty()) {
            p.setImageUrls(Arrays.asList(imageUrls.split(",")));
        } else {
            p.setImageUrls(new ArrayList<>());
        }

        return p;
    }
}
