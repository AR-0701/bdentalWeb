<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>B - DENTAL - Principal</title>
        <link rel="stylesheet" href="PrincipalAsistente.css">
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
                <div class="sidebar" id="sidebar">
                    <div class="menu-toggle" id="menuToggle">
                        <span>&#9776;</span>
                    </div>
                    <ul>
                        <li><a href="PrincipalAsistente.jsp">Principal</a></li>
                        <li><a href="registrar_citas.jsp">Registrar citas a clientes</a></li>
                        <li><a href="consultarregistrocitastablas.jsp">Consulta de registro de citas</a></li>
                        <li><a href="AsistentesServicios.jsp">Servicios</a></li>
                        <li><a href="AsistentesPromociones.jsp">Promociones</a></li>
                    </ul>
                </div>
            </header>
            
            
            
            
            

            <main>
                <section class="content">
                    <img src="imagenes/n-removebg-preview.png" alt="Recepción">
                    <h1 id="textBPrincipa">¡Bienvenido!</h1>
                    <p>Juan Hernández Garcia</p>
                    <p>"Transformando Sonrisas"</p>
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

