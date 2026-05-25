package com.unpam.model;

public class Nilai {
    private String nim;
    private String nama;
    private double tugas;
    private double uts;
    private double uas;
    private double nilaiAkhir;
    private String grade;

    public Nilai(String nim, String nama, double tugas, double uts, double uas) {
        this.nim = nim;
        this.nama = nama;
        this.tugas = tugas;
        this.uts = uts;
        this.uas = uas;
        hitungNilai();
    }

    private void hitungNilai() {
        nilaiAkhir = (tugas * 0.30) + (uts * 0.30) + (uas * 0.40);

        if (nilaiAkhir >= 80) {
            grade = "A";
        } else if (nilaiAkhir >= 70) {
            grade = "B";
        } else if (nilaiAkhir >= 60) {
            grade = "C";
        } else if (nilaiAkhir >= 50) {
            grade = "D";
        } else {
            grade = "E";
        }
    }

    public String getNim() {
        return nim;
    }

    public String getNama() {
        return nama;
    }

    public double getTugas() {
        return tugas;
    }

    public double getUts() {
        return uts;
    }

    public double getUas() {
        return uas;
    }

    public double getNilaiAkhir() {
        return nilaiAkhir;
    }

    public String getGrade() {
        return grade;
    }
}