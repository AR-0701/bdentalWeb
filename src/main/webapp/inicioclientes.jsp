<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Clientes</title>
        <link rel="stylesheet" href="iniciocliente1.css">
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
                        <li><a href="#">Registrar citas a Clientes</a></li>
                        <li><a href="#">Consulta del registro de citas</a></li>
                        <li><a href="ClienteCasos.jsp">Casos Clinicos</a></li>
                        <li><a href="ClienteServicios.jsp">Servicios</a></li>
                        <li><a href="PromocionCliente.jsp">Promociones</a></li>
                    </ul>
                </div>
            </header>
            <main>
                <section class="content">
                    <img src="imagenes/brayan.png" alt="Recepción">
                    <h1 id="textBPrincipa">¡Bienvenido!</h1>
                    <p>A B-Dental</p>
                    <p>"Sonrie con confianza, cuidamos"</p>
                    <p>de tu salud mental". Agenda tu cita</p>
                    <p>en nuestro consultorio dental.</p>
                </section>
                <a href = "RegistroClientes.jsp">
                    <button id="registro-button" name="registro-button"  >Agendar</button>
                </a>
                <a href = "RegistroClientes.jsp">
                    <button id="registro-button" name="registro-button"  >Consultar</button>
                </a>
            </main>
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

