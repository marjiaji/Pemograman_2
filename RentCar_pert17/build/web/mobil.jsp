<%@page import="java.sql.*"%>
<%@page import="rentcar.Koneksi"%>

<h2>Data Mobil</h2>

<form method="post">
    Merk Mobil <br>
    <input type="text" name="merk"><br><br>

    Nomor Plat <br>
    <input type="text" name="no_plat"><br><br>

    Harga Sewa / Hari <br>
    <input type="number" name="harga_sewa"><br><br>

    <button type="submit" name="simpan">Simpan</button>
</form>

<%
if(request.getParameter("simpan") != null){
    Connection conn = Koneksi.getConnection();
    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO mobil(merk,no_plat,harga_sewa,status) VALUES(?,?,?,'Tersedia')"
    );
    ps.setString(1, request.getParameter("merk"));
    ps.setString(2, request.getParameter("no_plat"));
    ps.setInt(3, Integer.parseInt(request.getParameter("harga_sewa")));
    ps.executeUpdate();

    out.println("<script>alert('Data mobil berhasil disimpan');location='mobil.jsp';</script>");
}
%>

<hr>

<table border="1" cellpadding="8">
<tr>
    <th>ID</th>
    <th>Merk</th>
    <th>No Plat</th>
    <th>Harga Sewa</th>
    <th>Status</th>
</tr>

<%
Connection conn = Koneksi.getConnection();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM mobil");

while(rs.next()){
%>
<tr>
    <td><%=rs.getInt("id_mobil")%></td>
    <td><%=rs.getString("merk")%></td>
    <td><%=rs.getString("no_plat")%></td>
    <td><%=rs.getInt("harga_sewa")%></td>
    <td><%=rs.getString("status")%></td>
</tr>
<% } %>
</table>

<br>
<a href="index.jsp">Kembali</a>