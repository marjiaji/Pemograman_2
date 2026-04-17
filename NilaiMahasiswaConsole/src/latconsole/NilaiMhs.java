/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package latconsole;
import java.util.Scanner;

/**
 *
 * @author Marji
 */
public class NilaiMhs {

    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        String nim, nama, grade;
        double uts, uas, rata;

        System.out.println("data: ");
        System.out.print("nim : "); 
        nim = input.next();

        System.out.print("nama : "); 
        nama = input.next();

        System.out.print("nilai UTS: "); 
        uts = input.nextDouble();

        System.out.print("nilai UAS: "); 
        uas = input.nextDouble();

        rata = (uts + uas) / 2;

        if (rata < 50)
            grade = "F";
        else if (rata < 60)
            grade = "D";
        else if (rata < 70)
            grade = "C";
        else if (rata < 80)
            grade = "B";
        else
            grade = "A";

        System.out.println("=============================================================================");
System.out.printf("%-18s %-15s %-10s %-10s %-10s %-10s\n",
        "Nim", "Nama", "UTS", "UAS", "Rata2", "Grade");
System.out.println("=============================================================================");

System.out.printf("%-18s %-15s %-10.1f %-10.1f %-10.1f %-10s\n",
        nim, nama, uts, uas, rata, grade);
        System.out.println("");
        System.out.println("");
    }
}
