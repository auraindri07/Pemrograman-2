<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login Operational Center | RARDrive</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            margin: 0; padding: 0;
            background: #080C14;
            /* Efek pancaran cahaya radial gelap dari tengah */
            background-image: radial-gradient(circle at 50% 50%, #1E1B4B 0%, #080C14 100%);
            height: 100vh;
            display: flex; justify-content: center; align-items: center;
            font-family: 'Segoe UI', Roboto, Helvetica, sans-serif;
        }
        
        /* Box Login - Deep Carbon dengan border tipis dan bayangan pekat */
        .login-box {
            background-color: #0F1626;
            border: 1px solid #1E293B;
            border-radius: 16px;
            padding: 45px 40px;
            width: 360px;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.6);
            text-align: center;
        }
        
        /* Logo Brand - Mengikuti Gaya Banner Dashboard */
        .brand-logo {
            font-size: 28px; font-weight: 800; color: #ffffff;
            margin-bottom: 5px; letter-spacing: 0.5px;
            display: flex; justify-content: center; align-items: center; gap: 8px;
        }
        /* Aksen Neon Cyan khas RARDrive dengan efek glow */
        .brand-logo span { 
            color: #00F2FE; 
            text-shadow: 0 0 15px rgba(0, 242, 254, 0.5); 
        }
        
        /* Teks Status Atas - Warna Magenta sesuai sub-title dashboard */
        .system-status { 
            color: #D946EF; 
            font-size: 11px; 
            font-weight: 800; 
            letter-spacing: 2px; 
            text-transform: uppercase;
            margin-bottom: 35px; 
        }
        
        .form-group { text-align: left; margin-bottom: 22px; }
        
        label { 
            color: #94A3B8; 
            font-size: 11px; 
            font-weight: 700; 
            text-transform: uppercase; 
            margin-bottom: 8px; 
            display: block; 
            letter-spacing: 0.5px;
        }
        
        /* Input Form Sci-Fi - Hitam Pekat dengan Teks Putih */
        .input-cyber {
            width: 100%; background: #050911 !important;
            border: 1px solid #1E293B; color: #ffffff !important;
            padding: 13px 16px; border-radius: 10px; box-sizing: border-box;
            outline: none; font-size: 14px;
            transition: all 0.2s ease;
        }
        /* Efek Menyala saat Kolom Di-klik */
        .input-cyber:focus { 
            border-color: #00F2FE !important; 
            box-shadow: 0 0 12px rgba(0, 242, 254, 0.3) !important;
        }
        
        /* Tombol Akses - Gradasi Cyan ke Mint Green (Buka Kasir Sewa style) */
        .btn-unlock {
            width: 100%; padding: 14px; margin-top: 10px;
            background: linear-gradient(135deg, #00F2FE, #10B981) !important; 
            color: #04060A !important;
            border: none !important; border-radius: 10px;
            font-weight: 700; cursor: pointer; text-transform: uppercase; font-size: 13px;
            box-shadow: 0 0 15px rgba(0, 242, 254, 0.3);
            transition: all 0.2s ease;
            display: flex; justify-content: center; align-items: center; gap: 8px;
        }
        .btn-unlock:hover {
            box-shadow: 0 0 25px rgba(0, 242, 254, 0.6);
            transform: translateY(-1px);
        }
        .btn-unlock:active {
            transform: translateY(0);
        }
        
        /* Notifikasi Gagal Login */
        .alert-danger {
            color: #F43F5E; background: rgba(244, 63, 94, 0.1);
            padding: 12px; border-radius: 10px; font-size: 12px; font-weight: 600;
            margin-bottom: 24px; border: 1px solid rgba(244, 63, 94, 0.2);
            text-align: left;
        }
    </style>
</head>
<body>

    <div class="login-box">
        <div class="brand-logo"><i class="bi bi-car-front-fill" style="color: #00F2FE;"></i> RAR<span>DRIVE</span></div>
        <div class="system-status">ENTERPRISE SUITE SYSTEM V4.0</div>
        
        <% if(request.getParameter("error") != null) { %>
            <div class="alert-danger">
                ❌ KREDENSIAL SALAH / AKSES DITOLAK!
            </div>
        <% } %>

        <form action="LoginController" method="POST">
            <div class="form-group">
                <label>ID Operator Terminal</label>
                <input type="text" name="username" class="input-cyber" placeholder="Masukkan username" required autocomplete="off">
            </div>
            <div class="form-group">
                <label>Kunci Akses Enkripsi</label>
                <input type="password" name="password" class="input-cyber" placeholder="••••••••" required>
            </div>
            <button type="submit" class="btn-unlock">
                <i class="bi bi-shield-lock-fill"></i> Unlock System
            </button>
        </form>
    </div>

</body>
</html>