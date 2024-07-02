
<%@page import="logica.usuarios"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" 
              content="width=device-width, initial-scale=1.0">
        <title>Promociones</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="inicio.css">
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo2">
                    <%
                        usuarios usuario = (usuarios) session.getAttribute("usuario");
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
                <div class="menu">
                    <div class="menu-toggle" id="menuToggle">
                        <span>&#9776;</span>
                    </div>
                    <nav class="menu1" id="menu1">
                        <ul>
                            <li><a href="index.jsp">| Principal |</a></li>
                            <li><a href="Casos_clinicos.jsp">| Casos Clínicos |</a></li>
                            <li><a href="Servicios.jsp">| Servicios |</a></li>
                        </ul>
                    </nav>
                </div>
            </header>
            <section class="container1">
                <div class="row">
                    <div class="col s12" >
                        <div class="carousel center-align" >
                            <div class="carousel-item" >
                                <image src ="imagenes/1.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="imagenes/2.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="imagenes/3.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="imagenes/4.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="imagenes/5.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="imagenes/6.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="imagenes/7.png" alt="">
                            </div>
                            <div class="carousel-item" >
                                <image src ="imagenes/8.png" alt="">
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
                    <h3>Correo:</h3>
                    <p>bdentaly@gmail.com</p>
                </div>
                <div class="footer-section legal">
                    <h3>Manual de usuario:</h3>
                    <p>
                        <a href="${pageContext.request.contextPath}/Manual/Manual de Usuario.pdf"target="_blank">Dar clic para abrir pdf</a>
                    </p>
                </div>
            </footer>
        </div>
        <script >
            document.addEventListener('DOMContentLoaded', function () {
                const menuToggle = document.getElementById('menuToggle');
                const menu1 = document.querySelector('.menu1');

                menuToggle.addEventListener('click', function () {
                    menu1.classList.toggle('show');
                });
            });
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="script.js"></script>

    </body>
</html>