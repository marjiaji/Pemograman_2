<%@page import="java.sql.*"%>
<%@page import="rentcar.Koneksi"%>

<h2>Pengembalian Mobil</h2>

<table border="1" cellpadding="8">
<tr>
    <th>ID Transaksi</th>
    <th>Customer</th>
    <th>Mobil</th>
    <th>Tanggal Sewa</th>
    <th>Tanggal Kembali</th>
    <th>Total</th>
    <th>Aksi</th>
</tr>

<%
Connection conn = Koneksi.getConnection();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(
    "SELECT transaksi.*, customer.nama, mobil.merk " +
    "FROM transaksi " +
    "JOIN customer ON transaksi.id_customer=customer.id_customer " +
    "JOIN mobil ON transaksi.id_mobil=mobil.id_mobil " +
    "WHERE transaksi.status='Disewa'"
);

while(rs.next()){
%>
<tr>
    <td><%=rs.getInt("id_transaksi")%></td>
    <td><%=rs.getString("nama")%></td>
    <td><%=rs.getString("merk")%></td>
    <td><%=rs.getString("tanggal_sewa")%></td>
    <td><%=rs.getString("tanggal_kembali")%></td>
    <td><%=rs.getInt("total_bayar")%></td>
    <td>
        <a href="pengembalian.jsp?kembali=<%=rs.getInt("id_transaksi")%>&mobil=<%=rs.getInt("id_mobil")%>">
            Kembalikan
        </a>
    </td>
</tr>
<% } %>
</table>

<%
if(request.getParameter("kembali") != null){
    int idTransaksi = Integer.parseInt(request.getParameter("kembali"));
    int idMobil = Integer.parseInt(request.getParameter("mobil"));

    PreparedStatement ps1 = conn.prepareStatement(
        "UPDATE transaksi SET status='Selesai' WHERE id_transaksi=?"
    );
    ps1.setInt(1, idTransaksi);
    ps1.executeUpdate();

    PreparedStatement ps2 = conn.prepareStatement(
        "UPDATE mobil SET status='Tersedia' WHERE id_mobil=?"
    );
    ps2.setInt(1, idMobil);
    ps2.executeUpdate();

    out.println("<script>alert('Mobil berhasil dikembalikan');location='pengembalian.jsp';</script>");
}
%>

<br>
<a href="index.jsp">Kembali</a>