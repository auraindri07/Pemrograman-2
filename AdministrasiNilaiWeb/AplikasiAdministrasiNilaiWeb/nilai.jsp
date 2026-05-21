<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="koneksi.jsp" %>
        <%
    // Logika Hitung Otomatis dan Simpan Nilai
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("nim") != null) {
        String nim = request.getParameter("nim");
        String kodeMk = request.getParameter("kode_mk");
        double tugas = Double.parseDouble(request.getParameter("tugas"));
        double uts = Double.parseDouble(request.getParameter("uts"));
        double uas = Double.parseDouble(request.getParameter("uas"));

        // RUMUS AKADEMIK: Tugas 30%, UTS 30%, UAS 40%
        double nilaiAkhir = (0.30 * tugas) + (0.30 * uts) + (0.40 * uas);

        // LOGIKA PENENTUAN GRADE HURUF HURUF
        String grade = "E";
        if (nilaiAkhir >= 80) { grade = "A"; }
        else if (nilaiAkhir >= 70) { grade = "B"; }
        else if (nilaiAkhir >= 60) { grade = "C"; }
        else if (nilaiAkhir >= 50) { grade = "D"; }

        PreparedStatement psNilai = null;
        try {
            if (conn != null) {
                String sql = "INSERT INTO tbl_nilai (nim, kode_mk, nilai_tugas, nilai_uts, nilai_uas, nilai_akhir, grade) VALUES (?, ?, ?, ?, ?, ?, ?)";
                psNilai = conn.prepareStatement(sql);
                psNilai.setString(1, nim);
                psNilai.setString(2, kodeMk);
                psNilai.setDouble(3, tugas);
                psNilai.setDouble(4, uts);
                psNilai.setDouble(5, uas);
                psNilai.setDouble(6, nilaiAkhir);
                psNilai.setString(7, grade);

                int hasil = psNilai.executeUpdate();
                if (hasil > 0) {
                    response.sendRedirect("nilai.jsp");
                }
            }
        } catch (Exception e) {
            out.println("<script>alert('Gagal simpan nilai: " + e.getMessage() + "');</script>");
        } finally {
            if (psNilai != null) psNilai.close();
        }
    }
%>
            <!DOCTYPE html>
            <html lang="id">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="style.css" rel="stylesheet" type="text/css" />
                <title>SIAKAD - Input Nilai</title>
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
                                <a href="#">Master Data ▾</a>
                                <ul class="dropdown-menu">
                                    <li><a href="mahasiswa.jsp">Mahasiswa</a></li>
                                    <li><a href="matakuliah.jsp">Mata Kuliah</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="active">Transaksi ▾</a>
                                <ul class="dropdown-menu">
                                    <li><a href="nilai.jsp">Input Nilai</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="laporan.jsp">Laporan ▾</a>
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
                                <a href="matakuliah.jsp">🔸 Data Mata Kuliah</a>
                            </div>
                            <div class="menu-section">
                                <h3>Transaksi</h3>
                                <a href="nilai.jsp" class="active-sidebar">📝 Kelola Nilai</a>
                            </div>
                            <div class="menu-section">
                                <h3>Laporan</h3>
                                <a href="laporan.jsp">🖨️ Cetak Nilai</a>
                            </div>
                        </aside>

                        <main class="content-area">
                            <div class="data-card">
                                <h2>Form Transaksi Input Nilai</h2>
                                <p style="color: #7d6e83; font-size: 0.9rem; margin-bottom: 20px;">Masukkan komponen nilai akademik mahasiswa per mata kuliah</p>

                                <form action="#" method="POST" class="mahasiswa-form">
                                    <div class="form-row">
                                        <div class="form-input-group">
                                            <label for="pilih_mhs">Pilih Mahasiswa</label>
                                            <select id="pilih_mhs" name="nim" required>
                                            <option value="" disabled selected>-- Pilih Mahasiswa --</option>
                                            <%
                                                Statement stM = conn.createStatement();
                                                ResultSet rsM = stM.executeQuery("SELECT nim, nama FROM mst_mahasiswa");
                                                while(rsM.next()) {
                                            %>
                                                <option value="<%= rsM.getString("nim") %>"><%= rsM.getString("nim") %> - <%= rsM.getString("nama") %></option>
                                            <% } rsM.close(); stM.close(); %>
                                        </select>
                                        </div>
                                        <div class="form-input-group">
                                            <label for="pilih_mk">Pilih Mata Kuliah</label>
                                            <select id="pilih_mk" name="kode_mk" required>
                                                <option value="" disabled selected>-- Pilih Mata Kuliah --</option>
                                                <%
                                                    Statement stK = conn.createStatement();
                                                    ResultSet rsK = stK.executeQuery("SELECT kode_mk, nama_mk FROM mst_matakuliah");
                                                    while(rsK.next()) {
                                                %>
                                                    <option value="<%= rsK.getString("kode_mk") %>"><%= rsK.getString("kode_mk") %> - <%= rsK.getString("nama_mk") %></option>
                                                <% } rsK.close(); stK.close(); %>
                                            </select>
                                        </div>
                                        </select>
                                    </div>
                            </div>

                            <div class="form-row">
                                <div class="form-input-group">
                                    <label for="nilai_tugas">Nilai Tugas</label>
                                    <input type="number" id="nilai_tugas" name="tugas" min="0" max="100" placeholder="0 - 100" required>
                                </div>
                                <div class="form-input-group">
                                    <label for="nilai_uts">Nilai UTS</label>
                                    <input type="number" id="nilai_uts" name="uts" min="0" max="100" placeholder="0 - 100" required>
                                </div>
                                <div class="form-input-group">
                                    <label for="nilai_uas">Nilai UAS</label>
                                    <input type="number" id="nilai_uas" name="uas" min="0" max="100" placeholder="0 - 100" required>
                                </div>
                            </div>

                            <button type="submit" class="save-btn">Simpan & Hitung Nilai 📝</button>
                            </form>
                    </div>

                    <div class="data-card" style="margin-top: 30px;">
                        <h2>Daftar Nilai Akademik Mahasiswa</h2>
                        <div class="table-container">
                            <table class="styled-table">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>NIM</th>
                                        <th>Nama Lengkap</th>
                                        <th>Mata Kuliah</th>
                                        <th>Tugas</th>
                                        <th>UTS</th>
                                        <th>UAS</th>
                                        <th>Nilai Akhir</th>
                                        <th>Grade</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int noN = 1;
                                        Statement stmtN = null;
                                        ResultSet rsN = null;
                                        try {
                                            if (conn != null) {
                                                String query = "SELECT n.*, m.nama, k.nama_mk FROM tbl_nilai n " +
                                                            "JOIN mst_mahasiswa m ON n.nim = m.nim " +
                                                            "JOIN mst_matakuliah k ON n.kode_mk = k.kode_mk " +
                                                            "ORDER BY n.id_nilai DESC";
                                                stmtN = conn.createStatement();
                                                rsN = stmtN.executeQuery(query);
                                                while(rsN.next()) {
                                    %>
                                        <tr>
                                            <td>
                                                <%= noN++ %>
                                            </td>
                                            <td>
                                                <%= rsN.getString("nim") %>
                                            </td>
                                            <td>
                                                <%= rsN.getString("nama") %>
                                            </td>
                                            <td>
                                                <%= rsN.getString("nama_mk") %>
                                            </td>
                                            <td>
                                                <%= rsN.getDouble("nilai_tugas") %>
                                            </td>
                                            <td>
                                                <%= rsN.getDouble("nilai_uts") %>
                                            </td>
                                            <td>
                                                <%= rsN.getDouble("nilai_uas") %>
                                            </td>
                                            <td><strong><%= String.format("%.1f", rsN.getDouble("nilai_akhir")) %></strong></td>
                                            <td><span class="status-badge"><%= rsN.getString("grade") %></span></td>
                                            <td>
                                                <button class="action-btn delete">🗑️</button>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        } catch (Exception e) {
                                            out.println("Gagal memuat data nilai: " + e.getMessage());
                                        } finally {
                                            if (rsN != null) rsN.close();
                                            if (stmtN != null) stmtN.close();
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