<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="koneksi.jsp" %>
        <%
    // Logika Simpan Data Mata Kuliah
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("kode_mk") != null) {
        String kodeMk = request.getParameter("kode_mk");
        String namaMk = request.getParameter("nama_mk");
        int sks = Integer.parseInt(request.getParameter("sks"));
        int semester = Integer.parseInt(request.getParameter("semester"));

        PreparedStatement ps = null;
        try {
            if (conn != null) {
                String sql = "INSERT INTO mst_matakuliah (kode_mk, nama_mk, sks, semester) VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, kodeMk);
                ps.setString(2, namaMk);
                ps.setInt(3, sks);
                ps.setInt(4, semester);

                int hasil = ps.executeUpdate();
                if (hasil > 0) {
                    response.sendRedirect("matakuliah.jsp");
                }
            }
        } catch (Exception e) {
            out.println("<script>alert('Gagal simpan mata kuliah: " + e.getMessage() + "');</script>");
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
                <title>SIAKAD - Data Mata Kuliah</title>
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
                                    <li><a href="nilai.jsp">Input Nilai</a></li>
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
                                <a href="mahasiswa.jsp">🔸 Data Mahasiswa</a>
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
                                <h2>Form Input Mata Kuliah</h2>
                                <p style="color: #7d6e83; font-size: 0.9rem; margin-bottom: 20px;">Tambahkan daftar mata kuliah baru ke dalam kurikulum</p>

                                <form action="matakuliah.jsp" method="POST" class="mahasiswa-form">
                                    <div class="form-row">
                                        <div class="form-input-group">
                                            <label for="kode_mk">Kode Mata Kuliah</label>
                                            <input type="text" id="kode_mk" name="kode_mk" placeholder="Contoh: TPL0212" required>
                                        </div>
                                        <div class="form-input-group">
                                            <label for="nama_mk">Nama Mata Kuliah</label>
                                            <input type="text" id="nama_mk" name="nama_mk" placeholder="Contoh: Pemrograman Web 2" required>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-input-group">
                                            <label for="sks">Jumlah SKS</label>
                                            <select id="sks" name="sks">
                                    <option value="1">1 SKS</option>
                                    <option value="2">2 SKS</option>
                                    <option value="3">3 SKS</option>
                                    <option value="4">4 SKS</option>
                                </select>
                                        </div>
                                        <div class="form-input-group">
                                            <label for="semester">Semester</label>
                                            <select id="semester" name="semester">
                                    <% for(int i=1; i<=8; i++) { %>
                                        <option value="<%= i %>">Semester <%= i %></option>
                                    <% } %>
                                </select>
                                        </div>
                                    </div>
                                    <button type="submit" class="save-btn">Simpan Mata Kuliah 📚</button>
                                </form>
                            </div>

                            <div class="data-card" style="margin-top: 30px;">
                                <h2>Daftar Mata Kuliah</h2>
                                <div class="table-container">
                                    <table class="styled-table">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Kode MK</th>
                                                <th>Nama Mata Kuliah</th>
                                                <th>SKS</th>
                                                <th>Semester</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int noMk = 1;
                                                Statement stmtMk = null;
                                                ResultSet rsMk = null;
                                                try {
                                                    if (conn != null) {
                                                        String query = "SELECT * FROM mst_matakuliah ORDER BY kode_mk ASC";
                                                        stmtMk = conn.createStatement();
                                                        rsMk = stmtMk.executeQuery(query);
                                                        while(rsMk.next()) {
                                            %>
                                                <tr>
                                                    <td>
                                                        <%= noMk++ %>
                                                    </td>
                                                    <td>
                                                        <%= rsMk.getString("kode_mk") %>
                                                    </td>
                                                    <td>
                                                        <%= rsMk.getString("nama_mk") %>
                                                    </td>
                                                    <td>
                                                        <%= rsMk.getInt("sks") %> SKS</td>
                                                    <td>Semester
                                                        <%= rsMk.getInt("semester") %>
                                                    </td>
                                                    <td>
                                                        <button class="action-btn edit">✏️</button>
                                                        <button class="action-btn delete">🗑️</button>
                                                    </td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                } catch (Exception e) {
                                                    out.println("Gagal memuat data: " + e.getMessage());
                                                } finally {
                                                    if (rsMk != null) rsMk.close();
                                                    if (stmtMk != null) stmtMk.close();
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