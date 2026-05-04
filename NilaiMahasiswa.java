
import java.util.Scanner;

public class NilaiMahasiswa {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);

        String nim, nama;
        double uts, uas, rata;
        char grade;

        System.out.println("tur:");
        System.out.println("data:");

        System.out.print("nim: ");
        nim = input.nextLine();

        System.out.print("nama: ");
        nama = input.nextLine();

        System.out.print("nilai UTS: ");
        uts = input.nextDouble();

        System.out.print("nilai UAS: ");
        uas = input.nextDouble();

        rata = (uts + uas) / 2;

        if (rata >= 85) {
            grade = 'A';
        } else if (rata >= 75) {
            grade = 'B';
        } else if (rata >= 65) {
            grade = 'C';
        } else if (rata >= 50) {
            grade = 'D';
        } else {
            grade = 'E';
        }

        System.out.println("\n===============================================");
        System.out.printf("%-6s %-10s %-6s %-6s %-6s %-6s\n",
                "Nim", "Nama", "UTS", "UAS", "Rata2", "Grade");
        System.out.println("===============================================");

        System.out.printf("%-6s %-10s %-6.1f %-6.1f %-6.1f %-6s\n",
                nim, nama, uts, uas, rata, grade);

        input.close();
    }
}
