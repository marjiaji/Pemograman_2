package aplikasipenjualan;

import java.sql.Connection;
import java.sql.DriverManager;

public class Koneksi {
    Connection con;

    public Connection getKoneksi() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/db_penjualan",
                "root",
                ""
            );

            System.out.println("Koneksi Berhasil");

        } catch (Exception e) {
            System.out.println(e);
        }

        return con;
    }
}