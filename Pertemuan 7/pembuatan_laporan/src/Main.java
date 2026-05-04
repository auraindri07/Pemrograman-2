import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.view.JasperViewer;
import java.sql.Connection;
import java.sql.DriverManager;

public class Main {
    public static void main(String[] args) {
        try {
           Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost/db_nilai",
                "root",
                ""
        );

            // compile jrxml jadi jasper
            JasperCompileManager.compileReportToFile("laporan.jrxml");

            // load jasper
            JasperPrint jp = JasperFillManager.fillReport(
                "laporan.jasper", null, conn
            );

            JasperViewer.viewReport(jp, false);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}