package com.hms.utils;
import org.mindrot.jbcrypt.BCrypt;
public class PasswordUtils {
    // Method to hash a password
    public static String hashPassword(String plainPassword) {
        // The number of rounds for bcrypt strength
        int workload = 12;
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(workload));
    }

    // Method to verify if a plain password matches the hashed password
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }

}