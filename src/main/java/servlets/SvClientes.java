package servlets;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.usuarios;

@WebServlet(name = "SvClientes", urlPatterns = {"/SvClientes"})
public class SvClientes extends HttpServlet {

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
        // Obtener parámetros del formulario
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nombre = request.getParameter("firstName");
        String apellidoPa = request.getParameter("lastName");
        String apellidoMa = request.getParameter("motherLastName");
        String genero = request.getParameter("gender");
        Date fechaNacimiento = Date.valueOf(request.getParameter("birthdate"));
        String telefono = request.getParameter("phone");
        String rol = "Cliente"; // Puedes ajustar esto según tus necesidades

        if (control.existeCorreo(email)) {
            // Correo ya existe
            request.setAttribute("errorMessage", "El correo ya existe. Por favor, use otro correo.");
            request.getRequestDispatcher("RegistroClientes.jsp").forward(request, response);
        } else {
            // Crear usuario con credenciales
            control.crearUsuarioCliente(nombre, apellidoPa, apellidoMa, email, telefono, rol, password, genero, fechaNacimiento);
            // Verificar la sesión y redirigir según el rol
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("usuario") != null) {
                usuarios usuario = (usuarios) session.getAttribute("usuario");
                String userRole = usuario.getRol();

                if ("Administrador".equals(userRole)) {
                    response.sendRedirect("admin/PrincipalAdmin.jsp");
                } else if ("Asistente".equals(userRole)) {
                    response.sendRedirect("asistentes/PrincipalAsistentes.jsp");
                } else {
                    response.sendRedirect("index.jsp"); // Default fallback
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
