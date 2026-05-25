<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Input Nilai Mahasiswa</title>
    <style>
        body {
            margin: 0;
            font-family: "Times New Roman", serif;
            background: #ffffff;
        }

        .header {
            background: #e9e9e9;
            text-align: center;
            padding: 15px 0;
        }

        .header h2 {
            margin: 0;
            font-size: 24px;
        }

        .header h1 {
            margin: 0;
            font-size: 32px;
            letter-spacing: 1px;
        }

        .header p {
            margin: 0;
            font-weight: bold;
        }

        .container {
            display: flex;
            min-height: 410px;
        }

        .sidebar-area {
            width: 190px;
            background: #eaffea;
            padding-top: 20px;
        }

        .sidebar {
            width: 130px;
            margin: auto;
            background: linear-gradient(to right, #e0e0e0, #bfbfbf);
            border-radius: 8px;
            padding: 20px 0;
            box-shadow: 0 0 8px #ddd;
            text-align: center;
        }

        .menu-title {
            font-weight: bold;
            margin-top: 10px;
        }

        .menu-link {
            display: block;
            width: 85px;
            margin: 5px auto 15px;
            background: #d8ccff;
            color: #9b4ca0;
            text-decoration: underline;
            padding: 3px 0;
            border-left: 5px solid #4c8b2b;
            border-right: 5px solid #4c8b2b;
        }

        .content {
            flex: 1;
            padding-top: 15px;
            text-align: center;
        }

        .top-menu {
            width: 380px;
            margin: 0 auto 45px;
            padding: 8px 12px;
            border-radius: 8px;
            background: linear-gradient(#eeeeee, #bcbcbc);
            box-shadow: 0 3px 10px #ccc;
        }

        .top-menu a {
            margin: 0 12px;
            color: #666;
            text-decoration: none;
            font-size: 15px;
        }

        h2 {
            margin-bottom: 18px;
        }

        table {
            margin: auto;
            border-collapse: collapse;
        }

        td {
            padding: 2px 4px;
            font-size: 16px;
        }

        td:first-child {
            text-align: right;
        }

        input[type="text"],
        input[type="number"] {
            height: 18px;
            border: 1px solid #aaa;
        }

        .small {
            width: 45px;
        }

        .medium {
            width: 110px;
        }

        .long {
            width: 200px;
        }

        button {
            height: 23px;
            min-width: 40px;
            border: 1px solid #aaa;
            background: linear-gradient(#ffffff, #d0d0d0);
        }

        .btn-action {
            width: 90px;
            margin-top: 5px;
        }

        .footer {
            background: #eeeeff;
            text-align: center;
            font-size: 13px;
            padding: 5px 0;
            border-top: 1px solid #ddd;
        }
    </style>
</head>

<body>

    <div class="header">
        <h2>Informasi Nilai Mahasiswa</h2>
        <h1>UNIVERSITAS PAMULANG</h1>
        <p>Jl. Surya Kencana No. 1 Pamulang, Tangerang Selatan, Banten</p>
    </div>

    <div class="container">

        <div class="sidebar-area">
            <div class="sidebar">
                <div class="menu-title">Master Data</div>
                <a class="menu-link" href="#">Mahasiswa</a>
                <a class="menu-link" href="#">Mata Kuliah</a>

                <div class="menu-title">Transaksi</div>
                <a class="menu-link" href="#">Nilai</a>

                <div class="menu-title">Laporan</div>
                <a class="menu-link" href="#">Nilai</a>

                <a class="menu-link" href="#">Logout</a>
            </div>
        </div>

        <div class="content">
            <div class="top-menu">
                <a href="#">Home</a>
                <a href="#">Master Data</a>
                <a href="#">Transaksi</a>
                <a href="#">Laporan</a>
                <a href="#">Logout</a>
            </div>

            <h2>Input Nilai Mahasiswa</h2>

            <form action="NilaiController" method="post">
                <table>
                    <tr>
                        <td>NIM</td>
                        <td>
                            <input class="medium" type="text" name="nim">
                            <button type="button">Cari</button>
                            <button type="button">Lihat</button>
                        </td>
                    </tr>

                    <tr>
                        <td>Nama</td>
                        <td><input class="long" type="text" name="nama"></td>
                    </tr>

                    <tr>
                        <td>Semester</td>
                        <td><input class="small" type="text" name="semester"></td>
                    </tr>

                    <tr>
                        <td>Kelas</td>
                        <td><input class="small" type="text" name="kelas"></td>
                    </tr>

                    <tr>
                        <td>Kode Mata Kuliah</td>
                        <td>
                            <input class="medium" type="text" name="kode_mk">
                            <button type="button">Cari</button>
                            <button type="button">Lihat</button>
                        </td>
                    </tr>

                    <tr>
                        <td>Nama Mata Kuliah</td>
                        <td><input class="long" type="text" name="nama_mk"></td>
                    </tr>

                    <tr>
                        <td>Jumlah SKS</td>
                        <td><input class="small" type="number" name="sks"></td>
                    </tr>

                    <tr>
                        <td>Nilai Tugas</td>
                        <td><input class="small" type="number" name="tugas"></td>
                    </tr>

                    <tr>
                        <td>Nilai UTS</td>
                        <td><input class="small" type="number" name="uts"></td>
                    </tr>

                    <tr>
                        <td>Nilai UAS</td>
                        <td><input class="small" type="number" name="uas"></td>
                    </tr>

                    <tr>
                        <td></td>
                        <td>
                            <button class="btn-action" type="submit">Simpan</button>
                            <button class="btn-action" type="reset">Hapus</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>

    </div>

    <div class="footer">
        Copyright © 2014 Universitas Pamulang<br>
        Jl. Surya Kencana No. 1 Pamulang, Tangerang Selatan, Banten
    </div>

</body>
</html>