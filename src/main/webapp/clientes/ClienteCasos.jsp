<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/verificarSesion.jsp" %>

<!DOCTYPE html>

<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Casos Clinicos</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="cliente.css">
    </head>
    <body>
        <div class="Principal">
            <header>
                <div class="logo2">
                    <%                        String principalPage = "login.jsp"; // Default fallback in case session or user is not found
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
                    <img src="${pageContext.request.contextPath}/imagenes/cerrarsesion.png" class="user-icon" alt="Usuario">
                    <div class="dropdown-menu" id="dropdownMenu">
                        <a href="${pageContext.request.contextPath}/SvCerrarSesion">Cerrar sesión</a>
                    </div>
                </div>
                <div class="menu">
                    <div class="menu-toggle" id="menuToggle">
                        <span>&#9776;</span>
                    </div>
                    <nav class="menu1" id="menu1">
                        <ul>
                            <li><a href="PromocionCliente.jsp">Promociones</a></li>
                            <li><a href="ClienteServicios.jsp">Servicios</a></li>
                            <li><a href="InicioClientes.jsp">Agendar citas</a></li>
                        </ul>
                    </nav>
                </div>
            </header>
            <main>
                <section class="about">
                    <div class="text-content2">
                        <div class="Titulo1">
                            <h2>Casos Clínicos</h2>
                        </div>
                        <div class="parra1">
                            <p>- En la serie periapical completa realizada, se observa un patrón de pérdida ósea horizontal generalizado 
                                y presencia de imágenes compatibles con defectos intraóseos tipo cráter que se pueden observar sobre todo a nivel de los dientes.</p>
                        </div>
                        <div class="parra2">
                            <p>- Finalmente, el diagnostico Nos encontramos ante una periodontitis crónica avanzada generalizada. 
                                Crónica porque la progresión de la enfermedad es lenta y no existe agregación familiar. Avanzada por la presencia de 
                                pérdida del nivel de inserción mayores o iguales a 5mm. Generalizada, ya que afecta a más del 30% de las localizaciones.</p>
                        </div>
                    </div>
                    <div class="image-section">
                        <img src="${pageContext.request.contextPath}/imagenes/caso.jpg" alt="Error al cargar la imagen">
                    </div>
                </section>
            </main>
            <footer>
                <div class="footer-section location">
                    <h3>Ubicación:</h3>
                    <p>Circuito 7 H. Cocoyoc MZ 88 LOTE 8-B, Ex. Hacienda Santa Inés, 55796, México, México.</p>
                </div>
                <div class="footer-section contact">
                    <h3>Contacto:</h3>
                    <p>Tel: 55-12-47-02-06</p>
                    <p>Correo: bdentaly@gmail.com</p>
                </div>
                <div class="footer-section legal">
                    <h3>Manual de usuario:</h3>
                    <p>
                        <a href="${pageContext.request.contextPath}/Manual/Manual de Usuario.pdf"target="_blank">Dar clic para abrir pdf</a>
                    </p>
                </div>
            </footer>
        </div>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var userIcon = document.querySelector(".user-icon");
                var dropdownMenu = document.getElementById("dropdownMenu");

                userIcon.addEventListener("click", function () {
                    dropdownMenu.classList.toggle("show");
                });
            });
        </script>
    </body>
</html>

