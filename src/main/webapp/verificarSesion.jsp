<%@ page import="javax.servlet.http.HttpSession" %>|
<%@ page import="logica.usuarios" %>
<%
    usuarios usuario = (usuarios) session.getAttribute("usuario");

    if (usuario == null) {
        // Usuario no ha iniciado sesión
        request.setAttribute("errorMessage", "No ha iniciado sesión.");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        return;
    }

    String rol = usuario.getRol();
    String paginaActual = request.getRequestURI();

    // Define las rutas permitidas para cada rol
    boolean accesoPermitido = false;
    if (paginaActual.contains("InicioClientes.jsp") || paginaActual.contains("Agendar.jsp") || paginaActual.contains("modificarCitas.jsp")|| paginaActual.contains("ClienteCasos.jsp")|| paginaActual.contains("ClienteServicios.jsp")|| paginaActual.contains("PromocionCliente.jsp")) {
        accesoPermitido = "Cliente".equals(rol);
    } else if (paginaActual.contains("PrincipalAsistente.jsp") || paginaActual.contains("MostrarClientes.jsp") || paginaActual.contains("AgendarClientesAsis.jsp") || paginaActual.contains("mCitas.jsp") || paginaActual.contains("MostrarClientes.jsp") || paginaActual.contains("AsistentesPromociones.jsp")|| paginaActual.contains("AsistentesServicios.jsp")) {
        accesoPermitido = "Asistente".equals(rol);
    } else if (paginaActual.contains("PrincipaAdmin.jsp") || paginaActual.contains("MostrarClientes.jsp") || paginaActual.contains("mCitas.jsp") || paginaActual.contains("") || paginaActual.contains("mHorario.jsp") || paginaActual.contains("RegsitrarAsistentes.jsp") || paginaActual.contains("verAsistentes.jsp") || paginaActual.contains("AdmiServicio.jsp") || paginaActual.contains("AdmiPromociones.jsp")) {
        accesoPermitido = "Administrador".equals(rol);
    }

    if (!accesoPermitido) {
        request.setAttribute("errorMessage", "No tiene permisos para acceder a esta página.");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        return;
    }
%>
