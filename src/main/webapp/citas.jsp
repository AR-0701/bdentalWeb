<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="citas.css" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 20%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
            cursor: pointer;
        }
        th {
            background-color: #f2f2f2;
        }
        td.selected {
            background-color: #4CAF50;
            color: white;
        }
        .bloqueado {
            background-color: #f2f2f2; /* Cambia esto al color deseado */
            /* Otros estilos opcionales */
        }
    </style>
    <body>
        <div class="principal">
            <div class="cabecera">
                <div class="p1">
                    <img src="imagenes/logo.png" alt="Logo">
                    <p>B - Dental</p>
                </div>
                <div class="p2">
                    <a href="cerrarsesion.jsp">
                        <img src="imagenes/cerrarsesion.png" alt="Cerrar sesión">
                    </a>
                </div>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="index.jsp">Principal</a></li>
                    <li><a href="Casos_clinicos.jsp">Casos clínicos</a></li>
                    <li><a href="Promociones.jsp">Promociones</a></li>
                    <li><a href="Servicios.jsp">Servicios</a></li>
                    <li><a href="inicioClientes.jsp">Agendar citas</a></li>
                </ul>
            </div>

            <div class="contenido_principal">
                <form action="agendarCita.jsp" method="post">
                    <div class="pedir_datos">
                        <div class="p3">
                            <label for="nombre">Nombre completo:</label>
                        </div>
                        <div class="p4">
                            <input type="text" id="nombre" name="nombre" required><br><br>
                        </div>
                    </div>
                    <div class="pedir_datos">
                        <div class="p3">
                            <label for="genero">Género:</label>
                        </div>
                        <div class="p4">
                            <input type="text" id="genero" name="genero" required><br><br>
                        </div>
                        
                    </div>

                    <div class="calendario">
                        <div class="caler"></div>
                        <div class="horas">
                            <label for="opciones">Hora:</label>
                            <select id="opciones" name="opciones">
                                <option value="11:00">11:00</option>
                                <option value="12:00">12:00</option>
                                <option value="13:00">13:00</option>
                                <option value="14:00">14:00</option>
                                <option value="15:00">15:00</option>
                            </select>
                        </div>
                    </div>

                    <div class="boton">
                        <input type="submit" value="Agendar">
                    </div>
                    <input type="hidden" id="fechaSeleccionada" name="fechaSeleccionada">
                </form>
                <div class="calendar-container">
                    <h2 id="nombreMes"></h2>
                    <table id="calendar">
                        <thead>
                            <tr>
                                <th>Dom.</th>
                                <th>Lun.</th>
                                <th>Mar.</th>
                                <th>Mié.</th>
                                <th>Jue.</th>
                                <th>Vie.</th>
                                <th>Sáb.</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var calendarBody = document.querySelector('#calendar tbody');
                var nombreMes = document.getElementById('nombreMes');
                var fechaSeleccionadaInput = document.getElementById('fechaSeleccionada');
                var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
                var fechaActual = new Date();
                var mesActual = fechaActual.getMonth();
                var anoActual = fechaActual.getFullYear();
                nombreMes.textContent = meses[mesActual] + ' ' + anoActual;

                // Variable para almacenar la fecha seleccionada
                let fechaSeleccionada = '';

                // Función para obtener la fecha en formato AAAA-MM-DD
                function obtenerFechaAAAAMMDD(d) {
                    let year = d.getFullYear();
                    let month = ('0' + (d.getMonth() + 1)).slice(-2);
                    let day = ('0' + d.getDate()).slice(-2);
                    return `${year}-${month}-${day}`;
                            }

                            // Crear calendario para el mes actual
                            function crearCalendario(mes, año) {
                                calendarBody.innerHTML = '';

                                let primerDiaMes = new Date(año, mes, 1);
                                let ultimoDiaMes = new Date(año, mes + 1, 0);

                                let diaSemanaInicio = primerDiaMes.getDay();
                                let diasEnMes = ultimoDiaMes.getDate();

                                let date = 1;
                                for (let i = 0; i < 6; i++) {
                                    let row = document.createElement('tr');
                                    for (let j = 0; j < 7; j++) {
                                        if (i === 0 && j < diaSemanaInicio) {
                                            let cell = document.createElement('td');
                                            row.appendChild(cell);
                                        } else if (date > diasEnMes) {
                                            break;
                                        } else {
                                            let cell = document.createElement('td');
                                            cell.textContent = date;
                                            cell.setAttribute('data-date', obtenerFechaAAAAMMDD(new Date(año, mes, date)));
                                            cell.addEventListener('click', function () {
                                                // Remover clase de selección de la celda anteriormente seleccionada
                                                let selectedCell = document.querySelector('.selected');
                                                if (selectedCell) {
                                                    selectedCell.classList.remove('selected');
                                                }

                                                // Agregar clase de selección a la celda clickeada
                                                this.classList.add('selected');

                                                // Guardar fecha seleccionada en la variable y mostrar en consola
                                                fechaSeleccionada = this.getAttribute('data-date');
                                                console.log('Fecha seleccionada:', fechaSeleccionada);

                                                // Mostrar fecha seleccionada en el input
                                                fechaSeleccionadaInput.value = fechaSeleccionada;

                                                // Obtener horarios para la fecha seleccionada
                                                // obtenerHorarios(fechaSeleccionada); // Descomentar si hay una función para obtener horarios
                                            });
                                            row.appendChild(cell);
                                            date++;
                                        }
                                    }
                                    calendarBody.appendChild(row);
                                }
                            }

                            crearCalendario(mesActual, anoActual);
                        });
        </script>
    </body>
</html>
