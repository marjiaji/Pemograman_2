package com.unpam.view;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MainForm", urlPatterns = {"/MainForm"})
public class MainForm extends HttpServlet {

    public void tampilkan(HttpServletRequest request, HttpServletResponse response, String konten)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String menu = "<br><b>Master Data</b><br>"
                + "<a href='MahasiswaController'>Mahasiswa</a><br>"
                + "<a href='MataKuliahController'>Mata Kuliah</a><br><br>"
                + "<b>Transaksi</b><br>"
                + "<a href='#'>Nilai</a><br><br>"
                + "<b>Laporan</b><br>"
                + "<a href='#'>Nilai</a><br><br>"
                + "<a href='LoginController'>Login</a><br>";

        String topMenu = "<nav><ul>"
                + "<li><a href='MainForm'>Home</a></li>"
                + "<li><a href='MahasiswaController'>Mahasiswa</a></li>"
                + "<li><a href='MataKuliahController'>Mata Kuliah</a></li>"
                + "<li><a href='LoginController'>Login</a></li>"
                + "</ul></nav>";

        if (konten == null || konten.equals("")) {
            konten = "<br><h1>Selamat Datang</h1>"
                    + "<h2>Aplikasi Nilai Mahasiswa</h2>";
        }

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Informasi Nilai Mahasiswa</title>");
            out.println("<link href='style.css' rel='stylesheet' type='text/css'>");
            out.println("</head>");
            out.println("<body bgcolor='#808080'>");
            out.println("<center>");
            out.println("<table width='80%' bgcolor='#eeeeee'>");

            out.println("<tr>");
            out.println("<td colspan='2' align='center'>");
            out.println("<h2>Informasi Nilai Mahasiswa</h2>");
            out.println("<h1>UNIVERSITAS PAMULANG</h1>");
            out.println("<h4>Jl. Surya Kencana No. 1 Pamulang, Tangerang Selatan, Banten</h4>");
            out.println("</td>");
            out.println("</tr>");

            out.println("<tr height='400'>");
            out.println("<td width='200' align='center' valign='top' bgcolor='#eeffee'>");
            out.println(menu);
            out.println("</td>");

            out.println("<td align='center' valign='top' bgcolor='#ffffff'>");
            out.println(topMenu);
            out.println("<br>");
            out.println(konten);
            out.println("</td>");
            out.println("</tr>");

            out.println("<tr>");
            out.println("<td colspan='2' align='center' bgcolor='#eeeeff'>");
            out.println("<small>Copyright &copy; 2026 Universitas Pamulang</small>");
            out.println("</td>");
            out.println("</tr>");

            out.println("</table>");
            out.println("</center>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        tampilkan(request, response, "");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        tampilkan(request, response, "");
    }
}