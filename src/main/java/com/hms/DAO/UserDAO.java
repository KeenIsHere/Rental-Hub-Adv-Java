package com.hms.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hms.database.DBConnection;
import com.hms.models.User;
import com.hms.utils.PasswordUtils;

public class UserDAO {

    public User login(String email, String password) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password");

                // Verify the password using PasswordUtils
                if (PasswordUtils.checkPassword(password, hashedPassword)) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("first_name"),
                            rs.getString("last_name"),
                            rs.getString("email"),
                            rs.getString("phone_number"),
                            hashedPassword,
                            rs.getBoolean("is_admin")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    private String lastError;

    public String getLastError() {
        return lastError;
    }

    public boolean register(User user) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO users (first_name, last_name, email, phone_number, password, is_admin) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getPassword());
            ps.setBoolean(6, user.isAdmin());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            if (e instanceof java.sql.SQLIntegrityConstraintViolationException) {
                lastError = "User with given email already exists";
            } else {
                lastError = "Database error: " + e.getMessage();
            }
            e.printStackTrace(); // Debug line
            return false;
        } catch (ClassNotFoundException e) {
            lastError = "Database driver not found: " + e.getMessage();
            e.printStackTrace(); // Debug line
            return false;
        }
    }


    public ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("password"),
                        rs.getBoolean("is_admin")
                );
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public int getTotalUsers() {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM users");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
				return rs.getInt(1);
			}
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public void updatePassword(int userId, String newPassword) {
        try (Connection con = DBConnection.getConnection()) {
            String hashedPassword = PasswordUtils.hashPassword(newPassword);

            PreparedStatement ps = con.prepareStatement("UPDATE users SET password=? WHERE id=?");
            ps.setString(1, hashedPassword);
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateUserProfile(User user) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE users SET first_name=?, last_name=?, email=?, phone_number=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setInt(5, user.getId());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void blockUser(int userId) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("UPDATE users SET is_blocked=1 WHERE id=?");
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void unblockUser(int userId) {
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("UPDATE users SET is_blocked=0 WHERE id=?");
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public User getUserById(int userId) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("phone_number"),
                        rs.getString("password"),
                        rs.getBoolean("is_admin")
                );
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
}