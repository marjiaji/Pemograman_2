package Koneksi;

import java.sql.Connection;
import java.sql.DriverManager;

public class Koneksi {

    public static Connection getConnection() {
        Connection conn = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/db_rentcar";
            String user = "root";
            String pass = "";

            conn = DriverManager.getConnection(url, user, pass);
            System.out.println("Koneksi database berhasil");

        } catch (Exception e) {
            System.out.println("Koneksi database gagal: " + e.getMessage());
        }

        return conn;
    }
}