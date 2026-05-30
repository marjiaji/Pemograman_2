<%@page import="java.sql.*"%>
<%@page import="rentcar.Koneksi"%>

<h2>Laporan Transaksi Penyewaan Mobil</h2>

<table border="1" cellpadding="8">
<tr>
    <th>ID</th>
    <th>Customer</th>
    <th>Mobil</th>
    <th>No Plat</th>
    <th>Tanggal Sewa</th>
    <th>Tanggal Kembali</th>
    <th>Lama Sewa</th>
    <th>Total Bayar</th>
    <th>Status</th>
</tr>

<%
Connection conn = Koneksi.getConnection();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(
    "SELECT transaksi.*, customer.nama, mobil.merk, mobil.no_plat " +
    "FROM transaksi " +
    "JOIN customer ON transaksi.id_customer=customer.id_customer " +
    "JOIN mobil ON transaksi.id_mobil=mobil.id_mobil"
);

while(rs.next()){
%>
<tr>
    <td><%=rs.getInt("id_transaksi")%></td>
    <td><%=rs.getString("nama")%></td>
    <td><%=rs.getString("merk")%></td>
    <td><%=rs.getString("no_plat")%></td>
    <td><%=rs.getString("tanggal_sewa")%></td>
    <td><%=rs.getString("tanggal_kembali")%></td>
    <td><%=rs.getInt("lama_sewa")%> Hari</td>
    <td>Rp <%=rs.getInt("total_bayar")%></td>
    <td><%=rs.getString("status")%></td>
</tr>
<% } %>
</table>

<br>
<button onclick="window.print()">Cetak Laporan</button>
<br><br>
<a href="index.jsp">Kembali</a>