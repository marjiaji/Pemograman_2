package com.unpam.controller;

import com.unpam.model.Enkripsi;
import com.unpam.model.Mahasiswa;
import com.unpam.view.MainForm;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MahasiswaController", urlPatterns = {"/MahasiswaController"})
public class MahasiswaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String konten = "";

        if (request.getParameter("simpan") != null) {
            try {
                Mahasiswa mahasiswa = new Mahasiswa();
                Enkripsi enkripsi = new Enkripsi();

                mahasiswa.setNim(request.getParameter("nim"));
                mahasiswa.setNama(request.getParameter("nama"));
                mahasiswa.setSemester(Integer.parseInt(request.getParameter("semester")));
                mahasiswa.setKelas(request.getParameter("kelas"));
                mahasiswa.setPassword(enkripsi.hashMD5(request.getParameter("password")));

                mahasiswa.simpan();

                konten = "<h3>" + mahasiswa.getPesan() + "</h3>";

            } catch (Exception ex) {
                konten = "<h3>Error: " + ex + "</h3>";
            }
        }

        konten += "<h2>Form Data Mahasiswa</h2>"
                + "<form method='post' action='MahasiswaController'>"
                + "<table>"
                + "<tr><td>NIM</td><td><input type='text' name='nim'></td></tr>"
                + "<tr><td>Nama</td><td><input type='text' name='nama'></td></tr>"
                + "<tr><td>Semester</td><td><input type='number' name='semester'></td></tr>"
                + "<tr><td>Kelas</td><td><input type='text' name='kelas'></td></tr>"
                + "<tr><td>Password</td><td><input type='password' name='password'></td></tr>"
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