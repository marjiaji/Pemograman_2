<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aplikasi Rent Car</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #1f2937;
        }

        /* SIDEBAR */
        .sidebar {
            width: 260px;
            height: 100vh;
            background: #1f3349;
            position: fixed;
            top: 0;
            left: 0;
            color: white;
            box-shadow: 4px 0 15px rgba(0,0,0,0.15);
        }

        .brand {
            padding: 28px 20px;
            text-align: center;
            background: #172638;
            border-bottom: 1px solid rgba(255,255,255,0.12);
        }

        .brand .logo {
            width: 58px;
            height: 58px;
            margin: 0 auto 12px;
            border-radius: 15px;
            background: linear-gradient(135deg, #4da3ff, #7dd3fc);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            box-shadow: 0 8px 18px rgba(77,163,255,0.35);
        }

        .brand h2 {
            font-size: 25px;
            letter-spacing: 0.5px;
        }

        .brand p {
            font-size: 13px;
            margin-top: 6px;
            color: #cbd5e1;
        }

        .menu {
            padding-top: 18px;
        }

        .menu a {
            display: flex;
            align-items: center;
            gap: 13px;
            padding: 15px 22px;
            color: #e5e7eb;
            text-decoration: none;
            font-size: 15px;
            transition: 0.25s;
            border-left: 5px solid transparent;
        }

        .menu a .icon {
            width: 25px;
            height: 25px;
            border-radius: 7px;
            background: rgba(255,255,255,0.12);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
        }

        .menu a:hover,
        .menu a.active {
            background: #172638;
            color: #ffffff;
            border-left: 5px solid #4da3ff;
        }

        .menu a:hover .icon,
        .menu a.active .icon {
            background: #4da3ff;
            color: white;
        }

        .menu a.logout {
            margin-top: 25px;
            background: #b83232;
            color: white;
            border-left: 5px solid #b83232;
        }

        .menu a.logout:hover {
            background: #991f1f;
            border-left: 5px solid #ffb4b4;
        }

        .menu a.logout .icon {
            background: rgba(255,255,255,0.18);
        }

        /* MAIN */
        .main-content {
            margin-left: 260px;
            min-height: 100vh;
        }

        .topbar {
            background: white;
            padding: 22px 35px;
            border-bottom: 1px solid #e5e7eb;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .topbar h1 {
            font-size: 27px;
            color: #1f3349;
            font-weight: 700;
        }

        .user-info {
            background: #eef6ff;
            color: #1f3349;
            padding: 10px 16px;
            border-radius: 9px;
            font-size: 14px;
            border: 1px solid #d8ecff;
        }

        .content {
            padding: 35px;
        }

        .welcome-card {
            background: white;
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 8px 22px rgba(0,0,0,0.07);
            margin-bottom: 28px;
            border-left: 6px solid #4da3ff;
        }

        .welcome-card h2 {
            color: #1f3349;
            font-size: 27px;
            margin-bottom: 12px;
        }

        .welcome-card p {
            color: #4b5563;
            font-size: 15px;
            line-height: 1.8;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 22px;
        }

        .dashboard-card {
            background: white;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 8px 22px rgba(0,0,0,0.07);
            transition: 0.25s;
            cursor: pointer;
            border: 1px solid #eef2f7;
        }

        .dashboard-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 28px rgba(0,0,0,0.12);
            border-color: #cfe7ff;
        }

        .card-icon {
            width: 50px;
            height: 50px;
            background: #eef6ff;
            color: #1f3349;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
            margin-bottom: 15px;
        }

        .dashboard-card h3 {
            color: #1f3349;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .dashboard-card p {
            color: #5b6470;
            font-size: 14px;
            line-height: 1.6;
            min-height: 68px;
            margin-bottom: 18px;
        }

        .dashboard-card a {
            display: inline-block;
            text-decoration: none;
            background: #1f3349;
            color: white;
            padding: 10px 16px;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.25s;
        }

        .dashboard-card a:hover {
            background: #4da3ff;
        }

        .footer {
            text-align: center;
            padding: 25px;
            color: #6b7280;
            font-size: 13px;
        }

        @media screen and (max-width: 1100px) {
            .dashboard-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media screen and (max-width: 750px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }

            .main-content {
                margin-left: 0;
            }

            .topbar {
                flex-direction: column;
                gap: 14px;
                text-align: center;
            }

            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <div class="sidebar">
        <div class="brand">
            <div class="logo">🚗</div>
            <h2>Rent Car</h2>
            <p>Admin Panel</p>
        </div>

        <div class="menu">
            <a href="index.jsp" class="active">
                <span class="icon">🏠</span>
                <span>Dashboard</span>
            </a>

            <a href="mobil.jsp">
                <span class="icon">🚘</span>
                <span>Data Mobil</span>
            </a>

            <a href="customer.jsp">
                <span class="icon">👤</span>
                <span>Data Customer</span>
            </a>

            <a href="transaksi.jsp">
                <span class="icon">📝</span>
                <span>Transaksi Penyewaan</span>
            </a>

            <a href="pengembali.jsp">
                <span class="icon">↩</span>
                <span>Pengembalian Mobil</span>
            </a>

            <a href="laporan.jsp">
                <span class="icon">📊</span>
                <span>Laporan Transaksi</span>
            </a>

            <a href="logout.jsp" class="logout">
                <span class="icon">⏻</span>
                <span>Logout</span>
            </a>
        </div>
    </div>

    <div class="main-content">

        <div class="topbar">
            <h1>Aplikasi Penyewaan Mobil / Rent Car</h1>

            <div class="user-info">
                Login sebagai: <b><%= session.getAttribute("username") %></b>
            </div>
        </div>

        <div class="content">

            <div class="welcome-card">
                <h2>Selamat Datang</h2>
                <p>
                    Aplikasi ini digunakan untuk mengelola data mobil, data customer,
                    transaksi penyewaan, pengembalian mobil, serta laporan transaksi rent car.
                    Sistem ini membantu admin dalam mencatat dan memantau proses penyewaan mobil
                    secara lebih mudah, rapi, dan terstruktur.
                </p>
            </div>

            <div class="dashboard-grid">

                <div class="dashboard-card" onclick="location.href='mobil.jsp'">
                    <div class="card-icon">🚘</div>
                    <h3>Data Mobil</h3>
                    <p>
                        Mengelola data mobil yang tersedia, seperti merk, tipe,
                        nomor polisi, harga sewa, dan status mobil.
                    </p>
                    <a href="mobil.jsp">Kelola Data</a>
                </div>

                <div class="dashboard-card" onclick="location.href='customer.jsp'">
                    <div class="card-icon">👤</div>
                    <h3>Data Customer</h3>
                    <p>
                        Mengelola data pelanggan yang melakukan penyewaan mobil
                        pada aplikasi rent car.
                    </p>
                    <a href="customer.jsp">Kelola Data</a>
                </div>

                <div class="dashboard-card" onclick="location.href='transaksi.jsp'">
                    <div class="card-icon">📝</div>
                    <h3>Transaksi</h3>
                    <p>
                        Mencatat transaksi penyewaan mobil mulai dari tanggal sewa,
                        lama sewa, sampai total pembayaran.
                    </p>
                    <a href="transaksi.jsp">Kelola Transaksi</a>
                </div>

                <div class="dashboard-card" onclick="location.href='laporan.jsp'">
                    <div class="card-icon">📊</div>
                    <h3>Laporan</h3>
                    <p>
                        Menampilkan laporan transaksi penyewaan mobil untuk kebutuhan
                        pencatatan dan administrasi.
                    </p>
                    <a href="laporan.jsp">Lihat Laporan</a>
                </div>

            </div>

        </div>

        <div class="footer">
            Copyright © 2026 Aplikasi Rent Car
        </div>

    </div>

</body>
</html>