<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <title>SIAKAD - Login</title>
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
                <li><a href="index.jsp"> ← Kembali ke Beranda</a></li>
            </ul>
        </nav>

        <div class="login-layout">
            <div class="login-card">
                <div class="login-card-header">
                    <h2>Selamat Datang Kembali</h2>
                    <p>Silakan masuk menggunakan akun SIAKAD Anda</p>
                </div>
                
                <form action="index.jsp" method="POST" class="login-form">
                    
                    <div class="form-group">
                        <label for="username">Nomor Induk Mahasiswa (NIM) / Username</label>
                        <div class="input-wrapper">
                            <span class="input-icon">👤</span>
                            <input type="text" id="username" name="username" placeholder="Masukkan NIM atau username Anda" required autocomplete="off">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Kata Sandi (Password)</label>
                        <div class="input-wrapper">
                            <span class="input-icon">🔒</span>
                            <input type="password" id="password" name="password" placeholder="Masukkan kata sandi Anda" required>
                        </div>
                    </div>

                    <div class="form-options">
                        <label class="remember-me">
                            <input type="checkbox" name="remember"> Ingat Saya
                        </label>
                        <a href="#" class="forgot-pass">Lupa Password?</a>
                    </div>
                    
                    <button type="submit" class="submit-login-btn">Masuk Ke Sistem 🚀</button>
                </form>
            </div>
        </div>
        
        <footer class="main-footer">
            <p>Copyright &copy; 2026 <strong>Universitas Pamulang</strong>. All Rights Reserved.</p>
            <p><small>Teknik Informatika - Fakultas Ilmu Komputer</small></p>
        </footer>
    </div>

</body>
</html>