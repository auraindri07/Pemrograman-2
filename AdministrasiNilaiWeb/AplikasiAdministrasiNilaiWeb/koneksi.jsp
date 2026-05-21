<%@ page import="java.sql.*" %>
    <%
    // Konfigurasi Database
    String dbDriver = "com.mysql.cj.jdbc.Driver"; // Driver MySQL terbaru
    String dbUrl = "jdbc:mysql://localhost:3306/db_admnilaiweb"; // Sesuaikan port MySQL kamu (default biasanya 3306)
    String dbUser = "root"; // Username default XAMPP
    String dbPass = ""; // Password default XAMPP (kosong)

    Connection conn = null;

    try {
        // Load Driver MySQL
        Class.forName(dbDriver);
        // Membuka Koneksi
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
    } catch (Exception e) {
        out.println("<div style='color:red; background:#fee2e2; padding:10px; border-radius:5px; margin:10px 0;'>");
        out.println("<strong>Koneksi Database Gagal:</strong> " + e.getMessage());
        out.println("</div>");
    }
%>