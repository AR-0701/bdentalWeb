package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import persistencia.exceptions.NonexistentEntityException;

@WebServlet(name = "SvEliminarAsistente", urlPatterns = {"/SvEliminarAsistente"})
public class SvEliminarAsistente extends HttpServlet {

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
        String idStr = request.getParameter("id");

        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                control.eliminarAsistente(id);
                response.sendRedirect("SvMostrarAsistentes"); // Redirigir después de la eliminación exitosa
                return;
            } catch (NumberFormatException e) {
                e.printStackTrace();
            } catch (NonexistentEntityException ex) {
                ex.printStackTrace();
                // Aquí podrías redirigir o mostrar un mensaje de error específico según tu necesidad
            }
        }

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Error al eliminar asistente</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Error al eliminar asistente</h1>");
            out.println("<p>No se pudo eliminar el asistente. Por favor, intenta nuevamente.</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
