<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <title>SIAKAD - Universitas Pamulang</title>
</head>
<body>

    <div class="app-container">
        
        <header class="main-header">
            <div class="header-content">
                <h2>Aplikasi Administrasi Nilai Web</h2>
                <h1>UNIVERSITAS PAMULANG</h1>
                <p>Jl. Surya Kencana No. 1 Pamulang, Tangerang Selatan, Banten</p>
            </div>
        </header>
        
        <nav class="top-nav">
            <ul>
                <li><a href="index.jsp" class="active">Home</a></li>
                <li class="dropdown">
                    <a href="#">Master Data ▾</a>
                    <ul class="dropdown-menu">
                        <li><a href="mahasiswa.jsp">Mahasiswa</a></li>
                        <li><a href="matakuliah.jsp">Mata Kuliah</a></li>
                    </ul>
                </</li>
                <li class="dropdown">
                    <a href="#">Transaksi ▾</a>
                    <ul class="dropdown-menu">
                        <li><a href="nilai.jsp">Input Nilai</a></li>
                    </ul>
                </</li>
                <li class="dropdown">
                    <a href="#">Laporan ▾</a>
                    <ul class="dropdown-menu">
                        <li><a href="laporan.jsp">KHS Mahasiswa</a></li>
                    </ul>
                </li>
                <li class="login-btn"><a href="login.jsp">Keluar</a></li>
            </ul>
        </nav>

        <div class="main-layout">
            
            <aside class="sidebar">
                <div class="menu-section">
                    <h3>📁 Master Data</h3>
                    <a href="mahasiswa.jsp">✨ Data Mahasiswa</a>
                    <a href="matakuliah.jsp">📚 Data Mata Kuliah</a>
                </div>
                <div class="menu-section">
                    <h3>💼 Transaksi</h3>
                    <a href="nilai.jsp">📝 Kelola Nilai</a>
                </div>
                <div class="menu-section">
                    <h3>📊 Laporan</h3>
                    <a href="laporan.jsp">🖨️ Cetak Nilai</a>
                </div>
            </aside>
            
            <main class="content-area">
                <div class="welcome-card">
                    <h1>Selamat Datang 👋</h1>
                    <p>Sistem Informasi Akademik (SIAKAD) Aplikasi Administrasi Nilai Web</p>
                    <div class="status-badge">Status Sistem: Aktif & Aman</div>
                </div>
            </main>

        </div>
        
        <footer class="main-footer">
            <p>Copyright &copy; 2026 <strong>Universitas Pamulang</strong>. All Rights Reserved.</p>
            <p><small>Teknik Informatika - Fakultas Ilmu Komputer</small></p>
        </footer>
    </div>

</body>
</html>