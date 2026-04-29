package pemograman2;

import java.sql.Connection;
import java.sql.DriverManager;

public class Koneksi {

    Connection con;

    public Connection getKoneksi() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost/db_nilai",
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