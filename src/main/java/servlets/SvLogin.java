package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.Controladora;
import logica.usuarios;

@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //--------------- Reacabar Datos
        String email = request.getParameter("email");
        String password = request.getParameter("password");
//--------------------------Verificar
        usuarios user = control.verificarCredenciales(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", user);
            String nombreCompleto = user.getNombre() + " " + user.getApellidoPa() + " " + user.getApellidoMa();
            session.setAttribute("nombreCompleto", nombreCompleto);
            session.setAttribute("idCliente", user.getIdUsuario());
            System.out.println("id es" + user.getIdUsuario());
            session.setAttribute("usuarioRol", user.getRol());

            //------------------Verificar Rol
            switch (user.getRol()) {
                case "Administrador":
                    response.sendRedirect("admin/PrincipaAdmin.jsp");
                    break;
                case "Asistente":
                    response.sendRedirect("asistentes/PrincipalAsistente.jsp");
                    break;
                case "Cliente":
                    response.sendRedirect("clientes/InicioClientes.jsp");
                    break;
                default:
                    response.sendRedirect("LoginError.jsp");
                    break;
            }
        } else {

            request.setAttribute("errorMessage", "Credenciales inválidas. Por favor, intente nuevamente.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
