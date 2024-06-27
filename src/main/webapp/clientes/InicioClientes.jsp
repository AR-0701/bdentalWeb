<%@page import="codigo.citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clientes</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="citas_clientes1.css">
    </head>
    <body>
        <div class="Principal">
            <header>
                <div class="logo2">
                    <a href="${pageContext.request.contextPath}/inicio_principal.jsp">
                        <img src="${pageContext.request.contextPath}/imagenes/loogo.png" class="logo" alt="B - DENTAL">
                    </a>
                </div>
                <div class="user-menu">
                    <img src="${pageContext.request.contextPath}/imagenes/cerrarsesion.png" class="user-icon" alt="Usuario">
                    <div class="dropdown-menu" id="dropdownMenu">
                        <a href="index.jsp">Cerrar sesión</a>
                    </div>
                </div>
                <div class="menu">
                    <div class="menu-toggle" id="menuToggle">
                        <span>&#9776;</span>
                    </div>
                    <nav class="menu1" id="menu1">
                        <ul>
                            <li><a href="ClienteCasos.jsp">Casos clinicos</a></li>
                            <li><a href="PromocionCliente.jsp">Promociones</a></li>
                            <li><a href="ClienteServicios.jsp">Servicios</a></li>
                        </ul>
                    </nav>
                </div>
            </header>
            <main>
                <section class="about">
                    <div class="text-content">
                        <div class="Titulo">
                            <h2>¡Bienvenido!</h2>
                        </div>
                        <div class="eslogan">
                            <h3>A B-DENTAL</h3>
                        </div>
                        <div class="parra">
                            <p>Sonrrie con confianza, cuidamos
                                de tu salud dental. Agenda tu cita
                                en nuestro consultorio dental.</p>
                        </div>
                        <div class="button-container">
                            <a href="${pageContext.request.contextPath}/Agendar.jsp" class="login-button">Agendar</a>
                            <a href="${pageContext.request.contextPath}/SvModificarCita" class="login-button">Consultar</a>
                        </div>
                    </div>
                    <div class="image-section">
                        <img src="${pageContext.request.contextPath}/imagenes/brayan.png" alt="Dentist with a child">
                    </div>  
                </section>
            </main>
        </div>
        <script >
            document.addEventListener('DOMContentLoaded', function () {
                const menuToggle = document.getElementById('menuToggle');
                const menu1 = document.querySelector('.menu1');

                menuToggle.addEventListener('click', function () {
                    menu1.classList.toggle('show');
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
