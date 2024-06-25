package servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.horarios;

@WebServlet(name = "SvObtenerDiasBloqueados", urlPatterns = {"/SvObtenerDiasBloqueados"})
public class SvObtenerDiasBloqueados extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<horarios> horariosBloqueados = control.obtenerHorariosBloqueados();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (horariosBloqueados != null) {
            String json = new Gson().toJson(horariosBloqueados);
            response.getWriter().write(json);
        } else {
            response.getWriter().write("[]");
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
