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

            // Ambil input dari form
            int hadir = Integer.parseInt(request.getParameter("hadir"));
            int pertemuan = Integer.parseInt(request.getParameter("pertemuan"));
            double tugas = Double.parseDouble(request.getParameter("tugas"));
            double uts = Double.parseDouble(request.getParameter("uts"));
            double uas = Double.parseDouble(request.getParameter("uas"));

            // Hitung kehadiran (%)
            double kehadiran = (double) hadir / pertemuan * 100;

            // Hitung nilai akhir
            double nilaiAkhir = (0.1 * kehadiran) + (0.2 * tugas) + (0.3 * uts) + (0.4 * uas);

            // Tentukan grade
            String grade;
            if (nilaiAkhir >= 85) {
                grade = "A";
            } else if (nilaiAkhir >= 70) {
                grade = "B";
            } else if (nilaiAkhir >= 60) {
                grade = "C";
            } else if (nilaiAkhir >= 50) {
                grade = "D";
            } else {
                grade = "E";
            }

            // Tentukan status
            String status = (nilaiAkhir >= 60) ? "Lulus" : "Tidak Lulus";

            // OUTPUT HTML
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Hitung Nilai</title>");
            out.println("</head>");
            out.println("<body>");

            out.println("<h2>Menghitung Nilai</h2>");

            out.println("Jumlah hadir <input value='" + hadir + "'><br><br>");
            out.println("Jumlah pertemuan <input value='" + pertemuan + "'><br><br>");
            out.println("Nilai tugas <input value='" + tugas + "'><br><br>");
            out.println("Nilai UTS <input value='" + uts + "'><br><br>");
            out.println("Nilai UAS <input value='" + uas + "'><br><br>");
            out.println("Nilai Akhir <input value='" + nilaiAkhir + "'><br><br>");
            out.println("Grade <input value='" + grade + "'><br><br>");
            out.println("Status <input value='" + status + "'><br><br>");

            out.println("<button onclick='history.back()'>Hitung Lagi</button>");

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

    @Override
    public String getServletInfo() {
        return "Servlet Hitung Nilai Mahasiswa";
    }
}