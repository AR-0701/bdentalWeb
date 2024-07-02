<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="logica.asistentes" %>
<%@ page import="logica.usuarios" %>
<%@ include file="/verificarSesion.jsp" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver Asistentes</title>
        <link rel="stylesheet" href="admiprue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo2">
                    <%
                        String principalPage = "login.jsp"; // Default fallback in case session or user is not found
                        if (session != null && session.getAttribute("usuario") != null) {
                            String userRole = usuario.getRol();

                            if ("Administrador".equals(userRole)) {
                                principalPage = "admin/PrincipaAdmin.jsp";
                            } else if ("Asistente".equals(userRole)) {
                                principalPage = "asistentes/PrincipalAsistente.jsp";
                            } else if ("Cliente".equals(userRole)) {
                                principalPage = "clientes/InicioClientes.jsp";
                            } else {
                                principalPage = "index.jsp";
                            }
                        }
                    %>
                    <a href="${pageContext.request.contextPath}/<%= principalPage%>">
                        <img src="${pageContext.request.contextPath}/imagenes/loogo.png" class="logo" alt="B - DENTAL">
                    </a>
                </div>
                <div class="user-menu">
                    <img src="imagenes/cerrarsesion.png" class="user-icon" alt="Usuario">
                    <div class="dropdown-menu" id="dropdownMenu">
                        <a href="${pageContext.request.contextPath}/SvCerrarSesion">Cerrar sesión</a>
                    </div>
                </div>
                <div class="sidebar" id="sidebar">
                    <!-- Movemos las rayitas aquí -->
                    <div class="menu-toggle" id="menuToggle">
                        <span>&#9776;</span>
                    </div>
                    <!-- Agrega el menú que se desplegará -->
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/SvMostrarClientes">Ver clientes/Agendar</a></li>
                        <li><a href="${pageContext.request.contextPath}/mCitas.jsp">Consulta del registro de citas</a></li>
                        <li><a href="${pageContext.request.contextPath}/mHorario.html">Modificar Horarios</a></li>
                        <li><a href="${pageContext.request.contextPath}/RegsitrarAsistentes.jsp">Registrar Asistentes</a></li>
                        <li><a href="${pageContext.request.contextPath}/SvMostrarAsistentes">Ver Asistentes</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/AdmiServicio.jsp">Servicios</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/AdmiPromociones.jsp">Promociones</a></li>
                    </ul>
                </div>

            </header>
            <main class="main">
                <div class="about">
                    <div class="text-content">
                        <div class="Titulo modify-title"><h1>Ver Asistentes</h1></div>
                    </div>
                </div>
                <form id="deleteForm" class="delete-form" action="SvEliminarAsistente" method="POST">
                    <div class="delete-form-group">
                        <label for="deleteId">ID del Asistente:</label>
                        <input type="text" id="id" name="id" placeholder="id a borrar" required>                   
                    </div>
                    <button type="submit">Eliminar Asistente</button>
                </form>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Identificador</th>
                            </tr>
                        </thead>
                        <%                            List<asistentes> listaAsistentes = (List<asistentes>) request.getSession().getAttribute("listaAsistentes");
                        %>
                        <tbody> 
                            <%
                                if (listaAsistentes != null) {
                                    for (asistentes asist : listaAsistentes) {
                            %>
                            <tr name = data-id id=data-id data-id="<%= asist.getUsuario().getIdUsuario()%>">
                                <td><%= asist.getIdAsistente()%></td>
                                <td><%= asist.getUsuario().getNombre()%> <%= asist.getUsuario().getApellidoPa()%> <%= asist.getUsuario().getApellidoMa()%></td>
                                <td>
                                    <div style="width: 20px; height: 20px; background-color: <%= asist.getIdentificador()%>; border-radius: 50%; margin: auto;"></div>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </main>
            <footer>
                <!-- Contenido del pie de página -->
            </footer>
        </div>
        <!-- Agregamos el script JavaScript -->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var menuToggle = document.getElementById("menuToggle");
                var sidebar = document.getElementById("sidebar");
                var menuVisible = false;

                menuToggle.addEventListener("click", function () {
                    if (!menuVisible) {
                        sidebar.style.left = "0";
                        menuToggle.style.left = "250px"; /* Movemos las rayitas a la derecha */
                        menuVisible = true;
                    } else {
                        sidebar.style.left = "-250px";
                        menuToggle.style.left = "20px"; /* Movemos las rayitas a la izquierda */
                        menuVisible = false;
                    }
                });

                var userIcon = document.querySelector(".user-icon");
                var dropdownMenu = document.getElementById("dropdownMenu");

                userIcon.addEventListener("click", function () {
                    dropdownMenu.classList.toggle("show");
                });
            });
        </script>
    </body>
</html>
