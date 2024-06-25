package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.horarios;

@WebServlet(name = "SvModificarHorario", urlPatterns = {"/SvModificarHorario"})
public class SvModificarHorario extends HttpServlet {

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
        String fechaString = request.getParameter("fechaSeleccionada");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date fecha = sdf.parse(fechaString);
            horarios horario = control.obtenerHorariosPorFecha(fecha);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            if (horario != null) {
                //out.print("{\"id\":" + horario.getId() + "}");
            } else {
                out.print("{\"id\":null}");
            }
            out.flush();
        } catch (ParseException ex) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Fecha inválida.");
        } catch (Exception ex) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno del servidor.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
