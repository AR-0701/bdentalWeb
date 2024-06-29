<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Promociones</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="Admi2.css">
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo2">
                    <a href="PrincipaAdmin.jsp">
                        <img src="${pageContext.request.contextPath}/imagenes/loogo.png" class="logo" alt="B - DENTAL">
                    </a>
                </div>
                <div class="user-menu">
                    <img src="${pageContext.request.contextPath}/imagenes/cerrarsesion.png" class="user-icon" alt="Usuario">
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
                        <li><a href="${pageContext.request.contextPath}/mCitas">Consulta del registro de citas</a></li>
                        <li><a href="mHorarios.jsp">Modificar Horarios</a></li>
                        <li><a href="RegsitrarAsistentes.jsp">Registrar Asistentes</a></li>
                        <li><a href="${pageContext.request.contextPath}/SvMostrarAsistentes">Ver Asistentes</a></li>
                        <li><a href="AdmiServicio.jsp">Servicios</a></li>
                    </ul>
                </div>
            </header>
            <section class="container1">
                <div class="row">
                    <div class="col s12" >
                        <div class="carousel center-align" >
                            <div class="carousel-item" >
                                <image src ="${pageContext.request.contextPath}/imagenes/1.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="${pageContext.request.contextPath}/imagenes/2.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="${pageContext.request.contextPath}/imagenes/3.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="${pageContext.request.contextPath}/imagenes/4.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="${pageContext.request.contextPath}/imagenes/5.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="${pageContext.request.contextPath}/imagenes/6.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="${pageContext.request.contextPath}/imagenes/7.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="${pageContext.request.contextPath}/imagenes/8.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </section>
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
                    <h3>
                        <a href="${pageContext.request.contextPath}/Manual/Manual de Usuario.pdf"target="_blank">Dar clic para abrir pdf</a>
                    </h3>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="script.js"></script>
    </body>
</html>
