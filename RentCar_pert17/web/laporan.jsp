<%@page import="java.sql.*"%>
<%@page import="Koneksi.Koneksi"%>
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
    <title>Laporan Transaksi</title>

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
        }

        .brand h2 {
            font-size: 25px;
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
            border-left: 5px solid #4da3ff;
        }

        .menu a.logout {
            margin-top: 25px;
            background: #b83232;
            color: white;
            border-left: 5px solid #b83232;
        }

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

        .summary-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
            margin-bottom: 25px;
        }

        .summary-card {
            background: white;
            padding: 24px;
            border-radius: 16px;
            box-shadow: 0 8px 22px rgba(0,0,0,0.07);
        }

        .summary-card h3 {
            color: #6b7280;
            font-size: 15px;
            margin-bottom: 8px;
        }

        .summary-card h2 {
            color: #1f3349;
            font-size: 28px;
        }

        .card {
            background: white;
            padding: 28px;
            border-radius: 16px;
            box-shadow: 0 8px 22px rgba(0,0,0,0.07);
        }

        .card-header {
            margin-bottom: 22px;
        }

        .card-header h2 {
            color: #1f3349;
            font-size: 25px;
            margin-bottom: 8px;
        }

        .card-header p {
            color: #6b7280;
            font-size: 14px;
        }

        .btn-print {
            display: inline-block;
            margin-top: 12px;
            background: #1f3349;
            color: white;
            padding: 10px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
        }

        th {
            background: #1f3349;
            color: white;
            padding: 14px;
            text-align: left;
            font-size: 14px;
        }

        td {
            padding: 13px 14px;
            border-bottom: 1px solid #e5e7eb;
            font-size: 14px;
        }

        tr:hover {
            background: #f1f7ff;
        }

        .error-box {
            background: #fee2e2;
            color: #991b1b;
            padding: 15px;
            border-radius: 10px;
        }

        @media print {
            .sidebar, .topbar, .btn-print {
                display: none;
            }

            .main-content {
                margin-left: 0;
            }

            body {
                background: white;
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
        <a href="index.jsp"><span class="icon">🏠</span><span>Dashboard</span></a>
        <a href="mobil.jsp"><span class="icon">🚘</span><span>Data Mobil</span></a>
        <a href="customer.jsp"><span class="icon">👤</span><span>Data Customer</span></a>
        <a href="transaksi.jsp"><span class="icon">📝</span><span>Transaksi Penyewaan</span></a>
        <a href="pengembali.jsp"><span class="icon">↩</span><span>Pengembalian Mobil</span></a>
        <a href="laporan.jsp" class="active"><span class="icon">📊</span><span>Laporan Transaksi</span></a>
        <a href="logout.jsp" class="logout"><span class="icon">⏻</span><span>Logout</span></a>
    </div>
</div>

<div class="main-content">

    <div class="topbar">
        <h1>Laporan Transaksi</h1>
        <div class="user-info">
            Login sebagai: <b><%= session.getAttribute("username") %></b>
        </div>
    </div>

    <div class="content">

        <%
            Connection conn = Koneksi.getConnection();

            if (conn == null) {
        %>
            <div class="error-box">Koneksi database gagal. Pastikan MySQL dan database db_rentcar aktif.</div>
        <%
            } else {
                Statement stCount = conn.createStatement();

                int totalMobil = 0;
                int totalCustomer = 0;
                int totalTransaksi = 0;

                ResultSet r1 = stCount.executeQuery("SELECT COUNT(*) FROM mobil");
                if (r1.next()) totalMobil = r1.getInt(1);

                ResultSet r2 = stCount.executeQuery("SELECT COUNT(*) FROM customer");
                if (r2.next()) totalCustomer = r2.getInt(1);

                ResultSet r3 = stCount.executeQuery("SELECT COUNT(*) FROM transaksi");
                if (r3.next()) totalTransaksi = r3.getInt(1);
        %>

        <div class="summary-grid">
            <div class="summary-card">
                <h3>Total Mobil</h3>
                <h2><%= totalMobil %></h2>
            </div>

            <div class="summary-card">
                <h3>Total Customer</h3>
                <h2><%= totalCustomer %></h2>
            </div>

            <div class="summary-card">
                <h3>Total Transaksi</h3>
                <h2><%= totalTransaksi %></h2>
            </div>
        </div>

        <div class="card">

            <div class="card-header">
                <h2>Laporan Data Transaksi</h2>
                <p>Laporan ini berisi data transaksi penyewaan mobil pada aplikasi rent car.</p>
                <a onclick="window.print()" class="btn-print">Cetak Laporan</a>
            </div>

            <%
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM transaksi");
                ResultSetMetaData meta = rs.getMetaData();
                int jumlahKolom = meta.getColumnCount();
            %>

            <table>
                <tr>
                    <th>No</th>
                    <%
                        for (int i = 1; i <= jumlahKolom; i++) {
                    %>
                        <th><%= meta.getColumnName(i) %></th>
                    <%
                        }
                    %>
                </tr>

                <%
                    int no = 1;
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= no++ %></td>
                    <%
                        for (int i = 1; i <= jumlahKolom; i++) {
                    %>
                        <td><%= rs.getString(i) %></td>
                    <%
                        }
                    %>
                </tr>
                <%
                    }

                    rs.close();
                    st.close();
                    stCount.close();
                    conn.close();
                }
                %>
            </table>

        </div>

    </div>

</div>

</body>
</html>