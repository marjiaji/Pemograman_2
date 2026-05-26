package com.unpam.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Mahasiswa {

    private String nim, nama, kelas, password;
    private int semester;
    private String pesan;

    private final Koneksi koneksi = new Koneksi();

    public String getPesan() {
        return pesan;
    }

    public void setNim(String nim) {
        this.nim = nim;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public void setKelas(String kelas) {
        this.kelas = kelas;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean simpan() {

        boolean berhasil = false;

        Connection connection = koneksi.getConnection();

        if (connection != null) {

            String sql = "INSERT INTO tbmahasiswa(nim,nama,semester,kelas,password) VALUES (?,?,?,?,?)";

            try {

                PreparedStatement ps = connection.prepareStatement(sql);

                ps.setString(1, nim);
                ps.setString(2, nama);
                ps.setInt(3, semester);
                ps.setString(4, kelas);
                ps.setString(5, password);

                int hasil = ps.executeUpdate();

                if (hasil > 0) {
                    berhasil = true;
                    pesan = "Data mahasiswa berhasil disimpan";
                } else {
                    pesan = "Data mahasiswa gagal disimpan";
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