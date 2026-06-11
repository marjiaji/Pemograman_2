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
    <title>Tambah Mobil</title>

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            margin: 0;
            background: #f4f7fb;
            color: #1f2937;
        }

        .wrapper {
            width: 100%;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-card {
            width: 620px;
            background: white;
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 8px 22px rgba(0,0,0,0.08);
        }

        .form-card h2 {
            color: #1f3349;
            margin-bottom: 8px;
        }

        .form-card p {
            color: #6b7280;
            margin-bottom: 25px;
            font-size: 14px;
        }

        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 7px;
            font-weight: bold;
            color: #374151;
        }

        input, select {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            outline: none;
            font-size: 14px;
        }

        input:focus, select:focus {
            border-color: #4da3ff;
        }

        .button-group {
            margin-top: 25px;
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 12px 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }

        .btn-save {
            background: #1f3349;
            color: white;
        }

        .btn-save:hover {
            background: #4da3ff;
        }

        .btn-back {
            background: #6b7280;
            color: white;
        }
    </style>
</head>

<body>

<div class="wrapper">
    <div class="form-card">
        <h2>Tambah Data Mobil</h2>
        <p>Masukkan data mobil yang akan tersedia pada aplikasi Rent Car.</p>

        <form action="simpan_mobil.jsp" method="post">
            <label>Merk Mobil</label>
            <input type="text" name="merk" placeholder="Contoh: Avanza" required>

            <label>No Plat</label>
            <input type="text" name="no_plat" placeholder="Contoh: B 1234 ABC" required>

            <label>Harga Sewa</label>
            <input type="number" name="harga_sewa" placeholder="Contoh: 300000" required>

            <label>Status</label>
            <select name="status" required>
                <option value="Tersedia">Tersedia</option>
                <option value="Disewa">Disewa</option>
            </select>

            <div class="button-group">
                <button type="submit" class="btn btn-save">Simpan Data</button>
                <a href="mobil.jsp" class="btn btn-back">Kembali</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>