package com.unpam.controller;

import com.unpam.model.Nilai;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NilaiController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String nim = request.getParameter("nim");
        String nama = request.getParameter("nama");
        double tugas = Double.parseDouble(request.getParameter("tugas"));
        double uts = Double.parseDouble(request.getParameter("uts"));
        double uas = Double.parseDouble(request.getParameter("uas"));

        Nilai nilai = new Nilai(nim, nama, tugas, uts, uas);

        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head><title>Hasil Nilai</title></head>");
            out.println("<body>");
            out.println("<h2>Hasil Penilaian Mahasiswa</h2>");
            out.println("<table border='1' cellpadding='8'>");
            out.println("<tr><td>NIM</td><td>" + nilai.getNim() + "</td></tr>");
            out.println("<tr><td>Nama</td><td>" + nilai.getNama() + "</td></tr>");
            out.println("<tr><td>Nilai Tugas</td><td>" + nilai.getTugas() + "</td></tr>");
            out.println("<tr><td>Nilai UTS</td><td>" + nilai.getUts() + "</td></tr>");
            out.println("<tr><td>Nilai UAS</td><td>" + nilai.getUas() + "</td></tr>");
            out.println("<tr><td>Nilai Akhir</td><td>" + nilai.getNilaiAkhir() + "</td></tr>");
            out.println("<tr><td>Grade</td><td>" + nilai.getGrade() + "</td></tr>");
            out.println("</table>");
            out.println("<br><a href='index.jsp'>Kembali</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}