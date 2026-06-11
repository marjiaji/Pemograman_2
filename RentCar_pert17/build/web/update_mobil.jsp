<%@page import="java.sql.*"%>
<%@page import="Koneksi.Koneksi"%>

<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int id_mobil = Integer.parseInt(request.getParameter("id_mobil"));
    String merk = request.getParameter("merk");
    String no_plat = request.getParameter("no_plat");
    int harga_sewa = Integer.parseInt(request.getParameter("harga_sewa"));
    String status = request.getParameter("status");

    Connection conn = Koneksi.getConnection();

    if (conn != null) {
        String sql = "UPDATE mobil SET merk=?, no_plat=?, harga_sewa=?, status=? WHERE id_mobil=?";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, merk);
        ps.setString(2, no_plat);
        ps.setInt(3, harga_sewa);
        ps.setString(4, status);
        ps.setInt(5, id_mobil);

        ps.executeUpdate();

        ps.close();
        conn.close();
    }

    response.sendRedirect("mobil.jsp");
%>