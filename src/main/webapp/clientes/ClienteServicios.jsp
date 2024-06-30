<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Servicios</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="cliente.css">
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
                        <a href="${pageContext.request.contextPath}/SvCerrarSesion">Cerrar sesión</a>
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
                            <li><a href="InicioClientes.jsp">Agendar citas</a></li>
                        </ul>
                    </nav>
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
                            <p>-  Brackets.</p>
                            <p>-  Implantes.</p>
                            <p>-  Extracciòn..</p>
                        </div>
                    </div>
                    <div class="image-section">
                        <img src="${pageContext.request.contextPath}/imagenes/servicio.png" alt="Error al cargar la imagen">
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
