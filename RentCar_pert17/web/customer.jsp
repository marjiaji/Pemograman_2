<%@page import="java.sql.*"%>
<%@page import="rentcar.Koneksi"%>

<h2>Data Customer</h2>

<form method="post">
    Nama Customer <br>
    <input type="text" name="nama"><br><br>

    Alamat <br>
    <textarea name="alamat"></textarea><br><br>

    No HP <br>
    <input type="text" name="no_hp"><br><br>

    No KTP <br>
    <input type="text" name="no_ktp"><br><br>

    <button type="submit" name="simpan">Simpan</button>
</form>

<%
if(request.getParameter("simpan") != null){
    Connection conn = Koneksi.getConnection();
    PreparedStatement ps = conn.prepareStatement(
        "INSERT INTO customer(nama,alamat,no_hp,no_ktp) VALUES(?,?,?,?)"
    );
    ps.setString(1, request.getParameter("nama"));
    ps.setString(2, request.getParameter("alamat"));
    ps.setString(3, request.getParameter("no_hp"));
    ps.setString(4, request.getParameter("no_ktp"));
    ps.executeUpdate();

    out.println("<script>alert('Data customer berhasil disimpan');location='customer.jsp';</script>");
}
%>

<hr>

<table border="1" cellpadding="8">
<tr>
    <th>ID</th>
    <th>Nama</th>
    <th>Alamat</th>
    <th>No HP</th>
    <th>No KTP</th>
</tr>

<%
Connection conn = Koneksi.getConnection();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM customer");

while(rs.next()){
%>
<tr>
    <td><%=rs.getInt("id_customer")%></td>
    <td><%=rs.getString("nama")%></td>
    <td><%=rs.getString("alamat")%></td>
    <td><%=rs.getString("no_hp")%></td>
    <td><%=rs.getString("no_ktp")%></td>
</tr>
<% } %>
</table>

<br>
<a href="index.jsp">Kembali</a>