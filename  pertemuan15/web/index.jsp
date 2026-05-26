<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Informasi Nilai Mahasiswa</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="header">
    <h2>Informasi Nilai Mahasiswa</h2>
    <h1>UNIVERSITAS PAMULANG</h1>
    <h4>Jl. Surya Kencana No. 1 Pamulang, Tangerang Selatan, Banten</h4>
</div>

<div class="layout">

    <div class="sidebar">
        <h3>Master Data</h3>
        <a href="#">Mahasiswa</a>
        <a href="#">Mata Kuliah</a>

        <h3>Transaksi</h3>
        <a href="index.jsp?page=nilai">Nilai</a>

        <h3>Laporan</h3>
        <a href="#">Nilai</a>

        <a href="#">Logout</a>
    </div>

    <div class="content">

        <div class="topmenu">
            <a href="index.jsp">Home</a>
            <a href="#">Master Data</a>
            <a href="index.jsp?page=nilai">Transaksi</a>
            <a href="#">Laporan</a>
            <a href="#">Logout</a>
        </div>

        <h2 class="judul-form">Input Nilai Mahasiswa</h2>

        <form action="NilaiController" method="post" class="form-nilai">

            <div class="row">
                <label>NIM</label>
                <input type="text" name="nim" class="input-small">
                <button type="button">Cari</button>
                <button type="button">Lihat</button>
            </div>

            <div class="row">
                <label>Nama</label>
                <input type="text" name="nama" class="input-long">
            </div>

            <div class="row">
                <label>Semester</label>
                <input type="text" name="semester" class="input-mini">
            </div>

            <div class="row">
                <label>Kelas</label>
                <input type="text" name="kelas" class="input-mini">
            </div>

            <div class="row">
                <label>Kode Mata Kuliah</label>
                <input type="text" name="kode_mata_kuliah" class="input-small">
                <button type="button">Cari</button>
                <button type="button">Lihat</button>
            </div>

            <div class="row">
                <label>Nama Mata Kuliah</label>
                <input type="text" name="nama_mata_kuliah" class="input-long">
            </div>

            <div class="row">
                <label>Jumlah SKS</label>
                <input type="text" name="sks" class="input-mini">
            </div>

            <div class="row">
                <label>Nilai Tugas</label>
                <input type="number" name="nilai_tugas" class="input-nilai" required>
            </div>

            <div class="row">
                <label>Nilai UTS</label>
                <input type="number" name="nilai_uts" class="input-nilai" required>
            </div>

            <div class="row">
                <label>Nilai UAS</label>
                <input type="number" name="nilai_uas" class="input-nilai" required>
            </div>

            <div class="row tombol">
                <button type="submit">Simpan</button>
                <button type="reset">Hapus</button>
            </div>

        </form>
    </div>
</div>

</body>
</html>