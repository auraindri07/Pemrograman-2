
import javax.swing.*;
import java.awt.event.*;

public class ContohGUI {

    public static void main(String[] args) {
        // Membuat jendela (frame)
        JFrame frame = new JFrame("Contoh GUI Java");
        frame.setSize(400, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        // Membuat tombol
        JButton button = new JButton("Klik Saya");
        button.setBounds(150, 80, 100, 30);

        // Menambahkan action listener pada tombol
        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(frame, "Tombol Ditekan!");
            }
        });

        // Menambahkan tombol ke frame
        frame.add(button);
        frame.setLayout(null);
        frame.setVisible(true);
    }
}
