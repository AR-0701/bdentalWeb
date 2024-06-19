/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.asistentes;
import com.google.gson.Gson;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import logica.usuarios;

@WebServlet(name = "SvMostrarAsistentes", urlPatterns = {"/SvMostrarAsistentes"})
public class SvMostrarAsistentes extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<asistentes> listaAsistentes = control.obtenerAsistentes();
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("listaAsistentes", listaAsistentes);
        System.out.println("usuarios:" + listaAsistentes.get(0));
        response.sendRedirect("verAsistentes.jsp");
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
