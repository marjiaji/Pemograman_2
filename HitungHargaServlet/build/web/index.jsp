<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hitung Harga</title>
</head>
<body>

<h2>Hitung Total Harga</h2>

<form action="HitungHarga" method="post">
    Nama Barang: <input type="text" name="nama"><br><br>
    Harga: <input type="number" name="harga"><br><br>
    Jumlah: <input type="number" name="jumlah"><br><br>

    <input type="submit" value="Hitung">
</form>

</body>
</html>