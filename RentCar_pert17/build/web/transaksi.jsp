<%@page import="java.sql.*"%>
<%@page import="rentcar.Koneksi"%>

<h2>Transaksi Penyewaan Mobil</h2>

<form method="post">
    Pilih Mobil <br>
    <select name="id_mobil">
        <%
        Connection conn1 = Koneksi.getConnection();
        Statement st1 = conn1.createStatement();
        ResultSet mobil = st1.executeQuery("SELECT * FROM mobil WHERE status='Tersedia'");
        while(mobil.next()){
        %>
        <option value="<%=mobil.getInt("id_mobil")%>">
            <%=mobil.getString("merk")%> - <%=mobil.getString("no_plat")%>
        </option>
        <% } %>
    </select><br><br>

    Pilih Customer <br>
    <select name="id_customer">
        <%
        ResultSet cust = st1.executeQuery("SELECT * FROM customer");
        while(cust.next()){
        %>
        <option value="<%=cust.getInt("id_customer")%>">
            <%=cust.getString("nama")%>
        </option>
        <% } %>
    </select><br><br>

    Tanggal Sewa <br>
    <input type="date" name="tanggal_sewa"><br><br>

    Tanggal Kembali <br>
    <input type="date" name="tanggal_kembali"><br><br>

    Lama Sewa / Hari <br>
    <input type="number" name="lama_sewa"><br><br>

    Total Bayar <br>
    <input type="number" name="total_bayar"><br><br>

    <button type="submit" name="simpan">Simpan Transaksi</button>
</form>

<%
if(request.getParameter("simpan") != null){
    Connection conn = Koneksi.getConnection();

    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO transaksi(id_mobil,id_customer,tanggal_sewa,tanggal_kembali,lama_sewa,total_bayar,status) VALUES(?,?,?,?,?,?,?)"
    );

    ps.setInt(1, Integer.parseInt(request.getParameter("id_mobil")));
    ps.setInt(2, Integer.parseInt(request.getParameter("id_customer")));
    ps.setString(3, request.getParameter("tanggal_sewa"));
    ps.setString(4, request.getParameter("tanggal_kembali"));
    ps.setInt(5, Integer.parseInt(request.getParameter("lama_sewa")));
    ps.setInt(6, Integer.parseInt(request.getParameter("total_bayar")));
    ps.setString(7, "Disewa");
    ps.executeUpdate();

    PreparedStatement updateMobil = conn.prepareStatement(
        "UPDATE mobil SET status='Disewa' WHERE id_mobil=?"
    );
    updateMobil.setInt(1, Integer.parseInt(request.getParameter("id_mobil")));
    updateMobil.executeUpdate();

    out.println("<script>alert('Transaksi berhasil disimpan');location='transaksi.jsp';</script>");
}
%>

<br>
<a href="index.jsp">Kembali</a>