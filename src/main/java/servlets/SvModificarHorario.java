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
import javax.servlet.http.HttpSession;
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
        System.out.println("servletGET");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("servletPOST");
        String fecha = request.getParameter("fechaSeleccionada");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;

        String h_inicio = request.getParameter("horariosIN");
        String h_cierre = request.getParameter("horariosCI");
        SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");

        Boolean vigen = true;
        try {
            date = sdf.parse(fecha);
        } catch (ParseException ex) {
            Logger.getLogger(SvModificarHorario.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error 1");
        }
        Time timeInicio = null;
        Time timeCierre = null;
        try {
            Date dateInicio = sdfHora.parse(h_inicio);
            Date dateCierre = sdfHora.parse(h_cierre);
            timeInicio = new Time(dateInicio.getTime());
            timeCierre = new Time(dateCierre.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(SvModificarHorario.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("error2");
        }

        if (date != null) {
            horarios hor = control.obtenerHorariosPorFecha(date);
            int id = hor.getIdHorarios();
//            HttpSession miSesion = request.getSession();
//            miSesion.setAttribute("editFecha", id);

            if (hor != null) {
                System.out.println("ID de horario: " + id);
                System.out.println("hora_inicio= " + h_inicio);
                System.out.println("hora_cierre" + h_cierre);
                System.out.println("esta desbloqueado?= " + vigen);

                horarios hora = new horarios();
                hora.setIdHorarios(id);
                hora.setFecha(date);
                hora.setHoraApertura(timeInicio);
                hora.setHoraCierre(timeCierre);
                hora.setVigente(true);

                control.modificarHorarios(hora);

                response.sendRedirect("mHorario.html");
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
