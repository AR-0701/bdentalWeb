
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;

@WebServlet(name = "SvAsistentes", urlPatterns = {"/SvAsistentes"})
public class SvAsistentes extends HttpServlet {

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
        String color = request.getParameter("color");
        String rol = "Asistente"; // Puedes ajustar esto según tus necesidades

        if (control.existeCorreo(email)) {
            // Correo ya existe
            request.setAttribute("errorMessage", "El correo ya existe. Por favor, use otro correo.");
            request.getRequestDispatcher("RegsitrarAsistentes.jsp").forward(request, response);
        } else {
            // Crear usuario con credenciales
            control.crearUsuarioAsistente(nombre, apellidoPa, apellidoMa, email, telefono, rol, password, genero, fechaNacimiento, color);
            response.sendRedirect("PrincipaAdmin.jsp");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
