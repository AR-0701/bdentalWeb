package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.citas;
import persistencia.citasJpaController;

@WebServlet(name = "SvModificarCita", urlPatterns = {"/SvModificarCita"})
public class SvModificarCita extends HttpServlet {

    private citasJpaController citasController;

    public SvModificarCita() {
        this.citasController = new citasJpaController();
    }

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
//        String idCitaStr = request.getParameter("idCita");
//        String nuevaFechaStr = request.getParameter("fechaSeleccionada");
//        String nuevaHoraStr = request.getParameter("hora");
//
//        if (idCitaStr != null && !idCitaStr.isEmpty()
//                && nuevaFechaStr != null && !nuevaFechaStr.isEmpty()
//                && nuevaHoraStr != null && !nuevaHoraStr.isEmpty()) {
//
//            try {
//                int idCita = Integer.parseInt(idCitaStr);
//                Date nuevaFecha = java.sql.Date.valueOf(nuevaFechaStr);
//                Time nuevaHora = java.sql.Time.valueOf(nuevaHoraStr);
//
//                citas cita = citasController.findcitas(idCita);
//                if (cita != null) {
//                    cita.setDia(nuevaFecha);
//                    cita.setHorario(nuevaHora);
//                    citasController.edit(cita);
//                    response.sendRedirect("SvMostrarCitas"); // Redirigir después de la modificación exitosa
//                } else {
//                    response.sendRedirect("error.jsp"); // Redirigir a una página de error si la cita no existe
//                }
//
//            } catch (NumberFormatException | NonexistentEntityException | Exception e) {
//                e.printStackTrace();
//                response.sendRedirect("error.jsp"); // Redirigir a una página de error
//            }
//        } else {
//            response.sendRedirect("error.jsp"); // Redirigir a una página de error
//        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
