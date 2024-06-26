<%-- 
    Document   : prueba
    Created on : 25 jun. 2024, 18:41:36
    Author     : edriv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link rel="stylesheet" href="consultar_tablas_citas.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="sidebar" id="sidebar">
                    <div class="menu-toggle" id="menuToggle">
                        <span>&#9776;</span>
                    </div>
                    <ul>
                        <li><a href="PrincipalAsistente.jsp">Principal</a></li>
                        <li><a href="registrar_citas.jsp">Registrar citas a clientes</a></li>
                        <li><a href="consultarregistrocitastablas.jsp">Consulta de registro de citas</a></li>
                        <li><a href="Servicios.jsp">Servicios</a></li>
                        <li><a href="AsistentesPromociones.jsp">Promociones</a></li>
                    </ul>
                </div>
         <div class="principal">
            <div class="cabesera">
                <div class="p1"><%--imagen con la letra--%>
                    <img src="imagenes\logo.png">
                    <p>B - Dental</p>
                </div><%--imagen con la letra--%>
                <div class= "consultaregistro">
                    <p>Consulta de registro de citas</p>
                </div>
                <div class="p2">
                    <img src="imagenes\cerrarsesion.png">
                </div>
                </div>
                <div class="contenedortabla">
                    <div class="tabla">
               <img src="imagenes\lapiz.jpg">
                    <table id="miTabla">
                        <thead>
                            <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Hora</th>
                            </tr>
                        </thead>
                    </table>
               <script> <%--codigo para que cada vez que se meta un dato, la tabla aumente filas--%>
        document.addEventListener("DOMContentLoaded", function() {
            fetch('/datos')
                .then(response => response.json())
                .then(data => {
                    const tabla = document.getElementById('miTabla').getElementsByTagName('tbody')[0];
                    data.forEach(row => {
                        const nuevaFila = tabla.insertRow();
                        const nuevaCelda1 = nuevaFila.insertCell(0);
                        const nuevaCelda2 = nuevaFila.insertCell(1);
                        const nuevaCelda3 = nuevaFila.insertCell(2);
                        nuevaCelda1.textContent = row.columna1;
                        nuevaCelda2.textContent = row.columna2;
                        nuevaCelda3.textContent = row.columna3;
                    });
                })
                .catch(error => console.error('Error al cargar los datos:', error));
        });
    </script>
                    </div> 
                </div>
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
