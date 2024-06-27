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
import javax.servlet.http.HttpSession;
import logica.citas;
import logica.usuarios;
import persistencia.citasJpaController;
import persistencia.clientesJpaController;
import persistencia.controladoraPersistencia;

@WebServlet(name = "SvModificarCita", urlPatterns = {"/SvModificarCita"})
public class SvModificarCita extends HttpServlet {

    clientesJpaController clientesjpa = new clientesJpaController();

    controladoraPersistencia control = new controladoraPersistencia();
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
        HttpSession session = request.getSession();
        usuarios usuario = (usuarios) session.getAttribute("usuario");

        if (usuario != null) {
            int idUsuario = usuario.getIdUsuario();
            System.out.println("id Usuario servlet =" + idUsuario);
            int idCliente = clientesjpa.getIdClienteByIdUsuario(idUsuario);
            System.out.println("id cliente=" + idCliente);

            citas ultimaCita = control.obtenerUltimaCitaPorCliente(idCliente);
            request.setAttribute("ultimaCita", ultimaCita);
            request.getRequestDispatcher("modificarCitas.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
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
