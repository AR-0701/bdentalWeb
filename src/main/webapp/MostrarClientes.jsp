<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="logica.clientes" %>
<%@ page import="logica.usuarios" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ include file="/verificarSesion.jsp" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver Clientes</title>
        <link rel="stylesheet" href="admiprue.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* Estilos para la barra de búsqueda */
            .search-container {
                margin-bottom: 20px;
            }
            .search-input {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo2">
                    <%                        
                        session = request.getSession(false);
                        usuario = null;
                        if (session != null) {
                            usuario = (usuarios) session.getAttribute("usuario");
                        }
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
                    <div class="menu-toggle" id="menuToggle">
                        <span>&#9776;</span>
                    </div>
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
                        <div class="Titulo modify-title"><h1>Ver Clientes</h1></div>
                    </div>
                </div>
                <div class="button1">
                    <a href="RegistroClientes.jsp">
                        <button type="button">Registrar Nuevo Cliente</button>
                    </a>
                </div>

                <div class="search-container">
                    <input type="text" id="searchInput" class="search-input" placeholder="Buscar por nombre...">
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre Completo</th>
                                <th>Correo</th>
                                <th>Género</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody id="clientTableBody"> 
                            <%
                                
                                List<clientes> listaClientes = null;
                                System.out.println(" " + listaClientes);
                                if (session != null) {
                                    listaClientes = (List<clientes>) session.getAttribute("listaClientes");
                                }

                                if (listaClientes != null) {
                                    for (clientes cliente : listaClientes) {
                            %>
                            <tr data-id="<%= cliente.getUsuario().getIdUsuario()%>">
                                <td><%= cliente.getIdCliente()%></td>
                                <td><%= cliente.getUsuario().getNombre()%> <%= cliente.getUsuario().getApellidoPa()%> <%= cliente.getUsuario().getApellidoMa()%></td>
                                <td><%= cliente.getUsuario().getEmail()%></td>
                                <td><%= cliente.getUsuario().getGenero()%></td>
                                <td>
                                    <button class="agendarCitaBtn" data-id="<%= cliente.getIdCliente()%>">Agendar Cita</button>
                                </td>
                            </tr>
                            <%
                                    }
                                } else {
                                    out.println("<tr><td colspan='5'>No hay clientes disponibles o la lista de clientes es nula.</td></tr>");
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
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var menuToggle = document.getElementById("menuToggle");
                var sidebar = document.getElementById("sidebar");
                var menuVisible = false;
                menuToggle.addEventListener("click", function () {
                    if (!menuVisible) {
                        sidebar.style.left = "0";
                        menuToggle.style.left = "250px";
                        menuVisible = true;
                    } else {
                        sidebar.style.left = "-250px";
                        menuToggle.style.left = "20px";
                        menuVisible = false;
                    }
                });

                var userIcon = document.querySelector(".user-icon");
                var dropdownMenu = document.getElementById("dropdownMenu");
                userIcon.addEventListener("click", function () {
                    dropdownMenu.classList.toggle("show");
                });

                document.querySelectorAll('.agendarCitaBtn').forEach(button => {
                    button.addEventListener('click', function () {
                        var idCli = this.getAttribute('data-id');
                        if (idCli) {
                            var url = "AgendarCllentesAsis.jsp?idCli=" + idCli;
                            window.location.href = url;
                        } else {
                            console.error("ID Cliente no encontrado");
                        }
                    });
                });

                // Funcionalidad de búsqueda
                var searchInput = document.getElementById('searchInput');
                searchInput.addEventListener('input', function () {
                    var filter = searchInput.value.toLowerCase();
                    var rows = document.querySelectorAll('#clientTableBody tr');
                    rows.forEach(row => {
                        var nombreCompleto = row.cells[1].innerText.toLowerCase();
                        if (nombreCompleto.includes(filter)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                });
            });
        </script>
    </body>
</html>
