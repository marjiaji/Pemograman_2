<!DOCTYPE html>
<html>
<head>
    <title>Aplikasi Rent Car</title>
    <style>
        body {
            font-family: Arial;
            background: #f4f6f9;
            margin: 0;
        }

        .header {
            background: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .menu {
            width: 250px;
            background: #34495e;
            height: 100vh;
            float: left;
            padding-top: 20px;
        }

        .menu a {
            display: block;
            color: white;
            padding: 15px;
            text-decoration: none;
        }

        .menu a:hover {
            background: #1abc9c;
        }

        .content {
            margin-left: 270px;
            padding: 30px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<div class="header">
    <h1>Aplikasi Penyewaan Mobil / Rent Car</h1>
</div>

<div class="menu">
    <a href="mobil.jsp">Data Mobil</a>
    <a href="customer.jsp">Data Customer</a>
    <a href="transaksi.jsp">Transaksi Penyewaan</a>
    <a href="pengembalian.jsp">Pengembalian Mobil</a>
    <a href="laporan.jsp">Laporan Transaksi</a>
</div>

<div class="content">
    <div class="card">
        <h2>Selamat Datang</h2>
        <p>Aplikasi ini digunakan untuk mengelola data mobil, customer, transaksi penyewaan, pengembalian, dan laporan rent car.</p>
    </div>
</div>

</body>
</html>