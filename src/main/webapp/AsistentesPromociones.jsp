<%-- 
    Document   : AsistentesPromociones
    Created on : 14/06/2024, 01:05:20 PM
    Author     : wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>B - DENTAL - Principal</title>
        <link rel="stylesheet" href="Asistentes.css">
    </head>
    <body>
        <div class="menu-toggle" id="menuToggle">
                    <span>&#9776;</span>
                </div>
                
                <div class="sidebar" id="sidebar">
                    <ul>
                        <li><a href="#">Principal</a></li>
                        <li><a href="#">Registrar citas a Clientes</a></li>
                        <li><a href="#">Consulta del registro de citas</a></li>
                        <li><a href="AsistentesServicios.jsp">Servicios</a></li>
                    </ul>
                </div>
        <div class="container">
            <header>
                <div class="logo2">
                    <a href="inicio_principal.jsp">
                        <img src="imagenes/loogo.png" class="logo" alt="B - DENTAL">
                    </a>
                </div>
                
                
            </header>
              <main>
            <section class="carousel-container">
                <div class="carousel">
                    <div class="carousel-item">
                        <img src="imagenes/1.png" alt="Imagen 1">
                    </div>
                    <div class="carousel-item">
                        <img src="imagenes/2.png" alt="Imagen 2">
                    </div>
                    <div class="carousel-item">
                        <img src="imagenes/3.png" alt="Imagen 3">
                    </div>
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
                    <p>Los contenidos publicados por InboundCycle - Agencia de Inbound Marketing están elaborados y supervisados por un equipo de expertos en marketing y ventas con el objetivo de proporcionar a los usuarios información del sector veraz y actualizada. El uso de esta página web está sujeto a nuestro aviso legal, nuestra política de privacidad y nuestra política de cookies. InboundCycle © 2024.</p>
                </div>
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
                        sidebar.style.left = "-500px";
                        menuToggle.style.left = "20px";
                        menuVisible = false;
                    }
                });
            });
        </script>
    </body>
</html>