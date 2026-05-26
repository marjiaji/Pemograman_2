package com.unpam.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MataKuliah {

    private String kodeMataKuliah, namaMataKuliah;
    private int jumlahSks;
    private String pesan;

    private final Koneksi koneksi = new Koneksi();

    public String getPesan() {
        return pesan;
    }

    public void setKodeMataKuliah(String kodeMataKuliah) {
        this.kodeMataKuliah = kodeMataKuliah;
    }

    public void setNamaMataKuliah(String namaMataKuliah) {
        this.namaMataKuliah = namaMataKuliah;
    }

    public void setJumlahSks(int jumlahSks) {
        this.jumlahSks = jumlahSks;
    }

    public boolean simpan() {

        boolean berhasil = false;

        Connection connection = koneksi.getConnection();

        if (connection != null) {

            String sql = "INSERT INTO tbmatakuliah(kodeMataKuliah,namaMataKuliah,jumlahSks) VALUES (?,?,?)";

            try {

                PreparedStatement ps = connection.prepareStatement(sql);

                ps.setString(1, kodeMataKuliah);
                ps.setString(2, namaMataKuliah);
                ps.setInt(3, jumlahSks);

                int hasil = ps.executeUpdate();

                if (hasil > 0) {
                    berhasil = true;
                    pesan = "Data mata kuliah berhasil disimpan";
                } else {
                    pesan = "Data mata kuliah gagal disimpan";
                }

                ps.close();
                connection.close();

            } catch (SQLException ex) {

                pesan = "Error simpan data\n" + ex;
            }

        } else {

            pesan = "Koneksi gagal\n" + koneksi.getPesanKesalahan();
        }

        return berhasil;
    }
}