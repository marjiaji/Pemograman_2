package com.unpam.model;

import java.sql.*;
import javax.swing.table.DefaultTableModel;

public class Nilai {

    private String nim;
    private String kodeMataKuliah;
    private double nilaiTugas;
    private double nilaiUTS;
    private double nilaiUAS;
    private double nilaiAkhir;

    Koneksi koneksi = new Koneksi();

    public void setNim(String nim) {
        this.nim = nim;
    }

    public void setKodeMataKuliah(String kodeMataKuliah) {
        this.kodeMataKuliah = kodeMataKuliah;
    }

    public void setNilaiTugas(double nilaiTugas) {
        this.nilaiTugas = nilaiTugas;
    }

    public void setNilaiUTS(double nilaiUTS) {
        this.nilaiUTS = nilaiUTS;
    }

    public void setNilaiUAS(double nilaiUAS) {
        this.nilaiUAS = nilaiUAS;
    }

    public double hitungNilaiAkhir() {
        nilaiAkhir = (nilaiTugas * 0.3) +
                      (nilaiUTS * 0.3) +
                      (nilaiUAS * 0.4);

        return nilaiAkhir;
    }

    public boolean simpan() {

        boolean berhasil = false;

        try {

            Connection conn = koneksi.getConnection();

            String sql = "INSERT INTO nilai VALUES(?,?,?,?,?,?)";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, nim);
            ps.setString(2, kodeMataKuliah);
            ps.setDouble(3, nilaiTugas);
            ps.setDouble(4, nilaiUTS);
            ps.setDouble(5, nilaiUAS);
            ps.setDouble(6, hitungNilaiAkhir());

            ps.executeUpdate();

            berhasil = true;

        } catch (Exception e) {
            System.out.println(e);
        }

        return berhasil;
    }

    public DefaultTableModel tampilData() {

        String[] kolom = {
            "NIM",
            "Kode MK",
            "Tugas",
            "UTS",
            "UAS",
            "Nilai Akhir"
        };

        DefaultTableModel model =
                new DefaultTableModel(null, kolom);

        try {

            Connection conn =
                    koneksi.getConnection();

            Statement st =
                    conn.createStatement();

            ResultSet rs =
                    st.executeQuery("SELECT * FROM nilai");

            while (rs.next()) {

                String nim = rs.getString("nim");
                String kode =
                        rs.getString("kode_mata_kuliah");

                String tugas =
                        rs.getString("nilai_tugas");

                String uts =
                        rs.getString("nilai_uts");

                String uas =
                        rs.getString("nilai_uas");

                String akhir =
                        rs.getString("nilai_akhir");

                String[] data = {
                    nim,
                    kode,
                    tugas,
                    uts,
                    uas,
                    akhir
                };

                model.addRow(data);
            }

        } catch (Exception e) {
            System.out.println(e);
        }

        return model;
    }
}