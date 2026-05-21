<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="koneksi.jsp" %>

        <%
    // Mengecek apakah ada kiriman data dari Form (Tombol Simpan diklik)
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("nim") != null) {
        String nim = request.getParameter("nim");
        String nama = request.getParameter("nama");
        String kelas = request.getParameter("kelas");
        String prodi = request.getParameter("prodi");

        PreparedStatement ps = null;
        try {
            if (conn != null) {
                // Query SQL untuk memasukkan data
                String sql = "INSERT INTO mst_mahasiswa (nim, nama, kelas, prodi) VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, nim);
                ps.setString(2, nama);
                ps.setString(3, kelas);
                ps.setString(4, prodi);

                // Jalankan perintah insert
                int hasil = ps.executeUpdate();
                
                if (hasil > 0) {
                    // Jika sukses, refresh halaman agar data baru langsung muncul di tabel
                    response.sendRedirect("mahasiswa.jsp");
                }
            }
        } catch (Exception e) {
            out.println("<script>alert('Gagal menyimpan data: " + e.getMessage() + "');</script>");
        } finally {
            if (ps != null) ps.close();
        }
    }
%>

            <!DOCTYPE html>
            <html lang="id">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="style.css" rel="stylesheet" type="text/css" />
                <title>SIAKAD - Data Mahasiswa</title>
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
                            <li><a href="index.jsp">Home</a></li>
                            <li class="dropdown">
                                <a href="#" class="active">Master Data ▾</a>
                                <ul class="dropdown-menu">
                                    <li><a href="mahasiswa.jsp">Mahasiswa</a></li>
                                    <li><a href="matakuliah.jsp">Mata Kuliah</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#">Transaksi ▾</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Input Nilai</a></li>
                                </ul>
                            </li>
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
                                <h3>Master Data</h3>
                                <a href="mahasiswa.jsp" class="active-sidebar">🔸 Data Mahasiswa</a>
                                <a href="matakuliah.jsp" class="active-sidebar">🔸 Data Mata Kuliah</a>
                            </div>
                            <div class="menu-section">
                                <h3>Transaksi</h3>
                                <a href="nilai.jsp">📝 Kelola Nilai</a>
                            </div>
                            <div class="menu-section">
                                <h3>Laporan</h3>
                                <a href="laporan.jsp">🖨️ Cetak Nilai</a>
                            </div>
                        </aside>

                        <main class="content-area">
                            <div class="data-card">
                                <h2>Form Input Data Mahasiswa</h2>
                                <p style="color: #7d6e83; font-size: 0.9rem; margin-bottom: 20px;">Tambahkan data mahasiswa baru ke dalam sistem administrasi</p>

                                <form action="mahasiswa.jsp" method="POST" class="mahasiswa-form">
                                    <div class="form-row">
                                        <div class="form-input-group">
                                            <label for="nim">NIM (Nomor Induk Mahasiswa)</label>
                                            <input type="text" id="nim" name="nim" placeholder="Contoh: 2022051001" required>
                                        </div>
                                        <div class="form-input-group">
                                            <label for="nama">Nama Lengkap Mahasiswa</label>
                                            <input type="text" id="nama" name="nama" placeholder="Masukkan nama lengkap" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-input-group">
                                            <label for="kelas">Kelas</label>
                                            <input type="text" id="kelas" name="kelas" placeholder="Contoh: 07TPLE001" required>
                                        </div>
                                        <div class="form-input-group">
                                            <label for="prodi">Program Studi</label>
                                            <select id="prodi" name="prodi">
                                    <option value="Teknik Informatika">Teknik Informatika</option>
                                    <option value="Sistem Informasi">Sistem Informasi</option>
                                    <option value="Sistem Komputer">Sistem Komputer</option>
                                </select>
                                        </div>
                                    </div>
                                    <button type="submit" class="save-btn">Simpan Data Mahasiswa ✨</button>
                                </form>
                            </div>

                            <div class="data-card" style="margin-top: 30px;">
                                <h2>Daftar Mahasiswa Terdaftar</h2>
                                <div class="table-container">
                                    <table class="styled-table">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>NIM</th>
                                                <th>Nama Lengkap</th>
                                                <th>Kelas</th>
                                                <th>Program Studi</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                int no = 1;
                                Statement stmt = null;
                                ResultSet rs = null;
                                try {
                                    if (conn != null) {
                                        String query = "SELECT * FROM mst_mahasiswa ORDER BY nim ASC";
                                        stmt = conn.createStatement();
                                        rs = stmt.executeQuery(query);

                                        while(rs.next()) {
                            %>
                                                <tr>
                                                    <td>
                                                        <%= no++ %>
                                                    </td>
                                                    <td>
                                                        <%= rs.getString("nim") %>
                                                    </td>
                                                    <td>
                                                        <%= rs.getString("nama") %>
                                                    </td>
                                                    <td>
                                                        <%= rs.getString("kelas") %>
                                                    </td>
                                                    <td>
                                                        <%= rs.getString("prodi") %>
                                                    </td>
                                                    <td>
                                                        <button class="action-btn edit">✏️</button>
                                                        <button class="action-btn delete">🗑️</button>
                                                    </td>
                                                </tr>
                                                <%
                                        }
                                    } else {
                            %>
                                                    <tr>
                                                        <td colspan="6" style="text-align:center; color:red;">Koneksi database belum terhubung.</td>
                                                    </tr>
                                                    <%
                                    }
                                } catch (Exception e) {
                                    out.println("Gagal mengambil data: " + e.getMessage());
                                } finally {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                }
                            %>
                                        </tbody>
                                    </table>
                                </div>
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