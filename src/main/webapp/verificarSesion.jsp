<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page import="logica.usuarios" %>
<%
    usuarios usuario = (usuarios) session.getAttribute("usuario");

    if (usuario == null) {
        // Usuario no ha iniciado sesi�n
        request.setAttribute("errorMessage", "No ha iniciado sesi�n.");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        return;
    }

    String rol = usuario.getRol();
    String paginaActual = request.getRequestURI();

    // Define las rutas permitidas para cada rol
    boolean accesoPermitido = false;
    if (paginaActual.contains("InicioClientes.jsp") || paginaActual.contains("Agendar.jsp") || paginaActual.contains("ModificarCita.jsp")) {
        accesoPermitido = "Cliente".equals(rol);
    } else if (paginaActual.contains("PrincipalAsistentes.jsp") || paginaActual.contains("AgendarClientesAsis.jsp") || paginaActual.contains("MCitas.jsp") || paginaActual.contains("MostrarClientes.jsp")) {
        accesoPermitido = "Asistente".equals(rol) || "Administrador".equals(rol);
    } else if (paginaActual.contains("MHorarios.jsp") || paginaActual.contains("VerAsistentes.jsp") || paginaActual.contains("RegistrarAsistentes.jsp")) {
        accesoPermitido = "Administrador".equals(rol);
    }

    if (!accesoPermitido) {
        request.setAttribute("errorMessage", "No tiene permisos para acceder a esta p�gina.");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        return;
    }
%>