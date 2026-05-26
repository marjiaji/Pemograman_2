package com.unpam.controller;

import com.unpam.model.Nilai;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "NilaiController", urlPatterns = {"/NilaiController"})
public class NilaiController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Nilai nilai = new Nilai();

        String nim = request.getParameter("nim");
        String kode = request.getParameter("kode_mata_kuliah");
        String tugas = request.getParameter("nilai_tugas");
        String uts = request.getParameter("nilai_uts");
        String uas = request.getParameter("nilai_uas");

        nilai.setNim(nim);
        nilai.setKodeMataKuliah(kode);
        nilai.setNilaiTugas(Double.parseDouble(tugas));
        nilai.setNilaiUTS(Double.parseDouble(uts));
        nilai.setNilaiUAS(Double.parseDouble(uas));

        nilai.simpan();

        response.sendRedirect("index.jsp?page=nilai");
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