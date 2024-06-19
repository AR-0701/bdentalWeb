<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ver Asistentes</title>
        <link rel="stylesheet" href="Admi1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <div class="sidebar" id="sidebar">
            <div class="menu-toggle" id="menuToggle">
                <span>&#9776;</span>
            </div>
            <ul>
                <li><a href="PrincipaAdmin.jsp">Principal</a></li>
                <li><a href="RegistroClientes.jsp">Registrar citas a Clientes</a></li>
                <li><a href="#">Consulta del registro de citas</a></li>
                <li><a href="mHorarios.jsp">Modificar Horarios</a></li>
                <li><a href="RegsitrarAsistentes.jsp">Registrar Asistentes</a></li>
                <li><a href="verAsistentes.jsp">Ver Asistentes</a></li>
                <li><a href="#">Servicioss</a></li>
                <li><a href="#">Promociones</a></li>
            </ul>
        </div>
        <div class="container">
            <header>
                <div class="logo2">
                    <a href="PrincipaAdmin.jsp">
                        <img src="imagenes/logoo.png" alt="B - DENTAL">
                    </a>
                </div>

            </header>
            <main class="main">
                <div class="about">
                    <div class="text-content">
                        <div class="Titulo modify-title"><h1>Ver Asistentes</h1></div>
                    </div>
                </div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Iapellido</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>01</td>
                                <td>Asistente ejemplo 1</td>
                                <td><div style="width: 20px; height: 20px; background-color: #b3ffab; border-radius: 50%; margin: auto;"></div></td>
                            </tr>
                            <tr>
                                <td>02</td>
                                <td>María Vázquez González</td>
                                <td><div style="width: 20px; height: 20px; background-color: #c8b3ff; border-radius: 50%; margin: auto;"></div></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="button-modify">
                    <button id="Registrar">Eliminar</button>
                </div>
            </main>
            <footer>
                <!-- Contenido del pie de página -->
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
                        menuToggle.style.left = "250px"; /* Mover el toggle a la derecha */
                        menuVisible = true;
                    } else {
                        sidebar.style.left = "-250px";
                        menuToggle.style.left = "20px"; /* Mover el toggle a la izquierda */
                        menuVisible = false;
                    }
                });

                // Resaltar fila seleccionada
                const rows = document.querySelectorAll("tbody tr");
                rows.forEach(row => {
                    row.addEventListener("click", function () {
                        rows.forEach(r => r.classList.remove("selected"));
                        this.classList.add("selected");
                    });
                });
            });
        </script>
    </body>
</html>
