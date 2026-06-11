<%@page import="java.sql.*"%>
<%@page import="Koneksi.Koneksi"%>

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

    if (conn != null) {
        String sql = "DELETE FROM mobil WHERE id_mobil=?";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, id);
        ps.executeUpdate();

        ps.close();
        conn.close();
    }

    response.sendRedirect("mobil.jsp");
%>