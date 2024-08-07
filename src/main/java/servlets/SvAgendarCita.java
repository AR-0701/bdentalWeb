package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import logica.Controladora;
import logica.citas;
import logica.clientes;
import logica.horarios;
import logica.usuarios;
import persistencia.citasJpaController;

@WebServlet(name = "SvAgendarCita", urlPatterns = {"/SvAgendarCita"})
public class SvAgendarCita extends HttpServlet {

    Controladora control = new Controladora();
    citasJpaController citas = new citasJpaController();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetros del formulario
        String fechaStr = request.getParameter("fechaSeleccionada");
        String horarioStr = request.getParameter("hora");
        String idClienteStr = request.getParameter("idCli"); // Nuevo campo para ID del cliente

        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = null;
        try {
            fecha = formato.parse(fechaStr);
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Formato de fecha inválido.");
            return;
        }

        Time horario = Time.valueOf(horarioStr + ":00");
        int idCliente = Integer.parseInt(idClienteStr);

        // Obtener el usuario que inició sesión
        HttpSession session = request.getSession();
        usuarios usuarioSesion = (usuarios) session.getAttribute("usuario");
        System.out.println("el id usuario es" + (usuarios) session.getAttribute("usuario"));

        // Obtener el cliente especificado en el formulario
        clientes cliente = control.obtenerClientePorId(idCliente);

        // Obtener el objeto horario correspondiente
        horarios horarioObj = control.obtenerIDPorFecha(fecha);

        // Comprobar si ya existe una cita en la fecha seleccionada
        Date ultimaFechaCita = citas.getFechaUltimaCita(idCliente);
        LocalDate hoy = LocalDate.now();

        if (ultimaFechaCita != null) {
            LocalDate fechaUltimaCita = ultimaFechaCita.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            if (!fechaUltimaCita.isBefore(hoy)) {
                // Ya existe una cita para este cliente y la fecha no ha pasado
                response.sendError(HttpServletResponse.SC_CONFLICT, "Ya existe una cita programada para esta fecha.");
                return;
            }
        }

        // Crear la nueva cita
        citas nuevaCita = new citas();
        nuevaCita.setHorario(horario);
        nuevaCita.setDia(fecha);
        nuevaCita.setCliente(cliente);
        nuevaCita.setUsuario(usuarioSesion); // Registrar quien realizó la acción
        nuevaCita.setHorarioObj(horarioObj);

        // Persistir la cita
        control.crearCita(nuevaCita);
        // Redirigir a la página de confirmación o a la misma página con un mensaje de éxito
        response.sendRedirect("confirmacionCita.jsp?success=true");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
