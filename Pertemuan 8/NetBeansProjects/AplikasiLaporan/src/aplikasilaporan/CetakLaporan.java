package aplikasilaporan;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

public class CetakLaporan extends javax.swing.JFrame {

    public CetakLaporan() {
        initComponents();
        this.setVisible(true);
        this.toFront();
        this.setLocationRelativeTo(null);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">                          
    private void initComponents() {
        btnCetak = new java.awt.Button();
        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("Menu Cetak Laporan");
        btnCetak.setLabel("Cetak Laporan");
        btnCetak.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCetakActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(140, 140, 140)
                .addComponent(btnCetak, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(140, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(130, Short.MAX_VALUE)
                .addComponent(btnCetak, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(140, 140, 140))
        );
        pack();
    }// </editor-fold>                        

    private void btnCetakActionPerformed(java.awt.event.ActionEvent evt) {                                         
        try {
            String user = "root";
            String pass = "";
            String host = "localhost";
            String db   = "db_nilai"; 
            String url  = "jdbc:mysql://" + host + "/" + db;
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            
            // Path disesuaikan dengan folder di gambar kamu
            String reportPath = "src/laporan/NilaiReport.jasper"; 
            
            JasperPrint jp = JasperFillManager.fillReport(reportPath, null, conn);
            JasperViewer.viewReport(jp, false);
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(rootPane, "Gagal Mencetak: " + e.getMessage());
        }
    }                                        

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(() -> {
            new CetakLaporan().setVisible(true);
        });
    }

    private java.awt.Button btnCetak;
}