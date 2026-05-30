package com.unpam.koneksi;

import java.sql.Connection;
import java.sql.DriverManager;

public class Koneksi {

    private static Connection conn;

    public static Connection getConnection() {

        try {

            if (conn == null || conn.isClosed()) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/db_pertemuan16",
                        "root",
                        ""
                );

                System.out.println("Koneksi Berhasil");
            }

        } catch (Exception e) {

            System.out.println("Koneksi Gagal : " + e.getMessage());

        }

        return conn;
    }
}