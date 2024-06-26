package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.horarios;
import persistencia.controladoraPersistencia;

@WebServlet(name = "svCalculaHorario", urlPatterns = {"/svCalculaHorario"})
public class svCalculaHorario extends HttpServlet {

    controladoraPersistencia control = new controladoraPersistencia();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fechaStr =  request.getParameter("fecha");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            if (fechaStr != null && !fechaStr.trim().isEmpty() && fechaStr.matches("\\d{4}-\\d{2}-\\d{2}")) {
                Date fecha = Date.valueOf(fechaStr);
                horarios horario = control.obtenerHorariosPorFecha(fecha);

                if (horario != null) {
                    LocalTime apertura = horario.getHoraApertura().toLocalTime();
                    LocalTime cierre = horario.getHoraCierre().toLocalTime();
                    List<LocalTime> horariosDisponibles = HorariosUtil.generarHorariosDisponibles(apertura, cierre);
                    List<LocalTime> horariosFiltrados = new ArrayList<>();

                    for (LocalTime hora : horariosDisponibles) {
                        if (control.verificarDisponibilidad(fecha, hora)) {
                            horariosFiltrados.add(hora);
                        }
                    }

                    String json = new Gson().toJson(horariosFiltrados);
                    response.getWriter().write(json);
                } else {
                    response.getWriter().write("[]");
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
