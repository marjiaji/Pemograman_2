package com.unpam.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Koneksi {
    private Connection connection;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/db_pertemuan15",
                    "root",
                    ""
            );

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Koneksi gagal: " + ex.getMessage());
        }

        return connection;
    }
}