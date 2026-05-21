<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="id">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="style.css" rel="stylesheet" type="text/css" />
        <title>SIAKAD - KHS Mahasiswa</title>
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
                        <a href="#">Transaksi ▾</a>
                        <ul class="dropdown-menu">
                            <li><a href="nilai.jsp">Input Nilai</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="active">Laporan ▾</a>
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
                        <a href="nilai.jsp">📝 Kelola Nilai</a>
                    </div>
                    <div class="menu-section">
                        <h3>Laporan</h3>
                        <a href="laporan.jsp" class="active-sidebar">🖨️ Cetak Nilai</a>
                    </div>
                </aside>

                <main class="content-area">
                    <div class="data-card">
                        <h2>Cetak Kartu Hasil Studi (KHS)</h2>
                        <p style="color: #7d6e83; font-size: 0.9rem; margin-bottom: 20px;">Pilih mahasiswa untuk menampilkan laporan nilai akademik resmi</p>

                        <form action="#" method="POST" class="mahasiswa-form">
                            <div class="form-row" style="align-items: flex-end;">
                                <div class="form-input-group" style="flex: 2;">
                                    <label for="cari_mhs">Pilih Mahasiswa (NIM / Nama)</label>
                                    <select id="cari_mhs" name="nim" required>
                                    <option value="" disabled selected>-- Cari Mahasiswa --</option>
                                    <option value="2022051001">2022051001 - Ahmad Fauzi</option>
                                    <option value="2022051045">2022051045 - Siti Rahmawati</option>
                                </select>
                                </div>
                                <div style="flex: 1;">
                                    <button type="button" onclick="window.print()" class="save-btn" style="width: 100%; margin-top: 0; background: linear-gradient(135deg, #8ec5fc 0%, #e0c3fc 100%);">
                                    🖨️ Cetak KHS (PDF)
                                </button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="data-card" style="margin-top: 30px;">
                        <div style="text-align: center; margin-bottom: 20px; border-bottom: 2px dashed #eaddf2; padding-bottom: 15px;">
                            <h3 style="color: #3b2d42; font-size: 1.2rem; font-weight: 700;">KARTU HASIL STUDI (KHS)</h3>
                            <p style="font-size: 0.85rem; color: #7d6e83; margin-top: 5px;">Semester Ganjil - 2026/2027</p>
                        </div>

                        <div style="display: flex; justify-content: space-between; font-size: 0.9rem; color: #4a3e4d; margin-bottom: 20px; background: #fdfbfe; padding: 15px; border-radius: 10px; border: 1px solid #f5edf8;">
                            <div>
                                <p style="margin-bottom: 5px;"><strong>NIM:</strong> 2022051001</p>
                                <p><strong>Nama:</strong> Ahmad Fauzi</p>
                            </div>
                            <div style="text-align: right;">
                                <p style="margin-bottom: 5px;"><strong>Prodi:</strong> Teknik Informatika</p>
                                <p><strong>Kelas:</strong> 07TPLE001</p>
                            </div>
                        </div>

                        <div class="table-container">
                            <table class="styled-table">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>Kode MK</th>
                                        <th>Nama Mata Kuliah</th>
                                        <th>SKS</th>
                                        <th>Nilai Akhir</th>
                                        <th>Grade</th>
                                        <th>Bobot</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>TPL0102</td>
                                        <td>Dasar Pemrograman</td>
                                        <td>3</td>
                                        <td>81.9</td>
                                        <td><span class="status-badge" style="background-color: #e8f5e9; color: #2e7d32;">A</span></td>
                                        <td>4.00</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>TPL0412</td>
                                        <td>Jaringan Komputer</td>
                                        <td>2</td>
                                        <td>76.5</td>
                                        <td><span class="status-badge" style="background-color: #e3f2fd; color: #1565c0;">B</span></td>
                                        <td>3.00</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr style="background-color: #f7f3f9; font-weight: bold; color: #3b2d42;">
                                        <td colspan="3" style="text-align: right; padding: 14px 16px;">Total SKS & IPK Sementara:</td>
                                        <td style="padding: 14px 16px;">5 SKS</td>
                                        <td colspan="2" style="padding: 14px 16px;"></td>
                                        <td style="padding: 14px 16px; color: #a180b5;">3.60</td>
                                    </tr>
                                </tfoot>
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