<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" 
              content="width=device-width, initial-scale=1.0">
        <title>B - DENTAL</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="inicio.css">
    </head>
    <body>
        <div class="container">
            <header>
                <div class="logo2">
                    <a href="index.jsp">
                        <img src="imagenes/loogo.png" class="logo" alt="B - DENTAL">
                    </a>
                </div>             
                <div class="menu">
                    <div class="menu-toggle" id="menuToggle">
                        <span>&#9776;</span>
                    </div>
                    <nav class="menu1" id="menu1">
                        <ul>                          
                            <li><a href="Casos_clinicos.jsp">| Casos Cl�nicos |</a></li>
                            <li><a href="Servicios.jsp">| Servicios |</a></li>
                            <li><a href="Promociones.jsp">| Promociones |</a></li>
                        </ul>
                    </nav>
                </div>
            </header>
            <main>
                <section class="about">
                    <div class="text-content">
                        <div class="Titulo">
                            <h2>B - DENTAL</h2>
                        </div>
                        <div class="eslogan">
                            <h3>Transformando sonrisas</h3>
                        </div>
                        <div class="parra">
                            <p>El consultorio B-DENTAL ofrece sus servicios de calidad con el objetivo de satisfacer y mantener una buena comunicaci�n con nuestros clientes.</p>
                        </div>
                        <div class="button-container">
                            <a href="login.jsp" class="login-button">Iniciar Sesi�n</a>
                        </div>
                    </div>
                    <div class="image-section">
                        <img src="imagenes/prin.png" alt="Dentist with a child">
                    </div>
                </section>
            </main>
            <footer>
                <div class="footer-section location">
                    <h3>Ubicaci�n:</h3>
                    <p>Circuito 7 H. Cocoyoc MZ 88 LOTE 8-B, Ex. Hacienda Santa In�s, 55796, M�xico, M�xico.</p>
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
    </body>
</html>
