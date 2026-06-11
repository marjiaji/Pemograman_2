<%@page import="java.sql.*"%>
<%@page import="Koneksi.Koneksi"%>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String merk = request.getParameter("merk");
    String no_plat = request.getParameter("no_plat");
    String hargaParam = request.getParameter("harga_sewa");
    String status = request.getParameter("status");

    if (merk == null || no_plat == null || hargaParam == null || status == null ||
        merk.trim().equals("") || no_plat.trim().equals("") || hargaParam.trim().equals("")) {
        response.sendRedirect("tambah_mobil.jsp");
        return;
    }

    int harga_sewa = Integer.parseInt(hargaParam);

    Connection conn = Koneksi.getConnection();

    if (conn != null) {
        String sql = "INSERT INTO mobil (merk, no_plat, harga_sewa, status) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, merk);
        ps.setString(2, no_plat);
        ps.setInt(3, harga_sewa);
        ps.setString(4, status);

        ps.executeUpdate();

        ps.close();
        conn.close();
    }

    response.sendRedirect("mobil.jsp");
%>