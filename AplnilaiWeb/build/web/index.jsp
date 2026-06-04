<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Informasi Nilai Mahasiswa - UNPAM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Informasi Nilai Mahasiswa</h2>
        <h2>UNIVERSITAS PAMULANG</h2>
        <h3>Jl. Surya Kencana No. 1 Pamulang, Tangerang Selatan, Banten</h3>
    </div>

    <div class="main-nav">
        <a href="#">Home</a>
        <a href="#">Master Data</a>
        <a href="#">Transaksi</a>
        <a href="#">Laporan</a>
        <a href="#">Logout</a>
    </div>

    <div class="wrapper">
        <div class="sidebar">
            <h4>Master Data</h4>
            <ul>
                <li><a href="#">Mahasiswa</a></li>
                <li><a href="#">Mata Kuliah</a></li>
            </ul>

            <h4>Transaksi</h4>
            <ul>
                <li><a href="#">Nilai</a></li>
            </ul>

            <h4>Laporan</h4>
            <ul>
                <li><a href="#">Nilai</a></li>
            </ul>
        </div>

        <div class="content">
            <h3>Input Nilai Mahasiswa</h3>
            <form action="NilaiController" method="POST">
                <table class="form-table">
                    <tr>
                        <td>NIM</td>
                        <td>: <input type="text" name="nim" size="15"> 
                              <input type="submit" name="action" value="Cari"> 
                              <input type="submit" name="action" value="Lihat"></td>
                    </tr>
                    <tr>
                        <td>Nama</td>
                        <td>: <input type="text" name="nama" size="30"  </td>
                    </tr>
                    <tr>
                        <td>Semester</td>
                        <td>: <input type="text" name="semester" size="8"></td>
                    </tr>
                    <tr>
                        <td>Kelas</td>
                        <td>: <input type="text" name="kelas" size="12"></td>
                    </tr>
                    <tr>
                        <td>Kode Mata Kuliah</td>
                        <td>: <input type="text" name="kd_mk" size="15"> 
                              <input type="submit" name="action" value="Cari"> 
                              <input type="submit" name="action" value="Lihat"></td>
                    </tr>
                    <tr>
                        <td>Nama Mata Kuliah</td>
                        <td>: <input type="text" name="nm_mk" size="30"></td>
                    </tr>
                    <tr>
                        <td>Jumlah SKS</td>
                        <td>: <input type="text" name="sks" size="5" ></td>
                    </tr>
                    <tr>
                        <td>Nilai Tugas</td>
                        <td>: <input type="text" name="nilai_tugas" size="8"></td>
                    </tr>
                    <tr>
                        <td>Nilai UTS</td>
                        <td>: <input type="text" name="nilai_uts" size="8"></td>
                    </tr>
                    <tr>
                        <td>Nilai UAS</td>
                        <td>: <input type="text" name="nilai_uas" size="8"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="padding-top: 15px;">
                            <input type="submit" name="action" value="Simpan" style="width: 80px; padding: 3px;">
                            <input type="reset" value="Hapus" style="width: 80px; padding: 3px;">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <div class="footer">
        Copyright &copy; 2014 Universitas Pamulang<br>
        Jl. Surya Kencana No. 1 Pamulang, Tangerang Selatan, Banten
    </div>
</div>

</body>
</html>