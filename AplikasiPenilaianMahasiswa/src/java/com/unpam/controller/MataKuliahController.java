package com.unpam.controller;

import com.unpam.model.MataKuliah;
import com.unpam.view.MainForm;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MataKuliahController", urlPatterns = {"/MataKuliahController"})
public class MataKuliahController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String konten = "";

        if (request.getParameter("simpan") != null) {
            try {
                MataKuliah mk = new MataKuliah();

                mk.setKodeMataKuliah(request.getParameter("kodeMataKuliah"));
                mk.setNamaMataKuliah(request.getParameter("namaMataKuliah"));
                mk.setJumlahSks(Integer.parseInt(request.getParameter("jumlahSks")));

                mk.simpan();

                konten = "<h3>" + mk.getPesan() + "</h3>";

            } catch (Exception ex) {
                konten = "<h3>Error: " + ex + "</h3>";
            }
        }

        konten += "<h2>Form Data Mata Kuliah</h2>"
                + "<form method='post' action='MataKuliahController'>"
                + "<table>"
                + "<tr><td>Kode MK</td><td><input type='text' name='kodeMataKuliah'></td></tr>"
                + "<tr><td>Nama MK</td><td><input type='text' name='namaMataKuliah'></td></tr>"
                + "<tr><td>Jumlah SKS</td><td><input type='number' name='jumlahSks'></td></tr>"
                + "<tr><td></td><td><input type='submit' name='simpan' value='Simpan'></td></tr>"
                + "</table>"
                + "</form>";

        new MainForm().tampilkan(request, response, konten);
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