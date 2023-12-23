package com.MyEducationBlog.helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class ConnectionProvider {
     private static Connection cn = null;

    public static Connection getConnection() {
        try {
            if (cn == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyEducationBlog", "root", "1234");
                return cn;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cn;

    }
}
