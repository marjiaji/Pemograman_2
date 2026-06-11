<%@page import="java.sql.*"%>
<%@page import="Koneksi.Koneksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String idParam = request.getParameter("id");

    if (idParam == null || idParam.trim().equals("")) {
        response.sendRedirect("mobil.jsp");
        return;
    }

    int id = Integer.parseInt(idParam);

    Connection conn = Koneksi.getConnection();

    if (conn == null) {
        out.println("Koneksi database gagal.");
        return;
    }

    PreparedStatement ps = conn.prepareStatement("SELECT * FROM mobil WHERE id_mobil=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    if (!rs.next()) {
        rs.close();
        ps.close();
        conn.close();
        response.sendRedirect("mobil.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Mobil</title>

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
            border-color: #f59e0b;
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
            background: #f59e0b;
            color: white;
        }

        .btn-save:hover {
            background: #d97706;
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
        <h2>Edit Data Mobil</h2>
        <p>Perbarui informasi data mobil sesuai kebutuhan.</p>

        <form action="update_mobil.jsp" method="post">
            <input type="hidden" name="id_mobil" value="<%= rs.getInt("id_mobil") %>">

            <label>Merk Mobil</label>
            <input type="text" name="merk" value="<%= rs.getString("merk") %>" required>

            <label>No Plat</label>
            <input type="text" name="no_plat" value="<%= rs.getString("no_plat") %>" required>

            <label>Harga Sewa</label>
            <input type="number" name="harga_sewa" value="<%= rs.getInt("harga_sewa") %>" required>

            <label>Status</label>
            <select name="status" required>
                <option value="Tersedia" <%= rs.getString("status").equalsIgnoreCase("Tersedia") ? "selected" : "" %>>
                    Tersedia
                </option>
                <option value="Disewa" <%= rs.getString("status").equalsIgnoreCase("Disewa") ? "selected" : "" %>>
                    Disewa
                </option>
            </select>

            <div class="button-group">
                <button type="submit" class="btn btn-save">Update Data</button>
                <a href="mobil.jsp" class="btn btn-back">Kembali</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>

<%
    rs.close();
    ps.close();
    conn.close();
%>