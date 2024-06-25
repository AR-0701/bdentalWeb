package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.horarios;

@WebServlet(name = "SvMostrarHorarios", urlPatterns = {"/SvMostrarHorarios"})
public class SvMostrarHorarios extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fechaStr = request.getParameter("fecha");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            if (fechaStr != null && !fechaStr.trim().isEmpty() && fechaStr.matches("\\d{4}-\\d{2}-\\d{2}")) {
                Date fecha = Date.valueOf(fechaStr);

                horarios horario = control.obtenerHorariosPorFecha(fecha);

                if (horario != null) {
                    String json = new Gson().toJson(horario);
                    response.getWriter().write(json);
                } else {
                    response.getWriter().write("{}");
                }
            } else {
                throw new IllegalArgumentException("Fecha inválida: " + fechaStr);
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de fecha inválido. Debe ser 'yyyy-mm-dd'.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
