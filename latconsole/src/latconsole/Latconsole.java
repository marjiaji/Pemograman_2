/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package latconsole;

import java.util.Scanner;

public class Latconsole {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Masukkan NIM      : ");
        String nim = input.nextLine();

        System.out.print("Masukkan Nama     : ");
        String nama = input.nextLine();

        System.out.print("Masukkan Jurusan  : ");
        String jurusan = input.nextLine();

        // Membuat objek
        Mahasiswa mhs = new Mahasiswa(nim, nama, jurusan);

        System.out.println("\n=== DATA MAHASISWA ===");
        mhs.tampilData();
    }
}
