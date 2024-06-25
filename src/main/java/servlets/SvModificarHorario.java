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
        String horaAperturaString = request.getParameter("horariosIN");
        String horaCierreString = request.getParameter("horariosCI");

        SimpleDateFormat sdfFecha = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");

        Date fecha = null;
        Time horaApertura = null;
        Time horaCierre = null;

        try {
            fecha = sdfFecha.parse(fechaString);
            horaApertura = new Time(sdfHora.parse(horaAperturaString).getTime());
            horaCierre = new Time(sdfHora.parse(horaCierreString).getTime());

            control.editarHorarios(fecha, horaApertura, horaCierre);

            // Redirigir o enviar respuesta de éxito
            response.sendRedirect("mHorario.html"); // Ajustar según tu estructura de proyecto

        } catch (ParseException ex) {
            // Manejo de error al parsear fechas o horas
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Error al parsear la fecha o hora.");
        } catch (Exception ex) {
            Logger.getLogger(SvModificarHorario.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error interno del servidor.");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
