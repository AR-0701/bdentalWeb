package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.citasJpaController;
import persistencia.exceptions.NonexistentEntityException;

@WebServlet(name = "svElliminarCita", urlPatterns = {"/svElliminarCita"})
public class svElliminarCita extends HttpServlet {

    private citasJpaController citasController;

    public svElliminarCita() {
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
        int idCita = Integer.parseInt(request.getParameter("idCita"));

        // Llamar al controlador JPA para eliminar la cita
        try {
            citasController.destroy(idCita);
            // Redirigir a una página de éxito o a la lista de citas actualizada
            response.sendRedirect("SvModificarCita"); // Cambia esto al destino deseado
        } catch (Exception ex) {
            // Manejo de errores - puedes redirigir a una página de error
            response.sendRedirect("error.jsp"); // Página de error personalizada
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
