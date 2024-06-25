package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.horarios;

@WebServlet(name = "SvActualizarHorarios", urlPatterns = {"/SvActualizarHorarios"})
public class SvActualizarHorarios extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fechaStr = request.getParameter("fecha");
        boolean bloquear = Boolean.parseBoolean(request.getParameter("bloquear"));

        Date fecha = Date.valueOf(fechaStr);

        horarios horario = control.obtenerHorariosPorFecha(fecha);
        if (horario == null) {
            horario = new horarios();
            horario.setFecha(fecha);
        }
        horario.setVigente(!bloquear);

        try {
            control.actualizarHorarios(horario);
            response.getWriter().write(new Gson().toJson(horario));
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al actualizar el horario");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
