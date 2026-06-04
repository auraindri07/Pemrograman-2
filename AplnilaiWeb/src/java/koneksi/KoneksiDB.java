package koneksi;
import java.sql.Connection;
import java.sql.DriverManager;

public class KoneksiDB {
    public static Connection getConnection() {
        try {
            return DriverManager.getConnection("jdbc:mysql://localhost/nama_db", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}