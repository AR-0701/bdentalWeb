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
import logica.usuarios;

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
        String fecha = request.getParameter("fechaSeleccionada");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = sdf.parse(fecha);
        } catch (ParseException ex) {
            Logger.getLogger(SvModificarHorario.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (date != null) {
            horarios hor = control.obtenerHorariosPorFecha(date);
            int id =hor.getIdHorarios();
            if (hor != null) {
                System.out.println("ID de horario: " + id);
            } else {
                System.out.println("No se encontró horario para la fecha: " + fecha);
            }
        } else {
            System.out.println("Fecha inválida: " + fecha);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
