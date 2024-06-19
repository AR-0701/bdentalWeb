<%-- 
    Document   : AdmiServicio
    Created on : 15/06/2024, 08:56:31 PM
    Author     : wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>B - DENTAL - Principal</title>
        <link rel="stylesheet" href="Admi2.css">
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo2">
                    <a href="PrincipaAdmin.jsp">
                        <img src="imagenes/loogo.png" class="logo" alt="B - DENTAL">
                    </a>
                </div>
                <div class="user-menu">
                    <img src="imagenes/cerrarsesion.png" class="user-icon" alt="Usuario">
                    <div class="dropdown-menu" id="dropdownMenu">
                        <a href="index.jsp">Cerrar sesión</a>
                    </div>
                </div>
                <!-- Agrega el contenedor del menú desplegable -->
                <div class="sidebar" id="sidebar">
                    <!-- Movemos las rayitas aquí -->
                    <div class="menu-toggle" id="menuToggle">
                        <span>&#9776;</span>
                    </div>
                    <!-- Agrega el menú que se desplegará -->
                    <ul>
                        <li><a href="PrincipaAdmin.jsp">Principal</a></li>
                        <li><a href="#">Registrar citas a Clientes</a></li>
                        <li><a href="#">Consulta del registro de citas</a></li>
                        <li><a href="mHorarios.jsp">Modificar Horarios</a></li>
                        <li><a href="RegsitrarAsistentes.jsp">Registrar Asistentes</a></li>
                        <li><a href="SvMostrarAsistentes">Ver Asistentes</a></li>
                        <li><a href="AdmiPromociones.jsp">Promociones</a></li>
                    </ul>
                </div>
            </header>

            <main>
                <section class="about">
                    <div class="text-content3">
                        <div class="Titulo2">
                            <h2>Servicios</h2>
                        </div>
                        <div class="parra3">
                            <p>- Cirugía.</p>
                            <p>- Blanqueamiento.</p>
                            <p>- Blanqueamiento.</p>
                            <p>- Odontología general.</p>
                            <p>- Brackets.</p>
                            <p>- Implantes.</p>
                            <p>- Extracción.</p>
                            <p>- Etrapion.</p>
                        </div>
                    </div>
                    <div class="image-section">
                        <img src="imagenes/servicio.png" alt="Error al cargar la imagen">
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
                    <h3>Correo:</h3>
                    <p>bdentaly@gmail.com</p>
                </div>
                <div class="footer-section legal">
                    <p>Los contenidos publicados por InboundCycle - Agencia de Inbound Marketing están elaborados y supervisados por un equipo de expertos en marketing y ventas con el objetivo de proporcionar a los usuarios información del sector veraz y actualizada. El uso de esta página web está sujeto a nuestro aviso legal, nuestra política de privacidad y nuestra política de cookies. InboundCycle © 2024.</p>
                </div>
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
            });
        </script>
    </body>
</html>