package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.clientes;
import logica.usuarios;
import persistencia.controladoraPersistencia;

@WebServlet(name = "SvBuscarCliente", urlPatterns = {"/SvBuscarCliente"})
public class SvBuscarCliente extends HttpServlet {

    controladoraPersistencia control = new controladoraPersistencia();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String nombreCompleto = request.getParameter("nombreCompleto");

        try {
            if (nombreCompleto != null && !nombreCompleto.trim().isEmpty()) {
                String[] nombreParts = nombreCompleto.split(" ");
                if (nombreParts.length >= 3) {
                    String nombre = nombreParts[0];
                    String apellidoPa = nombreParts[1];
                    String apellidoMa = nombreParts[2];

                    usuarios usuario = control.buscarUsuarioPorNombre(nombre, apellidoPa, apellidoMa);
                    if (usuario != null) {
                        clientes cliente = control.buscarClientePorUsuario(usuario.getIdUsuario());
                        if (cliente != null) {
                            String json = new Gson().toJson(cliente);
                            response.getWriter().write(json);
                            return;
                        }
                    }
                }
            }
            response.getWriter().write("{}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Internal Server Error\"}");
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
