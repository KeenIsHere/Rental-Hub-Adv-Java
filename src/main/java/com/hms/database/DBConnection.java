package com.hms.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private final static String databaseName = "coursework";
    private final static String username = "root";
    private final static String password = "";
    private final static String jdbcURL = "jdbc:mysql://localhost:3306/" + databaseName;

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, username, password);
    }

//    public static void main(String[] args) {
//        try (Connection connection = getConnection()) {
//            if (connection != null && !connection.isClosed()) {
//                System.out.println("✅ Connection successful");
//            } else {
//                System.out.println("❌ Connection failed");
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            System.out.println("❌ Error connecting to database: " + e.getMessage());
//            e.printStackTrace();
//        }
//    }
}
