package proses;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HitungNilai", urlPatterns = {"/HitungNilai"})
public class HitungNilai extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head><title>Hitung Nilai</title></head>");
            out.println("<body>");
            out.println("<h2>Program Hitung Nilai</h2>");
            out.println("<form action='HitungNilai' method='post'>");
            out.println("Nama: <input type='text' name='nama'><br><br>");
            out.println("Nilai: <input type='number' name='nilai'><br><br>");
            out.println("<input type='submit' value='Hitung'>");
            out.println("</form>");

            String nama = request.getParameter("nama");
            String nilaiStr = request.getParameter("nilai");

            if (nama != null && nilaiStr != null) {
                int nilai = Integer.parseInt(nilaiStr);
                String keterangan;

                if (nilai >= 80) {
                    keterangan = "A / Sangat Baik";
                } else if (nilai >= 70) {
                    keterangan = "B / Baik";
                } else if (nilai >= 60) {
                    keterangan = "C / Cukup";
                } else {
                    keterangan = "D / Tidak Lulus";
                }

                out.println("<hr>");
                out.println("<h3>Hasil Perhitungan</h3>");
                out.println("Nama: " + nama + "<br>");
                out.println("Nilai: " + nilai + "<br>");
                out.println("Keterangan: " + keterangan + "<br>");
            }

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